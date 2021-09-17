//
//  Machine.swift
//  Fly
//
//  Created by Froy on 9/15/21.
//

import SwiftUI

struct Machine: View {
    let rows = 5
    let columns = 5
    let size: CGFloat = 10
    //Drawing a helicoper
    let machineBlocks: [[Color]] = [[.gray,.gray,.gray,.gray,.gray],
                                    [.clear,.clear,.green,.clear,.clear],
                                    [.green,.green,.green,.green,.gray],
                                    [.clear,.clear,.green,.green,.green],
                                    [.clear,.clear,.gray,.clear,.gray]]
    var body: some View {

        VStack (spacing: 0){
            ForEach((0...self.rows - 1), id: \.self) { row in
                HStack(spacing: 0){
                    ForEach((0...self.columns - 1), id: \.self) { col in
                        VStack (spacing: 0) {
                            Pixel(size: self.size, color: self.machineBlocks[row][col])
//                            Rectangle()
//                                .frame(width: self.size, height: self.size)
//                                .foregroundColor(self.machineBlocks[row][col])
                        }
                    }
                }
            }
        }
    }
}

//struct Machine_Previews: PreviewProvider {
//    static var previews: some View {
//        Machine()
//    }
//}
