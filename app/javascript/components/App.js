import React from "react"
import PropTypes from "prop-types"

import { BrowserRouter, Switch, Route } from 'react-router-dom'
import Home from "./Home"
import Building from './Building'

class App extends React.Component {
  render() {
    return (
      <BrowserRouter>
        <Switch>
          <Route extract path="/" render={() => <Home currentUserId={this.props.currentUserId} />} />
          <Route extract path="/" render={() => <Building greeting="Friend" />} />
        </Switch>
      </BrowserRouter>
    );
  }
}

export default App
