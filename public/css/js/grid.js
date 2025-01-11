async function loadGrid() {
  const channelId = 'UCX6OQ3DkcsbYNE6H8uQQuVA'; // Default to MrBeast
  const response = await fetch(`/results/${channelId}`);
  const data = await response.json();
  
  displayVideos(data.performance_metrics.outliers);
}

function displayVideos(videos) {
  const grid = document.getElementById('video-grid');
  grid.className = 'grid';
  
  videos.forEach(video => {
    const card = document.createElement('div');
    card.className = 'video-card';
    card.innerHTML = `
      <h3>${video.title}</h3>
      <p>Views: ${video.views.toLocaleString()}</p>
      <p>Engagement: ${video.likes + video.comments}</p>
    `;
    grid.appendChild(card);
  });
}

window.addEventListener('load', loadGrid); 