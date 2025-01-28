$(function () {
  'use strict';

  // Function to fetch data from the JSON file
  function fetchDataAndRenderCharts() {
    $.getJSON('/json/PointageChefProjet.json', function (data) {
      // Extract data for each chart
      var activityPeaksData = {
        labels: data.activityPeaks.labels,
        datasets: [
          {
            label: 'Nombre de pointages',
            data: data.activityPeaks.data,
            borderColor: '#587ce4',
            backgroundColor: 'rgba(88, 124, 228, 0.2)',
            borderWidth: 2,
            fill: true,
          },
        ],
      };

      var hoursWorkedData = {
        labels: data.hoursWorked.labels,
        datasets: [
          {
            label: 'Heures travaillées',
            data: data.hoursWorked.data,
            backgroundColor: 'rgba(54, 162, 235, 0.5)',
            borderColor: 'rgba(54, 162, 235, 1)',
            borderWidth: 1,
            fill: true,
          },
        ],
      };

      // Common chart options
      var options = {
        plugins: {
          legend: {
            display: false
          },
        },
        scales: {
          y: {
            ticks: {
              beginAtZero: true,
            },
          },
        },
        elements: {
          line: {
            tension: 0.5,
          },
          point: {
            radius: 3,
          },
        },
      };

      // Initialize 'Analyse des pics d’activité' Chart
      if ($("#activityPeaksChart").length) {
        var activityPeaksCtx = $("#activityPeaksChart").get(0).getContext("2d");
        new Chart(activityPeaksCtx, {
          type: 'line',
          data: activityPeaksData,
          options: options,
        });
      }

      // Initialize 'Heures travaillées par jour' Chart
      if ($("#hoursWorkedChart").length) {
        var hoursWorkedCtx = $("#hoursWorkedChart").get(0).getContext("2d");
        new Chart(hoursWorkedCtx, {
          type: 'bar',
          data: hoursWorkedData,
          options: {
            responsive: true,  // Make the chart responsive
            plugins: {
              legend: {
                display: false
              },
              tooltip: {
                  callbacks: {
                      label: function(tooltipItem) {
                          // Convert decimal hours back to "XhYm" format
                          const timeString = decimalHoursToTimeString(tooltipItem.raw);
                          return `${tooltipItem.dataset.label}: ${timeString}`;
                      }
                  }
              }
            },
            scales: {
                x: {
                    beginAtZero: true,  // Ensure the x-axis starts at 0
                    grid: {
                        color: 'rgba(255, 255, 255, 0.1)'  // Light grid lines for x-axis
                    },
                    ticks: {
                        font: {
                            size: 14  // Adjust the font size of x-axis ticks
                        },
                        color: '#FFFFFFaa'  // White color for x-axis ticks
                    },
                    stacked: true  // Enable stacking on the x-axis
                },
                y: {
                    beginAtZero: true,  // Ensure the y-axis starts at 0
                    grid: {
                        color: 'rgba(255, 255, 255, 0.1)'  // Light grid lines for y-axis
                    },
                    ticks: {
                        font: {
                            size: 14  // Adjust the font size of y-axis ticks
                        },
                        color: '#FFFFFFaa'  // White color for y-axis ticks
                    },
                    stacked: true  // Enable stacking on the y-axis
                }
            }
          },
        });
      }
    });
  }

  // Fetch data and render charts
  fetchDataAndRenderCharts();
});
