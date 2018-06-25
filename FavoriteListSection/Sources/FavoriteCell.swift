//
//  FavoriteCell.swift
//  FavoriteListSection
//
//  Created by Aceleradora Mobile Perú on 18/06/18.
//  Copyright © 2018 Aceleradora Mobile Perú. All rights reserved.
//

import UIKit

public enum FavoriteCellType {
    case one
    case first
    case normal
    case last
}

public class FavoriteCell: UITableViewCell {

    open var width: CGFloat?
    open var heigth: CGFloat?
    open var typeCell: FavoriteCellType?
    open var viewBackground: FavoriteCellDesign?
    
    // MARK: - Self Methods
    
    required public init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    }
    
    public init(type: FavoriteCellType, width: CGFloat, height: CGFloat, reuseIdentifier: String?) {
        super.init(style: .default, reuseIdentifier: reuseIdentifier)
        self.width = width
        self.heigth = height
        self.typeCell = type
        self.awakeFromNib()
        print(self.frame.size.height)
    }
    
    override public func awakeFromNib() {
        self.backgroundColor = .clear
        let rectCell = CGRect(origin: CGPoint(x: 0, y: 0), size: CGSize(width: self.width!, height: self.heigth!))
        print(rectCell)
        self.viewBackground = FavoriteCellDesign(frame: rectCell).loadNib() as? FavoriteCellDesign
        
        
        self.viewBackground?.viewBackground.backgroundColor = #colorLiteral(red: 0.9820312858, green: 0.3119005561, blue: 0.23068434, alpha: 1)
        if typeCell == FavoriteCellType.one {
            self.viewBackground?.viewBackground.roundCorners()
            self.viewBackground?.bottomLine.backgroundColor = UIColor.white
            self.viewBackground?.bottomLine.isHidden = true
            print("one")
        } else if typeCell == FavoriteCellType.first {
            self.viewBackground?.viewBackground.roundCornersTop()
            print("first")
        } else if typeCell == FavoriteCellType.last{
            self.viewBackground?.viewBackground.roundCornersBottom()
            self.viewBackground?.bottomLine.backgroundColor = UIColor.white
            self.viewBackground?.bottomLine.isHidden = true
            print("last")
        }
        
        self.frame.size.width = self.width!
        self.frame.size.height = self.heigth!
        print("cell",self.frame.size)
        
        self.backgroundView = self.viewBackground
//        self.addSubview(self.viewBackground!)
        
    }
    
    public func config(title: String, subTitle: String) {
        self.viewBackground?.fill(title: title, subTitle: subTitle)
    }
    
    override public func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
        self.selectionStyle = .none
        
        if selected{
            self.viewBackground?.setSelected(selected: true)
        } else {
            self.viewBackground?.setSelected(selected: false)
        }
    }
    
    override public func setHighlighted(_ highlighted: Bool, animated: Bool) {
        if highlighted {
            self.viewBackground?.setSelected(selected: true)
        } else {
            self.viewBackground?.setSelected(selected: false)
        }
    }
    
}


