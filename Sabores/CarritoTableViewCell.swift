//
//  CarritoTableViewCell.swift
//  Sabores
//
//  Created by Carlos Israel Almaguer Rioja on 28/03/23.
//

import UIKit

class CarritoTableViewCell: UITableViewCell {
    
    @IBOutlet weak var ivCarrito: UIImageView!
    
    @IBOutlet weak var labelTituloCarrito: UILabel!
        
    @IBOutlet weak var labelPrecioCarrito: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}
