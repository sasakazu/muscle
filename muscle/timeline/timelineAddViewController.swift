//
//  timelineAddViewController.swift
//  muscle
//
//  Created by 笹倉 一也 on 2018/01/11.
//  Copyright © 2018年 笹倉 一也. All rights reserved.
//

import UIKit
import MobileCoreServices

class timelineAddViewController: UIViewController, UIImagePickerControllerDelegate, UINavigationControllerDelegate {

    
    
    @IBOutlet weak var timelineTextView: UITextView!
    @IBOutlet weak var timelineImage: UIImageView!
    @IBOutlet weak var tlAddLabel: UILabel!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
    }
    
    
    @IBAction func tappedCamera(_ sender: Any) {
        
        let sourceType:UIImagePickerControllerSourceType = UIImagePickerControllerSourceType.camera
        // カメラが利用可能かチェック
        if UIImagePickerController.isSourceTypeAvailable(
            UIImagePickerControllerSourceType.camera){
            // インスタンスの作成
            let cameraPicker = UIImagePickerController()
            cameraPicker.sourceType = sourceType
            cameraPicker.delegate = self
            self.present(cameraPicker, animated: true, completion: nil)
            
        }
        else{
            tlAddLabel.text = "error"
        }
    }
    
    @IBAction func tlAddMovie(_ sender: Any) {
        // カメラロールを表示
        if UIImagePickerController.isSourceTypeAvailable(UIImagePickerControllerSourceType.camera) {
            let controller = UIImagePickerController()
            controller.sourceType = UIImagePickerControllerSourceType.camera
            controller.mediaTypes=[kUTTypeMovie as String] // 動画のみ
            controller.delegate = self
            
            self.present(controller, animated: true, completion: nil)
        }
    }
    
    
    func imagePickerController(picker: UIImagePickerController!, didFinishPickingMediaWithInfo info:NSDictionary!) {
        picker.dismiss(animated: true, completion: nil)
        
        if let url = info[UIImagePickerControllerMediaURL] as? NSURL {
            // 端末のカメラロールに保存する
            UISaveVideoAtPathToSavedPhotosAlbum(url.path!, self, Selector(("video:didFinishSavingWithError:contextInfo:")), nil)
        }
    }
    
  
    func video(videoPath: String, didFinishSavingWithError error: NSError!, contextInfo: UnsafeMutableRawPointer) {
        if (error != nil) {
            print ("動画の保存に失敗しました。")
        } else {
            print ("動画の保存に成功しました。")
        }
    }

    
    
    
    
    @IBAction func tlSaveBtn(_ sender: Any) {
        
        let image:UIImage! = timelineImage.image
        
        if image != nil {
            UIImageWriteToSavedPhotosAlbum(image, self,
                                           #selector(self.image(_:didFinishSavingWithError:contextInfo:)),
                                           nil)
        }
        else{
            tlAddLabel.text = "image Failed !"
        }
    }
    
    // 書き込み完了結果の受け取り
    @objc func image(_ image: UIImage,
                     didFinishSavingWithError error: NSError!,
                     contextInfo: UnsafeMutableRawPointer) {
        
        if error != nil {
            print(error.code)
            tlAddLabel.text = "Save Failed !"
        }
        else{
            tlAddLabel.text = "Save Succeeded"
        }
    }
    
    
    
    
    
    //　撮影が完了時した時に呼ばれる
    func imagePickerController(_ imagePicker: UIImagePickerController,
                               didFinishPickingMediaWithInfo info: [String : Any]) {
        
        if let pickedImage = info[UIImagePickerControllerOriginalImage]
            as? UIImage {
            
            timelineImage.contentMode = .scaleAspectFit
            timelineImage.image = pickedImage
            
        }
        
        //閉じる処理
        imagePicker.dismiss(animated: true, completion: nil)
        tlAddLabel.text = "Tap the [Save] to save a picture"
        
    }
    
    // 撮影がキャンセルされた時に呼ばれる
    func imagePickerControllerDidCancel(_ picker: UIImagePickerController) {
        picker.dismiss(animated: true, completion: nil)
        tlAddLabel.text = "Canceled"
    }
    
    
    @IBAction func tlAddAlbum(_ sender: Any) {
        let sourceType:UIImagePickerControllerSourceType =
            UIImagePickerControllerSourceType.photoLibrary
        
        if UIImagePickerController.isSourceTypeAvailable(
            UIImagePickerControllerSourceType.photoLibrary){
            // インスタンスの作成
            let cameraPicker = UIImagePickerController()
            cameraPicker.sourceType = sourceType
            cameraPicker.delegate = self
            self.present(cameraPicker, animated: true, completion: nil)
            
            tlAddLabel.text = "Tap the [Start] to save a picture"
        }
        else{
            tlAddLabel.text = "error"
            
        }
        
    }
    
    
    
    

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }


}
