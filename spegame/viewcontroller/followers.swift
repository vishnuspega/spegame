//
//  followers.swift
//  spegame
//
//  Created by spega on 07/02/18.
//  Copyright © 2018 spega. All rights reserved.
//

import UIKit

class followers: UIViewController,UICollectionViewDataSource {

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 5
    }
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "followcell", for: indexPath) as! followcell
        return cell
        
    }

   

}
