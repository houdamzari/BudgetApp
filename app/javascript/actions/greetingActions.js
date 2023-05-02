export const setGreeting = (greeting) => ({
  type: 'SET_GREETING',
  payload: greeting,
});

export const fetchGreeting = () => async (dispatch) => {
  const response = await fetch('/random_greeting');
  const data = await response.json();
  dispatch(setGreeting(data.content));
};
