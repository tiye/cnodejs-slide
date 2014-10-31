
React = require 'react'
$ = React.DOM
$$ = require '../util/helper'

Timer = require './timer'

slides = require './slides'
rate = 0.9

cx = -> innerWidth / 2
cy = -> innerHeight / 2

module.exports = React.createFactory React.createClass
  displayName: 'app-layout'

  getInitialState: ->
    at: @props.data.at
    focus: no

  componentDidMount: ->
    window.addEventListener 'keydown', @listener

  componentWillUnmount: ->
    window.addEventListener 'keydown', @listener

  listener: (event) ->
    if event.keyCode is 38
      event.preventDefault()
      @goPrev()
    else if event.keyCode is 40
      event.preventDefault()
      @goNext()
    else if event.keyCode is 32
      event.preventDefault()
      @toggleFocus()

  toggleFocus: ->
    @setState focus: (not @state.focus)

  goNext: ->
    nextOne = @state.at + 1
    if nextOne < slides.length
      @setState at: nextOne
      @props.changeAt nextOne

  goPrev: ->
    prevOne = @state.at - 1
    if prevOne >= 0
      @setState at: prevOne
      @props.changeAt prevOne

  jump: (index, focus) ->
    @setState at: index, focus: focus

  renderTitle: (title, index) ->
    if @state.focus
      left = 300
    else
      left = 400
    top = cy() + (index - @state.at) * 80
    $.div
      className: $$.concat 'title',
        if @state.at is index then 'is-focused'
      key: index
      style:
        left: "#{left}px"
        top: "#{top}px"
      onClick: =>
        @jump index, no
      title

  renderContent: (content, index) ->
    if @state.focus
      left = cx() + 60
    else
      left = cx() * 2

    if @state.at is index
      top = cy()
    else if index < @state.at
      top = -cy()
    else
      top = cy() * 3

    $.div
      className: 'content'
      key: index
      style:
        marginTop: "#{-cy() * rate}px"
        marginLeft: "#{-cx() * rate}px"
        left: "#{left}px"
        top: "#{top}px"
        width: "#{rate * 100}%"
        height: "#{rate * 100}%"
      onClick: =>
        @jump index, yes
      content

  render: ->
    titles = []
    contents = []
    for slide, index in slides
      titles.push @renderTitle slide.title, index
      contents.push @renderContent slide.content, index

    $.div className: 'app-layout',
      titles
      contents
      Timer
        data: new Date @props.data.time
        onClick: @props.changeTime