#######################################################
#
# ColorService
#
#######################################################

window.Color = require('color')

module.exports = [
  "$rootScope",
  ($rootScope)->

    class ColorService

      constructor: ()->
        console.log "#### INIT ColorService"

        styleEl = document.createElement('style')
        document.head.appendChild(styleEl)

        @styleSheet = styleEl.sheet

      setColor: (color)=>

        # Calculate colors
        color = Color(color)
        arr = color.rgb()
        inverse = Color({
          r: 255 - arr.r
          g: 255 - arr.g
          b: 255 - arr.b
        })
        @color = color.hexString()
        @inverse = inverse.hexString()


        # Set stylesheet rules
        if @styleSheet.cssRules.length > 0
          for i in [0..(@styleSheet.cssRules.length - 1)]
            @styleSheet.deleteRule 0
        @styleSheet.insertRule ".cl {color: #{@color} !important}", 0
        @styleSheet.insertRule ".cl-i {color: #{@inverse} !important}", 1
        @styleSheet.insertRule ".bg-cl {background-color: #{@color} !important}", 2
        @styleSheet.insertRule ".bg-cl-i {background-color: #{@inverse} !important}", 3

        # console.log "ColorService", arr, {
        #   r: 255 - arr.r
        #   g: 255 - arr.g
        #   b: 255 - arr.b
        # }, inverse




    window.ColorService = new ColorService()
]