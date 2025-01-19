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

interface Notification {
  title: string;
  description: string;
}

const Notifications: React.FC = () => {
  const [notifications, setNotifications] = React.useState<Notification[]>([]);

  const fetchNotificationData = async () => {
    try {
      const response = await fetch('/api/v1/channels/UC_test_channel/notifications');
      if (!response.ok) {
        throw new Error(`HTTP error! status: ${response.status}`);
      }
      const data = await response.json();
      setNotifications(data.notifications);
    } catch (error) {
      console.error('Failed to fetch notification data:', error);
      // set an error state here
      setNotifications([]);
    }
  };

  if (notifications.length === 0) {
    return (
      <div className="p-6">
        <h1 className="text-2xl font-bold mb-6">Notifications</h1>
        <div className="text-red-500">Failed to load notifications. Please try again later.</div>
      </div>
    );
  }

  React.useEffect(() => {
    fetchNotificationData();
  }, []);

  return (
    <div className="p-6">
      <h1 className="text-2xl font-bold mb-6">Notifications</h1>
      <div className="space-y-4">
        {notifications.map((notification, index) => (
          <Card key={index}>
            <CardHeader>
              <CardTitle>{notification.title}</CardTitle>
            </CardHeader>
            <CardContent>
              <p className="text-purple-300/70">{notification.description}</p>
            </CardContent>
          </Card>
        ))}
      </div>
    </div>
  );
};

export default Notifications;
