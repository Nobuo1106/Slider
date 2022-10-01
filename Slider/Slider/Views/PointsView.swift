//
//  PointsView.swift
//  Slider
//
//  Created by apple on 2022/09/28.
//

import SwiftUI

struct PointsView: View {
    @Binding var alertIsVisible : Bool
    @Binding var sliderValue: Double
    @Binding var game: Game

    var body: some View {
        let roundedValue = Int(sliderValue.rounded())
        let points = game.points(sliderValue: roundedValue)
        VStack(spacing: 10) {
            InstructionTextView(text: "The Slider's value is")
            BigNumberText(text: String(roundedValue))
            BodyText(text: "You scored \(points) points\n🎉🎉🎉")
            Button(action: {
                alertIsVisible = false
                game.startNewRound(points: points)
            }) {
                ButtonText(text: "Start New Round")
            }
        }
        .padding()
        .frame(maxWidth: 300)
        .background(Color("backGroundColor"))
        .cornerRadius(21.0)
        .shadow(radius: 10, x: 5, y: 5)
    }
}

struct PointsView_Previews: PreviewProvider {
    static private var alertIsVisible = Binding.constant(false)
    static private var sliderValue = Binding.constant(50.0)
    static private var game = Binding.constant(Game())
    
    
    static var previews: some View {
        PointsView(alertIsVisible: alertIsVisible, sliderValue: sliderValue, game: game)
            .preferredColorScheme(.light)
        PointsView(alertIsVisible: alertIsVisible, sliderValue: sliderValue, game: game)
            .previewLayout(.fixed(width: 568, height: 320))
        PointsView(alertIsVisible: alertIsVisible, sliderValue: sliderValue, game: game)
            .preferredColorScheme(.dark)
        PointsView(alertIsVisible: alertIsVisible, sliderValue: sliderValue, game: game)
            .preferredColorScheme(.dark)
            .previewLayout(.fixed(width: 568, height: 320))
    }
}
