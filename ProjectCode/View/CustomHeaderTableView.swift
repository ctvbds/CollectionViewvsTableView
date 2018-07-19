//
//  CustomHeaderTableView.swift
//  ProjectCode
//
//  Created by CuongK on 7/19/18.
//  Copyright © 2018 CuongK. All rights reserved.
//

import Foundation
import UIKit

class CustomHeaderTableView: UITableViewHeaderFooterView {
    var imgCell: UIImageView!
    
    var lb_order_number: UILabel!
    var lb_received_time: UILabel!
    var lb_staff_name: UILabel!
    var lb_number_of_guests: UILabel!

    
    override init(reuseIdentifier: String?) {
        super.init(reuseIdentifier: reuseIdentifier)
        lb_staff_name = UILabel.init(frame: CGRect(x: 0, y: 5, width: contentView.frame.size.width, height: 30))
        lb_staff_name.font = UIFont.boldSystemFont(ofSize: 15)
        lb_staff_name.textColor = ColorUtil.COLOR_TITLE
        contentView.addSubview(lb_staff_name)
        lb_received_time = UILabel.init(frame: CGRect(x: 0, y: lb_staff_name.frame.size.height + 5, width: contentView.frame.size.width, height: 30))
        lb_received_time.font = UIFont.boldSystemFont(ofSize: 15)
        lb_received_time.textColor = ColorUtil.COLOR_TITLE

        contentView.addSubview(lb_received_time)
        lb_order_number = UILabel.init(frame: CGRect(x: 0, y: lb_staff_name.frame.size.height + 5, width: contentView.frame.size.width, height: 30))
        lb_order_number.font = UIFont.systemFont(ofSize: 15)
        lb_order_number.textColor = ColorUtil.COLOR_CONTENT
        contentView.addSubview(lb_order_number)
        lb_number_of_guests = UILabel.init(frame: CGRect(x: 0, y: lb_staff_name.frame.size.height + 5, width: contentView.frame.size.width, height: 30))
        lb_number_of_guests.font = UIFont.systemFont(ofSize: 15)
        lb_number_of_guests.textColor = ColorUtil.COLOR_CONTENT
        contentView.addSubview(lb_number_of_guests)
    }
    
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
        lb_staff_name.frame =  CGRect(x: 0, y: 2, width: contentView.frame.size.width/2, height: contentView.frame.size.height/2)
        lb_order_number.frame =  CGRect(x: lb_staff_name.frame.origin.x, y: lb_staff_name.frame.origin.y + lb_staff_name.frame.size.height, width: contentView.frame.size.width/2, height: contentView.frame.size.height/2)

        lb_received_time.frame =  CGRect(x: contentView.frame.size.width/2, y: lb_staff_name.frame.origin.y, width: contentView.frame.size.width/2, height: contentView.frame.size.height/2)
        lb_number_of_guests.frame =  CGRect(x: lb_received_time.frame.origin.x, y: lb_received_time.frame.origin.y + lb_received_time.frame.size.height, width: contentView.frame.size.width/2, height: contentView.frame.size.height/2)
        
    }
    
}
