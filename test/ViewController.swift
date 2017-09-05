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
        
        decimalTextfield = UITextField(frame: CGRect(x: 35, y: 100, width: 300, height: 35), placeholder: "Decimal Number", target: self, action: #selector(decimalDidChange(_:)))
        
        binaryTextfield = UITextField(frame: CGRect(x: 35, y: 180, width: 300, height: 35), placeholder: "Binary Number", target: self, action: #selector(binaryDidChange(_:)))
        
        hexadecimalTextfield = UITextField(frame: CGRect(x: 35, y: 260, width: 300, height: 35), placeholder: "Hexadecimal Number", target: self, action: #selector(hexadecimalDidChange(_:)))
        
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
            binaryTextfield.text = deletedDecimal
            hexadecimalTextfield.text = deletedDecimal
            shouldEdit = true
        }else{
            let decimalAlert = UIAlertController(title: "Ops!", message: "This is not a valid decimal number", preferredStyle: UIAlertControllerStyle.alert)
            self.present(decimalAlert, animated: true, completion: nil)
            decimalAlert.addAction(UIAlertAction(title: "OK", style: .default, handler: { (action: UIAlertAction!) in
                decimalAlert.dismiss(animated: true, completion: nil)
            }))
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
            decimalTextfield.text = deletedBinary
            hexadecimalTextfield.text = deletedBinary
            shouldEdit = true
        }else{
            let binaryAlert = UIAlertController(title: "Ops!", message: "This is not a valid binary number", preferredStyle: UIAlertControllerStyle.alert)
            self.present(binaryAlert, animated: true, completion: nil)
            binaryAlert.addAction(UIAlertAction(title: "OK", style: .default, handler: { (action: UIAlertAction!) in
                binaryAlert.dismiss(animated: true, completion: nil)
            }))
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
            decimalTextfield.text = deletedHexadecimal
            binaryTextfield.text = deletedHexadecimal
            shouldEdit = true
        }else{
            let hexadecimalAlert = UIAlertController(title: "Ops!", message: "This is not a valid hexadecimal number", preferredStyle: UIAlertControllerStyle.alert)
            self.present(hexadecimalAlert, animated: true, completion: nil)
            hexadecimalAlert.addAction(UIAlertAction(title: "OK", style: .default, handler: { (action: UIAlertAction!) in
                hexadecimalAlert.dismiss(animated: true, completion: nil)
            }))
        }
    }
    
    func dismissKeyboard() {
        view.endEditing(true)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    
}

