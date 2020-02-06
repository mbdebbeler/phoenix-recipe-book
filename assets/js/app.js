import React from 'react'
import 'phoenix_html'
import Recipes from './containers/Recipes'
import Networking from './networking'
import TopAppBar from './presentationals/TopAppBar'

class App extends React.Component {
  render () {
    return (
      <div>
          <TopAppBar />
          <Recipes networking={new Networking()} />
      </div>
    )
  }
}

export default App
