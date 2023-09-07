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
    var body: some View {
        ZStack{
            Rectangle()
                .onTapGesture {
                    if(gameOn == false){
                        playAgain()
                    }
                }
            Rectangle()
                .fill(Color.white)
                .frame(width: 316, height: 316, alignment: .center)
            Text("TicTacToe")
                .font(.system(size: 50))
                .foregroundColor(Color.white)
                .frame(width: 300, height: 700, alignment: .top)
            Text("\(winText)")
                .font(.system(size: 50))
                .foregroundColor(Color.white)
                .frame(width: 300, height: 700, alignment: .bottom)
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
            Rectangle()
                .opacity(0)
                .onTapGesture {
                    if(gameOn == false){
                        playAgain()
                    }
                }

        }
        .ignoresSafeArea()
        .preferredColorScheme(.light)
    }
    
    
    func markTile(tileNumber: Int){
        if(boxes[tileNumber] == "" && gameOn == true){
            if (Xturn == true) {
                boxes[tileNumber] = "X"
                Xturn = false
            }else{
                boxes[tileNumber] = "O"
                Xturn = true
            }
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
                return "X WINS"
            } else if a == "O" && b == "O" && c == "O" {
                gameOn = false
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
    }

        
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
