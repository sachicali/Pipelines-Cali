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
  const notifications: Notification[] = [
    { title: 'New Subscriber', description: 'You gained a new subscriber: JohnDoe123' },
    { title: 'Video Performance', description: 'Your video "React Tutorial" is trending' },
    { title: 'Comment Mention', description: 'You were mentioned in a comment' }
  ];

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
