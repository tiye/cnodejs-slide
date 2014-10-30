
exports.switch = (name, registry) ->
  registry[name]()

exports.if = (cond, a, b) ->
  if cond then a() else b?()

exports.concat = (args...) ->
  list = []
  for arg in args
    list.push arg if arg?
  list.join(' ')