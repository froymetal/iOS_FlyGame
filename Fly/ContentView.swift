//
//  ContentView.swift
//  Fly
//
//  Created by Froy on 9/15/21.
//

import SwiftUI

struct ContentView: View {
    @State private var machinePosition = CGPoint(x: 100, y: 100)
    @State private var obstaclePosition = CGPoint(x:1000, y: 300)

    let timer = Timer.publish(every: 0.1, on: .main, in: .common).autoconnect()

    var body: some View {


        GeometryReader{ geo in
            ZStack{
                Machine()
                    .position(self.machinePosition)
                    .onReceive(self.timer){ _ in
                        self.gravity()
                    }
                Obstacle()
                    .position(self.obstaclePosition)
                    .onReceive(self.timer){_ in

                            self.obstacleMove()


                    }
            }
            .frame(width: geo.size.width, height: geo.size.height)
            .background(Color.black)
            .gesture(
                TapGesture()
                    .onEnded{
                        withAnimation{
                            self.machinePosition.y -= 100
                        }
                    }
            )

        }
        .edgesIgnoringSafeArea(.all)

//        Pixel(size: 50, color: Color.red)

    }

    func gravity(){
        withAnimation{
            self.machinePosition.y += 20
        }

    }

    func obstacleMove(){
        if self.obstaclePosition.x > 0 {
            withAnimation{
                self.obstaclePosition.x -= 20
            }

        }else{
            self.obstaclePosition.x = 1000
        }

    }
}

//struct ContentView_Previews: PreviewProvider {
//    static var previews: some View {
//        ContentView()
//    }
//}
