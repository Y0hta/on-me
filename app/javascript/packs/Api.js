import axios from 'axios';

const getCsrfToken = () => {
  if (!(axios.defaults.headers.common['X-CSRF-Token'])) {
    return (
      document.getElementsByName('csrf-token')[0].getAttribute('content')
    )
  } else {
    return (
      axios.defaults.headers.common['X-CSRF-Token']
    )
  }
};

const setAxiosDefaults = () => {
  axios.defaults.headers.common['X-CSRF-Token'] = getCsrfToken();
  axios.defaults.headers.common['Accept'] = 'application/json';
};

setAxiosDefaults();

const updateCsrfToken = (csrf_token) => {
  axios.defaults.headers.common['X-CSRF-Token'] = csrf_token;
};

export const sessionApi = {
  login: ({email, password}) => {
    return (axios.post('/users/sign_in', {
        user: {
          email: email,
          password: password,
          remember_me: 1
        }
      })
        .then(response => {
          console.log('success');
          updateCsrfToken(response.data.csrf_token);
          return (response)
        })

    )
  },
  logout: () => {
    return (
      axios.delete(
        '/users/sign_out'
      )
        .then(response => {
          console.log('success');
          updateCsrfToken(response.data.csrf_token);
          return (response)
        })
    )
  }
};

export const registrationApi = {
  signUp: ({email, password, password_confirmation, name}) => {
    return (axios.post('/users', {
        user: {
          name: name,
          email: email,
          password: password,
          password_confirmation: password_confirmation,
        }
      })
        .then(response => {
          console.log('success');
          updateCsrfToken(response.data.csrf_token);
          return (response)
        })
    )
  }
};
