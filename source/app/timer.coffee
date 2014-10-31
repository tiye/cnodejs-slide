
React = require 'react'
$ = React.DOM

module.exports = React.createFactory React.createClass
  displayName: 'app-timer'

  getInitialState: ->
    start: @props.data
    now: new Date

  onClick: ->
    @props.onClick()
    @setState start: new Date

  componentDidMount: ->
    setInterval =>
      @setState now: new Date
    , 1000

  render: ->
    n = (@state.now - @state.start) / 60000
    $.div
      className: 'timer'
      onClick: @onClick
      n.toFixed()