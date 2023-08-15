

export default class GameView {
    constructor(game, ctx) {
        this.game = game
        this.ctx = ctx
        this.ship = this.game.addShip()
    }

    start() {
        this.bindKeyHandlers()
        setInterval(() => {
            this.game.step()
            this.game.draw(this.ctx)
        }, 20)
    }

    bindKeyHandlers() {
        const ship = this.ship

        key('w', () => ship.power({x: 0, y: -1}))
        key('a', () => ship.power({x: -1, y: 0}))
        key('s', () => ship.power({x: 0, y: 1}))
        key('d', () => ship.power({x: 1, y: 1}))

        // key('space', () => ship.fireBullet())
    }
}