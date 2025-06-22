import React, { useState } from 'react';

const HandoverForm = () => {
  const [date, setDate] = useState('');
  const [shiftDetails, setShiftDetails] = useState('');
  const [engineer, setEngineer] = useState('');
  const [notes, setNotes] = useState('');

  const handleSubmit = (e) => {
    e.preventDefault();
    // Add API call to submit the handover details
  };

  return (
    <form onSubmit={handleSubmit}>
      <div>
        <label>Date:</label>
        <input
          type="date"
          value={date}
          onChange={(e) => setDate(e.target.value)}
          required
        />
      </div>
      <div>
        <label>Shift Details:</label>
        <input
          type="text"
          value={shiftDetails}
          onChange={(e) => setShiftDetails(e.target.value)}
          required
        />
      </div>
      <div>
        <label>Engineer:</label>
        <input
          type="text"
          value={engineer}
          onChange={(e) => setEngineer(e.target.value)}
          required
        />
      </div>
      <div>
        <label>Notes:</label>
        <textarea
          value={notes}
          onChange={(e) => setNotes(e.target.value)}
        />
      </div>
      <button type="submit">Submit Handover</button>
    </form>
  );
};

export default HandoverForm;