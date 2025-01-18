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
  const competitors: Competitor[] = [
    {
      name: 'Tech Innovators',
      subscribers: 1500000,
      outlierVideos: [
        { title: 'AI Revolution', views: 2300000 },
        { title: 'Quantum Computing', views: 1800000 }
      ]
    },
    {
      name: 'Code Masters',
      subscribers: 850000,
      outlierVideos: [
        { title: 'React Advanced Patterns', views: 1100000 },
        { title: 'Node.js Performance', views: 950000 }
      ]
    }
  ];

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
