import { MetricsCardProps } from '../components/gui/views/components/MetricsCard';

type MountReactComponentProps = Partial<MetricsCardProps> & Record<string, unknown>;

declare global {
  interface Window {
    mountMetricsCard: (props: Record<string, unknown>, targetId: string) => void;
  }
}