#######################################################
#
# LineService
#
#######################################################

Line          = require('.././models/Line')()

module.exports = [
  "$rootScope", "$timeout", "RendererService"
  ($rootScope, $timeout, RendererService)->

    class LineService

      constructor: ()->
        console.log "#### INIT LineService"

      init: ()->
        for i in [0..0]
          line = new Line(
            0
            100 + i * 5
            "#0030C1"
            50
            30
            0.05
          )
          RendererService.register line

    window.LineService = new LineService()

]