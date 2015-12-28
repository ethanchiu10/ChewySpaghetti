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
        $scope.nextPage = @nextPage
        $scope.prevPage = @prevPage

        @init()



      init: ()->

        $scope.projects = DataService.projects

        numItemsPerPage = 4
        for project, i in $scope.projects
          project.page = Math.floor(i / numItemsPerPage)
          console.log i, project.page

        $scope.numPages = Math.ceil(i / numItemsPerPage)
        $scope.currentPage = 0




      select: ( evt )->
        console.log evt
        evt.target.classList.add 'active'

      # nextPage: ()->
      #   $scope.currentPage += 1
      #   if $scope.currentPage >= $scope.numPages
      #     $scope.currentPage = 0
      #   console.log 'nextPage', $scope.currentPage, $scope.numPages





    window.WorksCtrl = new WorksCtrl()
]