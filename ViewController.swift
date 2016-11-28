//
//  ViewController.swift
//  kids calculator
//
//  Created by Ogbechie Nnamdi on 21/11/2016.
//  Copyright © 2016 Ogbechie Nnamdi. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    @IBOutlet weak var txtFieldA: UITextField!
    @IBOutlet weak var txtFieldB: UITextField!
    @IBOutlet weak var operationLbl: UILabel!
    @IBOutlet weak var resultLbl: UILabel!


    
    var operation = Operations.none
        
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let tapRecogniser = UITapGestureRecognizer(target: self, action: #selector(hidekeyboard))
        
        view.addGestureRecognizer(tapRecogniser)

    }
    
    
    @IBAction func calculate(_ sender: AnyObject) {
        if let strA = txtFieldA.text, let strB = txtFieldB.text, let numA = Double(strA), let numB = Double(strB) {
            if operation != .none {
                calculateAandB(a: numA, b: numB, operation:operation) { result in
                    resultLbl.text = "\(result)"
                }
                
            }
            
        }
            
        hidekeyboard()
        
    }
    
    
    @IBAction func changeOperation(_ sender: AnyObject) {
        if sender.tag == 1 {
            operation = .add
        } else if sender.tag == 2 {
            operation = .subtract
        } else if sender.tag == 3 {
            operation = .multiply
        } else {
            operation = .divide
            
        }
        
        operationLbl.text = "Operation: \(operation)"
        
    }
    
    func hidekeyboard() {
        view.endEditing(true)
    
    }
    
    func calculateAandB(a: Double, b: Double, operation: Operations, completed: (Double) -> ()) {
        switch operation {
        case.add:
            completed(a + b)
        case.subtract:
            completed(a - b)
        case.multiply:
            completed(a * b)
        case.divide:
            completed(a / b)
        default:
            break
        }
        
    
    }
    
    
}

