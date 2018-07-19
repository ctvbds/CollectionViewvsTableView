//
//  ProductCell.swift
//  MVVCDemo
//
//  Created by CuongK on 7/16/18.
//  Copyright © 2018 CuongK. All rights reserved.
//

import Foundation
import UIKit

class ProductCell: UITableViewCell {
    var imgCell: UIImageView!

    var lb_order_number: UILabel!
    var lb_received_time: UILabel!
    var lb_staff_name: UILabel!
    var lb_number_of_guests: UILabel!
//    var array_Items: NSArray
    
    override init(style: UITableViewCellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        lb_staff_name = UILabel.init(frame: CGRect(x: 0, y: 5, width: contentView.frame.size.width, height: 30))
        contentView.addSubview(lb_staff_name)
        lb_received_time = UILabel.init(frame: CGRect(x: 0, y: lb_staff_name.frame.size.height + 5, width: contentView.frame.size.width, height: 30))
        contentView.addSubview(lb_received_time)
        lb_order_number = UILabel.init(frame: CGRect(x: 0, y: lb_staff_name.frame.size.height + 5, width: contentView.frame.size.width, height: 30))
        contentView.addSubview(lb_order_number)
        lb_number_of_guests = UILabel.init(frame: CGRect(x: 0, y: lb_staff_name.frame.size.height + 5, width: contentView.frame.size.width, height: 30))
        contentView.addSubview(lb_number_of_guests)

    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    override func layoutSubviews() {
        lb_staff_name.frame =  CGRect(x: 0, y: 2, width: contentView.frame.size.width, height: contentView.frame.size.height/2)
        lb_received_time.frame =  CGRect(x: 0, y: lb_staff_name.frame.size.height + 2, width: contentView.frame.size.width, height: contentView.frame.size.height/2)

    }
}
