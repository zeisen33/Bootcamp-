export function randomVec(length) {
    const deg = 2 * Math.PI * Math.random();
    return scale([Math.sin(deg), Math.cos(deg)], length);
}
  
export function scale(vec, m) {
    return [vec[0] * m, vec[1] * m];
}

export function wrap(coord, max) {
    if (coord < 0) {
        return max - (coord % max)
    } else if (coord > max) {
        return coord % max
    } else {
        return coord
    }
}

export function distance(pos1, pos2) {
    return Math.sqrt(Math.pow((pos2.x - pos1.x), 2) + Math.pow((pos2.y - pos1.y), 2))
}