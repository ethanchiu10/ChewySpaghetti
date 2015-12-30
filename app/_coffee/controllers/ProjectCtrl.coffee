#######################################################
#
# ProjectCtrl
#
#######################################################

module.exports = [
  "$scope", "$timeout", "$location", "$http", "$routeParams", "DataService"
  ($scope, $timeout, $location, $http, $routeParams, DataService)->
    class ProjectCtrl

      name: "project"

      constructor: ()->
        console.log "#### INIT ProjectCtrl"
        $scope.pageName = @name

        $scope.$on '$routeChangeStart', ( evt, currRoute, prevRoute )=>
          angular.element( document.querySelector("div[ng-view].#{@name}") ).addClass('ng-leave')
          angular.element( document.querySelector("div[ng-view].#{@name}") ).addClass('ng-leave-active')

        @init()

      init: ()->
        projects = DataService.projects
        projectId = $routeParams.id
        $scope.project = _.find projects, (project)-> project.id == projectId
        console.log projectId, projects
        if not $scope.project?
          $location.path "/"



    window.ProjectCtrl = new ProjectCtrl()
]