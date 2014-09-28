indexController   = require '../app/index/index-controller'
profileController = require '../app/profile/profile-controller'

class Router

  route: (app) ->
    app.get '/',             indexController.index
    app.get '/profile',      profileController.getProfile

module.exports = new Router()