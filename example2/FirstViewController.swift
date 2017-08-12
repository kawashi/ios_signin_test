//
//  FirstViewController.swift
//  example2
//
//  Created by allen on 2017/07/17.
//  Copyright © 2017年 allen. All rights reserved.
//

import UIKit
import RealmSwift
import Alamofire
import SwiftyJSON

class FirstViewController: UIViewController {
    
    @IBOutlet weak var userID: UITextField!
    @IBOutlet weak var password: UITextField!
    @IBOutlet weak var errorMessage: UILabel!

    @IBAction func signIn(_ sender: UIButton) {
        let params = [
            "user_id": userID.text!,
            "password": password.text!
        ]
        
        print("リクエストを送ります")
        
        Alamofire.request("http://192.168.0.12:3000/login", method: .post, parameters: params).responseJSON { response in
            if response.result.isSuccess {
                print("通信成功")
                let data = JSON(response.result.value)
                if data["status"].string == "OK" {
                    let userDefaults = UserDefaults.standard
                    userDefaults.set(data["access_token"].string, forKey: "accessToken")
                    self.moveNextPage()
                } else {
                    self.errorMessage.isHidden = false
                }
            } else {
                print("通信失敗")
            }
        }
        
    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        errorMessage.isHidden = true
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
    private func moveNextPage() {
        let storyboard: UIStoryboard = self.storyboard!
        let nextView = storyboard.instantiateViewController(withIdentifier: "nextView")
        present(nextView, animated: true, completion: nil)
    }

}
