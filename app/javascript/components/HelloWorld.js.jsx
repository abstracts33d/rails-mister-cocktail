import React from "react"
import PropTypes from "prop-types"


class HelloWorld extends React.Component {
  render() {
    return <h1>{this.props.greeting}</h1>
  }
}

HelloWorld.propTypes = {
  greeting: PropTypes.string
};
export default HelloWorld


// <%= react_component("HelloWorld", { greeting: "Hello" }) %>
