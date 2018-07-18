//
//  CollectionView.swift
//  ProjectCode
//
//  Created by CuongK on 7/18/18.
//  Copyright © 2018 CuongK. All rights reserved.
//

import Foundation
import UIKit

class CollectionCell: UICollectionViewCell {
    var products:[Product] = []
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
        backgroundColor = UIColor.orange
        
        tableView.register(UITableViewCell.self, forCellReuseIdentifier: ntdlCell)
        setupTableView()
        
    }
    func setupTableView() {
        
        addSubview(tableView)
        tableView.register(ProductCell.self, forCellReuseIdentifier: ViewController.cellId)
        tableView.topAnchor.constraint(equalTo: topAnchor).isActive = true
        tableView.bottomAnchor.constraint(equalTo: bottomAnchor).isActive = true
        tableView.leftAnchor.constraint(equalTo: leftAnchor).isActive = true
        tableView.rightAnchor.constraint(equalTo: rightAnchor).isActive = true
        
        let viewModel = ListViewModel(products: products)
        self.viewModel = viewModel
        viewModel.showProductList()

    }
    func setupData() {
        let viewModel = ListViewModel(products: products)
        self.viewModel = viewModel
        viewModel.showProductList()
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    var viewModel: ListViewModelProtocol! {
        didSet {
            self.viewModel.productDidChange = { [unowned self] viewModel in
                self.tableView.dataSource = self.viewModel.productListDataSource
                self.tableView.reloadData()
            }
        }
    }

}

//
//
//extension CollectionCell: UITableViewDelegate, UITableViewDataSource {
//    func numberOfSections(in tableView: UITableView) -> Int {
//        return ntdlArray.count
//    }
//
//    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
//        return 1
//    }
//    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> ProductCell {
//        let cell = tableView.dequeueReusableCell(withIdentifier: ntdlCell, for: indexPath) as! ProductCell
//
//        cell.textLabel?.text = ntdlArray[indexPath.item]
//
//        return cell
//    }
//
//    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
//        return 50
//    }
//}
