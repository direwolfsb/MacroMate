//
//  OpenAi.swift
//  Tracker
//
//  Created by Suyog Bam on 8/14/24.
//

import Foundation

// Enum to represent HTTP methods for making network requests
enum HTTPMethod: String {
    case post = "POST"
    case get = "GET"
}

// Singleton class to manage interactions with the OpenAI API
class OpenAIService {
    static let shared = OpenAIService() // Singleton instance
    private init() { } // Private initializer to prevent direct instantiation
    
    // Function to generate a URLRequest for the OpenAI API
    private func generateURLRequest(httpMethod: HTTPMethod, message: String) throws -> URLRequest {
        // Ensure the URL is valid
        guard let url = URL(string: "https://api.openai.com/v1/chat/completions") else {
            throw URLError(.badURL)
        }
        
        var urlRequest = URLRequest(url: url)
        
        // Set the HTTP method (POST or GET)
        urlRequest.httpMethod = httpMethod.rawValue
        
        // Set headers for the request
        urlRequest.addValue("application/json", forHTTPHeaderField: "Content-Type")
        urlRequest.addValue("Bearer \(Secrets.apiKey)", forHTTPHeaderField: "Authorization") // Authorization with Bearer token
        
        // Prepare the messages and function parameters for the request body
        let systemMessage = GPTMessage(role: "system", content: "You are a macronutrient expert.")
        let userMessage = GPTMessage(role: "user", content: message)
        
        // Define the properties for the function parameters
        let food = GPTFunctionProperty(type: "string", description: "The food item e.g. hamburger")
        let fats = GPTFunctionProperty(type: "integer", description: "The amount of fats in grams of the given food item")
        let carbs = GPTFunctionProperty(type: "integer", description: "The amount of carbohydrates in grams of the given food item")
        let protein = GPTFunctionProperty(type: "integer", description: "The amount of protein in grams of the given food item")
        
        // Combine the properties into a dictionary
        let params: [String: GPTFunctionProperty] = [
            "food": food,
            "fats": fats,
            "carbs": carbs,
            "protein": protein
        ]
        
        // Create the function parameter object
        let functionParams = GPTFunctionParam(type: "object", properties: params, required: ["food", "fats", "carbs", "protein"])
        
        // Define the function to be called by the GPT model
        let function = GPTFunction(name: "get_macronutrients", description: "Get the macronutrients for a given food.", parameters: functionParams)
        
        // Create the payload to send to the GPT model
        let payload = GPTPayload(model: "gpt-3.5-turbo", messages: [systemMessage, userMessage], functions: [function])
        
        // Encode the payload into JSON data
        let jsonData = try JSONEncoder().encode(payload)
        
        // Set the request body
        urlRequest.httpBody = jsonData
        
        return urlRequest
    }
    
    // Function to send a prompt to ChatGPT and receive the macro result
    func sendPromptToChatGPT(message: String) async throws -> MacroResult {
        // Generate the URLRequest
        let urlRequest = try generateURLRequest(httpMethod: .post, message: message)
        
        // Send the request and await the response
        let (data, _) = try await URLSession.shared.data(for: urlRequest)
        
        // Decode the response into a GPTResponse object
        let result = try JSONDecoder().decode(GPTResponse.self, from: data)
        
        // Extract the arguments from the function call as a JSON string
        let args = result.choices[0].message.functionCall.arguments
        
        // Convert the JSON string into Data
        guard let argData = args.data(using: .utf8) else {
            throw URLError(.badURL)
        }
        
        // Decode the Data into a MacroResult object
        let macro = try JSONDecoder().decode(MacroResult.self, from: argData)
        
        // Print the decoded MacroResult and the full response for debugging
        print(macro)
        print(String(data: data, encoding: .utf8)!)
        
        return macro
    }
}

