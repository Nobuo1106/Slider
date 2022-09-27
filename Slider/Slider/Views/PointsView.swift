//
//  PointsView.swift
//  Slider
//
//  Created by apple on 2022/09/28.
//

import SwiftUI

struct PointsView: View {
    var body: some View {
        VStack(spacing: 10) {
            InstructionTextView(text: "The Slider's value is")
            BigNumberText(text: "89")
            BodyText(text: "You scored 200 points\n🎉🎉🎉")
            Button(action: {}) {
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
    static var previews: some View {
        PointsView()
            .preferredColorScheme(.light)
        PointsView()
            .previewLayout(.fixed(width: 568, height: 320))
        PointsView()
            .preferredColorScheme(.dark)
        PointsView()
            .preferredColorScheme(.dark)
            .previewLayout(.fixed(width: 568, height: 320))
    }
}
