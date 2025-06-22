import React, { useEffect, useState } from 'react';
import { fetchIncidents } from '../services/api';

const Dashboard = () => {
  const [incidents, setIncidents] = useState([]);

  useEffect(() => {
    const getIncidents = async () => {
      const data = await fetchIncidents();
      setIncidents(data);
    };

    getIncidents();
  }, []);

  return (
    <div>
      <h1>Dashboard</h1>
      <h2>Recent Incidents</h2>
      <ul>
        {incidents.map((incident) => (
          <li key={incident.id}>
            <strong>{incident.title}</strong>: {incident.description}
          </li>
        ))}
      </ul>
    </div>
  );
};

export default Dashboard;