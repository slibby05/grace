dialect "logo"

createCanvas(500 @ 300)
speed := 20

penUp
forward(140)
turnRight(-90)
forward(140)
turnRight(180)
penDown

rect(380,200)
penUp
forward(20)
turnRight(90)
forward(20)
turnLeft(90)
penDown
repeat 4 times {
    row(6)
    penUp
    turnRight(180)
    forward(110)
    turnLeft(90)
    forward(10)
    turnLeft(90)
    penDown
    row(5)
    penUp
    turnRight(180)
    forward(110)
    turnLeft(90)
    forward(10)
    turnLeft(90)
    penDown
}
row(6)

penUp
turnRight(180)
forward(140)
turnLeft(90)
forward(10)
turnLeft(90)
penDown

forward(140)
turnLeft(90)
forward(110)
turnRight(90)

repeat 5 times {
    rect(240,16)
    turnRight(90)
    forward(16)
    turnLeft(90)
}

repeat 2 times {
    rect(240,15)
    turnRight(90)
    forward(15)
    turnLeft(90)
}

turnRight(180)
forward(140)
turnRight(180)

repeat 6 times {
    rect(380,15)
    turnRight(90)
    forward(15)
    turnLeft(90)
}

method row(n) {
    repeat (n) times {
        star(8)
        penUp
        forward(20)
        penDown
    }
}

method rect(w, h) {
    repeat 2 times {
        forward(w)
        turnRight(90)
        forward(h)
        turnRight(90)
    }
}

method star(s) {
    turnLeft(36)
    repeat 5 times {
        forward(s)
        turnLeft(180-36)
    }
    turnRight(36)
}
