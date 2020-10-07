//
//  SquareStatues.swift
//  Tic Tac Toe
//
//  Created by Abdelrahman Shehab on ٧/١٠/٢٠٢٠.
//

enum SquareStatus {
    case empty
    case visitor
    case home
}

struct Square {
    var status: SquareStatus
}
