import React from 'react';
import CompetitorCard from '../components/CompetitorCard';

interface OutlierVideo {
  title: string;
  views: number;
}

interface Competitor {
  name: string;
  subscribers: number;
  outlierVideos: OutlierVideo[];
}

const Recommendations: React.FC = () => {
  const [competitors, setCompetitors] = React.useState<Competitor[]>([]);

  const fetchCompetitorData = async () => {
    try {
      const response = await fetch('/api/v1/channels/UC_test_channel/competitors');
      if (!response.ok) {
        throw new Error(`HTTP error! status: ${response.status}`);
      }
      const data = await response.json();
      setCompetitors(data.competitors);
    } catch (error) {
      console.error('Failed to fetch competitor data:', error);
      // set an error state here
      // set an error state here
      setCompetitors([]);
    }
  };

  if (competitors.length === 0) {
    return (
      <div className="p-6">
        <h1 className="text-2xl font-bold mb-6">Competitor Analysis</h1>
        <div className="text-red-500">Failed to load competitor data. Please try again later.</div>
      </div>
    );
  }

  React.useEffect(() => {
    fetchCompetitorData();
  }, []);

  return (
    <div className="p-6">
      <h1 className="text-2xl font-bold mb-6">Competitor Analysis</h1>
      
      <div className="grid grid-cols-1 md:grid-cols-2 gap-4">
        {competitors.map((competitor, index) => (
          <CompetitorCard key={index} competitor={competitor} />
        ))}
      </div>
    </div>
  );
};

export default Recommendations;
