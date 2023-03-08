//
//  ContentView.swift
//  Virtual-Pet_App
//
//  Created by Madison Mitchell on 3/7/23.
//

import SwiftUI
struct ContentView: View {
    
    @State var pet = VirtualPet(
        name: "Cole",
        health: 100.00,
        hunger: 65.0,
        thirst: 55.0)
    let menuOptions = MenuOptions(
        subOptions: ["🎾", "🦮"],
        options: ["❤️‍🩹", "🍖", "💧", "🏃🏻‍♀️", "💤"]
    )
    
    let mainColor = Color(red: 20/255, green: 28/255, blue: 58/255)
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
                    .multilineTextAlignment(.center)
//                Text("| HEALTH\t| HUNGER\t| THIRST\t| ENERGY\t|")
//                Text("| \(String(format: "%.2f", pet.health))\t| \(String(format: "%.2f", pet.hunger))\t\t| \(String(format: "%.2f", pet.thirst))\t\t| \(String(format: "%.2f", pet.energy))\t\t|")
                Spacer()
                HStack{
                    VStack(spacing: 13){
                        HStack(spacing: 20){
                            VStack(spacing: 10){
                                Text("♥️")
                                Text("🍖")
                                Text("💧")
                                Text("⚡️")
                            }
                            .font(.system(size: UIFont.smallSystemFontSize))
                            VStack(spacing: 15){
                                StatusBar(percentage: pet.health)
                                StatusBar(percentage: pet.hunger)
                                StatusBar(percentage: pet.thirst)
                                StatusBar(percentage: pet.energy)
                            }
                        }
                    }
                    
                    
                    Image("dog")
                        .resizable()
                        .aspectRatio(contentMode: .fit)
                        .frame(width: 200)
                }
                
                Spacer()
                
                HStack{
                    ForEach(0..<menuOptions.options.count) {
                        i in
                        Button(action: {
                            print("Tapped on option with the text: \(menuOptions.options[i])")
                            
                            if menuOptions.options[i] == "🍖" {
                                pet.feed()
                            } else if menuOptions.options[i] == "💧" {
                                pet.water()
                            } else if menuOptions.options[i] == "🏃🏻‍♀️" {
                                pet.play(activity: 1)
                            } else if menuOptions.options[i] == "❤️‍🩹" {
                                pet.heal()
                            } else if menuOptions.options[i] == "💤" {
                                pet.sleep()
                            }
                            pet.tick()
                            
                            print("| HEALTH\t| HUNGER\t| THIRST\t| ENERGY\t|")
                            print("| \(pet.health)\t\t| \(pet.hunger)\t\t| \(pet.thirst)\t\t| \(pet.energy)\t\n")
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
