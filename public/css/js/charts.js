function initializeCharts(data) {
    // Views Trend Chart
    const viewsCtx = document.getElementById('viewsTrendChart').getContext('2d');
    new Chart(viewsCtx, {
        type: 'line',
        data: {
            labels: data.views_trend.dates,
            datasets: [{
                label: 'Views',
                data: data.views_trend.values,
                borderColor: 'rgb(79, 70, 229)',
                tension: 0.1
            }]
        },
        options: {
            responsive: true,
            maintainAspectRatio: false,
            plugins: {
                legend: {
                    position: 'top',
                }
            }
        }
    });

    // Engagement Chart
    const engagementCtx = document.getElementById('engagementChart').getContext('2d');
    new Chart(engagementCtx, {
        type: 'bar',
        data: {
            labels: data.engagement.labels,
            datasets: [{
                label: 'Engagement Rate',
                data: data.engagement.values,
                backgroundColor: 'rgba(79, 70, 229, 0.5)',
                borderColor: 'rgb(79, 70, 229)',
                borderWidth: 1
            }]
        },
        options: {
            responsive: true,
            maintainAspectRatio: false,
            plugins: {
                legend: {
                    position: 'top',
                }
            }
        }
    });
}

// Real-time updates
function updateMetrics(channelId) {
    fetch(`/api/metrics/${channelId}`)
        .then(response => response.json())
        .then(data => {
            // Update metrics cards
            document.getElementById('totalViews').textContent = data.total_views;
            document.getElementById('averageVph').textContent = data.average_vph;
            document.getElementById('growthRate').textContent = data.growth_rate + '%';
        });
} 