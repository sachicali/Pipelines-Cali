import React from 'react';

const Onboarding: React.FC = () => {
  return (
    <div className="flex flex-col items-center justify-center min-h-screen p-6">
      <h1 className="text-4xl font-bold mb-4 gradient-text">
        Welcome to Pipelines
      </h1>
      <p className="text-lg text-purple-300/70">
        Analyze your channel's performance and gain valuable insights.
      </p>
      <div className="mt-8 space-y-4">
        <p className="text-lg font-semibold text-white">Import your channel to get started</p>
        <button className="bg-purple-600 hover:bg-purple-700 text-white font-bold py-2 px-4 rounded">
          No Log-in
        </button>
        <button className="bg-purple-600 hover:bg-purple-700 text-white font-bold py-2 px-4 rounded">
          Log-in
        </button>
      </div>
    </div>
  );
};

export default Onboarding;