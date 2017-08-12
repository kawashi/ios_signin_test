import UIKit
import RealmSwift
import Alamofire
import SwiftyJSON

class SignUpController: UIViewController {

    @IBOutlet weak var userName: UITextField!
    @IBOutlet weak var userID: UITextField!
    @IBOutlet weak var password: UITextField!
    
    
    @IBAction func signUp(_ sender: UIButton) {
        let params = [
            "name": userName.text!,
            "user_id": userID.text!,
            "password": password.text!
        ]
        
        Alamofire.request("http://192.168.0.12:3000/sign_up", method: .post, parameters: params).responseJSON { response in
            if response.result.isSuccess {
                let data = JSON(response.result.value)
                let userDefaults = UserDefaults.standard
                let accessToken = data["access_token"].string
                userDefaults.set(accessToken, forKey: "accessToken")

                self.moveNextPage()
            } else {
                // エラーメッセージを表示
            }
        }
        

    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
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
