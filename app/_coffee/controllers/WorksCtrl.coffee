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
      numItemsPerPage: 4
      currentIndex: 0

      constructor: ()->
        console.log "#### INIT WorksCtrl"
        $scope.pageName = @name
        $scope.select = @select
        $scope.nextPage = @nextPage
        $scope.prevPage = @prevPage
        @init()



      init: ()->

        @projects = DataService.projects

        projects = []
        projects = projects.concat @projects[@currentIndex..@currentIndex + @numItemsPerPage - 1]
        projects = projects.concat @projects
        projects = projects[0..(@numItemsPerPage - 1)]
        @updatePage projects




      select: ( order, project )->
        $scope.selected =
          order: order
          project: project
        $timeout ()->
          $location.path "/project/#{project.id}"
        , 1500


      nextPage: ()=>
        angular.element( document.querySelector('.items') ).removeClass('down').addClass('up')

        @currentIndex += @numItemsPerPage
        if @currentIndex > @projects.length
          @currentIndex = @currentIndex - @projects.length

        @updatePage()


      prevPage: ()=>
        angular.element( document.querySelector('.items') ).removeClass('up').addClass('down')

        @currentIndex -= @numItemsPerPage
        if @currentIndex < 0
          @currentIndex = @projects.length + @currentIndex

        @updatePage()



      updatePage: ()=>

        projects = []
        projects = projects.concat @projects[@currentIndex..@currentIndex + @numItemsPerPage - 1]
        projects = projects.concat @projects
        projects = projects[0..(@numItemsPerPage - 1)]

        $scope.projects = []
        for project in projects
          $scope.projects.push _.clone(project)
        console.log "updatePage", _.pluck($scope.projects, 'id')



    window.WorksCtrl = new WorksCtrl()
]