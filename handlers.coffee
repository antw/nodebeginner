# Given a request, handlers perform actions.

exports.start = (callback) ->
  setTimeout (-> callback 200, {}, 'Hello start'), 10000

exports.upload = (callback) ->
  callback 200, {}, 'Hello upload'
