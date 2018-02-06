//
//  HomeView.swift
//  NestedData
//
//  Created by Bhawna on 02/02/18.
//  Copyright © 2018 Bhawna. All rights reserved.
//

import UIKit
import IQKeyboardManagerSwift
import PKHUD
import KRProgressHUD
import AlamofireImage

class HomeView: UIViewController {
@IBOutlet weak var txtUrl: UITextField!
@IBOutlet weak var btnSubmit: UIButton!
var presenter: HomePresenterProtocol?
    
      override func viewDidLoad() {
       super.viewDidLoad()
        self.title = NAVTITTLES.NAV_HOME
         IQKeyboardManager.sharedManager().enable = true
    }
    
    func verifyUrl (urlString: String?) -> Bool {
        //Check for nil
        if let urlString = urlString {
            // create NSURL instance
            if let url = NSURL(string: urlString) {
                // check if your application can open the NSURL instance
                return UIApplication.shared.canOpenURL(url as URL)
            }
        }
        return false
    }
    
   @IBAction func getData(sender: UIButton){
    if (txtUrl.text?.isEmpty)! {
        self.showAlert(with: ERROR_MESSAGE.Error, message: ERROR_MESSAGE.EMPTY_URL_MSG)
    }
    else if verifyUrl(urlString: txtUrl.text) == false{
          self.showAlert(with: ERROR_MESSAGE.Error, message: ERROR_MESSAGE.VALID_URL_MSG)
    }
    presenter?.fetchAllData(url: txtUrl.text)
    txtUrl.resignFirstResponder()
    }
}

extension HomeView:HomeProtocol{
    func showData(tracks: [Any]) {
        if tracks.count == 0 {
            self.showAlert(with: ERROR_MESSAGE.Error, message: ERROR_MESSAGE.NO_DATA)
        }
       
    }
    
    
    func showError(error: String?) {
        KRProgressHUD.showMessage(error!)
        self.showAlert(with: ERROR_MESSAGE.Error, message: error!)
    }
    
    func showLoading() {
        KRProgressHUD.show()
      
    }
    
    func hideLoading() {
        
        KRProgressHUD.dismiss()
    }
   
}
extension UIViewController {
    
    //Extension to show alert with default ok button
    func showAlert(with title:String?, message:String?){
        let alertController = UIAlertController(title: title, message: message, preferredStyle: .alert)
        alertController.addAction(UIAlertAction(title: "Ok", style: .default, handler: nil))
        present(alertController, animated: true, completion: nil)
        
}
}
