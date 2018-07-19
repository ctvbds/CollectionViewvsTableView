//
//  CustomFooterTableView.swift
//  ProjectCode
//
//  Created by CuongK on 7/19/18.
//  Copyright © 2018 CuongK. All rights reserved.
//

import Foundation
import UIKit

class CustomFooterTableView: UITableViewHeaderFooterView {
    var btnOrder: UIButton!
    
    override init(reuseIdentifier: String?) {
        super.init(reuseIdentifier: reuseIdentifier)
        btnOrder = UIButton(frame: .zero)
        //let button = CustomButton() // also works
        btnOrder.setTitle("Order", for: .normal)
        btnOrder.backgroundColor = ColorUtil.COLOR_BACKGROUD

        // auto layout
        btnOrder.translatesAutoresizingMaskIntoConstraints = false
        btnOrder.addTarget(self, action:#selector(actionButton), for: .touchUpInside)
        contentView.addSubview(btnOrder)
        btnOrder.centerXAnchor.constraint(equalTo: contentView.centerXAnchor).isActive = true
        btnOrder.centerYAnchor.constraint(equalTo: contentView.centerYAnchor).isActive = true
    }
    
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
        btnOrder.frame =  CGRect(x: 5, y: 2, width: contentView.frame.size.width - 5, height: contentView.frame.size.height - 2)
        
    }
    
    
    @objc func actionButton(sender: UIButton) {
       print("action button")
    }
}


