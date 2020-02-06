import React from 'react'
import 'phoenix_html'
import Recipes from './containers/Recipes'
import Networking from './networking'

class App extends React.Component {
  render () {
    return (
      <div className="mdc-layout-grid">
        <div>
          <Recipes networking={new Networking()} />
        </div>
      </div>
    )
  }
}

export default App
