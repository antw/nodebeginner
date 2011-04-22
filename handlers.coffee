# Given a request, handlers perform actions.

exports.start = (callback) ->
  setTimeout (-> callback 'Hello start'), 10000

exports.upload = (callback) ->
  callback 'Hello upload'
