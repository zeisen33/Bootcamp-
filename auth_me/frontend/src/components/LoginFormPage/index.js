import React, { useState } from 'react'
import * as sessionActions from '../../store/session';
import { Redirect } from 'react-router-dom';
import { useDispatch, useSelector } from 'react-redux';

const LoginFormPage = () => {
  const dispatch = useDispatch();
  const currentUser = useSelector((state) => state.session.user)
  const [credential, setCredential] = useState('');
  const [password, setPassword] = useState('');
  const [errors, setErrors] = useState([])

  if (currentUser) return <Redirect to='/' />

  const handleSubmit = (e) => {
    e.preventDefault();
    setErrors([]);
    return dispatch(sessionActions.login({credential, password}))
      .catch(async (res) => {
        let data;
        try {
          data = await res.clone().json()
        } catch {
          data = await res.text()
        }
        if (data?.errors) setErrors(data.errors);
        else if (data) setErrors([data]);
        else setErrors([res.statusText]);
      })
  }

  return (
    <form onSubmit={handleSubmit}>
      <ul>
        {errors.map((error) => <li key={error}>{error}</li>)}
      </ul>
      <label>
        Username or Email
        <input
          type="text"
          value={credential}
          onChange={(e) => setCredential(e.target.value)}
          required
          />
      </label>
      <label>
        Password
        <input
          type='password'
          onChange={(e) => setPassword(e.target.value)}
          required
          />
      </label>
      <button type='submit'>Log In</button>
    </form>
  )
}

export default LoginFormPage;