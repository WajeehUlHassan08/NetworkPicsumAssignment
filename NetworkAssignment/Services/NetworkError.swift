//
//  NetworkError.swift
//  NetworkAssignment
//
//  Created by Wajeeh Ul Hassan on 12/07/2022.
//

import Foundation

enum NetworkError: Error {
    case badData
    case badURL
    case other(Error)
}

