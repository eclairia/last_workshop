//
//  HomePageController.swift
//  WORKSHOP2
//
//  Created by admin on 09/02/2018.
//  Copyright © 2018 admin. All rights reserved.
//

import UIKit

class HomePageController: UIViewController {

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
    
    
    
    

}
