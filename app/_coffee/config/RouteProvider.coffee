



module.exports = [
  "$routeProvider"
  ($routeProvider)->
    console.log "#### INIT RouteProvider"

    animResolve = (time)->
      ["$q", "$timeout", "HistoryService", ($q, $timeout, HistoryService)->
        return true if HistoryService.history.length < 1
        console.log "DELAYING BY: ", time
        delay = $q.defer()
        $timeout delay.resolve, time, false
        delay.promise
      ]

    dataResolve = (time)->
      console.log 'dataResolve'
      ["DataService", (DataService)->
        DataService.getProjects()
      ]




    $routeProvider
      .when('/intro', {
        templateUrl: '/views/intro.html'
        controller: 'IntroCtrl'
        resolve: {
          anim: animResolve(0)
        }
      })
      .when('/works', {
        templateUrl: '/views/works.html'
        controller: 'WorksCtrl'
        resolve: {
          anim: animResolve(2000),
          data: dataResolve()
        }
      })
      .when('/project/:id', {
        templateUrl: '/views/project.html'
        controller: 'ProjectCtrl'
        resolve: {
          anim: animResolve(0),
          data: dataResolve()
        }
      })
      .when('/contact', {
        templateUrl: '/views/contact.html'
        controller: 'ContactCtrl'
        resolve: {
          anim: animResolve(3500)
        }
      })
      .otherwise({
        redirectTo: '/intro'
      })



]