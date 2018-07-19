//
//  ProductListViewModelProtocol.swift
//  MVVCDemo
//
//  Created by CuongK on 7/16/18.
//  Copyright © 2018 CuongK. All rights reserved.
//

import Foundation
import UIKit
//ViewModel chua datasource cho tableView cua View va ham hien thi danh sach product
protocol ListViewModelProtocol: class {
    var products:[Product] {get}
    var productListDataSource: ListDataSource!{get set}
    var productListDelegate: ListDelegate!{get set}

    var productDidChange: ((ListViewModelProtocol) -> ())? {get set}
    func showProductList()
    
}

class ListViewModel: ListViewModelProtocol {
    private(set) var  products: [Product] = []
    var productListDataSource: ListDataSource! {
        didSet {
            self.productDidChange?(self)
        }
    }
    var productListDelegate: ListDelegate! {
        didSet {
            self.productDidChange?(self)
        }
    }
    var productDidChange: ((ListViewModelProtocol) -> ())?
    required init(products: [Product] = []){ //    var products:[Product] = []

        self.products = products
    }
    func showProductList() {
        productListDataSource = ListDataSource(products: products)
        productListDelegate = ListDelegate(products: products)
    }
    
}
//datasource de dua du lieu vao data table
class ListDataSource: NSObject, UITableViewDataSource {
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: ViewController.cellId, for: indexPath) as! CustomTableCell
        if products.count>0 {
            let product = products[0]
            if product.array_Items.count>indexPath.row{
                let obj:NSDictionary = product.array_Items[indexPath.row] as! NSDictionary
                //        cell.lb?.text = product.staff_name
                //        cell.lbPrice?.text = String(product.order_number)
                
                cell.lb_name?.text = (obj["name"] as! String)// String(obj.key["name"])
                cell.lb_quantity?.text = (obj["quantity"] as! String)// String(obj.key["quantity"])
                cell.lb_notes?.text = (obj["notes"] as! String)//String(obj.key["notes"])
            }
        }
      
        
        return cell
    }
    var products:[Product] = []
    init(products: [Product] = []){
        self.products =  products
    }
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        return products.count
    }
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat{
        return 70
    }
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
}

//datasource de dua du lieu vao data table
class ListDelegate: NSObject, UITableViewDelegate {
    var products:[Product] = []
    init(products: [Product] = []){
        self.products =  products
    }

    //
    // MARK :- HEADER
    //
    var sizeHeader:CGFloat = 70
    
    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        
        return sizeHeader
    }
    
    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        
        let sectionHeaderView = CustomHeaderTableView()
        sectionHeaderView.frame = CGRect(x: 0, y: 0, width: tableView.frame.size.width, height: sizeHeader)
        sectionHeaderView.awakeFromNib()
        let product = products[section]
        sectionHeaderView.lb_staff_name?.text = product.staff_name
        sectionHeaderView.lb_order_number?.text = product.order_number
        sectionHeaderView.lb_received_time?.text = product.received_time
        sectionHeaderView.lb_number_of_guests?.text = product.number_of_guests
        return sectionHeaderView
    }
    
    //
    // MARK :- FOOTER
    
    var sizeFooter:CGFloat = 40
    
    func tableView(_ tableView: UITableView, heightForFooterInSection section: Int) -> CGFloat {
        
        return sizeFooter
    }
    
    func tableView(_ tableView: UITableView, viewForFooterInSection section: Int) -> UIView? {
        
        let viewForFooter = CustomFooterTableView()
        viewForFooter.frame = CGRect(x: 0, y: 0, width: tableView.frame.size.width, height: sizeFooter)
        viewForFooter.awakeFromNib()
        return viewForFooter
    }
    
}
