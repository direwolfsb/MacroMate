//
//  MacroDayView.swift
//  MacrosTracker123
//
//  Created by Suyog Bam on 8/13/24.
//

import SwiftUI

// Extension to format Date into desired string representations
extension Date {
    // Returns the month and day as a string, e.g., "Aug 13"
    var monthAndDay: String {
        let formatter = DateFormatter()
        formatter.dateFormat = "MMM d"
        return formatter.string(from: self)
    }
    
    // Returns the time as a string, e.g., "02:45 PM"
    var time: String {
        let formatter = DateFormatter()
        formatter.dateFormat = "hh:mm"
        return formatter.string(from: self)
    }
}

// A view that displays the macronutrient summary for a specific day
struct MacroDayView: View {
    @State var macro: DailyMacro // State variable representing a day's macronutrients
    
    var body: some View {
        HStack {
            // Display the date and time on the left side
            VStack(alignment: .leading) {
                Text(macro.date.monthAndDay) // Display month and day
                    .font(.title2)
                Text(macro.date.time) // Display time
            }
            .frame(width: 90, alignment: .leading) // Set a fixed width for the date and time section
            
            Spacer() // Add space between date/time and macronutrient details
            
            // Display the macronutrient details in a horizontal stack
            HStack {
                // Carbohydrates section
                VStack {
                    Text("Carbs") // Label for carbohydrates
                    Text("\(macro.carbs)g") // Display the amount of carbs
                }
                .padding()
                .background(
                    RoundedRectangle(cornerRadius: 10) // Background with rounded corners
                        .fill(.gray.opacity(0.2)) // Light gray background with opacity
                )
                
                Spacer() // Add space between the nutrient sections
                
                // Protein section
                VStack {
                    Text("Protein") // Label for protein
                    Text("\(macro.protein)g") // Display the amount of protein
                }
                .padding()
                .background(
                    RoundedRectangle(cornerRadius: 10) // Background with rounded corners
                        .fill(.gray.opacity(0.2)) // Light gray background with opacity
                )
                
                Spacer() // Add space between the nutrient sections
                
                // Fats section
                VStack {
                    Text("Fats") // Label for fats
                    Text("\(macro.fats)g") // Display the amount of fats
                }
                .padding()
                .background(
                    RoundedRectangle(cornerRadius: 10) // Background with rounded corners
                        .fill(.gray.opacity(0.2)) // Light gray background with opacity
                )
                
                Spacer() // Add space between the sections
            }
        }
    }
}

#Preview {
    // Preview the MacroDayView with example data
    MacroDayView(macro: DailyMacro(date: .now, carbs: 12, fats: 123, protein: 123))
}

