//
//  profileController.swift
//  Runner
//
//  Created by mohamed on 6/4/2023.
//

import UIKit

class profileController: UIViewController , UIImagePickerControllerDelegate,UINavigationControllerDelegate{
    @IBOutlet weak var edit: UIButton!
    
    @IBOutlet weak var tstep: UILabel!
    @IBOutlet weak var followers: UILabel!
    @IBOutlet weak var yprofile: UILabel!
    @IBAction func edit(_ sender: Any) {
        performSegue(withIdentifier: "edit", sender: sender)
    }
    
    @IBOutlet weak var imgPhoto: UIImageView!
    @IBAction func takephoto(_ sender: Any) {
        showPhotoAlert()
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.imgPhoto.layer.borderWidth = 1
        self.imgPhoto.layer.borderColor = UIColor.black.cgColor
        self.imgPhoto.layer.masksToBounds = false
        self.imgPhoto.layer.cornerRadius = imgPhoto.frame.size.height/2
        self.imgPhoto.clipsToBounds = true
        tstep.text = NSLocalizedString("step", comment: "desc")
        followers.text = NSLocalizedString("followers", comment: "desc")
        yprofile.text = NSLocalizedString("profile", comment: "desc")
        edit.setTitle(NSLocalizedString("edit", comment: ""), for: .normal)
        

        // Do any additional setup after loading the view.
    }
    
    func showPhotoAlert(){
        let alert = UIAlertController(title: "take photo from", message:nil, preferredStyle: .actionSheet)
        alert.addAction(UIAlertAction(title: "Camera", style: .default, handler: {ACTION
            in
            self.getPhoto(type: .camera)
            
        }))
        alert.addAction(UIAlertAction(title: "Photo Library", style: .default, handler: {ACTION
            in
            self.getPhoto(type: .photoLibrary)
        }))
        alert.addAction(UIAlertAction(title: "Cancel", style: .cancel, handler: nil))
        present(alert,animated: true,completion: nil)
    }
    func getPhoto(type : UIImagePickerController.SourceType){
        let picker = UIImagePickerController()
        picker.sourceType = type
        picker.allowsEditing = true
        picker.delegate = self
        present(picker,animated: true, completion: nil)
    }
    func imagePickerController(_ picker: UIImagePickerController ,didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]) {
        guard let image = info[.originalImage] as? UIImage else{
          
           print("image no found")
            return
        }
            
        imgPhoto.image = image
        
    }
    func imagePickerControllerDidCancel(_ picker: UIImagePickerController) {
        dismiss(animated: true, completion: nil)
        
    }
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
