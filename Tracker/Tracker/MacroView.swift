import SwiftUI
import SwiftData

// A model struct to represent daily macro intake
struct DailyMacro: Identifiable {
    let id = UUID() // Unique identifier for each daily macro entry
    let date: Date // The date of the macro intake
    let carbs: Int // Total carbs intake in grams
    let fats: Int // Total fats intake in grams
    let protein: Int // Total protein intake in grams
}

struct MacroView: View {
    @Environment(\.modelContext) var modelContext // Environment variable for accessing the model context
    @Query var macros: [Macro] // Query for fetching macros from the database
    @State var dailyMacros = [DailyMacro]() // State to hold daily macros data
    @State var carbs = 0 // State to hold total carbs for today
    @State var protein = 0 // State to hold total protein for today
    @State var fats = 0 // State to hold total fats for today
    @State var showTextField = false // State to control the visibility of the text field
    @State var food = "" // State to hold the food name entered by the user

    var body: some View {
        NavigationStack {
            ScrollView(.vertical) {
                VStack(alignment: .leading) {
                    // Display today's macros
                    Text("Today's Macros")
                        .font(.title)
                        .padding()

                    // Header view showing total carbs, fats, and protein for today
                    MacroHeaderView(carbs: $carbs, fats: $fats, protein: $protein)
                        .padding()

                    // Display previous meals with their macros
                    VStack(alignment: .leading) {
                        Text("Previous Meals")
                            .font(.title)
                        ForEach(dailyMacros) { macro in
                            MacroDayView(macro: macro) // View for each day's macro entry
                        }
                        .padding()
                    }
                }
                .frame(maxWidth: .infinity, maxHeight: .infinity, alignment: .top)
            }
            .toolbar {
                ToolbarItem {
                    // Button to add new macros
                    Button {
                        showTextField = true
                    } label: {
                        Image(systemName: "plus")
                    }
                }
            }
            .sheet(isPresented: $showTextField) {
                AddMacroView() // View for adding a new macro entry
                    .presentationDetents([.fraction(0.33)]) // Adjust the size of the sheet
            }
            .onAppear {
                fetchDailyMacros() // Fetch daily macros when the view appears
            }
            .onChange(of: macros) { _, _ in
                fetchDailyMacros() // Fetch daily macros when the macros array changes
            }
        }
    }

    // Function to fetch daily macros from the stored macros
    private func fetchDailyMacros() {
        let today = Calendar.current.startOfDay(for: Date()) // Get the start of today

        var totalCarbs = 0
        var totalFats = 0
        var totalProtein = 0

        let dates = Set(macros.map { Calendar.current.startOfDay(for: $0.date) }) // Get unique dates from macros

        var dailyMacros = [DailyMacro]()
        
        for date in dates {
            // Filter macros for the specific date
            let filteredMacros = macros.filter { Calendar.current.startOfDay(for: $0.date) == date }
            
            // Calculate the total carbs, fats, and protein for that date
            let carbs = filteredMacros.reduce(0) { $0 + $1.carbs }
            let fats = filteredMacros.reduce(0) { $0 + $1.fats }
            let protein = filteredMacros.reduce(0) { $0 + $1.protein }
            
            // Create a DailyMacro object and add it to the dailyMacros array
            let macro = DailyMacro(date: date, carbs: carbs, fats: fats, protein: protein)
            dailyMacros.append(macro)
            
            // If the date is today, update the totals
            if date == today {
                totalCarbs = carbs
                totalFats = fats
                totalProtein = protein
            }
        }
        
        // Sort the dailyMacros array by date and update the state variables
        self.dailyMacros = dailyMacros.sorted(by: { $0.date > $1.date })
        self.carbs = totalCarbs
        self.fats = totalFats
        self.protein = totalProtein
    }
}

#Preview {
    // Preview with sample data
    MacroView(dailyMacros: [
        DailyMacro(date: Date(), carbs: 30, fats: 10, protein: 20),
        DailyMacro(date: Date().addingTimeInterval(-86400), carbs: 50, fats: 20, protein: 25)
    ])
}

