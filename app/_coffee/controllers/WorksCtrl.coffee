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

        $scope.numPages = Math.ceil(i / numItemsPerPage)
        $scope.currentPage = 0




      select: ( order, project )->
        $scope.selected =
          order: order
          project: project
        console.log $scope.selected


      nextPage: ()->
        angular.element( document.querySelector('.items') ).removeClass('down').addClass('up')
        $scope.currentPage += 1
        if $scope.currentPage >= $scope.numPages
          $scope.currentPage = 0


      prevPage: ()->
        angular.element( document.querySelector('.items') ).removeClass('up').addClass('down')
        $scope.currentPage -= 1
        if $scope.currentPage < 0
          $scope.currentPage = $scope.numPages - 1




    window.WorksCtrl = new WorksCtrl()
]