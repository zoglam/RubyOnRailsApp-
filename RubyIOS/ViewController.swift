//
//  TableViewController.swift
//  RubyIOS
//
//  Created by Anzor on 15.08.2019.
//  Copyright © 2019 Anzor. All rights reserved.
//

import UIKit
import M13Checkbox

var project = ["Семья","Работа","Прочее"]
var todo = [
    ["Купить молоко","Заменить масло в двигателе","Заплатить за квартиру"],
    ["Позвонить заказчику","Отправить документы","Заполнить отчет"],
    ["Позвонить другу","Подготовиться к поездке","Написать на email"]
]

class ViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {
    
    @IBOutlet weak var tableView: UITableView!

    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
   public func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        //возвращаем количество задач внутри проекта, который находим, используя section
        return todo.count
    }
    
    public func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        //возвращаем ячейку для заголовка
        let label = UILabel()
        label.text = project[section]
        return label
    }
    
    public func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        //высота cell (непосредственно само todo)
        return 50.0
    }
    
    private func tableView(tableView: UITableView, heightForRowAtIndexPath indexPath: NSIndexPath) -> CGFloat {
        //высота заголовка (название проекта)
        return 10.0
    }
    
    public func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        //находим cell, используя Identifier, который установили в storyboard, и возвращаем cell для текущего индекса
        //пока не нужно устанавливать текст, поскольку мы будем добавлять кастомный компонент - checkbox, а не UILabel,
        //который установлен в стандартной UITableViewCell по умолчанию
        let cell = tableView.dequeueReusableCell(withIdentifier: "Todoidentifier", for: indexPath)
        let checkbox = M13Checkbox(frame: CGRect(x: 20.0, y: 13.0, width: 20.0, height: 20.0))
        
        let selectedAttributes: [NSAttributedString.Key: Any] = [
            .strikethroughStyle: NSUnderlineStyle.patternDot.rawValue
        ]
        
        self.tableView.separatorStyle = UITableViewCell.SeparatorStyle.none
        
        checkbox.boxType = .square
        checkbox.stateChangeAnimation = .fill
        checkbox.checkmarkLineWidth = 3.0
        cell.addSubview(checkbox)
        
        /*
        if (checkbox.checkState == .unchecked){
            let attributeString = NSMutableAttributedString(string: todo[indexPath.section][indexPath.row], attributes: selectedAttributes)
            
            
            cell.textLabel?.attributedText = attributeString
            print("ЗАЧЕРКНУТО")
        }
        */
        
        cell.textLabel?.text = todo[indexPath.section][indexPath.row]
        
        
        return cell
    }
    
    public func numberOfSections(in tableView: UITableView) -> Int {
        //возвращаем количество секций (проектов)
        return project.count
    }   
    
    
}

extension ViewController {
    
    @IBAction func cancelToTodosViewController(_ segue: UIStoryboardSegue) {
    }
    
    @IBAction func saveTodosDetail(_ segue: UIStoryboardSegue) {
    }
}
