//
//  ViewController.swift
//  test
//
//  Created by Mariana Meireles on 04/09/17.
//  Copyright © 2017 Mariana Meireles. All rights reserved.
//

import UIKit

class ViewController: UIViewController{
    
    var decimalTextfield: UITextField!
    var binaryTextfield: UITextField!
    var hexadecimalTextfield: UITextField!
    
    var shouldEdit = true

    override func viewDidLoad() {
        super.viewDidLoad()
        
        let tap: UITapGestureRecognizer = UITapGestureRecognizer(target: self, action: #selector(dismissKeyboard))
        view.addGestureRecognizer(tap)
        
        decimalTextfield = UITextField(frame: CGRect(x: 35, y: 100, width: 300, height: 35),
                                       placeholder: "Decimal Number",
                                       target: self,
                                       action: #selector(decimalDidChange(_:)))
        
        binaryTextfield = UITextField(frame: CGRect(x: 35, y: 180, width: 300, height: 35),
                                      placeholder: "Binary Number",
                                      target: self,
                                      action: #selector(binaryDidChange(_:)))
        
        hexadecimalTextfield = UITextField(frame: CGRect(x: 35, y: 260, width: 300, height: 35),
                                           placeholder: "Hexadecimal Number",
                                           target: self,
                                           action: #selector(hexadecimalDidChange(_:)))
        
        view.addSubview(decimalTextfield)
        view.addSubview(binaryTextfield)
        view.addSubview(hexadecimalTextfield)
    }
    
    func decimalDidChange(_ textfield: UITextField){
        
        if !shouldEdit{
            return
        }
        if let decimal = Int(textfield.text!){
            shouldEdit = false
            binaryTextfield.text = String(decimal, radix: 2)
            hexadecimalTextfield.text = String(decimal, radix: 16)
            shouldEdit = true
        }else if let deletedDecimal = textfield.text, deletedDecimal.isEmpty{
            shouldEdit = false
            binaryTextfield.text = ""
            hexadecimalTextfield.text = ""
            shouldEdit = true
        }else{
            showDialog(title: "Ops!",
                       message: "This is not a valid decimal number")
        }
    }
    
    func binaryDidChange(_ textfield: UITextField){
        
        if !shouldEdit{
            return
        }
        
        if let decimal = Int(textfield.text!, radix: 2){
            shouldEdit = false
            decimalTextfield.text = String(decimal)
            hexadecimalTextfield.text = String(decimal, radix: 16)
            shouldEdit = true
        }else if let deletedBinary = textfield.text, deletedBinary.isEmpty{
            shouldEdit = false
            decimalTextfield.text = ""
            hexadecimalTextfield.text = ""
            shouldEdit = true
        }else{
            showDialog(title: "Ops!",
                       message: "This is not a valid binary number")
        }
    }
    
    func hexadecimalDidChange(_ textfield: UITextField){
        
        if !shouldEdit{
            return
        }
        
        if let decimal = Int(textfield.text!, radix: 16){
            shouldEdit = false
            decimalTextfield.text = String(decimal)
            binaryTextfield.text = String(decimal, radix: 2)
            shouldEdit = true
        }else if let deletedHexadecimal = textfield.text, deletedHexadecimal.isEmpty{
            shouldEdit = false
            decimalTextfield.text = ""
            binaryTextfield.text = ""
            shouldEdit = true
        }else{
            showDialog(title: "Ops!",
                       message: "This is not a valid hexadecimal number")
        }
    }
    
    private func showDialog(title : String, message: String) {
        let alert = UIAlertController(title: title,
                                      message: message,
                                      preferredStyle: UIAlertControllerStyle.alert)
        
        self.present(alert, animated: true, completion: nil)
        
        alert.addAction(UIAlertAction(title: "OK", style: .default, handler: { (action: UIAlertAction!) in
            alert.dismiss(animated: true, completion: nil)
        }))
    }
    
    func dismissKeyboard() {
        view.endEditing(true)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }

    
}

