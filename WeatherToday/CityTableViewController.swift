//
//  CityTableViewController.swift
//  WeatherToday
//
//  Created by 정수현 on 2020/08/21.
//  Copyright © 2020 정수현. All rights reserved.
//

import UIKit

class CityTableViewController: UITableViewController {
    
    var navigationText: String = ""
    var jsonText: String = ""
    var data: [Data] = []

    override func viewDidLoad() {
        //self.navigationController?.navigationBar.backItem?.title = "\(navigationText)" //
        self.navigationItem.title = "\(navigationText)"  // 제목
        //개별 행마다 제어해주지 않아도 텍스트 길이에 따라 알아서 셀의 높이가 변한다
        tableView.rowHeight = UITableView.automaticDimension
        tableView.rowHeight = 150
        
        // JSON
        let jsonDecoder: JSONDecoder = JSONDecoder()
        guard let dataAsset: NSDataAsset = NSDataAsset(name: "\(jsonText)") else {
            return
        }
        do {
            self.data = try jsonDecoder.decode([Data].self, from: dataAsset.data)
        } catch  {
            print(error.localizedDescription)
        }
        self.tableView.reloadData()
    }

    // MARK: - Table view data source
    override func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.data.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cityCell", for: indexPath) as! CityTableViewCell
    
        let datas = data[indexPath.row]
        cell.update(with: datas)
        cell.showsReorderControl = true
        return cell
    }
    
// force the view to reload the data
    override func viewWillAppear(_ animated: Bool) {
        tableView.reloadData()
    }
    
    // MARK: - Navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "show" {
            let indexPath = tableView.indexPathForSelectedRow!
            let nextViewController = segue.destination as! WeatherViewController
        let datas = data[indexPath.row]
        nextViewController.datas = datas
        }
    }
}

struct Data: Codable {
    let city_name: String
    let state: Int
    let celsius: Float
    let rainfall_probability: Int
    
    init(city_name: String, state: Int, celsius: Float, rainfall_probability: Int) {
        self.city_name = city_name
        self.state = state
        self.celsius = celsius
        self.rainfall_probability = rainfall_probability
    }
}
