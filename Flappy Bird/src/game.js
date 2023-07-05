import Level from './level'

export default class FlappyBird {
  constructor(canvas) {
    this.ctx = canvas.getContext("2d")
    
    this.dimensions = { width: canvas.width, height: canvas.height }
  }

  restart() {
    const level = new Level(this.dimensions)
    this.animate(this.ctx)
  }

  animate() {
     Level.animate()
  }
}