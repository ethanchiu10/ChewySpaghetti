module.exports = [
  "$routeProvider",
  ($routeProvider)->
    console.log "INIT RouteProvider"
    $routeProvider
      .when('/intro', {
        templateUrl: '/views/intro.html'
        controller: 'IntroCtrl'
      })
      .when('/story', {
        templateUrl: '/views/story.html'
        controller: 'StoryCtrl'
      })
      .otherwise({
        redirectTo: '/intro'
      })
]