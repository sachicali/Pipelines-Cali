import React from 'react';
interface CardProps {
  children: React.ReactNode;
  className?: string;
}

interface CardHeaderProps {
  children: React.ReactNode;
  className?: string;
}

interface CardTitleProps {
  children: React.ReactNode;
  className?: string;
}

interface CardContentProps {
  children: React.ReactNode;
  className?: string;
}

const Card: React.FC<CardProps> = ({ children, className = '' }) => (
  <div className={`bg-gray-800 rounded-lg shadow ${className}`}>
    {children}
  </div>
);

const CardHeader: React.FC<CardHeaderProps> = ({ children, className = '' }) => (
  <div className={`p-4 border-b border-purple-900/50 ${className}`}>
    {children}
  </div>
);

const CardTitle: React.FC<CardTitleProps> = ({ children, className = '' }) => (
  <h2 className={`text-lg font-semibold ${className}`}>
    {children}
  </h2>
);

const CardContent: React.FC<CardContentProps> = ({ children, className = '' }) => (
  <div className={`p-4 ${className}`}>
    {children}
  </div>
);

interface Video {
  title: string;
  views: number;
}

interface Competitor {
  name: string;
  subscribers: number;
  outlierVideos: Video[];
}

interface CompetitorCardProps {
  competitor: Competitor;
}


const CompetitorCard: React.FC<CompetitorCardProps> = ({ competitor }) => {
  try {
    return (
      <Card>
        <CardHeader>
          <CardTitle>{competitor.name}</CardTitle>
          <p className="text-sm text-purple-300/70">
            Subscribers: {competitor.subscribers}
          </p>
        </CardHeader>
        <CardContent>
          <h3 className="text-lg font-semibold mb-2">Top Performing Videos:</h3>
          <ul className="space-y-2">
            {competitor.outlierVideos.map((video, index) => (
              <li key={index} className="flex justify-between">
                <span>{video.title}</span>
                <span className="text-emerald-500">{video.views} views</span>
              </li>
            ))}
          </ul>
        </CardContent>
      </Card>
    );
  } catch (error) {
    console.error('Failed to render competitor card:', error);
    return <div className="text-red-500">Failed to render competitor card.</div>;
  }
};
export default CompetitorCard;
