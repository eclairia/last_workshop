//
//  InscriptionForm6Controller.swift
//  WORKSHOP2
//
//  Created by admin on 09/02/2018.
//  Copyright © 2018 admin. All rights reserved.
//

import UIKit
import MessageUI

class InscriptionForm6Controller: UIViewController, MFMailComposeViewControllerDelegate {

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
    @IBAction func sendEmailToValidLicence(_ sender: Any) {
        let mail = configuredMailComposeViewController()
        if MFMailComposeViewController.canSendMail() {
            self.present(mail, animated: true, completion: nil)
        } else {
            self.showSendMailErrorAlert()
        }
    }
    
    func configuredMailComposeViewController() -> MFMailComposeViewController {
        let mailComposerVC = MFMailComposeViewController()
        mailComposerVC.mailComposeDelegate = self // Extremely important to set the --mailComposeDelegate-- property, NOT the --delegate-- property
        
        mailComposerVC.setSubject("Viens essayer le hado")
        mailComposerVC.setMessageBody("A l’aide d’un casque et d’un bracelet connecté, vous découvrirez une nouvelle dimension. Grâce à cet équipement, vous pouvait envoyer des boules d’énergie et dresser des boucliers. Un jeu grandeur nature, c’est ce qu’on appelle la réalité augmentée. « Il y a un viseur au milieu et on voit tout en 3D », décrit une gameuse.Derrière le masque, des éléments virtuels qui viennent s’ajouter à la réalité et des effets sonores plus vrais que nature. Un combat comme dans les mangas, beaucoup en rêvaient. « On voit tout ce qui se passe autour de nous : les adversaires, les boules de couleur qu’on lance », explique un participant. « C’est intéressant, ça change des jeux sur ordinateur, c’est un jeu un peu plus physique, on arrête pas de bouger », remarque un autre gameur.", isHTML: false)
        
        return mailComposerVC
    }
    
    func showSendMailErrorAlert() {
        let sendMailErrorAlert = UIAlertView(title: "Could Not Send Email", message: "Your device could not send e-mail.  Please check e-mail configuration and try again.", delegate: self, cancelButtonTitle: "OK")
        sendMailErrorAlert.show()
    }
    
    // MARK: MFMailComposeViewControllerDelegate Method
    func mailComposeController(_ controller: MFMailComposeViewController, didFinishWith result: MFMailComposeResult, error: Error?) {
        controller.dismiss(animated: true, completion: nil)
    }

}
