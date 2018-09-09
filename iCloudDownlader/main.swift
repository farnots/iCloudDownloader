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
    if CommandLine.arguments[1] == "-A" {
        downloader.downloadFolder()
    }
    else {
        downloader.downloadFile()
    }
    
}

