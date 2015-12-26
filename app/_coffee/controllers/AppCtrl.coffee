#######################################################
#
# AppCtrl
#
#######################################################

module.exports = [
  "$scope", "$timeout", "$location"
  ($scope, $timeout, $location)->
    class AppCtrl

      constructor: ()->
        console.log "#### INIT AppCtrl"


    new AppCtrl()
]