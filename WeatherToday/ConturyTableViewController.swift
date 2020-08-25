//
//  ConturyTableViewController.swift
//  WeatherToday
//
//  Created by 정수현 on 2020/08/21.
//  Copyright © 2020 정수현. All rights reserved.
//

import UIKit
class ConturyTableViewController: UITableViewController {
    
    var countryList = ["한국", "독일", "이탈리아", "미국", "프랑스", "일본"]
    var imageFileName = ["flag_kr", "flag_de", "flag_it", "flag_us", "flag_fr", "flag_jp"]
    let accessoryTypes: [UITableViewCell.AccessoryType] = [.disclosureIndicator]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // 네비게이션바
        self.navigationController?.navigationBar.barTintColor = UIColor(red: 117/255, green: 172/255, blue: 228/255, alpha: 1)
        self.navigationController?.navigationBar.tintColor = .white
        self.navigationController?.navigationBar.topItem?.title = "세계 날씨"
        self.navigationController?.navigationBar.titleTextAttributes = [.foregroundColor: UIColor.white]
    }
    
    // MARK: - Table view data source
    override func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.countryList.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "countryCell", for: indexPath)
        // 국가 이름
        cell.textLabel?.text = countryList[indexPath.row]
        // 국기
        cell.imageView?.image = UIImage(named: imageFileName[(indexPath as NSIndexPath).row])
        cell.accessoryType = accessoryTypes[indexPath.row % accessoryTypes.count]
        return cell
    }
    
    var indexText: String = ""
    override func tableView(_ tableView: UITableView, willSelectRowAt indexPath: IndexPath) -> IndexPath? {
        switch indexPath.row {
        case 0:
            indexText = "kr"
        case 1:
            indexText = "de"
        case 2:
            indexText = "it"
        case 3:
            indexText = "us"
        case 4:
            indexText = "fr"
        case 5:
            indexText = "jp"
        default:
            print("nil")
        }
        return indexPath
    }
    //    override func viewWillAppear(_ animated: Bool) {
    //        tableView.reloadData()
    //    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        guard let nextViewController: CityTableViewController = segue.destination as? CityTableViewController else {
            return
        }
        let cell = sender as! UITableViewCell
        // json (kr, us...)
        nextViewController.jsonText = indexText
        // 국가명
        let tableText: String = (cell.textLabel?.text)!
        nextViewController.navigationText = tableText //cell.textLabel?.text as! String
    }
    
    
}













