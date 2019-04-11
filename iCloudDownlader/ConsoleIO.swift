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

enum Parameters: String {
    case all = "A"
    case delete = "D"
    case help = "H"
}


class ConsoleIO {
    
    // MARK: Output messaging
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
    
    // MARK: Arguments interpreteur
    func isParameters(_ argument: String) -> Bool {
        if argument.hasPrefix("-") || argument.hasPrefix("-- ") {
            return true
        }
        return false
    }
    
    func getParametersValue(_ argument: String) -> String?  {
        if argument.hasPrefix("-") || argument.hasPrefix("-- ") {
            var argumentTruncated = argument
            if argument.hasPrefix("-") {
                argumentTruncated.remove(at: String.Index(encodedOffset: 0))
            }
            if argumentTruncated.hasPrefix("-") {
                argumentTruncated.remove(at: String.Index(encodedOffset: 0))
            }
            return argumentTruncated
        }
        return nil
    }
    
    func findParametersForLetter(_ letter: String) -> Parameters? {
        return Parameters(rawValue: letter)
    }
    
    func getListOfArgument(_ arguments: [String]) -> [Parameters] {
        var listOfArgument = arguments
        listOfArgument.remove(at: 0)
        
        var listOfParameters: [Parameters] = []
        for argument in listOfArgument {
            if isParameters(argument) {
                guard let letter = getParametersValue(argument),
                    let parameter = findParametersForLetter(letter) else { break }
                listOfParameters.append(parameter)
                
            }
        }
        return listOfParameters
    }
    
    func getListOfPath(_ arguments: [String]) -> [String] {
        var listOfArgument = arguments
        listOfArgument.remove(at: 0)

        var listOfPaths: [String] = []
        for argument in listOfArgument {
            if !isParameters(argument) {
                listOfPaths.append(argument)
            }
        }
        return listOfPaths
    }
    
    //MARK: Display help
    func displayHelp() {
        print("This is the help to be displayed")
    }
}
