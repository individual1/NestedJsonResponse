//
//  HomeWireFrame.swift
//  NestedData
//
//  Created by Bhawna on 02/02/18.
//  Copyright © 2018 Bhawna. All rights reserved.
//

import UIKit

class HomeWireFrame: HomeWireFrameProtocol {
    func presentDetailScreen(from view: HomeProtocol, forData data: [Any]) {
                let detailController = ResponseDataFrame.createResponseDataModule(forUser: data) as? ResponseDataView
                detailController?.dataArray = data
                if let sourceView = view as? UIViewController {
                    sourceView.navigationController?.pushViewController(detailController!, animated: true)
                }
    }
    
 
    
   var root: RootWireframeInterface?
    func attachRoot(with controller: UIViewController, in window: UIWindow) {
        root?.showRoot(with: controller, in: window)
    }
    

    static var mainStoryboard: UIStoryboard {
        return UIStoryboard(name: "Main", bundle: Bundle.main)
    }
    
  
    required init(root: RootWireframeInterface?, view: HomeProtocol) {
        self.root = root
        ((UIApplication.shared.delegate) as! AppDelegate).root = self.root
        let presenter: HomePresenterProtocol & HomeInteractorOutputProtocol = HomePresenter()
        let interactor: HomeInteractorInputProtocol & HomeRemoteDataManagerOutputProtocol = HomeIntrector()
        let remoteDataManager: HomeRemoteDataManagerInputProtocol = HomeRemoteDataManager()
        view.presenter = presenter
        presenter.view = view
        presenter.wireFrame = self
        presenter.interactor = interactor
        interactor.presenter = presenter
        interactor.remoteDatamanager = remoteDataManager
        remoteDataManager.remoteRequestHandler = interactor
    }
    
    
    static func createHomeModule() -> UIViewController {
        let viewController = mainStoryboard.instantiateViewController(withIdentifier: "HomeViewController")
        if let view = viewController as? HomeView {
            let presenter: HomePresenterProtocol = HomePresenter()
            view.presenter = presenter
            presenter.view = view
            return viewController
        }
        return UIViewController()
    }
    


}




