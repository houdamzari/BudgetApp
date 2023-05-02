import React, { useState, useEffect } from 'react';
import { fetchRandomGreeting } from '../api/greetingApi';

const Greeting = () => {
  const [greeting, setGreeting] = useState('');

  useEffect(() => {
    const getRandomGreeting = async () => {
      const data = await fetchRandomGreeting();
      if (data && data.content) {
        setGreeting(data.content);
      }
    };
    getRandomGreeting();
  }, []);

  return (
    <div>
      <h1>{greeting}</h1>
    </div>
  );
};

export default Greeting;
