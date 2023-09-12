//
//  ContentView.swift
//  TicTacToe
//
//  Created by Vili Huotari on 6.9.2023.
//

import SwiftUI

struct ContentView: View {
    @State var boxes: [String] = ["","","","","","","","",""]
    @State var Xturn: Bool = true
    @State var Oturn: Bool = false
    @State var gameOn: Bool = true
    @State var winText: String = ""
    @State var playAgainText: String = ""
    
    @State var Xpoints: Int = 0
    @State var Opoints: Int = 0
    
    var body: some View {
        ZStack{
            Rectangle()
                .frame(width: 500, height: 1000)
                .onTapGesture {
                    if(gameOn == false){
                        playAgain()
                    }
                }
            Rectangle()
                .fill(Color.white)
                .frame(width: 315, height: 315)
                .padding(.top, 100.0)
            Text("TicTacToe")
                .font(.system(size: 50))
                .foregroundColor(Color.white)
                .frame(width: 300, height: 750, alignment: .top)
            Text("\(winText)")
                .font(.system(size: 60))
                .foregroundColor(Color.white)
                .frame(width: 300, height: 700, alignment: .bottom)
            Text("\(playAgainText)")
                .font(.system(size: 20))
                .foregroundColor(Color.white)
                .frame(width: 300, height: 650, alignment: .bottom)
            Rectangle()
                .fill(.clear)
                .frame(width: 260, height: 550)
                .overlay(
                    Text("O")
                        .foregroundColor(Color.white)
                        .font(.system(size:60))
                        .opacity(Oturn ? 1.0 : 0.5)
                    , alignment: .topTrailing
                    )
                .overlay(
                    Text("X")
                        .foregroundColor(Color.white)
                        .font(.system(size:60))
                        .opacity(Xturn ? 1.0 : 0.5)
                    , alignment: .topLeading
                    )
            Rectangle()
                .fill(.clear)
                .frame(width: 130, height: 510)
                .overlay(
                    HStack{
                        Spacer()
                        Text("\(Xpoints)")
                            .foregroundColor(Color.white)
                            .font(.system(size:40))
                            .frame(width: 50)
                        Text(":")
                            .foregroundColor(Color.white)
                            .font(.system(size:40))
                            .frame(width: 7)
                        Text("\(Opoints)")
                            .foregroundColor(Color.white)
                            .font(.system(size:40))
                            .frame(width: 50)
                        Spacer()
                    }
                    , alignment: .top
                    )
   
            HStack{
                VStack{
                    Rectangle()
                        .frame(width: 100, height: 100, alignment: .center)
                        .onTapGesture {
                            markTile(tileNumber: 0)
                        }
                        .overlay(
                        Text("\(boxes[0])")
                            .foregroundColor(.white)
                            .font(.system(size: 80))
                    )
                    Rectangle()
                        .frame(width: 100, height: 100, alignment: .center)
                        .onTapGesture {
                            markTile(tileNumber: 1)
                        }
                        .overlay(
                        Text("\(boxes[1])")
                            .foregroundColor(.white)
                            .font(.system(size: 80))
                    )
                    Rectangle()
                        .frame(width: 100, height: 100, alignment: .center)
                        .onTapGesture {
                            markTile(tileNumber: 2)
                        }
                        .overlay(
                        Text("\(boxes[2])")
                            .foregroundColor(.white)
                            .font(.system(size: 80))
                    )
                }
                .padding(0.0)
                VStack{
                    Rectangle()
                        .frame(width: 100, height: 100, alignment: .center)
                        .onTapGesture {
                            markTile(tileNumber: 3)
                        }
                        .overlay(
                        Text("\(boxes[3])")
                            .foregroundColor(.white)
                            .font(.system(size: 80))
                    )
                    Rectangle()
                        .frame(width: 100, height: 100, alignment: .center)
                        .onTapGesture {
                            markTile(tileNumber: 4)
                        }
                        .overlay(
                        Text("\(boxes[4])")
                            .foregroundColor(.white)
                            .font(.system(size: 80))
                    )
                    Rectangle()
                        .frame(width: 100, height: 100, alignment: .center)
                        .onTapGesture {
                            markTile(tileNumber: 5)
                        }
                        .overlay(
                        Text("\(boxes[5])")
                            .foregroundColor(.white)
                            .font(.system(size: 80))
                    )
                }
                VStack{
                    Rectangle()
                        .frame(width: 100, height: 100, alignment: .center)
                        .onTapGesture {
                            markTile(tileNumber: 6)
                        }
                        .overlay(
                        Text("\(boxes[6])")
                            .foregroundColor(.white)
                            .font(.system(size: 80))
                    )
                    Rectangle()
                        .frame(width: 100, height: 100, alignment: .center)
                        .onTapGesture {
                            markTile(tileNumber: 7)
                        }
                        .overlay(
                        Text("\(boxes[7])")
                            .foregroundColor(.white)
                            .font(.system(size: 80))
                    )
                    Rectangle()
                        .frame(width: 100, height: 100, alignment: .center)
                        .onTapGesture {
                            markTile(tileNumber: 8)
                        }
                        .overlay(
                        Text("\(boxes[8])")
                            .foregroundColor(.white)
                            .font(.system(size: 80))
                    )
                }
            }
            .padding(.top, 100.0)
            if !gameOn {
                Color.clear
                    .contentShape(Rectangle())
                    .onTapGesture {
                        playAgain()
                    }
            }

        }
        .ignoresSafeArea()
        .preferredColorScheme(.light)
    }
    
    
    func markTile(tileNumber: Int) {
        if boxes[tileNumber].isEmpty && gameOn{
            boxes[tileNumber] = Xturn ? "X" : "O"
            checkWin()
            if gameOn{
                withAnimation(
                    Animation
                        .default
                ) {
                    
                    Xturn.toggle()
                    Oturn.toggle()
                }
            }

            
        }
    }
    
    func checkWin(){
        // Define all possible winning combinations
        let winCombinations = [
            [0, 1, 2], [3, 4, 5], [6, 7, 8], // Rows
            [0, 3, 6], [1, 4, 7], [2, 5, 8], // Columns
            [0, 4, 8], [2, 4, 6]             // Diagonals
        ]

        var isFull = true // Flag to check if all tiles are filled

        for combination in winCombinations {
            let a = boxes[combination[0]]
            let b = boxes[combination[1]]
            let c = boxes[combination[2]]

            // Check if the combination has all "X" or all "O"
            if a == "X" && b == "X" && c == "X" {
                gameOn = false
                playAgainText = "Tap to play again!"
                Xpoints += 1
                return // Exit early if a win is found
            } else if a == "O" && b == "O" && c == "O" {
                gameOn = false
                playAgainText = "Tap to play again!"
                Opoints += 1
                return // Exit early if a win is found
            }

            // Check if any tile is empty
            if a.isEmpty || b.isEmpty || c.isEmpty {
                isFull = false
            }
        }

        // If all tiles are filled and no winner, it's a draw
        if isFull {
            gameOn = false
            Xturn = false
            Oturn = false
            playAgainText = "Tap to play again!"
        }
    }

    
    func playAgain(){
        for i in 0..<9 {
            boxes[i] = ""
        }
        if (Xpoints + Opoints) % 2 == 0{
            Xturn = true
            Oturn = false
        }else{
            Xturn = false
            Oturn = true
        }
        
        gameOn = true
        winText = ""
        playAgainText = ""
    }
        
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
