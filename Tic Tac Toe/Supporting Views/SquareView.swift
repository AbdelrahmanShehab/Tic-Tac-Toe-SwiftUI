//
//  SquareView.swift
//  Tic Tac Toe
//
//  Created by Abdelrahman Shehab on ٧/١٠/٢٠٢٠.
//

import SwiftUI

struct SquareView: View {
    var dataSource: Square
    var action: () -> Void
    var body: some View {
        
        Button(action: {
            print(self.dataSource.status)
            self.action()
        }, label: {
            Text((dataSource.status != .empty) ?
                    (dataSource.status != .visitor) ? "X" : "O"
                    : " ")
                .font(.largeTitle)
                .foregroundColor(.white)
                .frame(width: 60, height: 60)
                .background(Color.blue)
                .cornerRadius(8)
                .shadow(color: .orange, radius: 10)
                .padding(EdgeInsets(top: 4, leading: 4, bottom: 4, trailing: 4))
        })
    }
}
