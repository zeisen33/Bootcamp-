// Background image needs to be a moving object



export default class GameView {
    constructor(game, ctx) {
        this.game = game
        this.ctx = ctx
        this.ship = this.game.addShip()
    }


    start() {
        // this.img = new Image()
        // this.img.onload = () => {
        //     this.ctx.drawImage(this.img, 50, 60)
        // }
        // this.img.src = 'Z.png' 
        this.bindKeyHandlers()
        this.lastTime = 0
        requestAnimationFrame(this.animate.bind(this))
    }

    // start() {
    //     this.bindKeyHandlers()
    //     setInterval(() => {
    //         this.game.step()
    //         this.game.draw(this.ctx)
    //     }, 20)
    // }

    bindKeyHandlers() {
        const ship = this.ship

        key('w', () => ship.power({x: 0, y: -1}))
        key('a', () => ship.power({x: -1, y: 0}))
        key('s', () => ship.power({x: 0, y: 1}))
        key('d', () => ship.power({x: 1, y: 1}))

        key('space', () => ship.fireBullet())
    }

    animate(currTime) {
        const timeDelta = currTime - this.lastTime

        this.game.step(timeDelta)
        // this.ctx.drawImage(this.img, 50, 60)

        // const img = new Image()
        // img.onload = () => {
        //     this.ctx.drawImage(img, 50, 60)
        // }
        // img.src = 'Z.png' 

        this.game.draw(this.ctx)
       
        this.lastTime = currTime

        requestAnimationFrame(this.animate.bind(this))
    }
}