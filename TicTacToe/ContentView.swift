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
    @State var gameOn: Bool = true
    @State var winText: String = ""
    @State var playAgainText: String = ""
    
    @State var Xpoints: Int = 3
    @State var Opoints: Int = 4
    
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
                .frame(width: 315, height: 315, alignment: .center)
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
                .frame(width: 300, height: 770, alignment: .bottom)
            Rectangle()
                .fill(.clear)
                .frame(width: 260, height: 550)
                .overlay(
                    Text("O")
                        .foregroundColor(Color.white)
                        .font(.system(size:60))
                    , alignment: .topTrailing
                    )
                .overlay(
                    Text("X")
                        .foregroundColor(Color.white)
                        .font(.system(size:60))
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
                            winText = checkWin() ?? ""
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
                            winText = checkWin() ?? ""
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
                            winText = checkWin() ?? ""
                        }
                        .overlay(
                        Text("\(boxes[2])")
                            .foregroundColor(.white)
                            .font(.system(size: 80))
                    )
                }
                VStack{
                    Rectangle()
                        .frame(width: 100, height: 100, alignment: .center)
                        .onTapGesture {
                            markTile(tileNumber: 3)
                            winText = checkWin() ?? ""
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
                            winText = checkWin() ?? ""
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
                            winText = checkWin() ?? ""
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
                            winText = checkWin() ?? ""
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
                            winText = checkWin() ?? ""
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
                            winText = checkWin() ?? ""
                        }
                        .overlay(
                        Text("\(boxes[8])")
                            .foregroundColor(.white)
                            .font(.system(size: 80))
                    )
                }
            }
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
            Xturn.toggle()
        }
    }
    
    func checkWin() -> String? {
        // Define all possible winning combinations
        let winCombinations = [
            [0, 1, 2], [3, 4, 5], [6, 7, 8], // Rows
            [0, 3, 6], [1, 4, 7], [2, 5, 8], // Columns
            [0, 4, 8], [2, 4, 6]             // Diagonals
        ]

        for combination in winCombinations {
            let a = boxes[combination[0]]
            let b = boxes[combination[1]]
            let c = boxes[combination[2]]

            // Check if the combination has all "X" or all "O"
            if a == "X" && b == "X" && c == "X" {
                gameOn = false
                playAgainText = "Tap to play again!"
                return "X WIN"
            } else if a == "O" && b == "O" && c == "O" {
                gameOn = false
                playAgainText = "Tap to play again!"
                return "O WINS"
            }
        }

        return nil // No winner yet
    }
    
    func playAgain(){
        for i in 0..<9 {
            boxes[i] = ""
        }
        Xturn = true
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
