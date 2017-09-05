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
        
        
        decimalTextfield = UITextField(frame: CGRect(x: 50, y: 100, width: 300, height: 30))
        decimalTextfield.borderStyle = UITextBorderStyle.roundedRect
        view.addSubview(decimalTextfield)
        decimalTextfield.addTarget(self, action: #selector(decimalDidChange(_:)), for: UIControlEvents.editingChanged)
        
        binaryTextfield = UITextField(frame: CGRect(x: 50, y: 200, width: 300, height: 30))
        binaryTextfield.borderStyle = UITextBorderStyle.roundedRect
        view.addSubview(binaryTextfield)
        binaryTextfield.addTarget(self, action: #selector(binaryDidChange(_:)), for: UIControlEvents.editingChanged)

        hexadecimalTextfield = UITextField(frame: CGRect(x: 50, y: 300, width: 300, height: 30))
        hexadecimalTextfield.borderStyle = UITextBorderStyle.roundedRect
        view.addSubview(hexadecimalTextfield)
        hexadecimalTextfield.addTarget(self, action: #selector(hexadecimalDidChange(_:)), for: UIControlEvents.editingChanged)

    }
    
    func decimalDidChange(_ textfield: UITextField){
        if !shouldEdit{
            return
        }
        if let decimal = Int(textfield.text!){
//            let binary = String(dec, radix: 2)
            shouldEdit = false
            binaryTextfield.text = String(decimal, radix: 2)
            hexadecimalTextfield.text = String(decimal, radix: 16)
            shouldEdit = true
        }else{
            print("EROU")
            //notifica
        }
    }
    
    func binaryDidChange(_ textfield: UITextField){
        if !shouldEdit{
            return
        }
        if let decimal = Int(textfield.text!, radix: 2){
            //            let binary = String(dec, radix: 2)
            shouldEdit = false
            decimalTextfield.text = String(decimal)
            hexadecimalTextfield.text = String(decimal, radix: 16)
            shouldEdit = true
        }else{
            print("EROU")
            //notifica
        }
    }
    
    func hexadecimalDidChange(_ textfield: UITextField){
        if !shouldEdit{
            return
        }
        if let decimal = Int(textfield.text!, radix: 16){
            //            let binary = String(dec, radix: 2)
            shouldEdit = false
            decimalTextfield.text = String(decimal)
            binaryTextfield.text = String(decimal, radix: 2)
            shouldEdit = true
        }else{
            print("EROU")
            //notifica
        }
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

