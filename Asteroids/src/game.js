import Asteroid from "./asteroid"
import * as Util from './util'

export default class Game {
    static DIM_X = 480
    static DIM_Y = 640
    static NUM_ASTEROIDS = 5

    constructor() {
        this.asteroids = []
        this.addAsteroids()
    }

    addAsteroids() {
        for (let i = 0; i < 5; i++) {
            console.log(i)
            const ast = new Asteroid({pos: this.randomPosition(), game: this})
            this.asteroids.push(ast)
        }
        console.log(this.asteroids)
    }

    randomPosition() {
        const xPos = Math.random() * Game.DIM_X
        const yPos = Math.random() * Game.DIM_Y
        return {x: xPos, y: yPos}
    }

    draw(ctx) {
        ctx.clearRect(0, 0, Game.DIM_X, Game.DIM_Y)
        this.asteroids.forEach(asteroid => asteroid.draw(ctx))
    }


    moveObjects() {
        this.asteroids.forEach(asteroid => asteroid.move())
    }

    wrap(pos) {
        return {x: Util.wrap(pos.x, Game.DIM_X), y: Util.wrap(pos.y, Game.DIM_Y)}
    }
}