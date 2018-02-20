//
//  Home.swift
//  spegame
//
//  Created by spega on 06/02/18.
//  Copyright © 2018 spega. All rights reserved.
//

import UIKit

class Home: UIViewController {
    @IBOutlet weak var pro: UIButton!
    @IBOutlet weak var vw1: UIView!
    @IBOutlet weak var vw2: UIView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        pro.layer.cornerRadius = pro.frame.size.width / 2
        pro.clipsToBounds = true
        pro.layer.borderColor = UIColor.white.cgColor
        pro.layer.borderWidth = 2
vw1.layer.borderWidth = 1
        vw2.layer.borderWidth = 1
        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
