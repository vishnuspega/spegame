//
//  newsfeed.swift
//  spegame
//
//  Created by spega on 06/02/18.
//  Copyright © 2018 spega. All rights reserved.
//

import UIKit

class newsfeed: UIViewController,UICollectionViewDelegate,UICollectionViewDataSource {

    @IBOutlet weak var collection: UICollectionView!
    override func viewDidLoad() {
        super.viewDidLoad()

       
    }
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 5
    }
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "item1", for: indexPath) as! newscollection
        return cell
        
    }

  

}
