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

app.config require('./config/RouteProvider')

app.factory       'RendererService',      require('./services/RendererService')
app.factory       'LineService',          require('./services/LineService')

app.directive     'blast',                require('./directives/Blast')

app.controller    'AppCtrl',              require('./controllers/AppCtrl')
app.controller    'IntroCtrl',            require('./controllers/IntroCtrl')
app.controller    'StoryCtrl',            require('./controllers/StoryCtrl')
app.controller    'WorksCtrl',            require('./controllers/WorksCtrl')
app.controller    'ContactCtrl',          require('./controllers/ContactCtrl')


