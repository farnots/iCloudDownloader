//
//  main.swift
//  iCloudDownlader
//
//  Created by Lucas Tarasconi on 09/09/2018.
//  Copyright © 2018 Lucas Tarasconi. All rights reserved.
//

import Foundation
let downloader = Downloader()
let consoleIO = ConsoleIO()


if CommandLine.argc < 2 {
    consoleIO.writeMessage("No file given", to: .error)
} else {
    for parameter in consoleIO.getListOfArgument(CommandLine.arguments) {
        switch parameter {
        case .help:
            consoleIO.displayHelp()
            exit(0)
        case .all:
            downloader.downloadFolder()
            break
        case .delete:
            break
        }
    }
    
    for path in consoleIO.getListOfPath(CommandLine.arguments) {
        downloader.downloadFile(at: path)
    }
}

