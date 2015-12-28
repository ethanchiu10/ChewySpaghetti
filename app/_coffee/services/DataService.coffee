#######################################################
#
# DataService
#
#######################################################

module.exports = [
  "$rootScope", "$http"
  ($rootScope, $http)->

    class DataService

      constructor: ()->
        console.log "#### INIT DataService"

      getProjects: ()=>
        console.log 'DataService.resolve'
        $http.get('/data/projects.json').then(
          (response)=>
            @projects = response.data
        )


    window.DataService = new DataService()
]