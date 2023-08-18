import MovingObject from "./moving_object";
import * as Util from './util'
import Bullet from "./bullet";
// import Game from "./game";


export default class Ship extends MovingObject {
    static RADIUS = 15
    static COLOR = 'green'


    constructor(options) {
        super(options)
        this.vel = {x: 0, y: 0}
        this.radius = Ship.RADIUS
        this.color = Ship.COLOR
    }

    relocate() {
        this.pos = this.game.randomPosition()
        this.vel = {x: 0, y: 0}
    }


    power(impulse) {
        this.vel.x += impulse.x
        this.vel.y += impulse.y
    }


    fireBullet() {
        // console.log('vel' + this.vel)
        const norm = Util.norm(this.vel)

        if (norm === 0) {
            // Can't fire unless moving
            return
        }

        const relVel = Util.scale(Util.dir(this.vel), Bullet.SPEED)

        const bulletVel = {x: relVel.x + this.vel.x, y: relVel.y + this.vel.y}

        const bullet = new Bullet({
            vel: bulletVel,
            pos: this.pos,
            game: this.game
        })
        this.game.add(bullet)
    }

    
}

