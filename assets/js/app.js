import React from 'react'
import 'phoenix_html'
import Recipes from './containers/Recipes'
import Networking from './networking'
import TopAppBar from './presentationals/TopAppBar'
import FloatingActionButton from './presentationals/FloatingActionButton'

class App extends React.Component {
  render () {
    return (
      <div>
          <TopAppBar />
          <Recipes networking={new Networking()} />
          <FloatingActionButton />
      </div>
    )
  }
}

export default App
