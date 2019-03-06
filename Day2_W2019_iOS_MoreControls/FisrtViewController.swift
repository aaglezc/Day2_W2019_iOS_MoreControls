//
//  ViewController.swift
//  Day2_W2019_iOS_MoreControls
//
//  Created by MacStudent on 2019-03-05.
//  Copyright © 2019 MacStudent. All rights reserved.
//

import UIKit

class FirstViewController: UIViewController {

    @IBOutlet weak var lblMsg: UILabel!
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    @IBAction func swtch1(_ sender: UISwitch)
    {
        if(sender.isOn)
        {
            self.lblMsg.text = "Switch is ON"
        }
        else
        {
            self.lblMsg.text = "Switch is OFF"
        }
    }
    
    @IBAction func btnAlert(_ sender: UIButton)
    {
        //https://medium.com/ios-os-x-development/how-to-use-uialertcontroller-in-swift-70143d7fbede
        //https://learnappmaking.com/uialertcontroller-alerts-swift-how-to/
        
        //self.showAlert()
        //self.showActionSheet()
        self.showInputAlert()
     
    }
    
    //User Alert type for input fields
    
    func showInputAlert()
    {
        let alert = UIAlertController(title: "Login", message: nil, preferredStyle: .alert)
        
        
        alert.addTextField(configurationHandler: { textField in
            textField.placeholder = "Input your name here..."
        })
        
        alert.addTextField { (textField) in
            textField.isSecureTextEntry = true
            textField.placeholder = "Input your password here..."
        }
        
        // Action for "OK"
        alert.addAction(UIAlertAction(title: "OK", style: .default, handler: { action in
            
            if let name = alert.textFields?.first?.text {
                print("Your name: \(name)")
            }
            
            if let name = alert.textFields?[1].text {
                print("Your password: \(name)")
            }
        }))
        
        // Action for "Cancel" (none)
        alert.addAction(UIAlertAction(title: "Cancel", style: .cancel, handler: nil))
        
        self.present(alert, animated: true)
    }
    
    func showAlert()
    {
        // var alert = UIAlertController(title: "Alert", message: "how are you?", preferredStyle: .alert)
        var alert = UIAlertController(title: "Alert", message: "how are you?", preferredStyle: .actionSheet)
        
        var actionDefault = UIAlertAction(title: "OK", style: .default, handler: nil)
        
        var actionCancel = UIAlertAction(title: "Cancel", style: .cancel, handler: nil)
        
        var actionDescriptive = UIAlertAction(title: "Delete", style: .destructive, handler: nil)
        
        alert.addAction(actionDefault)
        alert.addAction(actionCancel)
        alert.addAction(actionDescriptive)
        
        self.present(alert, animated: true)
        
    }
    @IBAction func btnNextScreen(_ sender: UIButton) {
        var sb = UIStoryboard(name: "Main", bundle: nil)
        var  SecondView = sb.instantiateViewController(withIdentifier: "SecondView") as! SecondViewController
        
        self.present(SecondView, animated: true)
    }
}

