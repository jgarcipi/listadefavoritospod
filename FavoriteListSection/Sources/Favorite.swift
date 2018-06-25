
//
//  Favorite.swift
//  FavoriteListSection
//
//  Created by Aceleradora Mobile Perú on 19/06/18.
//  Copyright © 2018 Aceleradora Mobile Perú. All rights reserved.
//

import Foundation

public class Favorite {
    open var title: String?
    open var subtitle: String?
    
    public init(){}
    
    public init(title: String, subtitle: String) {
        self.title = title
        self.subtitle = subtitle
    }    
}
