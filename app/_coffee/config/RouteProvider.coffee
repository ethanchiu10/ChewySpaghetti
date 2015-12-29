



module.exports = [
  "$routeProvider"
  ($routeProvider)->
    console.log "#### INIT RouteProvider"

    animResolve = ( delayMap={} )->
      ["$q", "$timeout", "HistoryService", ($q, $timeout, HistoryService)->
        # return true if HistoryService.history.length < 1

        prevPath = HistoryService.getPrevious()?.$$route?.originalPath

        console.log 999, HistoryService.history, prevPath, delayMap

        time = delayMap[ prevPath ] || 0

        console.log "DELAY ANIM BY:", prevPath, prevPath in delayMap, time


        delay = $q.defer()
        $timeout delay.resolve, time, false
        return delay.promise
      ]

    dataResolve = (time)->
      # console.log 'dataResolve'
      ["DataService", (DataService)->
        DataService.getProjects()
      ]




    $routeProvider
      .when('/intro', {
        templateUrl: '/views/intro.html'
        controller: 'IntroCtrl'
        resolve: {
          anim: animResolve()
        }
      })
      .when('/works', {
        templateUrl: '/views/works.html'
        controller: 'WorksCtrl'
        resolve: {
          anim: animResolve({
            "/intro": 2000
          }),
          data: dataResolve()
        }
      })
      .when('/project/:id', {
        templateUrl: '/views/project.html'
        controller: 'ProjectCtrl'
        resolve: {
          anim: animResolve(),
          data: dataResolve()
        }
      })
      .when('/contact', {
        templateUrl: '/views/contact.html'
        controller: 'ContactCtrl'
        resolve: {
          anim: animResolve()
        }
      })
      .otherwise({
        redirectTo: '/intro'
      })



]