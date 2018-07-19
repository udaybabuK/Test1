//
//  LocationShareModel.swift
//  LocationTr
//
//  Created by Orient Technologies Mac on 6/19/18.
//  Copyright © 2018 Orient. All rights reserved.
//

import UIKit

class LocationShareModel: NSObject {
    //MARK: Shared Instance
    
    static let sharedInstance : LocationShareModel = {
        let instance = LocationShareModel()
        return instance
    }()
    
    //MARK: Local Variable
    
    var myLocationArray : [Any]? = nil
    var timer: Timer!
    //MARK: Init
    
    convenience override init() {
        self.init(array : [])
    }
    
    //MARK: Init Array
    
    init( array : [Any]) {
        myLocationArray = array
    }
}
