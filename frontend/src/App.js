import React, { useState, useEffect } from 'react';
import './App.css';

function App() {
  const [status, setStatus] = useState('Loading...');

  useEffect(() => {
    // Check backend connection
    fetch('http://localhost:5000/api/health')
      .then(res => res.json())
      .then(data => setStatus('✅ Connected to Backend'))
      .catch(err => setStatus('❌ Backend not running'));
  }, []);

  return (
    <div className="App">
      <header className="App-header">
        <h1>🎬 USA - UGC Storyboard Affiliate</h1>
        <p>Create beautiful storyboards for your affiliate content</p>
        <div className="status">
          <p>{status}</p>
        </div>
      </header>

      <main className="App-main">
        <section className="feature-grid">
          <div className="feature-card">
            <h3>📸 Create Storyboards</h3>
            <p>Design beautiful product showcase storyboards</p>
          </div>
          <div className="feature-card">
            <h3>🎨 Customize Templates</h3>
            <p>Choose from pre-made templates or create your own</p>
          </div>
          <div className="feature-card">
            <h3>💰 Track Affiliate Links</h3>
            <p>Monitor your affiliate commissions and clicks</p>
          </div>
          <div className="feature-card">
            <h3>📤 Export Content</h3>
            <p>Download storyboards as images or videos</p>
          </div>
        </section>
      </main>

      <footer className="App-footer">
        <p>USA © 2024 | UGC Storyboard Affiliate Platform</p>
      </footer>
    </div>
  );
}

export default App;