import * as Util from './util'

export default class MovingObject {
    constructor(options) {
        this.pos = options.pos
        this.vel = options.vel
        this.radius = options.radius
        this.color = options.color
        this.game = options.game
        this.isWrappable = true
    }

    draw(ctx) {
        ctx.fillStyle = this.color
        ctx.beginPath()

        console.log('drawing')

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

        const pos = this.pos

        if (this.game.isOutOfBounds(pos)) {
            if (this.isWrappable) {
                this.pos = this.game.wrap(this.pos)
            } else {
                this.remove(this)
            }
        }
        this.pos = this.game.wrap(pos)
    }

    isCollidedWith(otherObject) {
        return Util.distance(this.pos, otherObject.pos) < this.radius + otherObject.radius
    }

    collideWith(otherObject) {
        console.log('collide')
        // this.game.remove(this)
        // this.game.remove(otherObject)
    }

    remove(object) {
        this.game.remove(this);
    };
}