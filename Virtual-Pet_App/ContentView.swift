//
//  ContentView.swift
//  Virtual-Pet_App
//
//  Created by Madison Mitchell on 3/7/23.
//

import SwiftUI

struct ContentView: View {
    
    let pet = VirtualPet(
        name: "Cole",
        health: 100,
        hunger: 65,
        thirst: 55)
    let menuOptions = MenuOptions(subOptions: [""], options: ["Feed", "Water"])
    
    var mainColor = Color(red: 20/255, green: 28/255, blue: 58/255)
    let accentColor = Color(red: 48/255, green: 105/255, blue: 240/255)
    
    
    var body: some View {
        ZStack{
            mainColor.ignoresSafeArea()
            VStack{
                Text("Virtual Pet")
                    .font(.callout)
                    .multilineTextAlignment(.leading)
                    .padding(EdgeInsets(top: 10, leading:0, bottom: 5, trailing: 0))
                Text("How would you like to interact with \(pet.name)?")
                    .font(.largeTitle)
                    .bold()
                    .multilineTextAlignment(.leading)
                Spacer()
                Image("dog")
                    .resizable()
                    .aspectRatio(contentMode: .fit)
                    .frame(width: 200)
                Spacer()
                HStack{
                    ForEach(0..<menuOptions.options.count) {
                        i in
                        Button(action: {
                            print("Tapped on option with the text: \(menuOptions.options[i])")
                        }, label: {
                            ChoiceViewText(choiceText: menuOptions.options[i])
                        })
                    }
                }
            }
        }
        .foregroundColor(.white)
    }
}

struct VirtualPet_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
