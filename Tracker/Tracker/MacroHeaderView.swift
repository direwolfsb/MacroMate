//
//  MacroHeaderView.swift
//  Tracker
//
//  Created by Suyog Bam on 8/14/24.
//

import SwiftUI

// A view that displays a summary of macronutrients (Carbs, Protein, Fats)
struct MacroHeaderView: View {
    @Binding var carbs: Int // Binding variable to display the amount of carbohydrates
    @Binding var fats: Int // Binding variable to display the amount of fats
    @Binding var protein: Int // Binding variable to display the amount of protein

    var body: some View {
        HStack {
            Spacer() // Add space between the elements
            
            // Carbohydrates section
            VStack {
                Image("carbs") // Image representing carbohydrates
                    .resizable()
                    .scaledToFit()
                    .frame(width: 60)
                Text("Carbs") // Label for carbohydrates
                Text("\(carbs)") // Display the amount of carbohydrates
            }
            .padding()
            .background(
                // Rounded rectangle background with slight opacity
                RoundedRectangle(cornerRadius: 10)
                    .fill(.gray.opacity(0.2))
            )
            
            Spacer() // Add space between the elements
            
            // Protein section
            VStack {
                Image("protein") // Image representing protein
                    .resizable()
                    .scaledToFit()
                    .frame(width: 60)
                Text("Protein") // Label for protein
                Text("\(protein)") // Display the amount of protein
            }
            .padding()
            .background(
                // Rounded rectangle background with slight opacity
                RoundedRectangle(cornerRadius: 10)
                    .fill(.gray.opacity(0.2))
            )
            
            Spacer() // Add space between the elements
            
            // Fats section
            VStack {
                Image("fat") // Image representing fats
                    .resizable()
                    .scaledToFit()
                    .frame(width: 60)
                Text("Fats") // Label for fats
                Text("\(fats)") // Display the amount of fats
            }
            .padding()
            .background(
                // Rounded rectangle background with slight opacity
                RoundedRectangle(cornerRadius: 10)
                    .fill(.gray.opacity(0.2))
            )
            
            Spacer() // Add space between the elements
        }
    }
}

#Preview {
    // Preview the MacroHeaderView with some example data
    MacroHeaderView(carbs: .constant(19), fats: .constant(19), protein: .constant(19))
}

