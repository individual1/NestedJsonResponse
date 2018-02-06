//
//  HomeRemoteDataManager.swift
//  HomeApp
//
//  Created by Bhawna on 02/02/18..
//  Copyright © 2017 Bhawna. All rights reserved.
//

import Foundation
import Alamofire
import AlamofireObjectMapper
import ObjectMapper

class HomeRemoteDataManager:HomeRemoteDataManagerInputProtocol {
    var remoteRequestHandler: HomeRemoteDataManagerOutputProtocol?
    var parameters: [String: AnyObject] = [:]
    func fetchResponsefromUrl(url: String?) {
      
        Alamofire.request(url!, method: .get, parameters: nil, encoding: JSONEncoding.default)
                .responseJSON { response in
                    switch response.result {
                    case .success:
                        debugPrint(response.result)
                        guard let newsResponse = response.result.value  else{
                            return
                        }
                   if let rootArray = newsResponse as? [Any] {
                    self.remoteRequestHandler?.onResponseDataVerified(rootArray)
                    }
                    case .failure(let error):
                        self.remoteRequestHandler?.onError(error: error.localizedDescription )
                    }
            }
        
    }
 

}
