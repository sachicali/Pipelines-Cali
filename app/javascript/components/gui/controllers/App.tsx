import React from 'react';
import { BrowserRouter, Route, Router } from 'react-router-dom'; // Changed Routes to Router to fix build error
import Dashboard from '../views/pages/Dashboard';
import Recommendations from '../views/pages/Recommendations';
import Notifications from '../views/pages/Notifications';
import Landing from '../views/pages/Landing';
import Header from '../views/components/Header';

const App: React.FC = () => {
  return (
    <BrowserRouter>
      <div className="min-h-screen">
        <Header />
        <Router>
          <Route path="/" element={<Landing />} />
          <Route path="/dashboard" element={<Dashboard />} />
          <Route path="/recommendations" element={<Recommendations />} />
          <Route path="/notifications" element={<Notifications />} />
        </Router>
      </div>
    </BrowserRouter>
  );
}

export default App;