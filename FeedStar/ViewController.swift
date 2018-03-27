//
//  ViewController.swift
//  FeedStar
//
//  Created by 小田和哉 on 2018/03/11.
//  Copyright © 2018年 K.oda. All rights reserved.
//

import UIKit
import Alamofire


class ViewController: UIViewController {

    // MARK: LifeCycle Method
    override func viewDidLoad() {
        super.viewDidLoad()
    }

    // Load
    override func loadView() {
        super.loadView()
        print("lifecycle", #function)
    }
    
    // Layout
    override func viewWillLayoutSubviews() {
        super.viewWillLayoutSubviews()
        print("lifecycle", #function)
    }
    
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        print("lifecycle", #function)
    }
    
    // Appear
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        print("lifecycle", #function)
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        print("lifecycle", #function)
    }
    
    // Disappear
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        print("lifecycle", #function)
    }
    
    override func viewDidDisappear(_ animated: Bool) {
        super.viewDidDisappear(animated)
        print("lifecycle", #function)
    }
    
    deinit {
        print("lifecycle", #function)
    }
    
    /// <#Description#>
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    // MARK: IBAction Method
    @IBAction func push(_ sender: Any) {
        
        let urlString:String? = self.infoForKey("Backend Url")
        guard let url = urlString else {return}
        
        Alamofire.request(url).responseJSON { (response) in
            if let JSON = response.result.value {
                print("json:\(JSON)")
            }
        }
        
    }
    
    
    // MARK: Private method
    
    /// plistから値を取得する
    ///
    /// - Parameter key: plistのkey
    /// - Returns: plistの値
    func infoForKey(_ key: String) -> String? {
        
        if let path = Bundle.main.path(forResource: "Info", ofType: "plist"){
            let dict = (NSDictionary(contentsOfFile: path)! as? [String: AnyObject])
            
            guard let myDict = dict else {
                return nil
            }
            return myDict[key]?.replacingOccurrences(of: "\\", with: "")
        }
        
        return nil
    }
}

