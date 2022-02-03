//
//  ErrorMessage.swift
//  GHFollowers
//
//  Created by Tim Irrgang on 16.12.21.
//

import Foundation

enum GFError: String, Error {
    case invalidUsername = "This user created an invalid request. Wrong username!"
    case unableToComplete = "Unable to bomplete your request. Please check the internet connection"
    case invalidResponse = "Invalid response from server. Please try again"
    case invalidData = "The data received from the server was invalid. Please try afain"
}
