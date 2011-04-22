# An extremely primitive router.
exports.route = (handle, pathname, callback) ->
  if handle[pathname]?
    handle[pathname](callback)
  else
    callback 404, {}, '404 Not Found'
