dialect "logo"

createCanvas(500 @ 300)
speed :=  100

//the american flag has a bunch of white in it.
//Let's make a constant so we don't need to keep retyping r,g,b
def white = r 255 g 255 b 255

flag 

method flag {
    //draw an american flag that has a size 380 by 200

    //dimmensions of the flag
    def flagWidth = 380
    def flagHeight = 200

    //width of the space between two stars
    def starWidth = 20
    
    //space between rows of stars
    def rowSpace = 10
    
    //width and height of the box of stars
    def boxWidth = 6*starWidth+20
    def boxHeight = 5*starWidth+rowSpace

    def stripeWidth = flagWidth-boxWidth
    def stripeHeight = flagHeight/13
    
    //move to top left corner
    //remember moving forward by a negative number is moving backwards
    moveTo(140, -140, 0, 0) 
    
    //make a blue background, so we can draw white stars on top of it.
    rect(380,200, blue)
    
    //move to position of first star
    moveTo(20,20,0,-90)
    
    //There are 6 rows of 6 stars and 5 rows of 5 stars on the flag
    repeat 4 times {
        row(6,starWidth)
        moveTo(5*starWidth+rowSpace,-rowSpace,180,90)
        row(5,starWidth)
        moveTo(5*starWidth+rowSpace,-rowSpace,180,90)
    }
    row(6,starWidth)
    
    //move back to the very edge of the flag
    moveTo(boxWidth,-rowSpace,180,90)
    
    moveTo(boxWidth, -boxHeight, 0, -90)
    
    repeat 2 times {
        rect(stripeWidth,stripeHeight+1,red)
        moveTo(0,stripeHeight+1,0,-90)
        rect(stripeWidth,stripeHeight+1,white)
        moveTo(0,stripeHeight+1,0,-90)
    }
    rect(stripeWidth,stripeHeight+1,red)
    moveTo(0,stripeHeight+1,0,-90)
    rect(stripeWidth,stripeHeight,white)
    moveTo(0,stripeHeight,0,-90)
    rect(stripeWidth,stripeHeight,red)
    moveTo(0,stripeHeight,0,-90)
    
    //we've finished the box stripes, so move to the left edge of the flag
    moveTo(-boxWidth,0,0,-90)
    
    repeat 3 times {
        rect(flagWidth,stripeHeight,white)
        moveTo(0,stripeHeight,0,-90)
        rect(flagWidth,stripeHeight,red)
        moveTo(0,stripeHeight,0,-90)
    }
}

method moveTo(dx, dy, inDir, outDir) {
    //Move the pen from the current position by (dx,dy) without drawing any lines.
    //inDir is the direction to move relative to the current direction
    //outDir is the direction to move relative to the current direction + 90
    penUp
    turnRight(inDir)
    forward(dx)
    turnRight(90)
    forward(dy)
    turnRight(outDir)
    penDown
}



method row(n,space) {
    //draw a row of n stars, and leave the turtle at the end of the row facing the same direction
    //stars are seperated by space
    
    repeat (n) times {
        star(8)
        penUp
        forward(space)
        penDown
    }
}

method rect(w, h, c) {
    //Draw a filled in rectangle of width w, height h, and color c
    //starting at the upper left(relative to the turtle) corner
    //the turtle ends at the starting position facing the same direction
    
    penColor := c
    penWidth := h

    //since we are filling in the rectangle we need to move the middle before we start drawing
    penUp
    turnRight(90)
    forward(h/2)
    turnLeft(90)
    penDown
    
    //actually draw the rectangle
    forward(w)
    
    //we don't want to draw everything at this width
    penWidth := 1
    
    //move the pen back to the start of the rectangle
    moveTo(-w,-h/2,0,-90)
}

method star(s) {
    //draw a white 5 pointed star with side length s
    
    penColor := white
    
    //the angle of the points on the star is 36 degrees
    def starAngle = 36
    
    turnLeft(starAngle)
    repeat 5 times {
        forward(s)
        turnLeft(180-starAngle)
    }
    turnRight(starAngle)
}

