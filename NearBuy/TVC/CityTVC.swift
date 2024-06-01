//
//  CityTVC.swift
//  NearBuy
//
//  Created by Tarun Khurana on 01/06/24.
//

import UIKit

class CityTVC: UITableViewCell {

    @IBOutlet weak var detailLbl: UILabel!
    @IBOutlet weak var headingLbl: UILabel!
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
    
    func configureCell(_ venue: Venues?){
        if let name = venue?.name_v2{
            headingLbl.text = name
        }
        if let address = venue?.extended_address{
            detailLbl.text = address
        }
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}
