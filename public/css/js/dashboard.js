async function loadDashboard() {
  const channelId = 'UCX6OQ3DkcsbYNE6H8uQQuVA'; // Default to MrBeast
  const response = await fetch(`/results/${channelId}`);
  const data = await response.json();
  
  displayMetrics(data.performance_metrics);
  displayCharts(data);
}

function displayMetrics(metrics) {
  const metricsDiv = document.getElementById('metrics');
  metricsDiv.innerHTML = `
    <h2>Performance Metrics</h2>
    <p>Average Views: ${metrics.average_views.toLocaleString()}</p>
    <p>View Growth Rate: ${metrics.view_growth_rate}%</p>
    <p>Engagement Rate: ${metrics.engagement_rates.overall}%</p>
  `;
}

function displayCharts(data) {
  // Add chart rendering logic here
}

window.addEventListener('load', loadDashboard); 