//
//  newsfeed.swift
//  spegame
//
//  Created by spega on 06/02/18.
//  Copyright © 2018 spega. All rights reserved.
//

import UIKit

class newsfeed: UIViewController,UICollectionViewDelegate,UICollectionViewDataSource {
    ////array declaration
    var newsname = [String]()
     var uid_profile_pic = [String]()
     var upload_image = [String]()
     var username = String()
     var message = [String]()
     var commentcount = String()
     var likecount = String()
    ///outlet connection
    
    @IBOutlet weak var proview: UIImageView!
    @IBOutlet weak var collection: UICollectionView!
    override func viewDidLoad() {
        super.viewDidLoad()
    
    }
    override func viewWillAppear(_ animated: Bool) {
        let imgurl1 = "http://www.spegame.com/user_profile_uploads/"
        let im1 = UserDefaults.standard.value(forKey: "profilepic") as! String
        let im2 = imgurl1+im1
        print(im2)
        if let url = NSURL(string: im2) {
            if let data = NSData(contentsOf: url as URL) {
                proview.image = UIImage(data: data as Data)
                
            }
        }
        
        postdata()
    }
    func postdata()
    {
        var u = UserDefaults.standard.string(forKey: "uid")
        let uidd = String(format: "uid=%@",u!)
        let url = URL(string:"http://www.spegame.com/api/newsfeed.php?\(uidd)&offset=0")
        URLSession.shared.dataTask(with:url!, completionHandler: {(data, response, error) in
            guard let data = data, error == nil else { return }
            
            do {
                let json = try JSONSerialization.jsonObject(with: data, options: .allowFragments) as! [String:Any]
                let posts = json["newsfeed"] as? [NSDictionary]
                print(posts)
                for data in posts!{
              
              if let resultarray = data as? NSDictionary
              {
                    if let head = resultarray.value(forKey:"name")
                    {
                        self.newsname.append(head as! String)
                    }
                    if let statu = resultarray.value(forKey: "uid_fk_profile_pic")
                    {
                       self.uid_profile_pic.append(statu as! String)
                    }
                    if let upimage = resultarray.value(forKey: "upload_image")
                    {
                        self.upload_image.append(upimage as! String)
                    }
                if let uname = resultarray.value(forKey: "username")
                {
                    self.username.append(uname as! String)
                }
                if let msg = resultarray.value(forKey: "message")
                {
                   self.message.append(msg as! String)
                }
                if let cmntcount = resultarray.value(forKey: "comment_count")
                {
                    self.commentcount.append(cmntcount as! String)
                }
                if let lkecount = resultarray.value(forKey: "like_count")
                {
                   self.likecount.append(lkecount as! String)
                }
                
                }
                }
                     //print(self.username)
            // print(self.uid_profile_pic)
                // print(self.upload_image )
              
//                let defaults = UserDefaults.standard
//                defaults.set(uid, forKey: "uid")
//                
//                defaults.set(self.status, forKey: "status")
//                defaults.set(self.pic, forKey: "profilepic")
                
            } catch let error as NSError {
                print(error)
            }
            // print(uid)
            //print(self.status)
            ///user defaults
            DispatchQueue.main.async {
                self.collection.reloadData()
            }
            
            
        }).resume()
        
        
    }
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return newsname.count
    }
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "item1", for: indexPath) as! newscollection
        
        cell.name.text = newsname[indexPath.row]
        cell.message.text = message[indexPath.row]
        let imgurl1 = "http://www.spegame.com/uploads/"
        let im1 = upload_image[indexPath.row]
          let pets = im1.filter { $0 != "," }
        let im2 = imgurl1+pets
        if let url = NSURL(string: im2) {
            if let data = NSData(contentsOf: url as URL) {
                cell.upldimage.image = UIImage(data: data as Data)
                
            }
        }
        let imgurl2 = "http://www.spegame.com/user_profile_uploads/"
        let im3 = uid_profile_pic[indexPath.row]
        let im4 = imgurl2+im3
        if let url = NSURL(string: im4) {
            if let data = NSData(contentsOf: url as URL) {
                cell.uid_propic.image = UIImage(data: data as Data)
                
            }
        }

        
        return cell
        
    }

  

}
