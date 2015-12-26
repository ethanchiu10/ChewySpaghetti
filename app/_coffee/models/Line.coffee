#######################################################
#
# Line
#
#######################################################

module.exports = ()->

  class Line

    constructor: ( @posX = 0, @posY = window.innerHeight / 2, @color="#0030C1", @numPoints = 20, @animY = 30, @animSpeed = 0.1 )->

      console.log "#### INIT Line"

      # Create Points
      @length = window.innerWidth * window.devicePixelRatio / @numPoints
      @points = []
      for i in [0..@numPoints]
        segSize = @length
        @points.push(new PIXI.Point(i * @length, 0))

      # Create Rope
      @texture = @createTexture @color
      @strip = new PIXI.Rope(@texture, @points)

      # Create container
      container = new PIXI.DisplayObjectContainer()
      container.position.x = @posX
      container.position.y = @posY
      container.addChild @strip

      @count = 0

      container.update = @update

      return container



    createTexture: ( color )=>

      # Create Canvas
      canvas = document.createElement("canvas")
      canvas.width = window.innerWidth * window.devicePixelRatio / 2
      canvas.height = 1
      ctx = canvas.getContext('2d')

      # Create Gradient
      gradient = ctx.createLinearGradient(0,0,canvas.width,0)
      gradient.addColorStop(0, "#333")
      gradient.addColorStop(1, "#FFF")


      # Fill
      ctx.fillStyle = gradient
      ctx.fillRect(0,0,canvas.width,1)

      # Create Texture
      new PIXI.Texture(new PIXI.BaseTexture(canvas))


    update: ()=>

      @count += @animSpeed

      for i in [0..@points.length-1]
        @points[i].y = Math.sin(i * 0.5 + @count) * @animY
        @points[i].x = i * @length + Math.cos(i * 0.3  + @count) * @numPoints

