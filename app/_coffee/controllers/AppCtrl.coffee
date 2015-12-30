#######################################################
#
# AppCtrl
#
#######################################################

module.exports = [
  "$scope", "$timeout", "$location", "HistoryService", "ColorService"
  ($scope, $timeout, $location, HistoryService, ColorService)->
    class AppCtrl

      constructor: ()->
        console.log "#### INIT AppCtrl"

        $scope.$on '$routeChangeSuccess', ( evt, currRoute, prevRoute )=>
          $scope.curr = currRoute?.$$route?.originalPath
          console.log "AppCtrl.scope.curr", $scope.curr

        $scope.color = "black"
        $scope.$watch 'color', (next, prev)->
          return if prev == next
          ColorService.setColor next

        $scope.showContact = false


    window.AppCtrl = new AppCtrl()
]