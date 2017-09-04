import UIKit
import RealmSwift
import Alamofire
import AlamofireImage
import SwiftyJSON

class ImageViewController: UIViewController, UIImagePickerControllerDelegate, UINavigationControllerDelegate {

    @IBAction func selectImage(_ sender: Any) {
        // TODO: 画像取得
        if UIImagePickerController.isSourceTypeAvailable(UIImagePickerControllerSourceType.photoLibrary) {
            
            let picker = UIImagePickerController()
            picker.modalPresentationStyle = UIModalPresentationStyle.popover
            picker.delegate = self // UINavigationControllerDelegate と　UIImagePickerControllerDelegateを実装する
            picker.sourceType = UIImagePickerControllerSourceType.photoLibrary
            
            self.present(picker, animated: true, completion: nil)
        }
    }
    
    @IBAction func takePhoto(_ sender: Any) {
        // TODO: カメラ起動
        if UIImagePickerController.isSourceTypeAvailable(UIImagePickerControllerSourceType.camera) {
            
            let picker = UIImagePickerController()
            picker.modalPresentationStyle = UIModalPresentationStyle.fullScreen
            picker.delegate = self // UINavigationControllerDelegate と　UIImagePickerControllerDelegateを実装する
            picker.sourceType = UIImagePickerControllerSourceType.camera
            
            self.present(picker, animated: true, completion: nil)
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // TODO: 画像表示テスト
//        Alamofire.request("https://httpbin.org/image/png").responseImage { response in
//            if let image = response.result.value {
//                let imageView = UIImageView(image: image)
//                imageView.center = CGPoint(x: 200/2, y: 200/2)
//                self.view.addSubview(imageView)
//            }
//        }
        
        
        
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [String : Any]) {
        
        if let pickedImage = info[UIImagePickerControllerOriginalImage] as? UIImage {
            // pickedImageが読み込まれた画像なので、あとはお好きに
            Alamofire.upload(
                multipartFormData: { multipartFormData in
                    
                    // 送信する値の指定をここでします
                    multipartFormData.append(NSImage, withName: "test", fileName: "test.jpeg", mimeType: "image/jpeg")
                    multipartFormData.append(sendSTR.data(using: String.Encoding.utf8)!, withName: "userId")
                },
                to: "http://~~~.com/image-upload/",
                encodingCompletion: { encodingResult in
                    switch encodingResult {
                    case .success(let upload, _, _):
                        upload.responseJSON { response in
                            // 成功
                            let responseData = response
                            print(responseData ?? "成功")
                        }
                    case .failure(let encodingError):
                        // 失敗
                        print(encodingError)
                    }
                }
            )

        }
        picker.dismiss(animated: true, completion: nil)
    }
}



//cannot call value of on-function type httpurl_response
