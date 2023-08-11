import MovingObject from "./moving_object"
import Asteroid from "./asteroid"

window.MovingObject = MovingObject

// console.log('webpack working')

const canvas = document.getElementById('game-canvas')
const ctx = canvas.getContext('2d')


const obj1 = new MovingObject({pos: {x: 50, y: 60}, color: 'green', radius: 10} )
obj1.draw(ctx)

const obj2 = new Asteroid({pos: {x: 75, y: 85}})
obj2.draw(ctx)