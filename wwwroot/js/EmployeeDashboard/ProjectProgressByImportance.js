// Load JSON data for task importance chart
fetch('/json/EmployeeDashboard/ProjectProgressByImportance.json')
.then(response => response.json())
.then(data => {
    new Chart(document.getElementById('taskImportanceChart'), {
        type: 'bar',
        data: {
            labels: Object.keys(data).map(level => `Importance ${level}`),
            datasets: [{
                label: 'Project Progress (%)',
                data: Object.values(data),
                backgroundColor: 'rgba(255, 99, 132, 0.6)'
            }]
        },
        options: {
            responsive: true,
            scales: {
                y: {
                    beginAtZero: true,
                    max: 100,
                    title: {
                        display: true,
                        text: 'Progress (%)'
                    }
                },
                x: {
                    title: {
                        display: true,
                        text: 'Task Importance Level'
                    }
                }
            }
        }
    });
});