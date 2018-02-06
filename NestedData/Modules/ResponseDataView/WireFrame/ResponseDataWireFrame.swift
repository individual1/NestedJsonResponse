//
//  ResponseDataFrame.swift
//  MusicApp
//
//  Created by Bhawna on 02/02/18.
//  Copyright © 2017 Bhawna. All rights reserved.
//

import UIKit

class ResponseDataFrame: ResponseDataWireFrameProtocol {
   
    
    class func createResponseDataModule(forUser user: [Any]) -> UIViewController {
        let viewController = mainStoryboard.instantiateViewController(withIdentifier: "ResponseDataController")
        if let view = viewController as? ResponseDataView {
           let wireFrame: ResponseDataWireFrameProtocol = ResponseDataFrame()
            let presenter: ResponseDataPresenterProtocol & ResponseDataInteractorOutputProtocol = ResponseDataPresenter()
            let interactor: ResponseDataInteractorInputProtocol  = ReponseDataIntrector() as ResponseDataInteractorInputProtocol
            view.presenter = presenter
            presenter.wireFrame = wireFrame
            presenter.interactor = interactor
            interactor.presenter = presenter
            
            return viewController
        }
        return UIViewController()
    }
    
    static var mainStoryboard: UIStoryboard {
        return UIStoryboard(name: "Main", bundle: Bundle.main)
    }
 
}


