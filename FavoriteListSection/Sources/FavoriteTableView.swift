//
//  FavoriteTableView.swift
//  FavoriteListSection
//
//  Created by Aceleradora Mobile Perú on 18/06/18.
//  Copyright © 2018 Aceleradora Mobile Perú. All rights reserved.
//

import UIKit

protocol FavoriteTableViewDelegate {
    func didSelectRowAt(indexPath: IndexPath)
}

class FavoriteTableView: UITableView, UITableViewDelegate, UITableViewDataSource {

    var heightCell: CGFloat = 50.0
    var listFavorites: [Favorite] = [Favorite]()
    
    var delegateFavorite: FavoriteTableViewDelegate?
    
    func configure(list: [Favorite], heightCell: CGFloat  = 50.0, bounces: Bool = false){
        if heightCell <= 50.0 {
            self.heightCell = 50.0
        } else {
            self.heightCell = heightCell
        }
        self.listFavorites = list
        
        self.backgroundColor = .clear
        self.delegate = self
        self.dataSource = self
        self.separatorStyle = .none
        self.bounces = bounces
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.listFavorites.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
      print(self.frame.size.width)
        if self.listFavorites.count == 1 {
            let cell = FavoriteCell(type: .one, width: self.frame.size.width, height: self.heightCell, reuseIdentifier: "cell")
            cell.config(title: self.listFavorites[indexPath.row].title!, subTitle: self.listFavorites[indexPath.row].subtitle!)
            print("uno",cell.frame.size.width)
            return cell
        } else if indexPath.row == 0 {
            let cell = FavoriteCell(type: .first, width: self.frame.size.width, height: self.heightCell, reuseIdentifier: "cell")
            cell.config(title: self.listFavorites[indexPath.row].title!, subTitle: self.listFavorites[indexPath.row].subtitle!)
            print("0",cell.frame.size.width)
            return cell
        } else if indexPath.row == self.listFavorites.endIndex - 1 {
            let cell = FavoriteCell(type: .last, width: self.frame.size.width, height: self.heightCell, reuseIdentifier: "cell")
            cell.config(title: self.listFavorites[indexPath.row].title!, subTitle: self.listFavorites[indexPath.row].subtitle!)
            print("2",cell.frame.size.width)
            return cell
        } else {
            let cell = FavoriteCell(type: .normal, width: self.frame.size.width, height: self.heightCell, reuseIdentifier: "cell")
            cell.config(title: self.listFavorites[indexPath.row].title!, subTitle: self.listFavorites[indexPath.row].subtitle!)
            print("1",cell.frame.size.width)
            return cell
        }
        
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return  self.heightCell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        self.delegateFavorite?.didSelectRowAt(indexPath: indexPath)
        let cell = self.cellForRow(at: indexPath)
        DispatchQueue.main.asyncAfter(deadline: .now() + 0.3) {
            cell?.setSelected(false, animated: true)
        }        
        
    }
    
}
