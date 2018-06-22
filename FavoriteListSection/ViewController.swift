//
//  ViewController.swift
//  FavoriteListSection
//
//  Created by Aceleradora Mobile Perú on 18/06/18.
//  Copyright © 2018 Aceleradora Mobile Perú. All rights reserved.
//

import UIKit

class ViewController: UIViewController, FavoriteTableViewDelegate{
    

    @IBOutlet weak var tableFavorites: FavoriteTableView!
    
    var listFavorite: [Favorite] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Do any additional setup after loading the view, typically from a nib.
        listFavorite = [
            Favorite(title: "Account", subtitle: "123123-234234-675"),
            Favorite(title: "Cuenta Scotiabank", subtitle: "32534534-345345-435"),
            Favorite(title: "Cuenta BBVA", subtitle: "234235-2354234-432")
        ]
        self.tableFavorites.delegateFavorite = self
        self.tableFavorites.configure(list: listFavorite)
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func didSelectRowAt(indexPath: IndexPath) {
        self.performSegue(withIdentifier: "showDetail", sender: nil)
    }
    


}

