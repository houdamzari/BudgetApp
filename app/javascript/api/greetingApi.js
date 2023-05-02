export const fetchRandomGreeting = async () => {
  try {
    const response = await fetch('/api/v1/greetings/random');
    const data = await response.json();
    console.log(data)
    return data;
  } catch (error) {
    console.error('Error fetching random greeting:', error);
  }
};
