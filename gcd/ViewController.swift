//
//  ViewController.swift
//  gcd
//
//  Created by Zhang Tianli on 2/8/18.
//  Copyright © 2018 tianli. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        let group = DispatchGroup()
        print(Date())
        group.enter()
        self.load (timeInterval: 2){ (name) in
            print("0=="+Date().description)

            print(name ?? "0")
            group.leave()
        }
        
        group.enter()
        self.load(timeInterval: 3) { (name) in
            print("1=="+Date().description)
            
            print(name ?? "0")
            group.leave()
        }
        
        group.enter()
        self.load(timeInterval: 10) { (name) in
            print("2==" + Date().description)
            
            print(name ?? "0")
            group.leave()
        }
        
        group.notify(queue: .main){
            print(Date())
        }
    }
    
    func load(timeInterval: TimeInterval, completion: @escaping (String?) -> Void) {
        DispatchQueue.global().async {
            Thread.sleep(forTimeInterval: timeInterval)
            completion(Thread.current.debugDescription)
        }
    }
    
}



