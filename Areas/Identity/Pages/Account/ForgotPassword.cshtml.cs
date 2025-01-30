// Licensed to the .NET Foundation under one or more agreements.
// The .NET Foundation licenses this file to you under the MIT license.
#nullable disable

using System;
using System.Collections.Generic;
using System.ComponentModel.DataAnnotations;
using System.Linq;
using System.Threading.Tasks;
using Microsoft.AspNetCore.Authorization;
using Microsoft.AspNetCore.Authentication;
using Microsoft.AspNetCore.Identity;
using Microsoft.AspNetCore.Identity.UI.Services;
using Microsoft.AspNetCore.Mvc;
using Microsoft.AspNetCore.Mvc.RazorPages;
using Microsoft.Extensions.Logging;
using Microsoft.AspNetCore.WebUtilities;
using System.Text;
using System.Text.Encodings.Web;
using _.Models;
using SendGrid;
using SendGrid.Helpers.Mail;

namespace ProdActive.Areas.Identity.Pages.Account
{
    public class ForgotPasswordModel : PageModel
    {
        private readonly UserManager<ApplicationUser> _userManager;
        private readonly IEmailSender _emailSender;
        private readonly ILogger<LoginModel> _logger;

        public ForgotPasswordModel(UserManager<ApplicationUser> userManager, IEmailSender emailSender, ILogger<LoginModel> logger)
        {
            _userManager = userManager ?? throw new ArgumentNullException(nameof(userManager));
            _emailSender = emailSender ?? throw new ArgumentNullException(nameof(emailSender));
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

        public async Task<IActionResult> OnPostAsync()
        {
            if (ModelState.IsValid)
            {
                Console.WriteLine("Email ",Input.Email);
                var user = await _userManager.FindByEmailAsync(Input.Email);
                if (user == null || !(await _userManager.IsEmailConfirmedAsync(user)))
                {
                    if(user == null)
                    {
                        Console.WriteLine("User not found");
                    }
                    else
                    {
                        Console.WriteLine("User not confirmed");
                    }
                    // Don't reveal that the user does not exist or is not confirmed
                    return RedirectToPage("./ForgotPasswordConfirmation");
                }

                // For more information on how to enable account confirmation and password reset please
                // visit https://go.microsoft.com/fwlink/?LinkID=532713
                var code = await _userManager.GeneratePasswordResetTokenAsync(user);
                code = WebEncoders.Base64UrlEncode(Encoding.UTF8.GetBytes(code));
                var callbackUrl = Url.Page(
                    "/Account/ResetPassword",
                    pageHandler: null,
                    values: new { area = "Identity", code },
                    protocol: Request.Scheme
                );
                
                // Prepare the email to be sent
                var apiKey = Environment.GetEnvironmentVariable("SENDGRID_API_KEY");
                var client = new SendGridClient(apiKey);
                var from = new EmailAddress("selma.sghaier@insat.ucar.tn", "ProdActive");
                var subject = "Reset Password";
                var to = new EmailAddress(Input.Email);
                var plainTextContent = "and easy to do anywhere, even with C#";
                var htmlContent = $@"
                    <div style='font-family: Arial, sans-serif; text-align: center; background-color: #f4f4f4; padding: 20px;'>
                        <div style='max-width: 500px; background-color: #ffffff; padding: 20px; border-radius: 10px; box-shadow: 0 0 10px rgba(0, 0, 0, 0.1); margin: auto;'>
                            <h2 style='color: #333;'>Reset Your Password</h2>
                            <p style='color: #555; font-size: 16px;'>Forgot your password? No worries! Click the button below to reset it.</p>
                            <a href='{HtmlEncoder.Default.Encode(callbackUrl)}' 
                                style='display: inline-block; background-color: #007bff; color: #ffffff; text-decoration: none; padding: 12px 20px; border-radius: 5px; font-size: 16px; margin: 10px 0;'>
                                Reset Password
                            </a>
                            <p style='color: #777; font-size: 14px;'>If you didn’t request a password reset, you can safely ignore this email.</p>
                            <hr style='border: none; border-top: 1px solid #ddd; margin: 20px 0;'>
                            <p style='color: #999; font-size: 12px;'>Need help? Contact our support team at <a href='mailto:support@example.com' style='color: #007bff;'>support@example.com</a></p>
                        </div>
                    </div>";
                
                // Send the email
                var msg = MailHelper.CreateSingleEmail(from, to, subject, plainTextContent, htmlContent);
                try
                {
                    var response = await client.SendEmailAsync(msg);
                    // Log the response details for debugging purposes
                    _logger.LogInformation($"SendGrid response status code: {response.StatusCode}");
                    _logger.LogInformation($"SendGrid response body: {await response.Body.ReadAsStringAsync()}");
                    if (!response.IsSuccessStatusCode)
                    {
                        _logger.LogError($"Failed to send email to {Input.Email}");
                    }
                    else
                    {
                        _logger.LogInformation($"Email sent successfully to {Input.Email}");
                    }
                }
                catch (Exception ex)
                {
                    // Log any exceptions that occur during email sending
                    _logger.LogError($"Error sending email: {ex.Message}");
                }

                return RedirectToPage("./ForgotPasswordConfirmation");
            }

            return Page();
        }
    }
}
