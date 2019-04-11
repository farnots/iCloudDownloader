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
    
    func downloadFile(at path: String) {
        let fileUrl = NSURL.fileURL(withPath: path)
        fetchFile(fileUrl: fileUrl)
        
    }
    
    func downloadFolder() {
        do {
            let items = try fm.contentsOfDirectory(atPath: path)
            
            for path in items {
                downloadFile(at: path)
            }
        } catch {
            consoleIO.writeMessage("Can't acces the folder", to: .error)
        }
        
        
    }
    
    
    
    
}
