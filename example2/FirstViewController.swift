//
//  FirstViewController.swift
//  example2
//
//  Created by allen on 2017/07/17.
//  Copyright © 2017年 allen. All rights reserved.
//

import UIKit
import RealmSwift

class FirstViewController: UIViewController {
    
    @IBOutlet weak var UserID: UITextField!
    @IBOutlet weak var password: UITextField!
    @IBOutlet weak var errorMessage: UILabel!

    @IBAction func onClick(_ sender: Any) {
        let Session = SessionModel()
        
        do {
            let sessionKey = try Session.create(userID: UserID.text!, password: password.text!)

            // セッション登録
            let userSession = UserSession()
            userSession.userID = 1
            userSession.key = sessionKey
            let realm = try! Realm()
            try! realm.write {
                realm.deleteAll() // 一度全て削除する
                realm.add(userSession)
            }
            
            moveNextPage()
        } catch {
            errorMessage.isHidden = false
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
