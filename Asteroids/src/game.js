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

    moveObjects(delta) {
        this.allObjects().forEach(object => object.move(delta))
    }

    // moveObjects() {
    //     this.allObjects().forEach(object => object.move())
    // }

    wrap(pos) {
        return {x: Util.wrap(pos.x, Game.DIM_X), y: Util.wrap(pos.y, Game.DIM_Y)}
    }

    checkCollisions() {
        const allObjects = this.allObjects()
        // console.log('allobjs:' + allObjects)
        for (let i = 0; i < allObjects.length; i++) {
            for (let j = 0; j < allObjects.length; j++) {
                const obj1 = allObjects[i]
                // console.log('obj1: ' + obj1)
                const obj2 = allObjects[j]
                // console.log('obj2: ' + obj2)

                // console.log(`i: ${i} j: ${j} obj1: ${obj1} obj2: ${obj2}`)


                if (obj1.isCollidedWith(obj2)) {
                    const collision = obj1.collideWith(obj2);
                    if (collision) return;
                }
                // if (i !== j && obj1.isCollidedWith(obj2)) {
                //     obj1.collideWith(obj2)
                //     return
            }
        }
    }

    step(delta) {
        this.moveObjects(delta)
        this.checkCollisions()
    }

    remove(object) {
        if (object instanceof Bullet) {
            this.bullets.splice(this.bullets.indexOf(object), 1);
          } else if (object instanceof Asteroid) {
            this.asteroids.splice(this.asteroids.indexOf(object), 1);
          } else if (object instanceof Ship) {
            this.ships.splice(this.ships.indexOf(object), 1);
          } else {
            throw new Error("unknown type of object");
          }
    }

    allObjects() {
        const allObjects = [].concat(this.ships, this.asteroids, this.bullets)
        // console.log('allObjs:' + allObjects)
        return allObjects
    }

    isOutOfBounds(pos) {
        if (pos.x > Game.DIM_X || pos.x < 0) {
            return true
        } else if (pos.y > Game.DIM_Y || pos.y < 0) {
            return true
        }

        return false
    }
}