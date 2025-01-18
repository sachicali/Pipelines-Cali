import React from 'react';
import { BrowserRouter, Route, Switch } from 'react-router-dom'; // Changed Routes to Switch and fixed Route usage for v5
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
        <Switch>
          <Route path="/" component={Landing} />
          <Route path="/dashboard" component={Dashboard} />
          <Route path="/recommendations" component={Recommendations} />
          <Route path="/notifications" component={Notifications} />
        </Switch>
      </div>
    </BrowserRouter>
  );
}

export default App;