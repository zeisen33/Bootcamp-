import * as Util from './util.js'
import MovingObject from './moving_object.js'
import Ship from './ship.js'
import Bullet from './bullet.js'

class Asteroid extends MovingObject {
    static RADIUS = 25
    static COLOR = 'red'

    constructor(options) {
        super(options)
        this.color = Asteroid.COLOR
        this.radius = Asteroid.RADIUS
        this.vel = {x: 1, y: 1}
    }

    collideWith(otherObject) {
        if (otherObject instanceof Ship) {
            otherObject.relocate()
            return true
        } else if (otherObject instanceof Bullet) {
            this.remove()
            otherObject.remove()
            return true
        }
    
        return false
    }
}

export default Asteroid;