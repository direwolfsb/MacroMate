 MacroMate - Macronutrient Tracking App

Overview

**MacroMate** is a modern and intuitive macronutrient tracking app designed to help users effortlessly monitor and manage their daily nutritional intake. Whether you're aiming to lose weight, build muscle, or maintain a balanced diet, MacroMate provides the tools and insights you need to achieve your health and fitness goals. By leveraging advanced AI technology, specifically OpenAI's GPT-3.5, MacroMate simplifies the process of tracking your diet by automatically providing accurate macronutrient information for various food items.

 Key Features

MacroMate offers a clear and concise overview of your daily macronutrient intake. The app's main screen displays the total amounts of carbohydrates, proteins, and fats you've consumed throughout the day, making it easy to stay on track with your dietary goals.

Reflecting on your dietary habits is made simple with MacroMate's meal history feature. You can review your macronutrient intake from past meals and analyze trends over time, allowing you to make informed adjustments to your diet as needed.

Integrating the power of OpenAI's GPT-3.5, MacroMate allows you to input food items and instantly receive detailed macronutrient information. This AI-powered analysis eliminates the need for manual searches, providing you with quick and accurate nutritional data that updates your daily intake automatically.

MacroMate uses a structured function-calling mechanism to interact with GPT-3.5. When you enter a food item, the app sends a request to ChatGPT, which triggers the `get_macronutrients` function. This function returns the nutritional data in a JSON format, which is then parsed and displayed in the app, ensuring seamless and precise tracking.

Adding meals to your daily log is straightforward with MacroMate. By inputting food items and selecting the date, the app calculates the macronutrients for each meal using AI and updates your daily intake accordingly.

The app is designed with the user in mind, featuring a clean and intuitive interface. MacroMate uses consistent design elements, such as rounded buttons and easy-to-read fonts, ensuring a seamless experience as you navigate through your nutritional data.

MacroMate securely stores all your data, allowing you to access your nutritional history and trends at any time. The app utilizes Core Data for efficient and reliable data management, making sure your progress is always saved and accessible.


Technical Implementation

MacroMate is built using SwiftUI, a modern framework that enables the creation of responsive and dynamic user interfaces. Components like `VStack`, `HStack`, `ScrollView`, and `NavigationStack` are employed to create an engaging and seamless user experience.

Core Data, integrated through SwiftData, manages the persistent storage of your macronutrient data. The app's data model includes entities like `Macro`, which store details such as food name, date, and macronutrient amounts, ensuring your data is organized and easily retrievable.

MacroMate integrates with OpenAI's API to fetch macronutrient data. The `OpenAIService` class handles the API requests and responses, managing the interaction with GPT-3.5. This includes generating URL requests with necessary headers and payloads, defining functions like `get_macronutrients` to describe the expected inputs and outputs, and processing responses to extract and display macronutrient data.

Custom SwiftUI views like `MacroHeaderView` and `MacroDayView` are used to display daily macronutrient totals and past meals in an aesthetically pleasing manner. These views are designed to be both informative and visually appealing, enhancing the user experience.

The app includes robust error handling to ensure a smooth user experience. Whether it's network issues or invalid inputs, MacroMate provides helpful feedback to guide the user, ensuring that any issues encountered are resolved quickly and effectively.


Future Enhancements


MacroMate aims to continually evolve and improve, with several future enhancements planned. One such enhancement is the introduction of dietary goal setting, allowing users to set daily macronutrient goals and receive notifications when they approach their limits. Another planned feature is AI-powered meal suggestions, which will offer users meal options based on their remaining macronutrient budgets for the day.

Integration with popular health and fitness apps like Apple Health or MyFitnessPal is also on the horizon, providing users with a more comprehensive health management experience. Additionally, MacroMate will enable users to input and calculate the macronutrients for custom recipes, making it easier to track home-cooked meals.

An analytics dashboard is also planned, which will show trends and analytics over time, helping users better understand their dietary patterns and make informed decisions about their nutrition.


Conclusion

MacroMate is more than just a tracking tool; it is a comprehensive dietary management solution designed to help users take control of their nutrition. By combining AI-powered food analysis with a user-friendly interface and robust data management, MacroMate is an invaluable tool for anyone looking to maintain a healthy diet. Whether you're aiming to lose weight, build muscle, or simply eat better, MacroMate provides the insights and tools you need to succeed.
![MacroMate](https://github.com/user-attachments/assets/b75e4cb9-4a32-43ad-9f91-2e3a477f824b)
![Launchscreen](https://github.com/user-attachments/assets/2ef85f5e-5aad-41ae-8241-5d75c7b7c392)
![Home](https://github.com/user-attachments/assets/a16d4323-ee22-46c0-95d0-d54483976cae)
![Addingfood](https://github.com/user-attachments/assets/730a2cd4-9a5d-423c-b892-89bc8f1d6a56)

