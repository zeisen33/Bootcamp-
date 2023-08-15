import Asteroid from "./asteroid"
import * as Util from './util'
import Ship from "./ship"
import Bullet from "./bullet"

export default class Game {
    static DIM_X = 480
    static DIM_Y = 640
    static NUM_ASTEROIDS = 4

    constructor() {
        this.asteroids = []
        this.ships = []
        this.bullets = []
        
        this.addAsteroids()
    }

    add(object) {
        if (object instanceof Asteroid) {
            this.asteroids.push(object);
        } else if (object instanceof Bullet) {
            this.bullets.push(object);
        } else if (object instanceof Ship) {
            this.ships.push(object);
        } else {
            throw new Error("unknown type of object");
        }
    }

    addAsteroids() {
        for (let i = 0; i < Game.NUM_ASTEROIDS; i++) {
            this.add(new Asteroid({pos: this.randomPosition(), game: this}))
        }
    }

    addShip() {
        const ship = new Ship({pos: this.randomPosition(), game: this})
        this.add(ship)
        return ship
    }


    randomPosition() {
        const xPos = Math.random() * Game.DIM_X
        const yPos = Math.random() * Game.DIM_Y
        return {x: xPos, y: yPos}
    }

    draw(ctx) {
        ctx.clearRect(0, 0, Game.DIM_X, Game.DIM_Y)
        this.allObjects().forEach(object => object.draw(ctx))
    }


    moveObjects() {
        this.allObjects().forEach(object => object.move())
    }

    wrap(pos) {
        return {x: Util.wrap(pos.x, Game.DIM_X), y: Util.wrap(pos.y, Game.DIM_Y)}
    }

    checkCollisions() {
        const allObjects = this.allObjects()
        // console.log('allobjs:' + allObjects)
        for (let i = 0; i < allObjects.length; i++) {
            for (let j = 1; j < allObjects.length; j++) {
                const obj1 = allObjects[i]
                const obj2 = allObjects[j]

                // console.log(`i: ${i} j: ${j} obj1: ${obj1} obj2: ${obj2}`)

                if (i < j && obj1.isCollidedWith(obj2)) {
                    obj1.collideWith(obj2)
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

    allObjects() {
        const allObjects = [].concat(this.ships, this.asteroids, this.bullets)
        // console.log('allObjs:' + allObjects)
        return allObjects
    }
}