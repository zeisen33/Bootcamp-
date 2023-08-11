import Level from './level'
import Bird from './bird'
import { CONSTANTS as BIRD_CONSTANTS} from './bird'

export default class FlappyBird {
  constructor(canvas) {
    this.ctx = canvas.getContext("2d")
    this.dimensions = { width: canvas.width, height: canvas.height }
    this.score = 0
    this.registerEvents()
    this.restart()
  }

  play() {
    this.running = true
    this.animate()
  }

  restart() {
    this.running = false
    this.score = 0
    this.level = new Level(this.dimensions)
    this.bird = new Bird(this.dimensions)
    this.animate()
  }

  animate() {
    this.level.animate(this.ctx)
    this.bird.animate(this.ctx)
    if (this.running) {
      requestAnimationFrame(this.animate.bind(this))
    }
    if (this.level.collidesWith(this.bird.getBounds()) || this.bird.y < 0 || (this.bird.y + BIRD_CONSTANTS.BIRD_HEIGHT > this.dimensions.height)) {
      alert (`Crashed! Score: ${this.score}`)
      this.restart()
    }
    this.drawScore()
  }

  passedPipe() {
    this.level.eachPipe(pipe => {
      if (this.bird.getBounds().bottomRight.x = pipe.topPipe.right) {
        this.score += 1
      }
    })
  }
  
  click(e) {
    if (!this.running) {
      this.play()
    }
    this.bird.flap()
  }

  registerEvents() {
    this.boundClickHandler = this.click.bind(this);
    this.ctx.canvas.addEventListener("mousedown", this.boundClickHandler)
  }

  drawScore() {
    const scorePos = {x: this.dimensions.width / 2.0, y: this.dimensions.height / 4.0}
    this.ctx.font = 'bold 50pt serif'
    this.ctx.fillStyle = "white";
    this.ctx.fillText(this.score, scorePos.x, scorePos.y);
    this.ctx.strokeStyle = "black";
    this.ctx.lineWidth = 2;
    this.ctx.strokeText(this.score, scorePos.x, scorePos.y);
  }
}