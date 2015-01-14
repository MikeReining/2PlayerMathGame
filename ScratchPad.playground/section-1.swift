// Playground - noun: a place where people can play

import Cocoa

struct Player {
    var Name = "Player Name"
    var Lives = 3
}

var firstPlayer = Player(Name: "Mike", Lives: 3)

firstPlayer.Lives = firstPlayer.Lives - 1



func testInOutLives (inout player: Player) {
    player.Lives = 2
}

testInOutLives(&firstPlayer)

firstPlayer
