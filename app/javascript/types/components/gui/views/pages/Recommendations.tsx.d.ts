import React from 'react';

interface OutlierVideo {
  title: string;
  views: number;
}

interface Competitor {
  name: string;
  subscribers: number;
  outlierVideos: OutlierVideo[];
}

declare const Recommendations: React.FC;

export default Recommendations;