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

declare const CompetitorCard: React.FC<CompetitorCardProps>;

export default CompetitorCard;