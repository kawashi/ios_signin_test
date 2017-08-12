import UIKit
import RealmSwift
import Alamofire
import SwiftyJSON

class NextViewController: UIViewController {

    @IBOutlet weak var sessionKey: UILabel!
    @IBOutlet weak var userName: UILabel!
    
    @IBAction func getGitHubName(_ sender: Any) {
        Alamofire.request("https://api.github.com/users/kawashi").responseJSON {response in
            let data = JSON(response.result.value)
            self.userName.text = data["name"].string
            self.userName.isHidden = false
        }
        // TODO: ここで試しにローカルのRailsサーバにアクセスしてみる
        Alamofire.request("http://172.16.13.35:3000/login?user_id=test&password=test").responseJSON { response in
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        userName.isHidden = true
        
        // セッションキーを表示している
        let realm = try! Realm()
        let userSession: UserSession? = realm.objects(UserSession).first
        sessionKey.text = userSession?.key
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
}

