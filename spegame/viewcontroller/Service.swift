//
//  Service.swift
//  spegame
//
//  Created by spega on 08/02/18.
//  Copyright © 2018 spega. All rights reserved.
//

import UIKit

class Service: UIViewController {
    @IBOutlet weak var slideview: UIView!
    var x = 0
    override func viewWillAppear(_ animated: Bool) {
        slideview.isHidden = true
        
    }
    override func viewDidLoad() {
        super.viewDidLoad()
    }

  
    
    @IBAction func slide(_ sender: Any) {
  if(x == 0)
  {
    UIView.animate(withDuration: 15, delay: 1,
                   options: [.repeat, .autoreverse, .curveEaseInOut],
                   animations: {
                    self.slideview.isHidden = false
    },
                   completion: nil
    )
  //self.slideview.isHidden = false
    x += 1
        }
  else{
    
    UIView.animate(withDuration: 15, delay: 5,
                   options: [.repeat, .autoreverse, .curveEaseInOut],
                   animations: {
                    self.slideview.isHidden = true
    },
                   completion: nil
    )
     // self.slideview.isHidden = true
     x -= 1
        }
    }
    

}
