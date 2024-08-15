import SwiftUI
import SwiftData

// A view that allows users to add a new macro entry
struct AddMacroView: View {
    @Environment(\.modelContext) var modelContext // Environment variable for accessing the model context
    @State private var food = "" // State variable to hold the food item entered by the user
    @State private var date = Date() // State variable to hold the selected date

    var body: some View {
        VStack(spacing: 20) {
            // Title of the view
            Text("Add Macro")
                .font(.largeTitle)

            // Text field for entering the food item
            TextField("What did you eat?", text: $food)
                .padding()
                .background(
                    RoundedRectangle(cornerRadius: 15)
                        .stroke() // Add a stroke to the background for better visibility
                )

            // Date picker for selecting the date of the meal
            DatePicker("Date", selection: $date)
                .padding(.horizontal)

            // Button to submit the food item and get the macro details
            Button {
                if food.count > 2 { // Check if the food item is valid (more than 2 characters)
                    Task {
                        do {
                            // Send the food item to ChatGPT and get the macro details
                            let result = try await OpenAIService.shared.sendPromptToChatGPT(message: food)
                            saveMacro(result) // Save the retrieved macro details to the database
                        } catch {
                            print(error) // Handle any errors that occur
                        }
                    }
                }
            } label: {
                // Styling for the button
                Text("Done")
                    .bold()
                    .padding()
                    .frame(maxWidth: .infinity)
                    .foregroundStyle(Color(uiColor: .systemBackground))
                    .background(
                        RoundedRectangle(cornerRadius: 15)
                            .fill(Color(uiColor: .label))
                    )
            }
        }
        .padding(.horizontal) // Padding around the content
    }

    // Function to save the retrieved macro details to the database
    private func saveMacro(_ result: MacroResult) {
        // Create a new Macro object with the retrieved details
        let macro = Macro(food: result.food, createdAt: .now, date: date, carbs: result.carbs, fats: result.fats, protein: result.protein)
        
        // Insert the new Macro object into the model context
        modelContext.insert(macro)
        
        do {
            // Attempt to save the context to persist the new macro
            try modelContext.save()
        } catch {
            // Handle any errors that occur during the save operation
            print("Failed to save macro: \(error.localizedDescription)")
        }
    }

}

#Preview {
    // Preview the AddMacroView for design and layout adjustments
    AddMacroView()
}

