import React from 'react'
class TopAppBar extends React.Component {
  render () {
    return (
      <header className=" mdc-top-app-bar">
        <div className="mdc-top-app-bar__row">
          <section className="mdc-top-app-bar__section mdc-top-app-bar__section--align-start">
            <button className="mdc-icon-button material-icons mdc-top-app-bar__navigation-icon--unbounded">menu</button><span className="mdc-top-app-bar__title">Recipe Box</span> </section>
            <section className="mdc-top-app-bar__section mdc-top-app-bar__section--align-end">
            </section>
          </div>
        </header>
    )
  }
}
export default TopAppBar
