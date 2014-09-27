config = require './config/config'
debug  = require('debug')('polymer-example')
router = require './config/router'

class App

  start: ->
    app = config.configure()
    router.route app
    server = app.listen app.get('port'), ->
      debug 'Express server listening on port ' + server.address().port

module.exports = new App()