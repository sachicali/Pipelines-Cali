import React from 'react';

interface Position {
  x: number;
  y: number;
}

interface Metric {
  title: string;
  trend: number;
}

interface RecommendationPopupProps {
  position: Position;
  metric: Metric;
}

const RecommendationPopup: React.FC<RecommendationPopupProps> = ({ position, metric }) => {
  const getRecommendations = (): string[] => {
    if (metric.trend >= 0) {
      return [
        'Your recent video series is performing exceptionally well',
        'Engagement from your loyal subscribers is increasing',
        'Consider creating more content in this style'
      ];
    } else {
      return [
        'Review your recent content strategy',
        'Consider experimenting with new formats',
        'Engage more with your audience in comments'
      ];
    }
  };

  try {
    return (
      <div
        className="absolute z-50 p-4 bg-gray-800 border border-purple-900/50 rounded-lg shadow-lg"
        style={{
          left: position.x + 20,
          top: position.y + 20,
          minWidth: '300px'
        }}
      >
        <h3 className="text-lg font-semibold mb-2">{metric.title} Analysis</h3>
        <div className="space-y-2">
          {getRecommendations().map((recommendation, index) => (
            <div key={index} className="text-sm text-purple-300/70">
              • {recommendation}
            </div>
          ))}
        </div>
      </div>
    );
  } catch (error) {
    console.error('Failed to render recommendation popup:', error);
    return <div className="text-red-500">Failed to render recommendation popup.</div>;
  }
};

export default RecommendationPopup;
