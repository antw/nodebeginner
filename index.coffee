server   = require './server'
router   = require './router'
handlers = require './handlers'

# Set up routes and handlers.
handle =
  '/':       handlers.start
  '/start':  handlers.start
  '/upload': handlers.upload
  '/show':   handlers.show

# Starts the simple web server.
server.start(router.route, handle)
