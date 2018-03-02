//
//  Login.swift
//  spegame
//
//  Created by spega on 06/02/18.
//  Copyright © 2018 spega. All rights reserved.
//

import UIKit
 //var uid = String()
var uid = String()

class Login: UIViewController {
   
    @IBOutlet weak var activityindicator: UIActivityIndicatorView!
    var status:String = ""
    var pic:String = ""
    //var sta:String = "success"
    @IBOutlet weak var text1: UITextField!
    
    @IBOutlet weak var text2: UITextField!
    override func viewDidLoad() {
       
        
        super.viewDidLoad()
        activityindicator.isHidden = true
    
    }

    @IBAction func login(_ sender: Any) {
        
        let username = text1.text
        let password = text2.text
        if (username != "" || password != "")
        {
           
            postdata(_user: username!, _pass: password!)
            
            viewchange()
            
            //print(check)
           
        }
            ///alert for empty fields
        else
        {
       

                        let alert = UIAlertController(title: "Error", message: "Enter some details", preferredStyle: UIAlertControllerStyle.alert)
                                  alert.addAction(UIAlertAction(title: "Ok", style: UIAlertActionStyle.default, handler: {(action:UIAlertAction!) in
                                       print("ok")
                                  }))
                                 self.present(alert, animated: true, completion: nil)
            
                    //postdata(_user: username!,_pass: password!)
        
            
        }
    }
    func postdata(_user:String,_pass:String)
    {

        let loginData = String(format: "username=%@&password=%@", _user, _pass)
        let url = URL(string:"http://www.spegame.com/api/login.php?\(loginData)")
         print(url)
        
        URLSession.shared.dataTask(with:url!, completionHandler: {(data, response, error) in
            guard let data = data, error == nil else { return }
            
            do {
                let json = try JSONSerialization.jsonObject(with: data, options: .allowFragments) as! [String:Any]
                let posts = json as? Any
              //print(posts)
                
                if let resularray = posts as? NSDictionary
                {
                    
                    if let head = resularray.value(forKey:"uid")
                    {
                        uid = head as! String
                    }
                    if let statu = resularray.value(forKey: "status")
                    {
                        self.status = statu as! String
                    }
                    if let pro = resularray.value(forKey: "profile_pic")
                    {
                        self.pic = pro as!String
                    }
                }
                let defaults = UserDefaults.standard
                defaults.set(uid, forKey: "uid")
                
                defaults.set(self.status, forKey: "status")
                defaults.set(self.pic, forKey: "profilepic")
                
            } catch let error as NSError {
                print(error)
            }
            // print(uid)
            //print(self.status)
            ///user defaults
            
            
            
        }).resume()


    }
    func viewchange()
    {
//        activityindicator.isHidden = false
//        activityindicator.startAnimating()
        sleep(3)
       
        let check = UserDefaults.standard.string(forKey: "status")
        if(check == "Fail")
        {
             activityindicator.startAnimating()
            print("please check your user name and password")
        }
        else  if(check == "success")
        {
             activityindicator.startAnimating()
            let tview:Home = self.storyboard?.instantiateViewController(withIdentifier: "home")as! Home
            self.present(tview, animated: true, completion: nil)
            
        }
//        activityindicator.isHidden = true
        
    }
//
        }
//        else
//        {
//            let alert = UIAlertController(title: "Error", message: "Enter some details", preferredStyle: UIAlertControllerStyle.alert)
//            alert.addAction(UIAlertAction(title: "Ok", style: UIAlertActionStyle.default, handler: {(action:UIAlertAction!) in
//                print("ok")
//            }))
//
//            self.present(alert, animated: true, completion: nil)
//        }
    //}
        

    
  


 
