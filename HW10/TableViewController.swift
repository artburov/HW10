//
//  TableViewController.swift
//  HW10
//
//  Created by Admin on 08.05.2020.
//  Copyright © 2020 home. All rights reserved.
//

import UIKit


struct Section {
    var sectionTitle = ""
    var sectionItem: [String] = []
}

class SectionFabric {
    static func sections() -> [Section] {
        return [
            Section(sectionTitle: " ", sectionItem:
                ["Авиарежим", "Wi-Fi", "Bluetooth", "Сотовая связь", "Режим модема"]),
            Section(sectionTitle: " ", sectionItem:
                ["Уведомления", "Звук, тактильные сигналы", "Не беспокоить", "Экранное время",]),
            Section(sectionTitle: " ", sectionItem:
                ["Основные", "Пункт управления", "Экран и яркость"])
        ]
    }
}

class TableViewController: UIViewController {
    var sections = SectionFabric.sections()
    
    //arrays with images
    let sectionImages = [UIImage(named: "avio"), UIImage(named: "wifi"),UIImage(named: "bluetooth"), UIImage(named: "cell_connect"),UIImage(named: "modem"), UIImage(named: "notification"), UIImage(named: "sound"),UIImage(named: "dont_distr"),UIImage(named: "screen_time"), UIImage(named: "avio"),UIImage(named: "avio"), UIImage(named: "avio")]
    
    let accessorImages = [UIImage(named: "anvics"), UIImage(named: "red_number")]
    
    
    @IBOutlet weak var myTableView: UITableView!
    let identificator = "MyCell"
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
}

extension TableViewController: UITableViewDataSource, UITableViewDelegate {
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return sections.count
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        return sections[section].sectionItem.count
    }
    
    func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        return sections[section].sectionTitle
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: identificator) as! SettingsTableViewCell
        
        cell.nameDynamic.isHidden = true
        
        let name = String( sections[indexPath.section].sectionItem[indexPath.row])
        cell.nameLabel.text = name
        cell.imageCell.frame.size.width = 25
        cell.imageCell.image = sectionImages[indexPath.row]
        cell.accessoryType = .disclosureIndicator
        
        
        switch sections[indexPath.section].sectionItem[indexPath.row] {
        case "Авиарежим":
            let mySwitch = UISwitch()
            mySwitch.isOn = false
            cell.accessoryView = mySwitch
        case "Wi-Fi":
            cell.imageDynamic.image = accessorImages[0]
            
        case "Bluetooth":
            cell.nameDynamic.isHidden = false
            cell.nameDynamic.textColor = UIColor.gray
            cell.nameDynamic.text = String("Вкл.")
            cell.nameDynamic.textAlignment = .right
            cell.nameDynamic.sizeToFit()
            cell.accessoryView = cell.nameDynamic
            
        case "Основные":
            cell.imageDynamic.image = accessorImages[1]
            
            // Manual positioning of accessor image from array
            cell.imageDynamic.translatesAutoresizingMaskIntoConstraints = false
            cell.imageDynamic.topAnchor.constraint(equalTo: cell.topAnchor, constant: 2).isActive = true
            cell.imageDynamic.rightAnchor.constraint(equalTo: cell.rightAnchor, constant: -10).isActive = true
            cell.imageDynamic.bottomAnchor.constraint(equalTo: cell.bottomAnchor).isActive = true
            cell.imageDynamic.widthAnchor.constraint(equalTo: cell.heightAnchor, constant: 20).isActive = true
            
        default:
            break
        }
        return cell
    }
}

// need for cellForRowAt because offset error
extension StringProtocol {
    subscript(offset: Int) -> Character {
        self[index(startIndex, offsetBy: offset)]
    }
}


