//
//  HomePresenter.swift
//  HomeApp
//
//  Created by Bhawna on 02/02/18..
//  Copyright © 2017 Bhawna. All rights reserved.
//


import UIKit

class HomePresenter: HomePresenterProtocol {
    
   
    var view: HomeProtocol?
    
    var interactor: HomeInteractorInputProtocol?
    
    var wireFrame: HomeWireFrameProtocol?
    
    func viewDidLoad() {
        self.viewDidLoad()
        
    }
    
    func fetchAllData(url:String?) {
        view?.showLoading()
        interactor?.fetchedResponse(url: url)
        
    }


}
extension HomePresenter: HomeInteractorOutputProtocol {
    func didFetchedResponse(_ user: [Any]) {
        view?.hideLoading()
        view?.showData(tracks: user)
         wireFrame?.presentDetailScreen(from: view!, forData: user)
    }

    
    func didVerifiedMobile(_ user: [Any]) {
        view?.hideLoading()
       view?.showData(tracks: user)
        
    }
  
   
    func onError(error: String?) {
        view?.hideLoading()
        view?.showError(error: error)
    }
    
   
  
    
}
