//
//  FileHelper.swift
//  Gallery
//
//  Created by Lucas Pinheiro Almeida on 29/11/2018.
//  Copyright © 2018 Lucas Pinheiro Almeida. All rights reserved.
//

import UIKit
import Foundation

class FileHelper {
    var manager = FileManager.default
    var mainPath = FileManager.default.urls(for: .documentDirectory, in: .userDomainMask).first!
    
    func saveImage(image: UIImage) -> Bool {
        guard let data = UIImageJPEGRepresentation(image, 1) ?? UIImagePNGRepresentation(image) else {
            return false
        }
        guard let directory = try? FileManager.default.url(for: .documentDirectory, in: .userDomainMask, appropriateFor: nil, create: false) as NSURL else {
            return false
        }
        do {
            try data.write(to: directory.appendingPathComponent("newImage.png")!)
            return true
        } catch {
            print(error.localizedDescription)
            return false
        }
    }
    
    func getSavedImage(named: String) -> UIImage? {
        if let dir = try? FileManager.default.url(for: .documentDirectory, in: .userDomainMask, appropriateFor: nil, create: false) {
            return UIImage(contentsOfFile: URL(fileURLWithPath: dir.absoluteString).appendingPathComponent(named).path)
        }
        return nil
    }
    
//    func createFile(with data: Data, path: String) -> Bool {
//        let contentPath = mainPath.appendingPathComponent(path)
//        manager.createFile(atPath: contentPath.path, contents: data, attributes: nil)
//        return manager.fileExists(atPath: contentPath.path)
//    }
//
//    func deleteFile(with path: String) -> Bool {
//        let contentPath = mainPath.appendingPathComponent(path)
//        do {
//            try manager.removeItem(at: contentPath)
//            return !manager.fileExists(atPath: contentPath.path)
//        } catch(let error) {
//            print(error.localizedDescription)
//            return false
//        }
//    }
//
//    func createDirectory(with path: String) -> Bool {
//        let dirPath = mainPath.appendingPathComponent(path)
//        do {
//            try manager.createDirectory(at: dirPath, withIntermediateDirectories: true, attributes: nil)
//            return manager.fileExists(atPath: dirPath.path)
//        } catch(let error) {
//            print(error.localizedDescription)
//            return false
//        }
//    }
//
//    func getFile(for path: String) -> Data? {
//        let contentPath = mainPath.appendingPathComponent(path)
//        return manager.contents(atPath: contentPath.path)
//    }
}
