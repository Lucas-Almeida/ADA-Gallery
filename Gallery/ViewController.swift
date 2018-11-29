//
//  ViewController.swift
//  Gallery
//
//  Created by Lucas Pinheiro Almeida on 20/11/2018.
//  Copyright © 2018 Lucas Pinheiro Almeida. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    var helper = FileHelper()
    
    var images = [
        (UIImage(named: "fighter"), "Likes to kill stuff"),
        (UIImage(named: "paladin"),  "Likes to kill evil stuff"),
        (UIImage(named: "sorcerer"), "Likes to kill stuff with magic")
    ]
    
    var currentPos = 0
    
    let vc = UIImagePickerController()
    
    @IBAction func addImageFromGallery(_ sender: UIButton) {
        OpenGallery()
    }
    
    struct Profession {
        var image: UIImage
        var description: String
    }
    
    @IBOutlet weak var classImages: UIImageView!
    @IBOutlet weak var desc: UILabel!
    
    @IBAction func next(_ sender: UIButton) {
        if !(currentPos + 1 == images.count) {
            currentPos = currentPos + 1
            loadImage()
        }
    }
    
    @IBAction func previous(_ sender: Any) {
        if !(currentPos - 1 < 0) {
            currentPos = currentPos - 1
            loadImage()
        }
    }

    func loadImage() {
        classImages.contentMode = .scaleAspectFit
        classImages.image = images[currentPos].0
        desc.text = images[currentPos].1
    }
    
    func OpenGallery() {
        vc.sourceType = .photoLibrary
        vc.allowsEditing = true
        vc.delegate = self
        present(vc, animated: true, completion: nil)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        if let image = helper.getSavedImage(named: "newImage") {
            images.append((image, "blablabla"))
        }
        
        loadImage()
    }
}

extension ViewController: UIImagePickerControllerDelegate, UINavigationControllerDelegate {
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [String : Any]) {
        
        if let pickedImage = info[UIImagePickerControllerOriginalImage] as? UIImage {
            images.append((pickedImage, "Nova foto"))
            let success = helper.saveImage(image: pickedImage)
        }
        picker.dismiss(animated: true, completion: nil)
    }
    
    
    
}
