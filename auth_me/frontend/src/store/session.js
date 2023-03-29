import csrfFetch from './csrf';


const SET_CURRENT_USER = 'session/setCurrentUser';
const REMOVE_CURRENT_USER = 'session/removeCurrentUser';

const setCurrentUser = (user) => {
  return {
    type: SET_CURRENT_USER,
    user: user
  };
};

const removeCurrentUser = (userId) => {
  return {
    type: REMOVE_CURRENT_USER,
    userId: userId
  };
};

export const login = (user) => async (dispatch) => {
  const { credential, password } = user;
  const res = await csrfFetch('/api/session', {
    method: 'POST',
    body: JSON.stringify({
      credential,
      password
    })
  });
  const data = await res.json();
  storeCurrentUser(data.user)
  dispatch(setCurrentUser(data.user));
  return res;
};

const initialState = { user: JSON.parse(sessionStorage.getItem('currentUser')) };

const sessionReducer = (state = initialState, action) => {
  Object.freeze(state)
  let nextState = { ...state }
  switch (action.type) {
    case SET_CURRENT_USER:
      nextState['user'] = action.user
      return nextState
    case REMOVE_CURRENT_USER:
      delete nextState.user[action.userId]
    default:
      return state;
  }
};

export const restoreSession = () => async (dispatch) => {
  const res = await csrfFetch('/api/session', {
    method: 'GET'
  })

  storeCSRFToken(res)
  const data = await res.json();
  storeCurrentUser(data.user)
  dispatch(setCurrentUser(data.user))
  return res
}

const storeCurrentUser = (user) => {
  if (user) sessionStorage.setItem('currentUser', JSON.stringify(user))
  else sessionStorage.removeItem('currentUser')
}

export function storeCSRFToken(response) {
  const csrfToken = response.headers.get("X-CSRF-Token");
  if (csrfToken) sessionStorage.setItem("X-CSRF-Token", csrfToken);
}

export const signup = (user) => async (dispatch) => {
  const username = user.username;
  const email = user.email;
  const password = user.password;

  const res = await csrfFetch('/api/users', {
    method: 'POST',
    body: JSON.stringify({username, email, password})
  })
    
  const data = await res.json();
  storeCurrentUser(data.user)
  dispatch(setCurrentUser(data.user))
  return res
}

export default sessionReducer;