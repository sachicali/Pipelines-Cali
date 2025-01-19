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

declare const RecommendationPopup: React.FC<RecommendationPopupProps>;

export default RecommendationPopup;