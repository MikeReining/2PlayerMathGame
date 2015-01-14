// Playground - noun: a place where people can play

import Cocoa

// MARK: Setup game variables

var player1Name = "Player 1"
var player2Name = "Player 2"
var gameRound = 1

// Major Changes: Add a Player Struct, Player1 and Player2 are instances of that stuct

struct Player {
    var Name = "Player Name"
    var Lives = 3
}



// MARK: Random Number generators

// Generate random number b/w 1 and 4 for 4 different math types

func generateRandomNumberUpTo4() -> Int {
    //minor change: removed intermediate variable
    return Int(arc4random() % 4)+1
}

// Generate random number b/w 1 and 20 for prompts / print line statements

func generateRandomNumberUpTo20() -> Int {
    var randomNumber = Int(arc4random() % 20)+1
    return randomNumber
}

// Generate random answer b/w 1 and 40 for player answers

func generateRandomNumberUpTo40() -> Int {
    var randomNumber = Int(arc4random() % 40)+1
    return randomNumber
}


// MARK: Play Game Logic

func playGame (inout #firstPlayer: Player, inout #secondPlayer: Player) {

    println("STARTING NEW MATH GAME!")
    println("PLAYER 1 is: \(firstPlayer.Name)")
    println("PLAYER 2 is: \(secondPlayer.Name)")
    
    while firstPlayer.Lives > 0 && secondPlayer.Lives > 0 {
        println(" ")
        println("This is round: \(gameRound)")
        
        // Player 1 takes turn implemented with Better Math (i.e. random math function)
        
        var randomNumber1 = generateRandomNumberUpTo20()
        
        //minor changes: can these be let instead?
        
        var randomNumber2 = generateRandomNumberUpTo20()
        var randomMathType1 = generateRandomNumberUpTo4()
        var player1Answer = generateRandomNumberUpTo20()
        
        switch randomMathType1 {
        case 1:
            println("\(firstPlayer.Name): What is \(randomNumber1) plus \(randomNumber2)?")
            var correctAnswer = randomNumber1 + randomNumber2
            println("\(firstPlayer.Name) said: \(player1Answer)")
            println("The correct answer is: \(correctAnswer)")
            if player1Answer != correctAnswer {
                firstPlayer.Lives -= 1
                println("CURRENT SCORE: \(firstPlayer.Name) lives: \(firstPlayer.Lives) and \(secondPlayer.Name) lives: \(secondPlayer.Lives)")
            }
            
        case 2:
            println("\(firstPlayer.Name): What is \(randomNumber1) minus \(randomNumber2)?")
            var correctAnswer = randomNumber1 - randomNumber2
            println("\(firstPlayer.Name) said: \(player1Answer)")
            println("The correct answer is: \(correctAnswer)")
            if player1Answer != correctAnswer {
                firstPlayer.Lives -= 1
                println("CURRENT SCORE: \(firstPlayer.Name) lives: \(firstPlayer.Lives) and \(secondPlayer.Name) lives: \(secondPlayer.Lives)")
            }
            
        case 3:
            println("\(firstPlayer.Name): What is \(randomNumber1) times \(randomNumber2)?")
            var correctAnswer = randomNumber1 * randomNumber2
            println("\(firstPlayer.Name) said: \(player1Answer)")
            println("The correct answer is: \(correctAnswer)")
            if player1Answer != correctAnswer {
                firstPlayer.Lives -= 1
                println("CURRENT SCORE: \(firstPlayer.Name) lives: \(firstPlayer.Lives) and \(secondPlayer.Name) lives: \(secondPlayer.Lives)")
            }
            
        case 4:
            println("\(firstPlayer.Name): What is \(randomNumber1) divided by \(randomNumber2)?")
            var correctAnswer = Float(randomNumber1) / Float(randomNumber2)
            println("\(firstPlayer.Name) said: \(player1Answer)")
            println("The correct answer is: \(correctAnswer)")
            if Float(player1Answer) != correctAnswer {
                firstPlayer.Lives -= 1
                println("CURRENT SCORE: \(firstPlayer.Name) lives: \(firstPlayer.Lives) and \(secondPlayer.Name) lives: \(secondPlayer.Lives)")
            }
            
        default:
            println("something is wrong")
        }
        
        if firstPlayer.Lives == 0 {
            println("Player 2: \(secondPlayer.Name) Wins!!!")
            break
        }
        
        // Player 2 Takes Turn - Simple Math - Addition question only for Player 2
        
        var randomNumber3 = generateRandomNumberUpTo20()
        var randomNumber4 = generateRandomNumberUpTo20()
        
        println ("\(secondPlayer.Name): What is \(randomNumber3) plus \(randomNumber4)?")
        var correctAnswerPlayer2 = randomNumber3 + randomNumber4
        var player2Answer = generateRandomNumberUpTo40()
        
        println("\(secondPlayer.Name) said: \(player2Answer)")
        println("The correct answer is: \(correctAnswerPlayer2)")
        if player2Answer != correctAnswerPlayer2 {
            secondPlayer.Lives -= 1
            println("CURRENT SCORE: \(firstPlayer.Name) lives: \(firstPlayer.Lives) and \(secondPlayer.Name) lives: \(secondPlayer.Lives)")
        }
        if secondPlayer.Lives == 0 {
            println("Player 1: \(firstPlayer.Name) Wins!!!")
            break
        }
        
        gameRound += 1
    }
    println("")
    println("GAME OVER")
    gameRound = 1
    println("")
}


// MARK: Play Game with different player names
// Setup Game 1

var firstPlayer = Player(Name: "Mike", Lives: 3)
var secondPlayer = Player(Name: "Felix", Lives: 3)

playGame(firstPlayer: &firstPlayer, secondPlayer: &secondPlayer)

// Setup Game 2

firstPlayer = Player(Name: "Sonja", Lives: 3)
secondPlayer = Player(Name: "Michelle", Lives: 3)

playGame(firstPlayer: &firstPlayer, secondPlayer: &secondPlayer)


// Major Changes: Break playgame() into smaller functions, so that you can guess numbers and loose lives if right/wrong

