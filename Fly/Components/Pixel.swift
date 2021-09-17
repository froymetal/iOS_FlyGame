//
//  Pixel.swift
//  Fly
//
//  Created by Froy on 9/15/21.
//

import SwiftUI

struct Pixel: View{
    let size: CGFloat
    let color: Color

    var body: some View{
        Rectangle()
            .frame(width: size, height: size)
            .foregroundColor(color)
    }
}


