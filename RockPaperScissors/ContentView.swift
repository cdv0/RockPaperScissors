//
//  ContentView.swift
//  RockPaperScissors
//
//  Created by Cathleen Vu on 1/9/25.
//

import SwiftUI

struct ContentView: View {
    var moves = ["Rock", "Paper", "Scissor"]
    @State var roundsPlayed = 0
    @State var playerScore = 0
    @State var playerMove = ""
    @State var appChoice = Int.random(in: 0...2)
    @State var shouldWin = Bool.random()
    @State var roundTitle = ""
    @State var showAlert = false
    @State var isGameOver = false
    
    var body: some View {
        VStack {
            Text("Rock Paper Scissors")
                .font(.largeTitle)
                .fontWeight(/*@START_MENU_TOKEN@*/.bold/*@END_MENU_TOKEN@*/)
            Text("Round: \(roundsPlayed + 1)")
                .font(.system(size: 20))
            Text("Player Score: \(playerScore)/6")
                .font(.system(size: 20))
        }
        VStack {
            Text("App Move: \(moves[appChoice])")
            Text("Player should: \(shouldWin ? "Win" : "Lose")")
        }
        .font(.system(size: 20))
        
        HStack {
            ForEach(0...2, id: \.self) { number in
                Button(action: {nextMove(number)}) {  // Curly braces are required for action when you pass in a parameter to the action
                    Text(moves[number])
                }
            }
        }
        .alert(roundTitle, isPresented: $showAlert) {
            Button(action: nextRound) {
                Text("Continue")
            }
        } message: {
            Text("Your score is \(playerScore)/6")
        }
    }
    
    func nextMove(_ playerChoice: Int) {
        playerMove = moves[playerChoice]
        let appMove = moves[appChoice]
        
        if shouldWin {
            if (playerMove == "Paper" && appMove == "Rock") || (playerMove == "Scissor" && appMove == "Paper") || (playerMove == "Rock" && appMove == "Scissor") {
                roundTitle = "Win!"
                playerScore += 1
            }
            else {
                roundTitle = "Lose!"
            }
        } else {
            if (playerMove == "Scissor" && appMove == "Rock") || (playerMove == "Rock" && appMove == "Paper") || (playerMove == "Paper" && appMove == "Scissor") {
                roundTitle = "Win!"
                playerScore += 1
            }
            else {
                roundTitle = "Lose!"
            }
        }
        
        // Check if game is over
        if roundsPlayed == 5 {
            isGameOver = true
            roundTitle = playerScore < 6 ? "Game Over! You lost the game." : "Congratulations! You won the game!"
        } else {
            isGameOver = false
        }
        
        roundsPlayed += 1
        showAlert = true
    }
    
    func nextRound() {
        if (roundsPlayed == 6) {
            // Reset the game
            playerScore = 0
            roundsPlayed = 0
        }
        
        showAlert = false
        appChoice = Int.random(in: 0...2)
        shouldWin.toggle()  // Toggle shouldWin after each round
    }
}

#Preview {
    ContentView()
}
