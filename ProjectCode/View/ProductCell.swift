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
//    var textLabel: UILabel!
//    var detailTextLabel: UILabel!
    var lbName: UILabel!
    var lbPrice: UILabel!
    var imgCell: UIImageView!

    override init(style: UITableViewCellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        lbName = UILabel.init(frame: CGRect(x: 0, y: 5, width: contentView.frame.size.width, height: 30))
        contentView.addSubview(lbName)
        lbPrice = UILabel.init(frame: CGRect(x: 0, y: lbName.frame.size.height + 5, width: contentView.frame.size.width, height: 30))
        contentView.addSubview(lbPrice)

    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    override func layoutSubviews() {
        lbName.frame =  CGRect(x: 0, y: 2, width: contentView.frame.size.width, height: contentView.frame.size.height/2)
        lbPrice.frame =  CGRect(x: 0, y: lbName.frame.size.height + 2, width: contentView.frame.size.width, height: contentView.frame.size.height/2)

    }
}
