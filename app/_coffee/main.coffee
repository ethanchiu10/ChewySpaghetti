#######################################################
#
# MAIN
#
#######################################################


#######################################################
# Require
#######################################################
window.$ = require 'jquery'
window._ = require 'underscore'

require 'angular'
require 'angular-route'
require 'angular-animate'
require 'angular-touch'

require 'gsap/src/minified/TweenLite.min'
require 'gsap/src/minified/TweenMax.min'



#######################################################
# Setup
#######################################################
app = angular.module('app', ['ngRoute', 'ngAnimate', 'ngTouch'])



app.factory       'RendererService',      require('./services/RendererService')
app.factory       'LineService',          require('./services/LineService')
app.factory       'HistoryService',       require('./services/HistoryService')

app.directive     'blast',                require('./directives/Blast')

app.controller    'AppCtrl',              require('./controllers/AppCtrl')
app.controller    'IntroCtrl',            require('./controllers/IntroCtrl')
app.controller    'StoryCtrl',            require('./controllers/StoryCtrl')
app.controller    'WorksCtrl',            require('./controllers/WorksCtrl')
app.controller    'ContactCtrl',          require('./controllers/ContactCtrl')


app.config require('./config/RouteProvider')

# resolve = {
#   anim: ["$q", "$timeout", "HistoryService", ($q, $timeout, HistoryService)->
#     console.log 111, HistoryService.history.length
#     return true if HistoryService.history.length < 1
#     delay = $q.defer()
#     $timeout delay.resolve, 3000, false
#     delay.promise
#   ]
# }

# app.config [
#   "$routeProvider"
#   ($routeProvider)->
#     console.log "#### INIT RouteProvider"


#     $routeProvider
#       .when('/intro', {
#         templateUrl: '/views/intro.html'
#         controller: 'IntroCtrl'
#       })
#       .when('/story', {
#         templateUrl: '/views/story.html'
#         controller: 'StoryCtrl'
#       })
#       .when('/works', {
#         templateUrl: '/views/works.html'
#         controller: 'WorksCtrl'
#         resolve: resolve
#       })
#       .when('/contact', {
#         templateUrl: '/views/contact.html'
#         controller: 'ContactCtrl'
#       })
#       .otherwise({
#         redirectTo: '/intro'
#       })
# ]