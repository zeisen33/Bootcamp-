

export default class MovingObject {
    constructor(options) {
        this.pos = options.pos
        this.vel = options.vel
        this.radius = options.radius
        this.color = options.color
    }

    draw(ctx) {
        ctx.fillStyle = this.color
        ctx.beginPath()

        ctx.arc(
            this.pos.x,
            this.pos.y,
            this.radius,
            0,
            2 * Math.PI,
            false
        )

        ctx.fill()
    }

    move() {
        this.pos.x += this.vel.x 
        this.pos.y += this.vel.y
    }
}