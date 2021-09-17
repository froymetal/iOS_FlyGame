//
//  Obstacle.swift
//  Fly
//
//  Created by Field Employee on 9/15/21.
//

import SwiftUI

struct Obstacle: View {
    let width: CGFloat = 20
    let height: CGFloat = 200
    
    var body: some View {
        Rectangle()
            .frame(width: width, height: height)
            .foregroundColor(Color.green)
    }
}

//struct Obstacle_Previews: PreviewProvider {
//    static var previews: some View {
//        Obstacle()
//    }
//}
