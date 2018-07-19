//
//  CustomTableView.swift
//  ProjectCode
//
//  Created by CuongK on 7/19/18.
//  Copyright © 2018 CuongK. All rights reserved.
//

import Foundation
import UIKit

class CustomTableView: UIView {
    var products:[Product] = []
    private let headerId = "headerId"
    private let footerId = "footerId"
    private let cellId = "cellId"

    var ntdlCell:String = "ntdlCell"
    lazy var tableView: UITableView = {
        let tblView = UITableView()
        //        tblView.delegate = self
        //        tblView.dataSource = self
        tblView.translatesAutoresizingMaskIntoConstraints = false
        return tblView
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        tableView.frame = CGRect(x: 0, y: 0, width: self.frame.size.width, height: self.frame.size.height)
        tableView.backgroundColor = .clear
        tableView.register(UITableViewCell.self, forCellReuseIdentifier: ntdlCell)
        setupTableView()
        
    }
    func setupTableView() {
        
        addSubview(tableView)
        tableView.register(CustomTableCell.self, forCellReuseIdentifier: ViewController.cellId)
        tableView.topAnchor.constraint(equalTo: topAnchor).isActive = true
        tableView.bottomAnchor.constraint(equalTo: bottomAnchor).isActive = true
        tableView.leftAnchor.constraint(equalTo: leftAnchor).isActive = true
        tableView.rightAnchor.constraint(equalTo: rightAnchor).isActive = true
    }
    func setupDataTable() {
        let viewModel = ListViewModel(products: products)
        self.viewModel = viewModel
        viewModel.showProductList()
    }
    
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    var viewModel: ListViewModelProtocol! {
        didSet {
//            self.viewModel.productDidChange = { [unowned self] viewModel in
//                self.tableView.dataSource = self.viewModel.productListDataSource
//                self.tableView.reloadData()
//            }
            self.viewModel.productDidChange = { [unowned self] viewModel in
                self.tableView.dataSource = self.viewModel.productListDataSource
                self.tableView.delegate = self.viewModel.productListDelegate
                self.tableView.reloadData()
            }

        }
    }
    
    
    
//    //
//    // MARK :- CELL
//    //
//    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
//
//        return listStocks.count
//    }
//
//    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
//
//        return 80
//    }
//
//    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
//
//        let cell = tableView.dequeueReusableCell(withIdentifier: cellId, for: indexPath) as! CustomTableCell
//        if indexPath.row < listStocks.count{
//            //            let dic = listTopic[indexPath.row] as! NSDictionary
//            cell.stock = listStocks[indexPath.row]
//        }
//        return cell
//    }
    
}

