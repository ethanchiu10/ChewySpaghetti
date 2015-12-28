#######################################################
#
# WorksCtrl
#
#######################################################

module.exports = [
  "$scope", "$timeout", "$location", "$http", "DataService"
  ($scope, $timeout, $location, $http, DataService)->
    class WorksCtrl

      name: "works"

      constructor: ()->
        console.log "#### INIT WorksCtrl"
        $scope.pageName = @name
        $scope.select = @select

        $scope.projects = DataService.projects

      select: ( evt )->
        console.log evt
        evt.target.classList.add 'active'


    window.WorksCtrl = new WorksCtrl()
]