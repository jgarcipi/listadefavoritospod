//
//  FavoriteCellDesign.swift
//  FavoriteListSection
//
//  Created by Aceleradora Mobile Perú on 19/06/18.
//  Copyright © 2018 Aceleradora Mobile Perú. All rights reserved.
//

import UIKit

public class FavoriteCellDesign: UIView {

    @IBOutlet weak var lblTitle: UILabel!
    @IBOutlet weak var lblSubTitle: UILabel!
    @IBOutlet weak var viewBackgroundContainer: UIView!
    @IBOutlet weak var viewBackground: UIView!
    @IBOutlet weak var bottomLine: UIView!
    @IBOutlet weak var btnChevronRigth: UIButton!
    
    
    override public init(frame: CGRect) {
        super.init(frame: frame)
        self.frame = frame
        print("celldesign",self.frame.size)
    }
    
    required public init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    }
    
    public func fill(title: String, subTitle: String) {
        self.lblTitle.text = title
        self.lblSubTitle.text = subTitle
    }
    
    public func setSelected(selected: Bool){
        if selected{
            self.viewBackgroundContainer.backgroundColor = #colorLiteral(red: 0.9803921569, green: 0.3137254902, blue: 0.231372549, alpha: 1)
            self.lblTitle.textColor = UIColor.white
            self.lblSubTitle.textColor = UIColor.white
            self.bottomLine.isHidden = true
            self.btnChevronRigth.setImage(UIImage(named: "chevron_rigth_white"), for: .normal)
        } else {
            self.viewBackgroundContainer.backgroundColor = UIColor.white
            self.lblTitle.textColor = UIColor.black
            self.lblSubTitle.textColor = UIColor.lightGray
            self.bottomLine.isHidden = false
            self.btnChevronRigth.setImage(UIImage(named: "chevron_rigth"), for: .normal)
        }
    }
    
}

extension UIView {
    public func loadNib() -> UIView {
        let bundle = Bundle(for: type(of: self))
        let nibName = type(of: self).description().components(separatedBy: ".").last!
        let nib = UINib(nibName: nibName, bundle: bundle)
        return nib.instantiate(withOwner: self, options: nil).first as! UIView
    }
    
    public func roundCornersTop(){
        self.clipsToBounds = true
        self.layer.cornerRadius = 8
        self.layer.maskedCorners = [.layerMaxXMinYCorner, .layerMinXMinYCorner]
    }
    
    public func roundCornersBottom(){
        self.clipsToBounds = true
        self.layer.cornerRadius = 8
        self.layer.maskedCorners = [.layerMaxXMaxYCorner, .layerMinXMaxYCorner]
    }
    
    public func roundCorners(){
        self.clipsToBounds = true
        self.layer.cornerRadius = 8
        self.layer.maskedCorners = [.layerMaxXMinYCorner, .layerMinXMinYCorner, .layerMaxXMaxYCorner, .layerMinXMaxYCorner]
    }
    
    public func dropShadow(scale: Bool = true, opacity: Float = 0.3, radius: CGFloat = 0.8, offSet: CGSize = CGSize(width: 1, height: 1)) {
        self.layer.masksToBounds = false
        self.layer.shadowColor = UIColor.black.cgColor
        self.layer.shadowOpacity = opacity
        self.layer.shadowOffset = offSet
        self.layer.shadowRadius = radius
        self.layer.shouldRasterize = true
        self.layer.rasterizationScale = scale ? UIScreen.main.scale : 1
    }
    
}
