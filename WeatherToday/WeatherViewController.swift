//
//  WeatherViewController.swift
//  WeatherToday
//
//  Created by 정수현 on 2020/08/21.
//  Copyright © 2020 정수현. All rights reserved.
//

import UIKit

class WeatherViewController: UIViewController {

    @IBOutlet weak var imgView: UIImageView!
    @IBOutlet weak var label1: UILabel!
    @IBOutlet weak var lebel2: UILabel!
    @IBOutlet weak var label3: UILabel!
    
    var datas: Data?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        var subtitleText = ""
        if let datas = datas {
            // 도시명
            label1.text = datas.city_name
            subtitleText = label1.text!
            // 온도
            let ft = Float(datas.celsius * (9/5) + 32)
            lebel2.text = "섭씨 \(datas.celsius)도 / 화씨" + String(format: "%.1f", ft) + "도"
            // 온도 색상
            if datas.celsius < 10 {
                lebel2.textColor = .blue
            }
            // 습도
            label3.text = "현재습도 \(datas.rainfall_probability)%"
     
            // 이미지, 습도 색상
                if datas.rainfall_probability >= 60 {
                    imgView.image = UIImage(named: "rainy")
                    label3.textColor = .red
                } else if (datas.rainfall_probability >= 40) && (datas.rainfall_probability < 60) {
                    imgView.image = UIImage(named: "cloudy")
                    label3.textColor = .orange
                } else {
                    imgView.image = UIImage(named: "sunny")
                }
            }
        self.navigationController?.navigationBar.backItem?.title = "\(subtitleText)"
        self.navigationItem.title = "\(subtitleText)"
        }
    }
    


    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
//    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
//        if segue.identifier == "sendData" {
//            
//        }
//    }



