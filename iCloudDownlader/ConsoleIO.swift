//
//  ConsoleIO.swift
//  iCloudDownlader
//
//  Created by Lucas Tarasconi on 09/09/2018.
//  Copyright © 2018 Lucas Tarasconi. All rights reserved.
//

import Foundation

enum OutputType {
    case error
    case standard
    case warning
}

class ConsoleIO {
    func writeMessage(_ message: String, to: OutputType = .standard) {
        switch to {
        case .standard:
            print("\(message)")
        case .warning:
            print("Warning: \(message)")
        case .error:
            fputs("Error: \(message)\n", stderr)
        }
    }
    }
