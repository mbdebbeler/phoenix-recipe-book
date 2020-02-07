import React from 'react'
import 'phoenix_html'
import Recipes from './containers/Recipes'
import Networking from './networking'
import TopAppBar from './presentationals/TopAppBar'
import FloatingActionButton from './presentationals/FloatingActionButton'
import SideNavDrawer from './presentationals/SideNavDrawer'

class App extends React.Component {
  render () {
    return (
      <div>
        <TopAppBar />
        <SideNavDrawer />
        <Recipes networking={new Networking()} />
        <FloatingActionButton />
      </div>
    )
  }
}

export default App
