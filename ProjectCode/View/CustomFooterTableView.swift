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
    var btnOrder: CustomButton!
    
    override init(reuseIdentifier: String?) {
        super.init(reuseIdentifier: reuseIdentifier)
        btnOrder = CustomButton(frame: .zero)
        //let button = CustomButton() // also works
        btnOrder.setTitle("Order", for: .normal)
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
import UIKit

class CustomButton: UIButton {
    
    var myValue: Int
    
    override init(frame: CGRect) {
        // set myValue before super.init is called
        self.myValue = 0
        super.init(frame: frame)
        // set other operations after super.init, if required
        backgroundColor = ColorUtil.COLOR_BACKGROUD
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}

