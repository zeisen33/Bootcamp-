export const CONSTANTS = {
    GRAVITY: 0.5,
    FLAP_VELOCITY: -8,
    BIRD_WIDTH: 40,
    BIRD_HEIGHT: 30
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
        ctx.fillRect(this.x, this.y, CONSTANTS.BIRD_WIDTH, CONSTANTS.BIRD_HEIGHT)
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

    getBounds() {
        return {topLeft: {x: this.x, y: this.y}, bottomRight: {x: this.x + CONSTANTS.BIRD_WIDTH, y: this.y + CONSTANTS.BIRD_HEIGHT}}
    }
}