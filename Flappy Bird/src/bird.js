const CONSTANTS = {
    GRAVITY: 0.5,
    FLAP_VELOCITY: -8
}

export default class Bird {
    constructor(dimensions) {
        this.velocity = 0;
        this.height = dimensions.height
        this.width = dimensions.width
        this.y = dimensions.height/2.0
        this.x = dimensions.width/3.0
    }

    drawBird(ctx) {
        ctx.fillStyle = "yellow"
        ctx.fillRect(this.x, this.y, 40, 30)
    }

    animate(ctx) {
        this.move()
        this.drawBird(ctx)
    }

    move() {
        this.y += this.velocity
        this.velocity += CONSTANTS.GRAVITY
    }

    flap() {
        this.velocity = CONSTANTS.FLAP_VELOCITY
    }
}