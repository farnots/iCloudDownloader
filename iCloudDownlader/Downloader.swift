//
//  Downloader.swift
//  iCloudDownlader
//
//  Created by Lucas Tarasconi on 09/09/2018.
//  Copyright © 2018 Lucas Tarasconi. All rights reserved.
//

import Foundation

let fm = FileManager.default
let path = fm.currentDirectoryPath

class Downloader {
    let consoleIO = ConsoleIO()
    
    func fetchFile(fileUrl : URL) {
        if fm.isUbiquitousItem(at: fileUrl){
            do {
                try fm.startDownloadingUbiquitousItem(at: fileUrl)
                consoleIO.writeMessage("Info : \(fileUrl.lastPathComponent) is downloading")
            } catch  {
                consoleIO.writeMessage("Can't download \(fm.displayName(atPath: fileUrl.lastPathComponent))", to: .error)
            }
        }
        else {
            consoleIO.writeMessage("\(fm.displayName(atPath: fileUrl.lastPathComponent)) is already download", to: .warning)
        }
    }
    
    func downloadFile() {
        let file = CommandLine.arguments[1]
        let fileUrl = NSURL.fileURL(withPath: file)
        fetchFile(fileUrl: fileUrl)
        
        }
    
        func downloadFolder() {
            do {
                let items = try fm.contentsOfDirectory(atPath: path)
                
                for item in items {
                    let itemUrl = NSURL.fileURL(withPath: item)
                    fetchFile(fileUrl: itemUrl)
                }
            } catch {
                consoleIO.writeMessage("Can't acces the folder", to: .error)
            }

            
        }


   

}
