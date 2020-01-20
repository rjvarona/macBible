//
//  ViewController.swift
//  tews
//https://www.raywenderlich.com/731-macos-development-for-beginners-part-1
//  Created by RJ Varona on 1/15/20.
//  Copyright © 2020 RJ Varona. All rights reserved.
//

import Cocoa

class ViewController: NSViewController {

    @IBOutlet weak var saySo: NSTextField!
    
    @IBOutlet weak var label: NSTextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    override var representedObject: Any? {
        didSet {
        // Update the view, if already loaded.
        }
    }


    @IBAction func onSubmit(_ sender: Any) {
       let session = URLSession.shared
       let url = URL(string: "https://learnappmaking.com/ex/users.json")!

       let task = session.dataTask(with: url) { data, response, error in

           if error != nil || data == nil {
               print("Client error!")
               return
           }

           guard let response = response as? HTTPURLResponse, (200...299).contains(response.statusCode) else {
               print("Server error!")
               return
           }

           guard let mime = response.mimeType, mime == "application/json" else {
               print("Wrong MIME type!")
               return
           }

           do {
               let json = try JSONSerialization.jsonObject(with: data!, options: [])
               print(json)
            
                 
           } catch {
               print("JSON error: \(error.localizedDescription)")
           }
       }

       task.resume()
    }
}

