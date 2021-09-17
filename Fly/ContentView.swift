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
    @State private var isPaused = false
    @State private var score = 0
    @State var timer = Timer.publish(every: 0.1, on: .main, in: .common).autoconnect()

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
                //Score Label
                Text("\(self.score)")
                    .position(x: geo.size.width - 50, y: geo.size.height / 10)
                    .foregroundColor(.white)
                    .font(.largeTitle)

                // Restart Button
                self.isPaused ? Button("Restart") {self.resume()}
                    .font(.title)
                    .foregroundColor(.white)
                    : nil



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
            ).onReceive(self.timer) { _ in
                self.collisionDetection()
                self.score += 1
            }

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
            self.obstaclePosition.y = CGFloat.random(in: 0...500)
        }

    }

    func pause(){
        self.timer.upstream.connect().cancel()
    }

    func resume(){

        self.timer = Timer.publish(every: 0.1, on: .main, in: .common).autoconnect()

        //move obtacle to original position
        self.obstaclePosition.x = 1000

        //Reset the machine
        self.machinePosition = CGPoint(x:100, y:100)

        self.isPaused = false

        //Reset score
        score = 0
    }

    func collisionDetection(){


        if abs(machinePosition.x - obstaclePosition.x) < (25 + 10) && abs(machinePosition.y - obstaclePosition.y) < (25 + 100){
            self.pause()
            self.isPaused = true

        }
    }

    // Control Buttons
//    VStack {
//        Button("Pause") {
//            self.timer.upstream.connect().cancel()
//        }
//        Button("Resume") {
//            self.timer = Timer.publish(every: 0.1, on: .main, in: .common).autoconnect()
//        }
//    }
}

//struct ContentView_Previews: PreviewProvider {
//    static var previews: some View {
//        ContentView()
//    }
//}
