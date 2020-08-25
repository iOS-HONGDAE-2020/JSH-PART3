//
//  CityTableViewCell.swift
//  WeatherToday
//
//  Created by 정수현 on 2020/08/23.
//  Copyright © 2020 정수현. All rights reserved.
//

import UIKit

class CityTableViewCell: UITableViewCell {

    @IBOutlet weak var firstLabel: UILabel!
    @IBOutlet weak var secondLabel: UILabel!
    @IBOutlet weak var thirdLabel: UILabel!
    @IBOutlet weak var imgView: UIImageView!
    
    func update(with datas: Data) {
        // 도시명
        firstLabel.text = datas.city_name
        // 온도
        let ft = Float(datas.celsius * (9/5) + 32)
        secondLabel.text = "섭씨 \(datas.celsius)도 / 화씨" + String(format: "%.1f", ft) + "도"
        // 온도 색상
        if datas.celsius < 10 {
            secondLabel.textColor = .blue
        }
        // 습도
        thirdLabel.text = "현재습도 \(datas.rainfall_probability)%"
        // 이미지, 습도 색상
        if datas.rainfall_probability >= 60 {
            imgView.image = UIImage(named: "rainy")
            thirdLabel.textColor = .red
        } else if (datas.rainfall_probability >= 40) && (datas.rainfall_probability < 60) {
            imgView.image = UIImage(named: "cloudy")
            thirdLabel.textColor = .orange
        } else {
            imgView.image = UIImage(named: "sunny")
        }
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
