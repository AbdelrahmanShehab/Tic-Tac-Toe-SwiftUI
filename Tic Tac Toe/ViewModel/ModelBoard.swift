//
//  ModelBoard.swift
//  Tic Tac Toe
//
//  Created by Abdelrahman Shehab on ٧/١٠/٢٠٢٠.
//

import SwiftUI
import Combine

class ModelBoard: ObservableObject {
    @Published var squares = [Square]()
    
    init() {
        for _ in 0...8 {
            squares.append(Square(status: .empty))
        }
    }
    
    // add 9 empty squares to the board
    func resetGame() {
        for i in 0...8 {
            squares[i].status = .empty
        }
    }
    
    // Game Over Checking
    var gameOver: (SquareStatus, Bool) {
        get {
            if thereIsAWinner != .empty {
                return (thereIsAWinner, true)
            } else {
                for i in 0...8 {
                    if squares[i].status == .empty {
                        return (.empty, false)
                    }
                }
                return (.empty, true)
            }
        }
    }
    
    // Check all possible ways of Winning
    private var thereIsAWinner: SquareStatus {
        get {
            if let check = self.checkIndex([0, 1, 2]) {
                return check
            } else if let check = self.checkIndex([3, 4, 5]) {
                return check
            } else if let check = self.checkIndex([6, 7, 8]) {
                return check
            } else if let check = self.checkIndex([0, 3 ,6]) {
                return check
            } else if let check = self.checkIndex([1, 4, 7]) {
                return check
            } else if let check = self.checkIndex([2, 5, 8]) {
                return check
            } else if let check = self.checkIndex([0, 4, 8]) {
                return check
            } else if let check = self.checkIndex([2, 4, 6]) {
                return check
            }
            return .empty
        }
    }
    
    // Method to check Winning
    private func checkIndex(_ indeces: [Int]) -> SquareStatus? {
        var homeCounter: Int = 0
        var visitorCounter: Int = 0
        
        for index in indeces {
            let square = squares[index]
            if square.status == .home {
                homeCounter += 1
            } else if square.status == .visitor {
                visitorCounter += 1
            }
        }
        
        if homeCounter == 3 {
            return .home
        } else if visitorCounter == 3 {
            return .visitor
        }
        return nil
    }
    
    private func aiMove() {
        var index = Int.random(in: 0...8)
        while (makeMove(index: index, player: .visitor) == false && gameOver.1 == false) {
            index =  Int.random(in: 0...8)
        }
        
    }
    
    func makeMove(index: Int, player: SquareStatus) -> Bool {
        if squares[index].status == .empty { /// if there is no 'X' or 'O' in square
            var square = squares[index] /// get index of square
            square.status = player /// set square status to player
            squares[index] = square /// index of squares array assigned to square
            if player == .home { aiMove() } /// make the Ai machine move when player has decided
            return true
        }
        return false
    }
    
}
