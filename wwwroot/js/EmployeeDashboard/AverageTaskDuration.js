// Load JSON data for the average task duration chart
fetch('/json/EmployeeDashboard/AverageTaskDurationPerEmployee.json')
.then(response => response.json())
.then(data => {
    new Chart(document.getElementById('averageTaskDurationChart'), {
        type: 'bar',
        data: {
            labels: Object.keys(data),
            datasets: [{
                label: 'Average Task Duration (hours)',
                data: Object.values(data),
                backgroundColor: 'rgba(54, 162, 235, 0.6)'
            }]
        },
        options: {
            responsive: true,
            scales: {
                y: {
                    beginAtZero: true,
                    title: {
                        display: true,
                        text: 'Duration (hours)'
                    }
                },
                x: {
                    title: {
                        display: true,
                        text: 'Employee'
                    }
                }
            }
        }
    });
});