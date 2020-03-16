import React from "react"
import PropTypes from "prop-types"
import './styles/Header.css';
import AxiosHelper from './services/AxiosHelper'
import api from './services/api'

class Header extends React.Component {
  
  async handleLogout(e) {
    e.preventDefault();
    let that = this
    // let email = this.props.currentUser
    AxiosHelper()
    const csrfToken = await document.querySelector('[name=csrf-token]').content
    await console.log(csrfToken);

    await api.delete('users/sign_out', {
      headers: {
        'Accept': 'application/json',
        'Content-Type': 'application/json',
        'X-CSRFToken': document.querySelector('[name=csrf-token]').content
      },
      headers: {
        'Accept': 'application/json',
        'Content-Type': 'application/json',
        'X-CSRFToken': document.querySelector('[name=csrf-token]').content
      }
    })
    .then(async function(response){
      console.log(response);
      that.props.changePage("login")
    })
    .catch(function(error){
      console.log(error)
    })
  }

  render() {
    return (
      <React.Fragment>
        <div className="container">
          <div className="desk-nav-bar">
            <ul>
              <li className="active"><a href="#">home</a></li>

              <li><a onClick={this.handleLogout} href="#" >Sair</a></li>
            </ul>
          </div>
        </div>
      </React.Fragment>
    );
  }
}

export default Header
