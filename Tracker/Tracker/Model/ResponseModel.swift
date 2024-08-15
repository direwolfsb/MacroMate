//
//  ResponseModel.swift
//  Tracker
//
//  Created by Suyog Bam on 8/14/24.
//

import Foundation

// Struct to decode the overall GPT response from the API
struct GPTResponse: Decodable {
    let choices: [GPTCompletion] // Array of possible completions provided by the API
}

// Struct to represent each completion choice
struct GPTCompletion: Decodable {
    let message: GPTResponseMessage // The message contained within the completion
}

// Struct to represent the message, specifically focusing on function calls
struct GPTResponseMessage: Decodable {
    let functionCall: GPTFunctionCall // Contains the function call details within the message
    
    // Custom coding keys to map the JSON keys to Swift property names
    enum CodingKeys: String, CodingKey {
        case functionCall = "function_call"
    }
}

// Struct to represent the function call made by the GPT model
struct GPTFunctionCall: Decodable {
    let name: String // The name of the function being called
    let arguments: String // The arguments passed to the function
}

// Struct to represent the final processed result from the function call, containing macronutrient details
struct MacroResult: Decodable {
    let food: String
    let fats: Int
    let protein: Int
    let carbs: Int
}

