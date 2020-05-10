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
            Section(sectionTitle: "Настройки", sectionItem:
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
    
    //array with images
    let sectionImages = [UIImage(named: "avio"), UIImage(named: "wifi"),UIImage(named: "bluetooth"), UIImage(named: "cell_connect"),UIImage(named: "modem"), UIImage(named: "notification"), UIImage(named: "sound"),UIImage(named: "dont_distr"),UIImage(named: "screen_time"), UIImage(named: "avio"),UIImage(named: "avio"), UIImage(named: "avio")]
    
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
        
        let name = String( sections[indexPath.section].sectionItem[indexPath.row])
        cell.nameLabel.text = name
        cell.imageCell.image = sectionImages[indexPath.row]
        cell.accessoryType = .disclosureIndicator
        
        
        switch sections[indexPath.section].sectionItem[indexPath.row] {
        case "Wi-Fi":
            let sentImage = UIImage(named: "anvics")
            let sentImageView = UIImageView(image: sentImage)
            sentImageView.frame = CGRect(x: 0, y: 0, width: 95, height: 25)
            sentImageView.tintColor = .lightGray
            sentImageView.sizeToFit()
            cell.accessoryView = sentImageView
        case "Авиарежим":
            let mySwitch = UISwitch()
            mySwitch.isOn = false
            cell.accessoryView = mySwitch
        case "Bluetooth":
            let myLabel = UILabel(frame: CGRect(x: 0, y: 0, width: 45, height: 45))
            myLabel.textColor         = UIColor.gray
            myLabel.text              = String("Вкл.")
            myLabel.textAlignment     = .right
            myLabel.sizeToFit()
            cell.accessoryView      = myLabel
        case "Основные":
            let sentImage = UIImage(named: "red_number")
            let sentImageView = UIImageView(image: sentImage)
            sentImageView.frame = CGRect(x: 0, y: 0, width: 50, height: 28)
            sentImageView.sizeToFit()
            cell.accessoryView = sentImageView
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
