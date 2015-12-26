#######################################################
#
# AppCtrl
#
#######################################################

module.exports = [
  "$scope", "$timeout", "$location", "LineService",
  ($scope, $timeout, $location, LineService)->
    class AppCtrl

      constructor: ()->
        console.log "#### INIT AppCtrl"


    new AppCtrl()
]