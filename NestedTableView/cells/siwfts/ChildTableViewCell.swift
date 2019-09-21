//
//  ChildTableViewCell.swift
//  NestedTableView
//
//  Created by Htet Arkar Zaw on 9/15/19.
//  Copyright © 2019 Htet Arkar Zaw. All rights reserved.
//

import UIKit

class ChildTableViewCell: UITableViewCell {

    static let identifier = "ChildTableViewCell"
    @IBOutlet weak var ivProfile: UIImageView!
    @IBOutlet weak var lblStudentName: UILabel!
    @IBOutlet weak var lblGender: UILabel!
    
    var child: ChildVO? {
        didSet {
            if let child = child{
                lblStudentName.text = child.childName
                lblGender.text = child.gender
                if child.gender == "Male"{
                    ivProfile.image = UIImage(named: "img_boy")
                }else{
                    ivProfile.image = UIImage(named: "img_girl")
                }
            }
        }
    }
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        self.selectionStyle = .none
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}
