//
//  ChoiceViewText.swift
//  Virtual-Pet_App
//
//  Created by Madison Mitchell on 3/7/23.
//

import SwiftUI

struct ChoiceViewText: View {
    let choiceText: String
    let accentColor = Color(red: 48/255, green: 105/255, blue: 240/255)
    
    var body: some View {
        Text(choiceText)
//          .font(.body)
          .font(.largeTitle)
          .bold()
          .multilineTextAlignment(.center)
          .padding()
          .border(accentColor, width: 4)
    }
}

struct ChoiceViewText_Previews: PreviewProvider {
    static var previews: some View {
        ChoiceViewText(choiceText: "Choice Text")
    }
}
