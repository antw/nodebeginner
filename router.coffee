# An extremely primitive router.
exports.route = (handle, pathname) ->
  if handle[pathname]?
    handle[pathname]()
  else
    console.log "No request handler for #{pathname}"
    '404 Not Found'
