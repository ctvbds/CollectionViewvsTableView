//
//  CollectionHorizontalView.swift
//  ProjectCode
//
//  Created by CuongK on 7/18/18.
//  Copyright © 2018 CuongK. All rights reserved.
//

import Foundation
import UIKit


class CollectionHorizontalView: UIViewController,UICollectionViewDataSource,UICollectionViewDelegateFlowLayout {
    static var cellId = "cellID"
    var array: NSMutableArray! = nil
    var listTopic: NSMutableArray! = nil
    var collectionview: UICollectionView!
    var products:[Product] = []
    var customSC = UISegmentedControl()

    //CollectionView
    var scrollXpos: CGFloat = 0.0
    var myCollectionView: UICollectionView!
    var cellView: UIView?
    var lbName: UILabel?
    var lbLocation: UILabel?
    var lbHeader: UILabel?
    var lbMoney: UILabel?
    var cellImage: UIImageView?
    var button: UIButton?
    var viewCell: UIView?
    var frameView: CGRect?
    var items = [Any]()
    var itemIds = [Any]()
    var itemBookLabels = [Any]()
    var itemAuthorLabels = [Any]()
    var itemGenreLabels = [Any]()
    var itemImages = [Any]()
    
    var sectionHeaderTitles = [Any]()
    var sectionValueBookTitles = [Any]()
    var sectionValueAuthorTitles = [Any]()
    var sectionValueCoverImages = [Any]()
    var sectionValueBookIds = [Any]()
    var sectionValueAuthorIds = [Any]()
    var sectionValueAboutBooks = [Any]()
    var sectionValueGenreTitles = [Any]()
    var parsedData = [String:Any]()
    var dummyDic = [AnyHashable:Any]()
    var cellCollection = "Cell"

    override func viewDidLoad() {
        super.viewDidLoad()
        
        
        listTopic = NSMutableArray.init()
        
        let keys = ["quantity", "name", "notes"]
        let values = ["1", "SP4", "Good"]
        
        let dict = Dictionary(uniqueKeysWithValues: zip(keys, values))
        array = NSMutableArray.init(object: dict)
        products = [ // model
            Product(order_number: "2", received_time: "21m", staff_name: "SP1", number_of_guests: "3", array_Items: array),
            Product(order_number: "1", received_time: "20m", staff_name: "SP2", number_of_guests: "5", array_Items: array),
            Product(order_number: "1", received_time: "20m", staff_name: "SP3", number_of_guests: "5", array_Items: array),
            Product(order_number: "1", received_time: "20m", staff_name: "SP4", number_of_guests: "5", array_Items: array),
            Product(order_number: "1", received_time: "20m", staff_name: "SP5", number_of_guests: "5", array_Items: array)
            
        ]
        listTopic.add(products)
        products = [ // model
            Product(order_number: "2", received_time: "21m", staff_name: "T1", number_of_guests: "3", array_Items: array),
            Product(order_number: "1", received_time: "20m", staff_name: "T1", number_of_guests: "5", array_Items: array),
            Product(order_number: "1", received_time: "20m", staff_name: "T1", number_of_guests: "5", array_Items: array),
            Product(order_number: "1", received_time: "20m", staff_name: "T1", number_of_guests: "5", array_Items: array),
            Product(order_number: "1", received_time: "20m", staff_name: "T1", number_of_guests: "5", array_Items: array)
            
        ]
        listTopic.add(products)
        products = [ // model
            Product(order_number: "2", received_time: "21m", staff_name: "SP1", number_of_guests: "3", array_Items: array),
            Product(order_number: "1", received_time: "20m", staff_name: "SP2", number_of_guests: "5", array_Items: array),
            Product(order_number: "1", received_time: "20m", staff_name: "SP3", number_of_guests: "5", array_Items: array),
            Product(order_number: "1", received_time: "20m", staff_name: "SP4", number_of_guests: "5", array_Items: array),
            Product(order_number: "1", received_time: "20m", staff_name: "SP5", number_of_guests: "5", array_Items: array)
            
        ]
        listTopic.add(products)
        products = [ // model
            Product(order_number: "2", received_time: "21m", staff_name: "T1", number_of_guests: "3", array_Items: array),
            Product(order_number: "1", received_time: "20m", staff_name: "T1", number_of_guests: "5", array_Items: array),
            Product(order_number: "1", received_time: "20m", staff_name: "T1", number_of_guests: "5", array_Items: array),
            Product(order_number: "1", received_time: "20m", staff_name: "T1", number_of_guests: "5", array_Items: array),
            Product(order_number: "1", received_time: "20m", staff_name: "T1", number_of_guests: "5", array_Items: array)
            
        ]
        listTopic.add(products)
        products = [ // model
            Product(order_number: "2", received_time: "21m", staff_name: "SP1", number_of_guests: "3", array_Items: array),
            Product(order_number: "1", received_time: "20m", staff_name: "SP2", number_of_guests: "5", array_Items: array),
            Product(order_number: "1", received_time: "20m", staff_name: "SP3", number_of_guests: "5", array_Items: array),
            Product(order_number: "1", received_time: "20m", staff_name: "SP4", number_of_guests: "5", array_Items: array),
            Product(order_number: "1", received_time: "20m", staff_name: "SP5", number_of_guests: "5", array_Items: array)
            
        ]
        listTopic.add(products)
        let items = ["Purple", "Green"]
        customSC = UISegmentedControl(items: items)
        customSC.selectedSegmentIndex = 0
        
        // Set up Frame and SegmentedControl
        let frame = self.view.frame
        customSC.frame = CGRect(x: frame.width/2 - frame.width/4, y: 25, width: frame.width/2, height: 44)
        
        // Style the Segmented Control
        customSC.layer.cornerRadius = 5.0  // Don't let background bleed
        customSC.backgroundColor = UIColor.clear
        customSC.tintColor = UIColor.blue
        // Add target action method
        customSC.addTarget(self, action:#selector(changeColor), for: .valueChanged)
        // Add this custom Segmented Control to our view
        self.view.addSubview(customSC)

        
        let layout = UICollectionViewFlowLayout()
        layout.itemSize = CGSize(width: 100, height: 100)
        myCollectionView = UICollectionView(frame: self.view.frame, collectionViewLayout: layout)
        myCollectionView.dataSource = self
        myCollectionView.delegate = self
        collectionview.register(CollectionCell.self, forCellWithReuseIdentifier: ViewController.cellId)
        myCollectionView.showsVerticalScrollIndicator = false
        myCollectionView.backgroundColor = UIColor.white
        self.view.addSubview(myCollectionView)
        myCollectionView.frame = CGRect(x: 0, y: customSC.frame.origin.y + customSC.frame.size.height, width: self.view.frame.size.width, height: self.view.frame.size.height - 100)

        
        let viewModel = ListViewModel(products: products)
        viewModel.showProductList()
        
     
    }
    @objc func changeColor(sender: UISegmentedControl) {
        switch sender.selectedSegmentIndex {
        case 0:
            self.view.backgroundColor = UIColor.green
        case 1:
            self.view.backgroundColor = UIColor.orange
        default:
            self.view.backgroundColor = UIColor.purple
        }
    }

   
    
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        return 1
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return listTopic.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: ViewController.cellId, for: indexPath as IndexPath) as? CollectionCell
        cell?.products = listTopic[indexPath.row] as! [Product]
        cell?.setupData()
        return cell!
    }
    
    @objc func buttonAction(sender: UIButton!) {
        print("Button tapped \(sender.tag)")
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        let retval = CGSize(width: CGFloat(self.view.frame.size.width - 10), height: CGFloat(180))
        return retval
    }
    
}


