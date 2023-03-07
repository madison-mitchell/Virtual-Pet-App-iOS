//
//  VirtualPet.swift
//  Virtual-Pet_App
//
//  Created by Madison Mitchell on 3/7/23.
//

import Foundation
class VirtualPet {
    var name: String
    var health = 100
    var hunger = 60
    var thirst = 65
    var energy = 55
    var mood = "Bored"
    var isAlive = true
    
    init(name: String, health: Int = 100, hunger: Int = 60, thirst: Int = 65, energy: Int = 55, mood: String = "Bored", isAlive: Bool = true) {
        self.name = name
        self.health = health
        self.hunger = hunger
        self.thirst = thirst
        self.energy = energy
        self.mood = mood
        self.isAlive = isAlive
    }
    
    func feed() {
        hunger += 40
        thirst -= 9
        
        if hunger > 60 {
            hunger = 100
        } else if hunger < 0 {
            hunger = 0
            health -= 10
        }
    }
    
    func water() {
        thirst += 31
        
        if thirst > 69 {
            thirst = 100
        } else if thirst < 0 {
            thirst = 0
            health -= 15
        }
    }
    
    func play(activity: Int) {
        if activity == 1 {
            mood = "Playful"
            energy -= 20
        } else if activity == 2 {
            mood = "Confused"
            energy -= 1
        }
    }
        
    func tick() {
        health -= 7
        hunger -= 9
        thirst -= 13
        energy -= 11
        
        health = health <= 0 ? 0 : health >= 100 ? 100 : health
        hunger = hunger <= 0 ? 0 : hunger >= 100 ? 100 : hunger
        thirst = thirst <= 0 ? 0 : thirst >= 100 ? 100 : thirst
        energy = energy <= 0 ? 0 : energy >= 100 ? 100 : energy
        mood = energy <= 10 ? "Sleepy" : energy <= 30 ? "Sleepy" : energy >= 100 ? "Spazzy" : "Lazy"
        
        health -= energy <= 0 ? 5 : 0
        isAlive = health <= 0 ? false : true
    }
}

