#######################################################
#
# App Controller
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

      next: ()->
        $location.path("/story")

    new IntroCtrl()
]