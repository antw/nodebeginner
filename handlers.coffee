# Given a request, handlers perform actions.

exports.start = ->
  console.log 'Request handler "start" was called'

  sleep = (ms) ->
    startTime = new Date().getTime()
    while new Date().getTime() < startTime + ms
      yes

  sleep 10000

  'Hello start'

exports.upload = ->
  console.log 'Request handler "upload" was called'
  'Hello upload'
