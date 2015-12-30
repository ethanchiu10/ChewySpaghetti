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

        $scope.toggleContact = @toggleContact
        $scope.showContact = false

        @init()

      init: ()->

        $scope.$on '$routeChangeSuccess', ( evt, currRoute, prevRoute )=>
          $scope.curr = currRoute?.$$route?.originalPath
          $scope.showContact = false
          console.log "AppCtrl.scope.curr", $scope.curr
          ga 'send', 'pageview', $location.path()

        $scope.color = "black"
        $scope.$watch 'color', (next, prev)->
          return if prev == next
          ColorService.setColor next


      toggleContact: ()=>
        $scope.showContact = !$scope.showContact
        if $scope.showContact
          ga 'send', 'event', 'contact', 'show'


    window.AppCtrl = new AppCtrl()
]