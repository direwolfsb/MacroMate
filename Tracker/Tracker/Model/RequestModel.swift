//
//  RequestModel.swift
//  Tracker
//
//  Created by Suyog Bam on 8/14/24.
//

import Foundation

// Struct to represent an individual message sent to the GPT model
struct GPTMessage: Encodable {
    let role: String // Role of the message sender (e.g., "user", "system", or "assistant")
    let content: String // The actual content of the message
}

// Struct to represent a function that can be called by the GPT model
struct GPTFunction: Encodable {
    let name: String // The name of the function
    let description: String // A brief description of what the function does
    let parameters: GPTFunctionParam // Parameters required by the function
}

// Struct to represent the parameters required by the function, including their types and descriptions
struct GPTFunctionParam: Encodable {
    let type: String // The type of the parameters (e.g., "object")
    let properties: [String: GPTFunctionProperty]? // Detailed properties of the parameters
    let required: [String]? // List of required parameters
}

// Struct to define individual properties of function parameters
struct GPTFunctionProperty: Encodable {
    let type: String // The type of the property (e.g., "string", "integer")
    let description: String // A brief description of what the property represents
}

// Struct to represent the payload sent to the GPT model, including the model name, messages, and functions
struct GPTPayload: Encodable {
    let model: String // The model to use (e.g., "gpt-3.5-turbo")
    let messages: [GPTMessage] // List of messages to be sent in the request
    let functions: [GPTFunction] // List of functions that can be invoked by the model
}

