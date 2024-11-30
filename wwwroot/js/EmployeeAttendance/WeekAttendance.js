// Chart.js setup for Attendance Chart
var ctx = document.getElementById('attendanceChart').getContext('2d');

// Function to convert TimeSpan strings (HH:mm:ss) to decimal hours
function timeSpanToDecimalHours(timeSpan) {
    const [hours, minutes, seconds] = timeSpan.split(':').map(Number);
    return hours + minutes / 60 + seconds / 3600;
}

// Function to convert decimal hours back to "XhYm" format
function decimalHoursToTimeString(decimalHours) {
    const totalMinutes = Math.round(decimalHours * 60); // Convert to total minutes
    const hours = Math.floor(totalMinutes / 60); // Extract hours
    const minutes = totalMinutes % 60; // Extract remaining minutes
    return `${hours}h${minutes}min`;
}

// Function to fetch and update the chart data
function fetchDataAndUpdateChart() {
    fetch('/json/WeekAttendance.json')  // Fetch the JSON file
        .then(response => response.json())  // Parse JSON
        .then(data => {
            // Convert TimeSpan strings to decimal hours in the datasets
            data.datasets.forEach(dataset => {
                dataset.data = dataset.data.map(timeSpanToDecimalHours); // Convert data to decimal hours
            });

            // Initialize the chart with data from the JSON file
            var attendanceChart = new Chart(ctx, {
                type: 'bar',  // Bar chart for attendance
                data: data,   // Use the data fetched and converted from the JSON file
                options: {
                    responsive: true,  // Make the chart responsive
                    plugins: {
                        legend: {
                            position: 'top',  // Position the legend at the top
                            labels: {
                                font: {
                                    size: 14  // Adjust the font size of the legend
                                },
                                color: '#FFFFFFaa'  // Change the label color of the legend
                            }
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
                }
            });
        })
        .catch(error => console.error('Error loading the JSON data:', error));  // Handle errors
}

// Call the function to fetch data and update the chart
fetchDataAndUpdateChart();
