import UIKit
import RealmSwift
import Alamofire
import AlamofireImage
import SwiftyJSON

class ImageViewController: UIViewController {
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // TODO: 画像表示テスト
        Alamofire.request("https://httpbin.org/image/png").responseImage { response in
            if let image = response.result.value {
                let imageView = UIImageView(image: image)
                imageView.center = CGPoint(x: 200/2, y: 200/2)
                self.view.addSubview(imageView)
            }
        }
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
}

//cannot call value of on-function type httpurl_response
