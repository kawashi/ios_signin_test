import UIKit
import RealmSwift
import Alamofire
import SwiftyJSON

class NextViewController: UIViewController {

    // セッションを破棄してログインページに戻る
    @IBAction func signOut(_ sender: UIButton) {
        let userDefaults = UserDefaults.standard
        userDefaults.removeObject(forKey: "accessToken")
        
        moveFirstPage()
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
    private func moveFirstPage() {
        let storyboard: UIStoryboard = self.storyboard!
        let nextView = storyboard.instantiateViewController(withIdentifier: "firstView")
        present(nextView, animated: true, completion: nil)
    }
}

