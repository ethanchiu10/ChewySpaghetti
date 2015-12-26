#######################################################
#
# StoryCtrl
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

      next: ()->
        $location.path("/home")

    new StoryCtrl()
]