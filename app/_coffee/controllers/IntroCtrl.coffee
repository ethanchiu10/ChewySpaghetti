#######################################################
#
# IntroCtrl
#
#######################################################

module.exports = [
  "$scope", "$timeout", "$location"
  ($scope, $timeout, $location)->
    class IntroCtrl

      name: "intro"

      constructor: ()->
        console.log "#### INIT IntroCtrl"
        $scope.pageName = @name
        $scope.next = @next

        $scope.$on '$routeChangeStart', ( evt, currRoute, prevRoute )=>
          angular.element( document.querySelector("div[ng-view].#{@name}") ).addClass('ng-leave')
          angular.element( document.querySelector("div[ng-view].#{@name}") ).addClass('ng-leave-active')



      next: ()->
        $location.path("/works")



    window.IntroCtrl = new IntroCtrl()
]