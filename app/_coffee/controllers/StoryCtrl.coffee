#######################################################
#
# Story Controller
#
#######################################################

module.exports = [
  "$scope", "$timeout", "$location"
  ($scope, $timeout, $location)->
    class StoryCtrl

      name: "story"

      constructor: ()->
        console.log "#### INIT StoryCtrl"
        $scope.pageName = @name
        $scope.next = @next

        $timeout ()->
          $location.path("/intro")
        , 6000

      next: ()->
        $location.path("/home")

    new StoryCtrl()
]