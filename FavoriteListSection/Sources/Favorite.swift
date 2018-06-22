
//
//  Favorite.swift
//  FavoriteListSection
//
//  Created by Aceleradora Mobile Perú on 19/06/18.
//  Copyright © 2018 Aceleradora Mobile Perú. All rights reserved.
//

import Foundation

class Favorite {
    var title: String?
    var subtitle: String?
    
    init(){}
    
    init(title: String, subtitle: String) {
        self.title = title
        self.subtitle = subtitle
    }    
}
