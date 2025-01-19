import React from 'react';

interface MountReactComponentProps {
  component: React.ComponentType<any>;
  props?: Record<string, unknown>;
  targetId: string;
}

declare global {
  interface Window {
    mountMetricsCard: (props: Record<string, unknown>, targetId: string) => void;
  }
}