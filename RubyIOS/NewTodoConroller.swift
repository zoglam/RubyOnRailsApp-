//
//  NewTodoConroller.swift
//  RubyIOS
//
//  Created by Anzor on 16.08.2019.
//  Copyright © 2019 Anzor. All rights reserved.
//

import Foundation
import UIKit

public class NewTodoController: UIViewController, UITableViewDataSource, UITableViewDelegate {
    
    
    public func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        //возвращаем количество задач внутри проекта, который находим, используя section
        return 1
    }
    
    public func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "inputText", for: indexPath) as! InputNewTodo
        cell.configure(text: "", placeholder: "Новое задание...")
        return cell
    }
    
    /*
    public func tableView(_ tableView: UITableView, didHighlightRowAt indexPath: IndexPath) {
        <#code#>
    }
    */
}
