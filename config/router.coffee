indexController = require '../app/index-controller'

class Router

  route: (app) ->
    app.get '/foo', (req, res) -> res.send 200

module.exports = new Router()