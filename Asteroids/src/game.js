import Asteroid from "./asteroid"
import * as Util from './util'

export default class Game {
    static DIM_X = 480
    static DIM_Y = 640
    static NUM_ASTEROIDS = 4

    constructor() {
        this.asteroids = []
        this.addAsteroids()
    }

    addAsteroids() {
        for (let i = 0; i < Game.NUM_ASTEROIDS; i++) {
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

    // checkCollisions() {
    //     for (let i = 0; i < Game.NUM_ASTEROIDS; i++) {
    //         for (let j = 1; j < Game.NUM_ASTEROIDS; j++) {
    //             if (i < j && this.asteroids[i].isCollidedWith(this.asteroids[j])) {
    //                 this.asteroids[i].collideWith(this.asteroids[j])
    //                 return
    //             }
    //         }
    //     }
    // }

    checkCollisions() {
        const allAsteroids = this.asteroids
        for (let i = 0; i < allAsteroids.length; i++) {
            for (let j = 1; j < allAsteroids.length; j++) {
                const ast1 = allAsteroids[i]
                const ast2 = allAsteroids[j]

                if (i < j && ast1.isCollidedWith(ast2)) {
                    // const collision = ast1.collideWith(ast2)
                    // if (collision) return
                    console.log('collision')
                    return
                }
            }
        }
    }

    step() {
        this.moveObjects()
        this.checkCollisions()
    }

    remove(asteroid) {
        this.asteroids.splice(this.asteroids.indexOf(asteroid), 1)
    }
}