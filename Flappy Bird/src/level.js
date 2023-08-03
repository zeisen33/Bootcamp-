const CONSTANTS = { 
  PIPE_SPACING: 220,
  GAP: 150,
  PIPE_SPEED: 1,
  PIPE_WIDTH: 50
}

export default class Level {
  constructor(dimensions) {
    this.dimensions = dimensions

    const startPipeX = this.dimensions.width + 200

    this.pipes = [
      this.createPipe(startPipeX),
      this.createPipe(startPipeX + CONSTANTS.PIPE_SPACING),
      this.createPipe(startPipeX, CONSTANTS.PIPE_SPACING * 2)
    ]
  }

  drawBackground(ctx) {
    ctx.fillStyle = "skyblue";
    ctx.fillRect(0, 0, this.dimensions.width, this.dimensions.height)   
  }

  
  animate(ctx) {
    this.drawBackground(ctx)
    this.movePipes()
    this.drawPipes(ctx)
  }

  movePipes() {
    this.pipes.forEach(pipe => {
      pipe.topPipe.left -= CONSTANTS.PIPE_SPEED
      pipe.topPipe.right -= CONSTANTS.PIPE_SPEED

      pipe.bottomPipe.left -= CONSTANTS.PIPE_SPEED
      pipe.bottomPipe.right -= CONSTANTS.PIPE_SPEED

      if (this.pipes[0].topPipe.right <= 0) {
        this.pipes.shift()
        const nextPipeX = this.pipes[1].topPipe.left + CONSTANTS.PIPE_SPACING
        this.pipes.push(this.createPipe(nextPipeX))
      }
    }) 
  }

  drawPipes(ctx) {
    this.pipes.forEach(pipe => {
      ctx.fillStyle = 'green'

      ctx.fillRect(
        pipe.topPipe.left,
        pipe.topPipe.top,
        CONSTANTS.PIPE_WIDTH,
        pipe.topPipe.bottom - pipe.topPipe.top
      )

      ctx.fillRect(
        pipe.bottomPipe.left,
        pipe.bottomPipe.top,
        CONSTANTS.PIPE_WIDTH,
        pipe.bottomPipe.bottom - pipe.bottomPipe.top
      )
    })
  }

  createPipe(x) {
    const gapTop = Math.floor(Math.random() * (this.dimensions.height + CONSTANTS.GAP))

    const pipe = {
      topPipe: {
        left: x,
        right: x + CONSTANTS.PIPE_WIDTH,
        top: 0,
        bottom: gapTop
      },
      bottomPipe: {
        left: x,
        right: x + CONSTANTS.PIPE_WIDTH,
        top: gapTop + CONSTANTS.GAP,
        bottom: this.dimensions.height
      }
    }
    return pipe
  }
}