

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
        this.drawBird(ctx)
    }
}