import React, { useState, useEffect } from 'react';

interface User {
  id: number;
  name: string;
  email: string;
}

const AdminSettings: React.FC = () => {
  const [users, setUsers] = useState<User[]>([]);

  const fetchUserData = async () => {
    try {
      const response = await fetch('/api/v1/users');
      if (!response.ok) {
        throw new Error(`HTTP error! status: ${response.status}`);
      }
      const data = await response.json();
      setUsers(data);
    } catch (error) {
      console.error('Failed to fetch user data:', error);
      // set an error state here
      setUsers([]);
    }
  };

  if (users.length === 0) {
    return (
      <div className="p-6">
        <h1 className="text-2xl font-bold mb-6">Admin Settings</h1>
        <div className="text-red-500">Failed to load user data. Please try again later.</div>
      </div>
    );
  }

  useEffect(() => {
    fetchUserData();
  }, []);

  return (
    <div className="p-6">
      <h1 className="text-2xl font-bold mb-6">Admin Settings</h1>
      <div className="bg-gray-800 rounded-lg shadow p-4">
        <h2 className="text-lg font-semibold mb-4">Admin View</h2>
        <p className="text-purple-300/70">
          This section will display all user activities.
        </p>
        <ul>
          {users.map((user) => (
            <li key={user.id} className="text-purple-300/70">
              {user.name} ({user.email})
            </li>
          ))}
        </ul>
      </div>
    </div>
  );
};

export default AdminSettings;