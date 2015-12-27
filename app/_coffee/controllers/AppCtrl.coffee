#######################################################
#
# AppCtrl
#
#######################################################

module.exports = [
  "$scope", "$timeout", "$location", "LineService", "HistoryService"
  ($scope, $timeout, $location, LineService, HistoryService)->
    class AppCtrl

      constructor: ()->
        console.log "#### INIT AppCtrl"


    new AppCtrl()
]