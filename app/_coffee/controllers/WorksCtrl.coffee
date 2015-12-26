#######################################################
#
# WorksCtrl
#
#######################################################

module.exports = [
  "$scope", "$timeout", "$location"
  ($scope, $timeout, $location)->
    class WorksCtrl

      name: "works"

      constructor: ()->
        console.log "#### INIT WorksCtrl"
        $scope.pageName = @name


    new WorksCtrl()
]