bodyParser   = require 'body-parser'
cookieParser = require 'cookie-parser'
env          = require '../env.json'
express      = require 'express'
favicon      = require 'serve-favicon'
logger       = require 'morgan'
path         = require 'path'

class Config

  ROOT_PATH = path.join(__dirname, '../')

  configure: ->
    app = express()

    app.set 'views', ROOT_PATH + 'app'
    app.set 'view engine', 'jade'
    app.set 'port', process.env.PORT || 3000
    app.use favicon(ROOT_PATH + 'assets/custom/images/favicon.ico')
    app.use logger('dev')
    app.use bodyParser.json()
    app.use bodyParser.urlencoded(extended: false)
    app.use cookieParser()
    app.use express.static(ROOT_PATH + 'assets')
    app.locals.pretty = !env.compression.jade

    app

module.exports = new Config()