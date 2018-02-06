//
//  HomeProtocol.swift
//  HomeApp
//
//  Created by Bhawna on 02/02/18.
//  Copyright © 2017 Bhawna. All rights reserved.
//

import UIKit
protocol HomeProtocol: class {
    var presenter: HomePresenterProtocol? { get set }
    
    // PRESENTER -> VIEW
   // func showPosts(with posts: [PostModel])
    
    func showError(error:String?)
    func showData(tracks:[Any])
    func showLoading()
    
    func hideLoading()
}

protocol HomePresenterProtocol: class {
    var view: HomeProtocol? { get set }
    var interactor: HomeInteractorInputProtocol? { get set }
    var wireFrame: HomeWireFrameProtocol? { get set }
    // VIEW -> PRESENTER
    func viewDidLoad()
    func fetchAllData(url:String?)
   
}

protocol HomeWireFrameProtocol: class {
    static func createHomeModule() -> UIViewController
    // PRESENTER -> WIREFRAME
    func presentDetailScreen(from view: HomeProtocol, forData data:[Any])
    
    
}

protocol HomeInteractorOutputProtocol: class {
    // INTERACTOR -> PRESENTER
    func didFetchedResponse(_ user: [Any])
    func onError(error:String?)
}

protocol HomeInteractorInputProtocol: class {
    var presenter: HomeInteractorOutputProtocol? { get set }
 
    var remoteDatamanager: HomeRemoteDataManagerInputProtocol? { get set }
    
    // PRESENTER -> INTERACTOR
    func fetchedResponse(url:String?)
}
protocol HomeDataManagerInputProtocol: class {
    // INTERACTOR -> DATAMANAGER
}

protocol HomeRemoteDataManagerInputProtocol: class {
    var remoteRequestHandler: HomeRemoteDataManagerOutputProtocol? { get set }
    
    // INTERACTOR -> REMOTEDATAMANAGER
      func fetchResponsefromUrl(url: String?)
}

protocol HomeRemoteDataManagerOutputProtocol: class {
    // REMOTEDATAMANAGER -> INTERACTOR
    func onResponseDataVerified(_ data: [Any])
    func onError(error:String?)
}
