//
//  ContentView.swift
//  Tic Tac Toe
//
//  Created by Abdelrahman Shehab on ٧/١٠/٢٠٢٠.
//

import SwiftUI
import Combine

struct ContentView: View {
    @ObservedObject var checker = ModelBoard()
    @State private var isGameOver = false
    
    func buttonAction(_ index: Int) {
        _ = self.checker.makeMove(index: index, player: .home)
        self.isGameOver = self.checker.gameOver.1
    }
    
    var body: some View {
        VStack {
            HStack {
                SquareView(dataSource: checker.squares[0]) { self.buttonAction(0) }
                SquareView(dataSource: checker.squares[1]) { self.buttonAction(1) }
                SquareView(dataSource: checker.squares[2]) { self.buttonAction(2) }
            }
            
            HStack {
                SquareView(dataSource: checker.squares[3]) { self.buttonAction(3) }
                SquareView(dataSource: checker.squares[4]) { self.buttonAction(4) }
                SquareView(dataSource: checker.squares[5]) { self.buttonAction(5) }
            }
            
            HStack {
                SquareView(dataSource: checker.squares[6]) { self.buttonAction(6) }
                SquareView(dataSource: checker.squares[7]) { self.buttonAction(7) }
                SquareView(dataSource: checker.squares[8]) { self.buttonAction(8) }
            }
        }
        .alert(isPresented: $isGameOver) {
            Alert(title: Text("Game Over"),
                  message: Text(self.checker.gameOver.0 != .empty ? (self.checker.gameOver.0 == .home) ? "YOU WIN!" : "iPhone Wins!" : "Parity"), dismissButton: Alert.Button.destructive(Text("Ok"), action:{ self.checker.resetGame()
            }) )
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
