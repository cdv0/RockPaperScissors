//
//  ContentView.swift
//  RockPaperScissors
//
//  Created by Cathleen Vu on 1/9/25.
//

import SwiftUI

struct ContentView: View {
    var moves = ["Rock", "Paper", "Scissors"]
    @State var playerScore = 0
    @State var playerMove: String = ""
    @State var appChoice = Int.random(in: 0...2)
    @State var shouldWin = Bool.random()
    
    var body: some View {
        VStack {
            Text("Rock Paper Scissors")
                .font(.largeTitle)
                .fontWeight(/*@START_MENU_TOKEN@*/.bold/*@END_MENU_TOKEN@*/)
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
                Button(action: nextMove) {
                    Text(moves[number])
                }
            }
        }
    }
    
    func nextMove() {
        
    }
}

#Preview {
    ContentView()
}
