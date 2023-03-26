//
//  ListTableViewCell.swift
//  Sabores
//
//  Created by Carlos Israel Almaguer Rioja on 25/03/23.
//

import UIKit

class ListTableViewCell: UITableViewCell {

    @IBOutlet weak var ivList: UIImageView!
    
    @IBOutlet weak var labelTitulo: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}
