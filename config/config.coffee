bodyParser   = require 'body-parser'
cookieParser = require 'cookie-parser'
express      = require 'express'
favicon      = require 'serve-favicon'
logger       = require 'morgan'
path         = require 'path'

class Config

  configure: ->
    app = express()

    app.set 'views', path.join(__dirname, '../views')
    app.set 'view engine', 'jade'
    app.set 'port', process.env.PORT || 3000
    app.use favicon(__dirname + '/../public/favicon.ico')
    app.use logger('dev')
    app.use bodyParser.json()
    app.use bodyParser.urlencoded(extended: false)
    app.use cookieParser()
    app.use express.static(path.join(__dirname, 'public'))
    app.router()

    app.use (req, res, next) ->
      err = new Error 'Not Found'
      err.status = 404
      next err

    if (app.get('env') == 'development')
      app.use (err, req, res, next) ->
        res.status err.status || 500
        res.render 'error',
          message: err.message,
          error:   err

    app.use (err, req, res, next) ->
      res.status(err.status || 500);
      res.render 'error',
        message: err.message,
        error:   {}

    app.get('/', (req, res) -> res.send 'foobar')

    app

module.exports = new Config()