{notFound} = require './handlers'

# An extremely primitive router.
exports.route = (handle, pathname, callback) ->
  if handle[pathname]?
    handle[pathname](callback)
  else
    notFound callback
