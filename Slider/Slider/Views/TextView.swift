//
//  TextView.swift
//  Slider
//
//  Created by apple on 2022/09/19.
//

import SwiftUI

struct InstructionTextView: View {
    var text: String
    
    var body: some View {
        Text(text.uppercased())
            .bold()
            .kerning(2.0)
            .multilineTextAlignment(.center)
            .lineSpacing(4.0)
            .font(.footnote)
            .foregroundColor(Color("TextColor"))
    }
}

struct BigNumberText: View {
    var text: String
    
    var body: some View {
        Text(text)
            .kerning(-1.0)
            .font(.largeTitle)
            .fontWeight(.black)
            .foregroundColor(Color("TextColor"))
    }
}

struct SliderLabelText: View {
    var text: String
    var body: some View {
        Text("1")
            .bold()
            .foregroundColor(Color("TextColor"))
    }
}

struct InstructionText_Previews: PreviewProvider {
    static var previews: some View {
        VStack {
            InstructionTextView(text: "🎯🎯🎯\nPut the Bullseye as close as you can to")
            BigNumberText(text: "999")
            SliderLabelText(text:"1")
        }
    }
}