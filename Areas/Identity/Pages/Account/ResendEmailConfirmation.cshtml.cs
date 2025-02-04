// Licensed to the .NET Foundation under one or more agreements.
// The .NET Foundation licenses this file to you under the MIT license.
#nullable disable

using System;
using System.ComponentModel.DataAnnotations;
using System.Text;
using System.Text.Encodings.Web;
using System.Threading.Tasks;
using _.Models;
using Microsoft.AspNetCore.Authorization;
using Microsoft.AspNetCore.Identity;
using Microsoft.AspNetCore.Identity.UI.Services;
using Microsoft.AspNetCore.Mvc;
using Microsoft.AspNetCore.Mvc.RazorPages;
using Microsoft.AspNetCore.WebUtilities;
using Microsoft.Extensions.Logging;
using SendGrid;
using SendGrid.Helpers.Mail;

namespace ProdActive.Areas.Identity.Pages.Account
{
    [AllowAnonymous]
    public class ResendEmailConfirmationModel : PageModel
    {
        private readonly UserManager<ApplicationUser> _userManager;
        private readonly IEmailSender _emailSender;
        private readonly ILogger<ResendEmailConfirmationModel> _logger;


        public ResendEmailConfirmationModel(
            UserManager<ApplicationUser> userManager, 
            IEmailSender emailSender, 
            ILogger<ResendEmailConfirmationModel> logger)
        {
            _userManager = userManager;
            _emailSender = emailSender;
            _logger = logger;
        }

        /// <summary>
        ///     This API supports the ASP.NET Core Identity default UI infrastructure and is not intended to be used
        ///     directly from your code. This API may change or be removed in future releases.
        /// </summary>
        [BindProperty]
        public InputModel Input { get; set; }

        /// <summary>
        ///     This API supports the ASP.NET Core Identity default UI infrastructure and is not intended to be used
        ///     directly from your code. This API may change or be removed in future releases.
        /// </summary>
        public class InputModel
        {
            /// <summary>
            ///     This API supports the ASP.NET Core Identity default UI infrastructure and is not intended to be used
            ///     directly from your code. This API may change or be removed in future releases.
            /// </summary>
            [Required]
            [EmailAddress]
            public string Email { get; set; }
        }

        public void OnGet()
        {
        }

        public async Task<IActionResult> OnPostAsync()
        {
            if (!ModelState.IsValid)
            {
                return Page();
            }

            var user = await _userManager.FindByEmailAsync(Input.Email);
            if (user == null)
            {
                ModelState.AddModelError(string.Empty, "Verification email sent. Please check your email.");
                return Page();
            }

            string returnUrl = Url.Content("~/");
            var userId = await _userManager.GetUserIdAsync(user);
            var code = await _userManager.GenerateEmailConfirmationTokenAsync(user);
            code = WebEncoders.Base64UrlEncode(Encoding.UTF8.GetBytes(code));
            var callbackUrl = Url.Page(
                "/Account/ConfirmEmail",
                pageHandler: null,
                values: new { area = "Identity", userId = userId, code = code, returnUrl = returnUrl },
                protocol: Request.Scheme);

            // Email configuration
            var apiKey = Environment.GetEnvironmentVariable("SENDGRID_API_KEY");
            var client = new SendGridClient(apiKey);
            var from = new EmailAddress("selma.sghaier@insat.ucar.tn", "ProdActive");
            var subject = "Confirm Your Email Address"; // Corrected subject
            var to = new EmailAddress(Input.Email);
            var plainTextContent = "Please confirm your email address to activate your account.";
            var htmlContent = $@"
                <div style='font-family: Arial, sans-serif; text-align: center; background-color: #f4f4f4; padding: 20px;'>
                    <div style='max-width: 500px; background-color: #ffffff; padding: 20px; border-radius: 10px; box-shadow: 0 0 10px rgba(0, 0, 0, 0.1); margin: auto;'>
                        <h2 style='color: #333;'>Welcome to ProdActive!</h2>
                        <p style='color: #555; font-size: 16px;'>Please confirm your email address to activate your account.</p>
                        <a href='{HtmlEncoder.Default.Encode(callbackUrl)}' 
                            style='display: inline-block; background-color: #007bff; color: #ffffff; text-decoration: none; padding: 12px 20px; border-radius: 5px; font-size: 16px; margin: 10px 0;'>
                            Confirm Email
                        </a>
                        <p style='color: #777; font-size: 14px;'>If you didn't create this account, you can safely ignore this email.</p>
                        <hr style='border: none; border-top: 1px solid #ddd; margin: 20px 0;'>
                        <p style='color: #999; font-size: 12px;'>Need help? Contact our support team at <a href='mailto:support@prodactive.com' style='color: #007bff;'>support@prodactive.com</a></p>
                    </div>
                </div>";

            var msg = MailHelper.CreateSingleEmail(from, to, subject, plainTextContent, htmlContent);
            
            try
            {
                var response = await client.SendEmailAsync(msg);
                _logger.LogInformation($"SendGrid response status code: {response.StatusCode}");
                
                if (!response.IsSuccessStatusCode)
                {
                    _logger.LogError($"Failed to send confirmation email to {Input.Email}. Status: {response.StatusCode}");
                    // Optional: Consider cleaning up the user if email fails to send
                    // await _userManager.DeleteAsync(user);
                }
                else
                {
                    _logger.LogInformation($"Confirmation email sent successfully to {Input.Email}");
                }
            }
            catch (Exception ex)
            {
                _logger.LogError($"Error sending confirmation email: {ex.Message}");
                ModelState.AddModelError(string.Empty, "Failed to send confirmation email. Please try again later.");
                return Page();
            }
            ModelState.AddModelError(string.Empty, "Verification email sent. Please check your email.");
            return Page();
        }
    }
}
