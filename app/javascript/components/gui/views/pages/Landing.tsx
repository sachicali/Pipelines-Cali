import React from 'react';

const Landing: React.FC = () => {
  return (
    <div className="flex flex-col items-center justify-center min-h-screen p-6">
      <h1 className="text-4xl font-bold mb-4 gradient-text">
        Welcome to Pipelines
      </h1>
      <p className="text-lg text-purple-300/70">
        Analyze your channel's performance and gain valuable insights.
      </p>
    </div>
  );
};

export default Landing;
