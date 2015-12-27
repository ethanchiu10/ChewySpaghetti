



module.exports = [
  "$routeProvider"
  ($routeProvider)->
    console.log "#### INIT RouteProvider"

    resolve = (time)->
      {
        anim: ["$q", "$timeout", "HistoryService", ($q, $timeout, HistoryService)->
          return true if HistoryService.history.length < 1
          console.log "DELAYING BY: ", time
          delay = $q.defer()
          $timeout delay.resolve, time, false
          delay.promise
        ]
      }

    $routeProvider
      .when('/intro', {
        templateUrl: '/views/intro.html'
        controller: 'IntroCtrl'
        resolve: resolve(0)
      })
      # .when('/story', {
      #   templateUrl: '/views/story.html'
      #   controller: 'StoryCtrl'
      #   resolve: resolve(1000)
      # })
      .when('/works', {
        templateUrl: '/views/works.html'
        controller: 'WorksCtrl'
        resolve: resolve(2000)
      })
      .when('/contact', {
        templateUrl: '/views/contact.html'
        controller: 'ContactCtrl'
        resolve: resolve(3500)
      })
      .otherwise({
        redirectTo: '/intro'
      })
]