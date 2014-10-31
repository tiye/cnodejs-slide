
React = require 'react'

Layout = require './app/layout'
key = 'cnodejs-slide'

rawData = (localStorage.getItem key) or '{}'
data = JSON.parse rawData

if data.time?
  data.time = new Date data.time
else
  data.time = (new Date).toISOString()
unless data.at?
  data.at = 0

window.onbeforeunload = ->
  rawData = JSON.stringify data
  localStorage.setItem key, rawData

component = Layout
  data: data
  changeAt: (n) ->
    data.at = n
  changeTime: (time) ->
    data.time = time

React.render component, document.body