//
//  LoginController.swift
//  WORKSHOP2
//
//  Created by admin on 09/02/2018.
//  Copyright © 2018 admin. All rights reserved.
//

import UIKit

class LoginController: UIViewController {

    @IBOutlet weak var emailText: UITextField!
    @IBOutlet weak var passwordText: UITextField!
    @IBAction func loginButton(_ sender: Any) {
        guard let url = URL(string: "https://blooming-springs-76240.herokuapp.com/users/1.json") else { return }
        let session = URLSession.shared
        session.dataTask(with: url) { (data, response, error) in
            
            if let response = response {
                print(response)
            }
            
            if let data = data {
                print(data)
                do {
                    let json = try JSONSerialization.jsonObject(with: data, options: [])
                    let emailJson = (json as AnyObject)["email"] as! String?
                    let passwordJson = (json as AnyObject)["password"] as! String?
                    let emailInput = self.emailText.text as! String
                    print(type(of: emailJson))
                    let passwordInput = self.passwordText.text as! String
                    
                    if (emailJson? .isEqual(emailInput))! && (passwordJson? .isEqual(passwordInput))! {
                        //self.present(HomePageController, animated: true, completion: nil)
                        if let nextViewController = self.storyboard?.instantiateViewController(withIdentifier: "home") {
                            self.navigationController?.pushViewController(nextViewController, animated: true)
                    }
                        
                    }
                } catch {
                    print(error)
                }
            }
        }.resume()
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()

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
