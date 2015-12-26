module.exports = [
  "$routeProvider",
  ($routeProvider)->
    console.log "#### INIT RouteProvider"
    $routeProvider
      .when('/intro', {
        templateUrl: '/views/intro.html'
        controller: 'IntroCtrl'
      })
      .when('/story', {
        templateUrl: '/views/story.html'
        controller: 'StoryCtrl'
      })
      .when('/works', {
        templateUrl: '/views/works.html'
        controller: 'WorksCtrl'
      })
      .when('/contact', {
        templateUrl: '/views/contact.html'
        controller: 'ContactCtrl'
      })
      .otherwise({
        redirectTo: '/intro'
      })
]