

export default class GameView {
    constructor(game, ctx) {
        this.game = game
        this.ctx = ctx
    }

    start() {
        setInterval(() => {
            this.game.step()
            this.game.draw(this.ctx)
        }, 20)
    }
}