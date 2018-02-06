//
//  HomeIntrector.swift
//  NestedData
//
//  Created by Bhawna on 02/02/18.
//  Copyright © 2018 Bhawna. All rights reserved.
//

import UIKit

class HomeIntrector: HomeInteractorInputProtocol{
    
    func fetchedResponse(url: String?) {
        remoteDatamanager?.fetchResponsefromUrl(url: url)
    }
    
    var presenter: HomeInteractorOutputProtocol?
    
    var remoteDatamanager: HomeRemoteDataManagerInputProtocol?
    
}
extension HomeIntrector: HomeRemoteDataManagerOutputProtocol{
    func onResponseDataVerified(_ data: [Any]) {
        presenter?.didFetchedResponse(data)
    }
    

    
    func onError(error: String?) {
         presenter?.onError(error: error)
    }
    
  
    
}
