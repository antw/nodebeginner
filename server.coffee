http = require 'http'
url  = require 'url'

# Starts a simple web server on port 8888.
exports.start = (route, handle) ->

  http.createServer (request, response) ->
    pathname = url.parse(request.url).pathname

    route handle, pathname, (code, headers, body) ->
      unless headers?
        # One argument given; permits supplying only a response body.
        body    = code
        code    = 200
        headers = {}

      else unless body?
        # Two arguments given; permits skipping the headers.
        body    = headers
        headers = {}

      headers['Content-Type'] or= 'text/html'

      response.writeHead code, headers
      response.write body
      response.end()

      console.log "#{code} - #{pathname}"

  .listen(8888)

  console.log 'Server started.'
