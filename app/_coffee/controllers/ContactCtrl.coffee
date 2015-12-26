#######################################################
#
# ContactCtrl
#
#######################################################

module.exports = [
  "$scope", "$timeout", "$location"
  ($scope, $timeout, $location)->
    class ContactCtrl

      name: "contact"

      constructor: ()->
        console.log "#### INIT ContactCtrl"
        $scope.pageName = @name

    new ContactCtrl()
]