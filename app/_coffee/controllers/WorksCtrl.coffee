#######################################################
#
# WorksCtrl
#
#######################################################

module.exports = [
  "$scope", "$timeout", "$location", "LineService"
  ($scope, $timeout, $location, LineService)->
    class WorksCtrl

      name: "works"

      constructor: ()->
        console.log "#### INIT WorksCtrl"
        $scope.pageName = @name

        # LineService.init()


    new WorksCtrl()
]