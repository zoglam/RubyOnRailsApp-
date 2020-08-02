//
//  InputNewTodo.swift
//  RubyIOS
//
//  Created by Anzor on 17.08.2019.
//  Copyright © 2019 Anzor. All rights reserved.
//

import Foundation
import UIKit

public class InputNewTodo: UITableViewCell {
    @IBOutlet weak var inputTodo: UITextField!
    
    public func configure(text: String?, placeholder: String){
        inputTodo.text = String(text!)
        inputTodo.placeholder = placeholder
        
        inputTodo.accessibilityValue = String(text!)
        inputTodo.accessibilityLabel = placeholder
    }
    
}
