import MovingObject from "./moving_object"
import Asteroid from "./asteroid"
import GameView from "./game_view"
import Game from "./game"

window.MovingObject = MovingObject
window.Asteroid = Asteroid
window.GameView = GameView
window.Game = Game



// console.log('webpack working')

document.addEventListener("DOMContentLoaded", function () {
    const canvas = document.getElementById('game-canvas')
    canvas.width = Game.DIM_X
    canvas.height = Game.DIM_Y
    const ctx = canvas.getContext('2d')
       
 

    // const obj1 = new MovingObject({pos: {x: 50, y: 60}, color: 'green', radius: 10} )
    // obj1.draw(ctx)
    
    // const obj2 = new Asteroid({pos: {x: 75, y: 85}})
    // obj2.draw(ctx)
    
    const game = new Game()
    new GameView(game, ctx).start()
    
    })