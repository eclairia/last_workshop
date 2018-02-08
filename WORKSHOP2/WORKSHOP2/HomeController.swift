//
//  HomeController.swift
//  WORKSHOP2
//
//  Created by Adrien Jourdier on 08/02/2018.
//  Copyright © 2018 admin. All rights reserved.
//

import UIKit

class HomeController: UIViewController {
    
    @IBOutlet weak var qrCodeView: UIImageView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // We get the licence of each member
        let licenceNumber = "artd563Kl1rty9"
        
        // We use ascii encodage for qrCode
        let data = licenceNumber.data(using: .ascii, allowLossyConversion: false)
        
        // We put the data to display a qrCode image
        let filter = CIFilter(name: "CIQRCodeGenerator")
        
        filter?.setValue(data, forKey: "inputMessage")
        
        let ciImage = filter?.outputImage
        
        let transform = CGAffineTransform(scaleX: 5, y: 5)
        let transformImage = ciImage?.transformed(by: transform)
        
        let image = UIImage(ciImage: transformImage!)
        qrCodeView.image = image
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
