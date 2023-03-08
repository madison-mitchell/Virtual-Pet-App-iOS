//
//  VirtualPet.swift
//  Virtual-Pet_App
//
//  Created by Madison Mitchell on 3/7/23.
//

import Foundation
struct VirtualPet {
    var name: String
    var health = 100.0
    var hunger = 60.0
    var thirst = 65.0
    var energy = 55.0
    var mood = "Bored"
    var isAlive = true
    
    init(name: String, health: Double = 100.0, hunger: Double = 60.0, thirst: Double = 65.0, energy: Double = 55.0, mood: String = "Bored", isAlive: Bool = true) {
        self.name = name
        self.health = health
        self.hunger = hunger
        self.thirst = thirst
        self.energy = energy
        self.mood = mood
        self.isAlive = isAlive
    }
    
    mutating func feed() {
        thirst -= 3
        
        if hunger > 78 {
            hunger = 100
        } else if hunger < 0 {
            hunger = 0
            hunger += 22
            
            health -= 10
        } else {
            hunger += 22
        }
    }
    
    mutating func water() {
        if thirst > 75 {
            thirst = 100
        } else if thirst < 0 {
            thirst = 0
            thirst += 25
            
            health -= 15
        } else {
            thirst += 25
        }
    }
    
    mutating func play(activity: Int) {
        if activity == 1 {
            mood = "Playful"
            energy -= 20
        } else if activity == 2 {
            mood = "Confused"
            energy -= 1
        }
    }
    
    mutating func heal() {
        if health > 60 {
            health = 103
        } else {
            health += 40
        }
    }
    
    mutating func sleep() {
        thirst -= 10
        hunger -= 15
        
        if energy > 50 {
            energy = 100
        } else if energy < 0 {
            energy = 0
            health -= 10
        } else {
            energy += 50
        }
    }
        
    mutating func tick() {
        health -= 3
        hunger -= 7
        thirst -= 11
        energy -= 9
        
        health = health <= 0 ? 0 : health > 103 ? 100 : health
        hunger = hunger <= 0 ? 0 : hunger >= 100-7 ? 100 : hunger
        thirst = thirst <= 0 ? 0 : thirst >= 100-11 ? 100 : thirst
        energy = energy <= 0 ? 0 : energy >= 100-9 ? 100 : energy
        mood = energy <= 10 ? "Sleepy" : energy <= 30 ? "Sleepy" : energy >= 100 ? "Spazzy" : "Lazy"
        
        health -= energy <= 0 ? 5 : 0
        isAlive = health <= 0 ? false : true
    }
}

