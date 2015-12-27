#######################################################
#
# App Service
#
#######################################################

module.exports = [
  "$rootScope",
  ($rootScope)->

    class HistoryService

      history: []

      constructor: ()->
        console.log "#### INIT HistoryService"

        $rootScope.$on '$routeChangeStart', ( evt, currRoute, prevRoute )=>
          console.log 111, '$routeChangeStart', currRoute

        $rootScope.$on '$routeChangeSuccess', ( evt, currRoute, prevRoute )=>
          console.log 222, '$routeChangeSuccess', currRoute
          @history.push currRoute

    window.HistoryService = new HistoryService()
]