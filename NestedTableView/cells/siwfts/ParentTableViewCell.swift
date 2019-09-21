//
//  ParentTableViewCell.swift
//  NestedTableView
//
//  Created by Htet Arkar Zaw on 9/15/19.
//  Copyright © 2019 Htet Arkar Zaw. All rights reserved.
//

import UIKit

class ParentTableViewCell: UITableViewCell {

    static let identifier = "ParentTableViewCell"
    @IBOutlet weak var lblParentName: UILabel!
    @IBOutlet weak var tvChildList: UITableView!
    
    var parent: ParentVO? {
        didSet{
            if let parent = parent {
                lblParentName.text = parent.parentName
            }
        }
    }
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        self.selectionStyle = .none
        tvChildList.dataSource = self
        tvChildList.delegate = self
        tvChildList.separatorStyle = .none
        tvChildList.registerForCell(strID: ChildTableViewCell.identifier)
        tvChildList.isScrollEnabled = false
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
        // Configure the view for the selected state
    }
    
}

extension ParentTableViewCell : UITableViewDataSource{
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return parent?.childs?.count ?? 0
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: ChildTableViewCell.identifier, for: indexPath) as! ChildTableViewCell
        cell.child = parent?.childs?[indexPath.row]
        return cell
    }
    
    
}

extension ParentTableViewCell : UITableViewDelegate{
    
}
