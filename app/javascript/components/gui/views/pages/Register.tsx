import React from 'react';

const Register: React.FC = () => {
  return (
    <div className="flex flex-col items-center justify-center min-h-screen p-6">
      <h1 className="text-4xl font-bold mb-4 gradient-text">
        Register
      </h1>
      <div className="bg-gray-800 rounded-lg shadow p-4 w-full max-w-md">
        <input
          type="text"
          placeholder="Name"
          className="bg-gray-700 text-white rounded p-2 mb-4 w-full"
        />
        <input
          type="text"
          placeholder="Email"
          className="bg-gray-700 text-white rounded p-2 mb-4 w-full"
        />
        <input
          type="password"
          placeholder="Password"
          className="bg-gray-700 text-white rounded p-2 mb-4 w-full"
        />
         <input
          type="password"
          placeholder="Confirm Password"
          className="bg-gray-700 text-white rounded p-2 mb-4 w-full"
        />
        <button className="bg-purple-600 hover:bg-purple-700 text-white font-bold py-2 px-4 rounded w-full">
          Register
        </button>
      </div>
    </div>
  );
};

export default Register;