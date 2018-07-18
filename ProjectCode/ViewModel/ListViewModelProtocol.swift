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
    var products:[Product]{get}
    var productListDataSource: ListDataSource!{get set}
    var productDidChange: ((ListViewModelProtocol) -> ())? {get set}
    func showProductList()
    
}

class ListViewModel: ListViewModelProtocol {
    private(set) var  products: [Product]
    var productListDataSource: ListDataSource! {
        didSet {
            self.productDidChange?(self)
        }
    }
    var productDidChange: ((ListViewModelProtocol) -> ())?
    required init(products: [Product]){
        self.products = products
    }
    func showProductList() {
        productListDataSource = ListDataSource(products: products)
    }
    
}
//datasource de dua du lieu vao data table
class ListDataSource: NSObject, UITableViewDataSource {
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: ViewController.cellId, for: indexPath) as! ProductCell
        let product = products[indexPath.row]
        cell.lbName?.text = product.staff_name
        cell.lbPrice?.text = String(product.order_number)
        return cell
    }
    var products:[Product]
    init(products: [Product]){
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
