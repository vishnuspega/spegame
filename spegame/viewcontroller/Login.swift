//
//  Login.swift
//  spegame
//
//  Created by spega on 06/02/18.
//  Copyright © 2018 spega. All rights reserved.
//

import UIKit

class Login: UIViewController {
    @IBOutlet weak var text1: UITextField!
    
    @IBOutlet weak var text2: UITextField!
    override func viewDidLoad() {
        super.viewDidLoad()
    }

    @IBAction func login(_ sender: Any) {
        
        let username = text1.text
        let password = text2.text
        if (username == "" || password == "")
        {
            let alert = UIAlertController(title: "Error", message: "Enter some details", preferredStyle: UIAlertControllerStyle.alert)
                      alert.addAction(UIAlertAction(title: "Ok", style: UIAlertActionStyle.default, handler: {(action:UIAlertAction!) in
                           print("ok")
                      }))
                     self.present(alert, animated: true, completion: nil)
        }
        postdata(_user: username!,_pass: password!)
    
    }
    func postdata(_user:String,_pass:String)
    {
        let url = URL(string: "http:spegame/api/lohin.php")
        let session = URLSession.shared
        let request = NSMutableURLRequest(url:url!)
        let param = "username=" + _user + "password=" + _pass
        request.httpMethod = "POST"
        request.httpBody = param.data(using: String.Encoding.utf8)
        let task = session.dataTask(with: request as! URLRequest, completionHandler: {
            (data,responce,Error) in
            guard let _:Data = data else
            {
            return
            }
            let json:Any?
            do
            {
                json = try JSONSerialization.jsonObject(with: data!, options: [])
            }
            catch
            {
                return
            }
            print(json)
    })
    }
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
        

    
  


