# An extremely primitive router.
exports.route = (handle, pathname, response) ->
  if handle[pathname]?
    handle[pathname](response)
  else
    console.log "No request handler for #{pathname}"

    response.writeHead 404, 'Content-Type': 'text/html'
    response.write '404 Not Found'
    response.end()
