import MovingObject from "./moving_object";


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
}