//
//  ResponseDataView.swift
//  NestedData
//
//  Created by Bhawna on 02/02/18.
//  Copyright © 2018 Bhawna. All rights reserved.
//
import UIKit
import RATreeView
import CCBottomRefreshControl

class ResponseDataView: UIViewController , RATreeViewDelegate, RATreeViewDataSource,UIScrollViewDelegate{
    var dataArray : [Any] = []
    var presenter: ResponseDataInteractorOutputProtocol?
    var totalPages = 0
    var currentPage = 0
    var startIndex = 0
    var endIndex = 20
    var treeView : RATreeView!
    var data : [TreeViewData] = []
    var editButton : UIBarButtonItem!

    override func viewDidLoad() {
        super.viewDidLoad()
        self.title = NAVTITTLES.NAV_RESPONSE
        totalPages = dataArray.count
        if totalPages < 20{
             data = TreeViewData.getDefaultTreeViewData(rootArray: dataArray, startIndex: 0, endIndex: dataArray.count)
        }
        else{
        data = TreeViewData.getDefaultTreeViewData(rootArray: dataArray, startIndex: startIndex, endIndex: endIndex)
        }
        currentPage = 1
        view.backgroundColor = .white
        setupTreeView()
    }
    
    func addBottomRefersh(){
        let bottomRefresh = UIRefreshControl.init(frame: CGRect(x:0,y:0,width:20,height:20))
        bottomRefresh.triggerVerticalOffset = 100.0
        bottomRefresh.addTarget(self, action:#selector(self.loadNewData) , for: UIControlEvents.valueChanged)
        self.treeView.scrollView.addSubview(bottomRefresh)
      
    }
    
    @objc func loadNewData(){
        
    }
    
    
    func setupTreeView() -> Void {
        treeView = nil
        treeView = RATreeView.init()
        treeView = RATreeView(frame: view.bounds)
        treeView.register(UINib(nibName: String(describing: TreeTableViewCell.self), bundle: nil), forCellReuseIdentifier: String(describing: TreeTableViewCell.self))
        treeView.autoresizingMask = [.flexibleWidth, .flexibleHeight]
        treeView.delegate = self;
        treeView.dataSource = self;
        treeView.treeFooterView = UIView()
        treeView.backgroundColor = .clear
        treeView.separatorColor = .clear
        treeView.scrollView.delegate = self
        let subViews = self.treeView.scrollView.subviews
        for subview in subViews{
            subview.removeFromSuperview()
        }
        treeView.removeFromSuperview()
        view.addSubview(treeView)
        for item in self.data{
            self.treeView.expandRow(forItem: item, expandChildren: true, with: RATreeViewRowAnimationNone)
        }
    }
    

    //MARK: RATreeView data source
    
    func treeView(_ treeView: RATreeView, numberOfChildrenOfItem item: Any?) -> Int {
        if let item = item as? TreeViewData {
            return item.children.count
        } else {
            return self.data.count
        }
    }
    
    func treeView(_ treeView: RATreeView, child index: Int, ofItem item: Any?) -> Any {
        if let item = item as? TreeViewData {
            return item.children[index]
        } else {
            return data[index] as AnyObject
        }
    }
    
    func treeView(_ treeView: RATreeView, cellForItem item: Any?) -> UITableViewCell {
        let cell = treeView.dequeueReusableCell(withIdentifier: String(describing: TreeTableViewCell.self)) as! TreeTableViewCell
        let item = item as! TreeViewData
        let level = treeView.levelForCell(forItem: item)
        cell.selectionStyle = .none
        cell.setup(withTitle: item.name, detailsText: "", level: level, additionalButtonHidden: true)

        return cell
    }
    
    
    func scrollViewDidEndDecelerating(_ scrollView: UIScrollView) {
      
        if endIndex<dataArray.count {
            startIndex = startIndex + 20
            endIndex = endIndex + 20
         let dataNew = TreeViewData.getDefaultTreeViewData(rootArray: dataArray, startIndex: startIndex, endIndex: endIndex)
            for item in dataNew{
                data.append(item)
            }
            setupTreeView()
            let bottomOffeset = CGPoint(x:0,y:treeView.scrollView.contentSize.height-treeView.scrollView.bounds.size.height)
            treeView.scrollView.setContentOffset(bottomOffeset, animated: true)
        treeView.scrollView.scrollRectToVisible(CGRect(x:treeView.scrollView.contentSize.width-1,y:treeView.scrollView.contentSize.height-1,width:1,height:1), animated: true)
         
        }
    }
  
}

extension Array {
    func takeElements(elementCount: Int) -> Array {
        if (elementCount > count) {
            return Array(self[0..<count])
        }
        return Array(self[0..<elementCount])
    }
}
