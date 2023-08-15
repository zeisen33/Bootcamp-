import MovingObject from "./moving_object";


export default class Bullet extends MovingObject {
    static RADIUS = 2
    static COLOR = 'black'
    static SPEED = 10

    constructor(options) {
        super(options)
        this.radius = Bullet.RADIUS
        this.color = Bullet.COLOR
    }
}