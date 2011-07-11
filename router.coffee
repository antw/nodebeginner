# An extremely primitive router.
exports.route = (handle, pathname, response, request) ->
  if handle.hasOwnProperty pathname
    handle[pathname](response, request)
  else
    console.log "No request handler for #{pathname}"

    response.writeHead 404, 'Content-Type': 'text/html'
    response.write '404 Not Found'
    response.end()
