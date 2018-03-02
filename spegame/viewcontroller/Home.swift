//
//  Home.swift
//  spegame
//
//  Created by spega on 06/02/18.
//  Copyright © 2018 spega. All rights reserved.
//

import UIKit

class Home: UIViewController {
    
    
   
    @IBOutlet weak var job: UILabel!
    @IBOutlet weak var profileID: UILabel!  
    
    @IBOutlet weak var friend_count: UILabel!
    
    @IBOutlet weak var uname: UILabel!
    @IBOutlet weak var folowingCount: UILabel!
    @IBOutlet weak var cover_pic: UIImageView!
    @IBOutlet weak var followersCount: UILabel!
    @IBOutlet weak var profileimage: UIImageView!
    @IBOutlet weak var pro: UIButton!
    @IBOutlet weak var vw1: UIView!
    @IBOutlet weak var vw2: UIView!
    var name = String()
    var coverpic = String()
    var username = String()
    var profileid = String()
    var profilecount = String()
    lazy var userDetails : NSDictionary? = [:]
    override func viewDidLoad() {
        super.viewDidLoad()
        profileimage.layer.cornerRadius = pro.frame.size.width / 2
         profileimage.clipsToBounds = true
         profileimage.layer.borderColor = UIColor.white.cgColor
        profileimage.layer.borderWidth = 0
vw1.layer.borderWidth = 1
        vw2.layer.borderWidth = 1
        print(uid)
      
    }
    override func viewWillAppear(_ animated: Bool) {
          postdata()
        setFields()
        //print(userDetails!)
//        guard let pic = userDetails.value(forKey: "profile_pic") as! String
//        else
//        {
//            return
//        }
          //pro.setBackgroundImage(UIImage(named : userDetails.value(forKey: "profile_pic") as! String), for: .normal)
        let imgurl1 = "http://www.spegame.com/user_profile_uploads/"
        let im1 = UserDefaults.standard.value(forKey: "profilepic") as! String
        let im2 = imgurl1+im1
        print(im2)
        if let url = NSURL(string: im2) {
            if let data = NSData(contentsOf: url as URL) {
              profileimage.image = UIImage(data: data as Data)

            }
        }
    }
func postdata()
{
    var u = UserDefaults.standard.string(forKey: "uid")
    let ui = String(format: "uid=%@",u!)
    let url = URL(string:"http://www.spegame.com/api/profile_details.php?\(ui)&offset=0")
    //print(y)
    // request.setValue("Basic \(loginData)"
   // print(url)
    
    URLSession.shared.dataTask(with:url!, completionHandler: {(data, response, error) in
        guard let data = data, error == nil else { return }
        
        do {
            let json = try JSONSerialization.jsonObject(with: data, options: .allowFragments) as! [String:Any]
            let posts = json["profiledetails"] as? [[String: Any]] ?? []
            //print(json)
            
            let resularray = posts as? NSArray
           // print(resularray)
            self.userDetails = resularray![0] as! NSDictionary
           print(self.userDetails!)
            if let finalresult = self.userDetails as? NSDictionary
            {
                
                if let head = finalresult.value(forKey:"profileid")
                {
                    self.name.append(head as! String)
                }
                if let coverp = finalresult.value(forKey: "cover_photo")
                {
                    self.coverpic = coverp as! String
                }
                if let user = finalresult.value(forKey: "username")
                {
                    self.username = user as! String
                }
                if let friend_count = finalresult.value(forKey: "friend_count")
                {
                    self.profilecount = friend_count as! String
                }
              
            }
         
           // print(self.name)
        } catch let error as NSError {
            print(error)
        }
       // print(uid)
        UserDefaults.standard.set(self.coverpic, forKey: "cover")
        UserDefaults.standard.set(self.username, forKey: "user")
        UserDefaults.standard.set(self.name, forKey: "proid")
         UserDefaults.standard.set(self.profilecount, forKey: "procount")
       
    }).resume()
      UserDefaults.standard.removeObject(forKey:"status")
    //cover pic
    sleep(3)
//    let cover = UserDefaults.standard.string(forKey: "status")
//    print(cover)
//    let imgurl1 = "http://www.spegame.com/cover_pic/"
//    let im2 = imgurl1+cover!
//    print(im2)
//    if let url = NSURL(string: im2) {
//        if let data = NSData(contentsOf: url as URL) {
//            profileimage.image = UIImage(data: data as Data)
//
//        }
//    }
    
    
    }
    func setFields()
    {
        let cover = UserDefaults.standard.string(forKey: "cover")
        let imgurl1 = "http://www.spegame.com/cover_pic/"
        let im2 = imgurl1+cover!
        print(im2)
        if let url = NSURL(string: im2) {
            if let data = NSData(contentsOf: url as URL) {
                cover_pic.image = UIImage(data: data as Data)
                
            }
        }
        let proid = UserDefaults.standard.string(forKey: "proid")
        
        profileID.text = proid
        let frnd_count = UserDefaults.standard.string(forKey: "procount")
        friend_count.text = frnd_count
        let userN = UserDefaults.standard.string(forKey: "user")
        uname.text = userN
    }

}
