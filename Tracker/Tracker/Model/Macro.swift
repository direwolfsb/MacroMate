//
//  Macro.swift
//  Tracker
//
//  Created by Suyog Bam on 8/14/24.
//

import Foundation
import SwiftData

// The `Macro` class represents a data model for storing macronutrient information
@Model
final class Macro: Identifiable {
    
    // Properties to store information about the macro entry
    let food: String // The name of the food item
    let createdAt: Date // The date and time when this entry was created
    let date: Date // The date associated with this macro entry
    var carbs: Int // The amount of carbohydrates in the food item
    var fats: Int // The amount of fats in the food item
    var protein: Int // The amount of protein in the food item
    
    // Initializer to create a new instance of the `Macro` class
    init(food: String, createdAt: Date, date: Date, carbs: Int, fats: Int, protein: Int) {
        self.food = food
        self.createdAt = createdAt
        self.date = date
        self.carbs = carbs
        self.fats = fats
        self.protein = protein
    }
}

