//
//  TableViewCell.swift
//  ServerJson_02
//
//  Created by TJ on 2022/06/19.
//

import UIKit

class TableViewCell: UITableViewCell {

    
    @IBOutlet weak var imageView22: UIImageView!
    
    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var codeLabel: UILabel!
    @IBOutlet weak var lblDept: UILabel!
    @IBOutlet weak var lblPhone: UILabel!
    
  
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
//        imageView22.image = UIImage(named: imageName)
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
