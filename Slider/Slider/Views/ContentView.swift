//
//  ContentView.swift
//  Slider
//
//  Created by apple on 2022/09/17.
//

import SwiftUI

struct ContentView: View {
    @State private var alertIsVisible = false
    @State private var sliderValue = 50.0
    @State private var game: Game = Game()
    
    var body: some View {
        ZStack {
            Color.purple
                .ignoresSafeArea()
            VStack {
                Text("🎯🎯🎯\nPUT THE BULLSEVE AS CLOSE AS U CAN TO")
                    .bold()
                    .kerning(2.0)
                    .multilineTextAlignment(.center)
                    .lineSpacing(4.0)
                    .font(.footnote)
                Text(String(game.target))
                    .kerning(-1.0)
                    .font(.largeTitle)
                    .fontWeight(.black)
                
                HStack {
                    Text("1")
                        .bold()
                    Slider(value: $sliderValue, in:1.0...100)
                    Text("100")
                        .bold()
                }
                
                Button(action:{
                    print("hello")
                    alertIsVisible = true
                }) {
                    Text("Hit me")
                }
                .alert(isPresented: $alertIsVisible, content: {
                    let roundedValue = Int(sliderValue)
                    return Alert(title: Text("Hello there"), message: Text("The slider value is \(String(roundedValue)).\n" + "you scored \(game.points(sliderValue: roundedValue)) points this round."), dismissButton: .default(Text("Awesome!"))
                    )
                })
            }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
        ContentView()
            .previewLayout(.fixed(width: 568, height: 320))
    }
}
