querystring = require 'querystring'
fs          = require 'fs'

{IncomingForm} = require 'formidable'

# Given a request, handlers perform actions.

exports.start = (response) ->
  console.log 'Request handler "start" was called'

  response.writeHead 200, 'Content-Type': 'text/html; charset=UTF-8'
  response.write """
    <html>
      <head></head>
      <body>
        <form action="/upload" enctype="multipart/form-data" method="post">
          <input type="file" name="upload" />
          <input type="submit" value="Upload file" />
        </form>
      </body>
    </html>
  """

  response.end()

exports.upload = (response, request) ->
  console.log 'Request handler "upload" was called'

  new IncomingForm().parse request, (error, fields, files) ->
    fs.renameSync files.upload.path, '/tmp/test.png'

    response.writeHead 200, 'Content-Type': 'text/html'
    response.write 'Received image:<br />'
    response.write '<img src="/show" />'
    response.end()

exports.show = (response) ->
  console.log 'Request handler "show" was called'

  fs.readFile '/tmp/test.png', 'binary', (error, file) ->
    if error
      response.writeHead 500, 'Content-Type': 'text/plain'
      response.write "#{err}\n"
    else
      response.writeHead 200, 'Content-Type': 'image/png'
      response.write file, 'binary'

    response.end()
