import Level from './level'
import Bird from './bird'

export default class FlappyBird {
  constructor(canvas) {
    this.ctx = canvas.getContext("2d")
    this.dimensions = { width: canvas.width, height: canvas.height }
    this.registerEvents()
    this.restart()
  }

  play() {
    this.running = true
    this.animate()
  }

  restart() {
    this.running = false
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
}