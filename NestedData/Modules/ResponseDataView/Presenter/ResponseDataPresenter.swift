//
//  ResponseDataPresenter.swift
//  MusicApp
//
//  Created by Bhawna on 02/02/18.
//  Copyright © 2017 Bhawna. All rights reserved.
//

class ResponseDataPresenter: ResponseDataPresenterProtocol {
    var interactor: ResponseDataInteractorInputProtocol?
    
    weak var view: ResponseDataProtocol?
    var wireFrame: ResponseDataWireFrameProtocol?
   // var user: UserModel?
    
    func viewDidLoad() {
        view?.showLoading()
        interactor?.retriveData()
        //view?.showResponseData(forUser: "test")
    }
   
}
extension ResponseDataPresenter: ResponseDataInteractorOutputProtocol {
    func didRetrivedData(user: [Any]) {
        view?.hideLoading()
       // wireFrame?.presentVerifyOTPScreen(from: view!, forUser: user)
    }
    
    
    
    func onError(error: String?) {
        view?.hideLoading()
        view?.showError(error: error)
    }
    
}
