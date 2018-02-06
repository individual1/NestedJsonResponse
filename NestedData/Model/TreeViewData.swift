//
//  TreeViewData.swift
//  NestedData
//
//  Created by Bhawna on 02/02/18.
//  Copyright © 2018 Bhawna. All rights reserved.
//

import UIKit

class TreeViewData {
    
    let name : String
    var children : [TreeViewData]
    
    init(name : String, children: [TreeViewData]) {
        self.name = name
        self.children = children
    }
    
    convenience init(name : String) {
        self.init(name: name, children: [TreeViewData]())
    }
    
    func addChild(_ child : TreeViewData) {
        self.children.append(child)
    }
    
    func removeChild(_ child : TreeViewData) {
        self.children = self.children.filter( {$0 !== child})
    }
}

func recursiveData(item:Any?,child:TreeViewData)-> TreeViewData{
    if let rootDictionary4 = item as? [String: Any] {
        for item in rootDictionary4.reversed() {
            let str = item.key
            var s = String(describing: item.value)
            if s.contains("{"){
                s = ""
            }
            let thirdChild = TreeViewData.init(name: str+" : " + s )
            let secondchildN = recursiveData(item: item.value, child: thirdChild)
            child.addChild(secondchildN)
        }
    }
    return child

}


extension TreeViewData {

    static func getDefaultTreeViewData(rootArray:[Any],startIndex:Int,endIndex:Int) -> [TreeViewData] {
       let oneTopparrent = TreeViewData.init(name: "")
        for arrayIndex in startIndex..<endIndex {
            let oneparrent = TreeViewData.init(name: "")
            //if let rootArray1 = rootArray as? [Any] {
                let item = rootArray[arrayIndex]
                if let rootDictionary2 = item as? [String: Any] {
                    for item in rootDictionary2.reversed() {
                        let str = item.key
                        var s = String(describing: item.value)
                        if s.contains("{"){
                            s = ""
                        }
                        let secondchild = TreeViewData.init(name: str+" : " + s )
                        let secondchildN = recursiveData(item: item.value, child: secondchild)
                        oneparrent.addChild(secondchildN)
                    }
                }
            //}
             oneTopparrent.addChild(oneparrent)
        }
     return [oneTopparrent]
      
   }
}

