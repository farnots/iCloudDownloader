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
        let status: URLResourceValues;
        
        do {
            status = try fileUrl.resourceValues(forKeys: [.isUbiquitousItemKey,
                                                          .ubiquitousItemIsDownloadingKey,
                                                          .ubiquitousItemDownloadingStatusKey]);
        } catch {
            consoleIO.writeMessage("Can't get attributes for file \(fm.displayName(atPath: fileUrl.lastPathComponent)): \(error)", to: .error)
            return
        }

        if status.isUbiquitousItem ?? false {
            if status.ubiquitousItemDownloadingStatus == .current {
                consoleIO.writeMessage("\(fm.displayName(atPath: fileUrl.lastPathComponent)) is already downloaded", to: .warning)
            } else if status.ubiquitousItemIsDownloading ?? false {
                consoleIO.writeMessage("\(fm.displayName(atPath: fileUrl.lastPathComponent)) is downloading")
            } else {
                do {
                    try fm.startDownloadingUbiquitousItem(at: fileUrl)
                    consoleIO.writeMessage("Info: \(fileUrl.lastPathComponent) is downloading")
                } catch {
                    consoleIO.writeMessage("Can't download \(fm.displayName(atPath: fileUrl.lastPathComponent)): \(error)", to: .error)
                }
            }
        } else {
            consoleIO.writeMessage("\(fm.displayName(atPath: fileUrl.lastPathComponent)) is not an iCloud file", to: .warning)
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
