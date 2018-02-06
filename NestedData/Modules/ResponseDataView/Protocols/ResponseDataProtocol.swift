//
//  ResponseDataProtocol.swift
//  MusicApp
//
//  Created by Bhawna on 02/02/18..
//  Copyright © 2017 Bhawna. All rights reserved.
//

import UIKit

protocol ResponseDataProtocol: class {
    var presenter: ResponseDataPresenterProtocol? { get set }
    func showError(error:String?)
    
    func showLoading()
    
    func hideLoading()
    // PRESENTER -> VIEW
    func showResponseData(forUser user:[Any])
}

protocol ResponseDataWireFrameProtocol: class {
    static func createResponseDataModule(forUser user: [Any]) -> UIViewController
}

protocol ResponseDataPresenterProtocol: class {
    var view: ResponseDataProtocol? { get set }
    var wireFrame: ResponseDataWireFrameProtocol? { get set }
  
    var interactor: ResponseDataInteractorInputProtocol? { get set }
    // VIEW -> PRESENTER
    func viewDidLoad()
   
}

protocol ResponseDataInteractorOutputProtocol: class {
    // INTERACTOR -> PRESENTER
    func onError(error:String?)
}

protocol ResponseDataInteractorInputProtocol: class {
    var presenter: ResponseDataInteractorOutputProtocol? { get set }
    var remoteDatamanager: ResponseDataRemoteDataManagerInputProtocol? { get set }
    // PRESENTER -> INTERACTOR
    func retriveData()
}


protocol ResponseDataRemoteDataManagerInputProtocol: class {
    var remoteRequestHandler: ResponseDataRemoteDataManagerOutputProtocol? { get set }
    // INTERACTOR -> REMOTEDATAMANAGER
    func retriveData()
}

protocol ResponseDataRemoteDataManagerOutputProtocol: class {
    // REMOTEDATAMANAGER -> INTERACTOR
    func didRetrivedData(_ user: [Any])
    func onError(error:String?)
}
