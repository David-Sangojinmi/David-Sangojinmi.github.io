var sprite = {
    x: 50,
    y: 50,
    xspeed: 2,
    yspeed: 1,
    points: 0,
    width: 25,
    height: 55
};

let img;

function preload() {
    img = loadImage("sprite.png");
}

function setup() {
    createCanvas(900, 390);
    rectMode(CORNER);
    image(img, sprite.x, sprite.y, sprite.width, sprite.height);
}

function draw() {
    background(245);
    fill(0);
    noStroke();
    rect(1, 330, 898, 388);

    image(img, sprite.x, sprite.y, sprite.width, sprite.height);
    spriteMove();
}

function spriteMove() {
    //Keyboard controls
    if (keyIsPressed === true && keyCode === RIGHT_ARROW) {
        sprite.x += sprite.xspeed;
    }
    if (keyIsPressed === true && keyCode === LEFT_ARROW) {
        sprite.x -= sprite.xspeed;
    }
    if (keyIsPressed === true && keyCode === UP_ARROW) {
        sprite.y -= 10;
    }

    // Edge detection
    if (sprite.y >= 274) {
        sprite.y += 0;
    } else {
        sprite.y += sprite.yspeed;
    }
}
