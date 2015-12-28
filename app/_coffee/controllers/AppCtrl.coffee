#######################################################
#
# AppCtrl
#
#######################################################

module.exports = [
  "$scope", "$timeout", "$location", "LineService", "HistoryService", "ColorService"
  ($scope, $timeout, $location, LineService, HistoryService, ColorService)->
    class AppCtrl

      constructor: ()->
        console.log "#### INIT AppCtrl"

        $scope.$on '$routeChangeSuccess', ( evt, currRoute, prevRoute )=>
          console.log currRoute
          $scope.curr = currRoute.$$route.originalPath

        $scope.color = "black"
        $scope.$watch 'color', (next, prev)->
          return if prev == next
          ColorService.setColor next


    window.AppCtrl = new AppCtrl()
]