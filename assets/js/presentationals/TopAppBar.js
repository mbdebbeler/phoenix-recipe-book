import React from 'react'
import { MDCTopAppBar } from '@material/top-app-bar'
import { MDCDrawer } from '@material/drawer'

class TopAppBar extends React.Component {
  componentDidMount () {
    this.drawer = MDCDrawer.attachTo(document.querySelector('.mdc-drawer'))
    this.topAppBar = MDCTopAppBar.attachTo(document.getElementById('app-bar'))
    this.topAppBar.setScrollTarget(document.getElementById('recipes'))
    this.topAppBar.listen('MDCTopAppBar:nav', () => {
      this.drawer.open = !this.drawer.open
    })
  }

  render () {
    return (
      <header className="mdc-top-app-bar app-bar" id="app-bar">
        <div className="mdc-top-app-bar__row">
          <section className="mdc-top-app-bar__section mdc-top-app-bar__section--align-start">
            <button className="material-icons mdc-top-app-bar__navigation-icon mdc-icon-button">menu</button>
            <span className="mdc-top-app-bar__title">Recipe Box</span>
          </section>
        </div>
      </header>
    )
  }
}
export default TopAppBar
