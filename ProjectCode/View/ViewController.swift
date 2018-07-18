//
//  ViewController.swift
//  MVVCDemo
//
//  Created by CuongK on 7/16/18.
//  Copyright © 2018 CuongK. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout{
    var tableView:UITableView!
    static var cellId = "cellID"
    var array: NSMutableArray! = nil
    var listTopic: NSMutableArray! = nil

    var collectionview: UICollectionView!
    var products:[Product] = []
    var customSC = UISegmentedControl()
    
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

        
        var cellWidth: Double = 0
        var cellHeight: Double = 0

        if DeviceType.IS_IPHONE {
            cellWidth = Double(self.view.frame.size.width) / Double(3)
            cellHeight = Double(self.view.frame.size.height) / Double(3)
        }else{
            cellWidth = Double(self.view.frame.size.width) / Double(4)
            cellHeight = Double(self.view.frame.size.height) / Double(3)
        }

        let layout = UICollectionViewFlowLayout()
//        layout.sectionInset = UIEdgeInsets(top: 0, left: 0, bottom: 0, right: 0)
//        layout.itemSize = CGSize(width: cellWidth, height: cellHeight)

        collectionview = UICollectionView(frame: self.view.frame, collectionViewLayout: layout)
        collectionview.dataSource = self
        collectionview.delegate = self
        collectionview.register(CollectionCell.self, forCellWithReuseIdentifier: ViewController.cellId)
        collectionview.showsVerticalScrollIndicator = false
        collectionview.backgroundColor = UIColor.lightGray
        collectionview.isScrollEnabled = false
        self.view.addSubview(collectionview)
        collectionview.frame = CGRect(x: 0, y: customSC.frame.origin.y + customSC.frame.size.height, width: self.view.frame.size.width, height: self.view.frame.size.height - 100)
        
        
        let viewModel = ListViewModel(products: products)
        viewModel.showProductList()
        let upGs = UISwipeGestureRecognizer(target: self, action: #selector(ViewController.handleSwipes(sender:)))
        let downGs = UISwipeGestureRecognizer(target: self, action: #selector(ViewController.handleSwipes(sender:)))
        
        upGs.direction = .up
        downGs.direction = .down
        
        collectionview.addGestureRecognizer(upGs)
        collectionview.addGestureRecognizer(downGs)
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
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
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {

        
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        let padding: CGFloat =  50
        let collectionViewSize = collectionView.frame.size.width - 10
        let collectionViewSizeHeight = collectionView.frame.size.height - padding
        return CGSize(width: collectionViewSize/2, height: collectionViewSizeHeight/2)
    }
    
    @objc func handleSwipes(sender:UISwipeGestureRecognizer) {
        
        if (sender.direction == .up) {
            print("Up")
        }
        
        if (sender.direction == .down) {
            print("Down")
        }
    }
}


extension ViewController: UIScrollViewDelegate {
    func scrollViewDidScroll(_ scrollView: UIScrollView) {
        if let _ = scrollView as? UICollectionView {
            if (scrollView.contentOffset.y >= (scrollView.contentSize.height - scrollView.frame.size.height)) {
                //reach bottom
//                print("reach bottom")

            }
            
            if (scrollView.contentOffset.y <= 0){
                //reach top
//                print("reach top")

            }
            
            if (scrollView.contentOffset.y > 0 && scrollView.contentOffset.y < (scrollView.contentSize.height - scrollView.frame.size.height)){
                //not top and not bottom
                print("not top and not bottom")

            }
            let scrollVelocity = scrollView.panGestureRecognizer.velocity(in: scrollView.superview)
            if (scrollVelocity.y > 0.0) {
                print("going down\(scrollVelocity.y)")
            } else if (scrollVelocity.y < 0.0) {
                print("going up\(scrollVelocity.y)")
            }

        }
    }
//
//    func scrollViewDidEndDecelerating(_ scrollView: UIScrollView) {
////        if let _ = scrollView as? UITableView {
////            print("tableview")
////            collectionview.isScrollEnabled = false
////
////        } else if let _ = scrollView as? UICollectionView {
////            print("collectionview")
////            collectionview.isScrollEnabled = true
////        }
//        print("text","\(self.collectionview.contentOffset.y)")
//        if (self.collectionview.contentOffset.y < 0) {
//            self.collectionview.isScrollEnabled = false;
//        } else {
//            self.collectionview.isScrollEnabled = true;
//        }
//    }
}

