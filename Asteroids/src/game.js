import Asteroid from "./asteroid"

export default class Game {
    static DIM_X = 480
    static DIM_Y = 640
    static NUM_ASTEROIDS = 5

    constructor() {
        this.asteroids = []
        this.addAsteroids()
    }

    addAsteroids() {
        for (let i = 0; i < NUM_ASTEROIDS, i++;) {
            this.asteroids.push(new Asteroid({pos: this.randomPosition()}))
        }
    }

    randomPosition() {
        const xPos = Math.random() * DIM_X
        const yPos = Math.random() * DIM_Y
        return {x: xPos, y: yPos}
    }

    draw(ctx) {
        ctx.clearRect(0, 0, DIM_X, DIM_Y)
        this.asteroids.forEach(asteroid => asteroid.draw(ctx))
    }

    moveObjects() {
        this.asteroids.forEach(asteroid => asteroid.move())
    }
}