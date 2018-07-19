//
//  CustomTableCell.swift
//  ProjectCode
//
//  Created by CuongK on 7/19/18.
//  Copyright © 2018 CuongK. All rights reserved.
//

import Foundation
import UIKit

class CustomTableCell: UITableViewCell {
    var imgCell: UIImageView!
    
    var lb_name: UILabel!
    var lb_quantity: UILabel!
    var lb_notes: UILabel!
    
    override init(style: UITableViewCellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        lb_name = UILabel.init(frame: CGRect(x: 0, y: 5, width: contentView.frame.size.width, height: 30))
        contentView.addSubview(lb_name)
        lb_quantity = UILabel.init(frame: CGRect(x: 0, y: lb_name.frame.size.height + 5, width: contentView.frame.size.width, height: 30))
        contentView.addSubview(lb_quantity)
        lb_notes = UILabel.init(frame: CGRect(x: 0, y: lb_name.frame.size.height + 5, width: contentView.frame.size.width, height: 30))
        contentView.addSubview(lb_notes)
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    override func layoutSubviews() {
        lb_name.frame =  CGRect(x: 0, y: 2, width: contentView.frame.size.width, height: contentView.frame.size.height/3)
        lb_quantity.frame =  CGRect(x: 0, y:lb_name.frame.origin.y + lb_name.frame.size.height, width: contentView.frame.size.width, height: contentView.frame.size.height/3)
        lb_notes.frame =  CGRect(x: 0, y: lb_quantity.frame.origin.y + lb_quantity.frame.size.height, width: contentView.frame.size.width, height: contentView.frame.size.height/3)

    }
}
