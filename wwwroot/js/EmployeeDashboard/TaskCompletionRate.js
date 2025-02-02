document.addEventListener("DOMContentLoaded", function () {
    var ctx = document.getElementById('CompletionRateChart').getContext('2d');

    fetch('/json/EmployeeDashboard/CompletionRatePerEmployee.json')
        .then(response => response.json())
        .then(data => {
            new Chart(ctx, {
                type: 'bar',
                data: data,
                options: {
                    responsive: true,
                    maintainAspectRatio: false, // Allow better spacing
                    plugins: {
                        legend: {
                            position: 'bottom', // Move legend to bottom for better spacing
                            labels: {
                                font: { size: 14 },
                                color: '#333'
                            }
                        },
                        tooltip: {
                            callbacks: {
                                label: function (tooltipItem) {
                                    return `${tooltipItem.dataset.label}: ${tooltipItem.raw}%`;
                                }
                            }
                        }
                    },
                    scales: {
                        x: {
                            grid: { display: false }, // Remove grid lines for better clarity
                            ticks: {
                                font: { size: 12 },
                                color: '#333',
                                maxRotation: 45, // Prevent excessive label rotation
                                minRotation: 45,
                                autoSkip: false // Ensure all labels are visible
                            },
                            categoryPercentage: 0.8, // Adjust bar width
                            barPercentage: 0.9
                        },
                        y: {
                            beginAtZero: true,
                            max: 100,
                            grid: { color: 'rgba(0, 0, 0, 0.1)' },
                            ticks: { font: { size: 14 }, color: '#333' }
                        }
                    }
                }
            });
        })
        .catch(error => console.error('Error loading JSON:', error));
});
