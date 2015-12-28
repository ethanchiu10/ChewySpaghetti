#######################################################
#
# RendererService
#
#######################################################

module.exports = [
  "$rootScope",
  ($rootScope)->

    class RendererService

      items: []

      constructor: ()->
        console.log "#### INIT RendererService"
        @init()

      init: ()=>
        @stage = new PIXI.Stage(0xFFFFFF)
        @renderer = PIXI.autoDetectRenderer(
          window.innerWidth
          window.innerHeight
          null
          true
        )

        container = document.querySelector(".canvas-container")
        return if not container?
        container.appendChild @renderer.view
        requestAnimationFrame @animate


      animate: ()=>
        for item in @items
          item?.update()
        @renderer.render @stage
        requestAnimationFrame @animate

      register: ( item )=>
        @items.push item
        @stage.addChild item

      unregister: ( item )=>
        idx = @items.indexOf item
        if idx >= 0
          items.splice idx, 1

    window.RendererService = new RendererService()
]