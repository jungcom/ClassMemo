//
//  ClassTableViewCell.swift
//  ClassMemo
//
//  Created by Anthony Lee on 10/3/18.
//  Copyright © 2018 anthony. All rights reserved.
//

import UIKit

class ClassTableViewCell: UITableViewCell {
    
    @IBOutlet weak var classImageView: UIImageView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        if let classImageView = classImageView{
            classImageView.layer.cornerRadius = 25
        }
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
