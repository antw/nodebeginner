http = require 'http'
url  = require 'url'

# Starts a simple web server on port 8888.
exports.start = (route, handle) ->

  http.createServer (request, response) ->
    pathname = url.parse(request.url).pathname

    route handle, pathname, (args...) ->
      [ code, headers, body ] = args

      if args.length is 1
        # Permits supplying only a response body.
        body    = code
        code    = 200
        headers = {}

      else if args.length is 2
        # Permits skipping the headers.
        body    = headers
        headers = {}

      headers['Content-Type'] or= 'text/html'

      response.writeHead code, headers
      response.write body
      response.end()

      console.log "#{code} - #{pathname}"

  .listen(8888)

  console.log 'Server started.'
