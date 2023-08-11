import * as Util from './util.js'
import MovingObject from './moving_object.js'

class Asteroid extends MovingObject {
    static RADIUS = 25
    static COLOR = 'red'

    constructor(options) {
        super(options)
        this.color = Asteroid.COLOR
        this.radius = Asteroid.RADIUS
        this.vel = {x: Math.random(), y: Math.random}
    }
}

export default Asteroid;