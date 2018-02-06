//
//  ReponseDataIntrector.swift
//  NestedData
//
//  Created by Bhawna on 02/02/18.
//  Copyright © 2018 Bhawna. All rights reserved.
//

import UIKit

class ReponseDataIntrector: ResponseDataInteractorInputProtocol{
    var presenter: ResponseDataInteractorOutputProtocol?
    
    var remoteDatamanager: ResponseDataRemoteDataManagerInputProtocol?
  
    func retriveData() {
       remoteDatamanager?.retriveData()
    }

}


    


