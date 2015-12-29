#######################################################
#
# HistoryService
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
          # console.log 111, '$routeChangeStart', currRoute
          @history.push currRoute

        $rootScope.$on '$routeChangeSuccess', ( evt, currRoute, prevRoute )=>
          # console.log 222, '$routeChangeSuccess', currRoute

      getCurrent: ()->
        return _.last @history

      getPrevious: ()->
        return null if @history.length < 2
        return @history[ @history.length - 2 ]

    window.HistoryService = new HistoryService()
]