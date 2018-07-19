//
//  CollectionVerticalView.swift
//  ProjectCode
//
//  Created by CuongK on 7/18/18.
//  Copyright © 2018 CuongK. All rights reserved.
//

import Foundation
import UIKit
//class CollectionVerticalView: UIViewController, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout{
//    var tableView:UITableView!
//    static var cellId = "cellID"
//    var array: NSMutableArray! = nil
//    var listTopic: NSMutableArray! = nil
//    var scrollXpos: CGFloat = 0.0
//
//    var collectionview: UICollectionView!
//    var products:[Product]
//    var customSC = UISegmentedControl()
//    var cellView: UIView?
//    var cellCollection = "Cell"
//
//    override func viewDidLoad() {
//        super.viewDidLoad()
//
//
//        listTopic = NSMutableArray.init()
//
//        let keys = ["quantity", "name", "notes"]
//        let values = ["1", "SP4", "Good"]
//
//        let dict = Dictionary(uniqueKeysWithValues: zip(keys, values))
//        array = NSMutableArray.init(object: dict)
//        products = [ // model
//            Product(order_number: "2", received_time: "21m", staff_name: "SP1", number_of_guests: "3", array_Items: array),
//            Product(order_number: "1", received_time: "20m", staff_name: "SP2", number_of_guests: "5", array_Items: array),
//            Product(order_number: "1", received_time: "20m", staff_name: "SP3", number_of_guests: "5", array_Items: array),
//            Product(order_number: "1", received_time: "20m", staff_name: "SP4", number_of_guests: "5", array_Items: array),
//            Product(order_number: "1", received_time: "20m", staff_name: "SP5", number_of_guests: "5", array_Items: array)
//
//        ]
//        listTopic.add(products)
//        products = [ // model
//            Product(order_number: "2", received_time: "21m", staff_name: "T1", number_of_guests: "3", array_Items: array),
//            Product(order_number: "1", received_time: "20m", staff_name: "T1", number_of_guests: "5", array_Items: array),
//            Product(order_number: "1", received_time: "20m", staff_name: "T1", number_of_guests: "5", array_Items: array),
//            Product(order_number: "1", received_time: "20m", staff_name: "T1", number_of_guests: "5", array_Items: array),
//            Product(order_number: "1", received_time: "20m", staff_name: "T1", number_of_guests: "5", array_Items: array)
//
//        ]
//        listTopic.add(products)
//        products = [ // model
//            Product(order_number: "2", received_time: "21m", staff_name: "SP1", number_of_guests: "3", array_Items: array),
//            Product(order_number: "1", received_time: "20m", staff_name: "SP2", number_of_guests: "5", array_Items: array),
//            Product(order_number: "1", received_time: "20m", staff_name: "SP3", number_of_guests: "5", array_Items: array),
//            Product(order_number: "1", received_time: "20m", staff_name: "SP4", number_of_guests: "5", array_Items: array),
//            Product(order_number: "1", received_time: "20m", staff_name: "SP5", number_of_guests: "5", array_Items: array)
//
//        ]
//        listTopic.add(products)
//        products = [ // model
//            Product(order_number: "2", received_time: "21m", staff_name: "T1", number_of_guests: "3", array_Items: array),
//            Product(order_number: "1", received_time: "20m", staff_name: "T1", number_of_guests: "5", array_Items: array),
//            Product(order_number: "1", received_time: "20m", staff_name: "T1", number_of_guests: "5", array_Items: array),
//            Product(order_number: "1", received_time: "20m", staff_name: "T1", number_of_guests: "5", array_Items: array),
//            Product(order_number: "1", received_time: "20m", staff_name: "T1", number_of_guests: "5", array_Items: array)
//
//        ]
//        listTopic.add(products)
//        products = [ // model
//            Product(order_number: "2", received_time: "21m", staff_name: "SP1", number_of_guests: "3", array_Items: array),
//            Product(order_number: "1", received_time: "20m", staff_name: "SP2", number_of_guests: "5", array_Items: array),
//            Product(order_number: "1", received_time: "20m", staff_name: "SP3", number_of_guests: "5", array_Items: array),
//            Product(order_number: "1", received_time: "20m", staff_name: "SP4", number_of_guests: "5", array_Items: array),
//            Product(order_number: "1", received_time: "20m", staff_name: "SP5", number_of_guests: "5", array_Items: array)
//
//        ]
//        listTopic.add(products)
//        let items = ["Purple", "Green"]
//        customSC = UISegmentedControl(items: items)
//        customSC.selectedSegmentIndex = 0
//
//        // Set up Frame and SegmentedControl
//        let frame = self.view.frame
//        customSC.frame = CGRect(x: frame.width/2 - frame.width/4, y: 25, width: frame.width/2, height: 44)
//
//        // Style the Segmented Control
//        customSC.layer.cornerRadius = 5.0  // Don't let background bleed
//        customSC.backgroundColor = UIColor.clear
//        customSC.tintColor = UIColor.blue
//        // Add target action method
//        customSC.addTarget(self, action:#selector(changeColor), for: .valueChanged)
//        // Add this custom Segmented Control to our view
//        self.view.addSubview(customSC)
//
//
//        var cellWidth: Double = 0
//        var cellHeight: Double = 0
//
//        if DeviceType.IS_IPAD_PRO || DeviceType.IS_IPAD {
//            cellWidth = Double(self.view.frame.size.width) / Double(4)
//            cellHeight = Double(self.view.frame.size.height) / Double(3)
//        }else{
//            cellWidth = Double(self.view.frame.size.width) / Double(3)
//            cellHeight = Double(self.view.frame.size.height) / Double(3)
//        }
//
//        let layout = UICollectionViewFlowLayout()
//        //        layout.sectionInset = UIEdgeInsets(top: 0, left: 0, bottom: 0, right: 0)
//        //        layout.itemSize = CGSize(width: cellWidth, height: cellHeight)
//
//        collectionview = UICollectionView(frame: self.view.frame, collectionViewLayout: layout)
//        collectionview.dataSource = self
//        collectionview.delegate = self
//        collectionview.register(CollectionCell.self, forCellWithReuseIdentifier: ViewController.cellId)
//        collectionview.showsVerticalScrollIndicator = false
//        collectionview.backgroundColor = UIColor.lightGray
//        //        collectionview.isScrollEnabled = false
//        self.view.addSubview(collectionview)
//        collectionview.frame = CGRect(x: 0, y: customSC.frame.origin.y + customSC.frame.size.height, width: self.view.frame.size.width, height: self.view.frame.size.height - 100)
//
//
//        let viewModel = ListViewModel(products: products)
//        viewModel.showProductList()
//
//        self.view.isUserInteractionEnabled = true
//        //        let upGs = UISwipeGestureRecognizer(target: self, action: #selector(ViewController.handleSwipes(sender:)))
//        //        let downGs = UISwipeGestureRecognizer(target: self, action: #selector(ViewController.handleSwipes(sender:)))
//        //
//        //        upGs.direction = .up
//        //        downGs.direction = .down
//        //
//        //        collectionview.addGestureRecognizer(upGs)
//        //        collectionview.addGestureRecognizer(downGs)
//        // Do any additional setup after loading the view, typically from a nib.
//    }
//
//    override func didReceiveMemoryWarning() {
//        super.didReceiveMemoryWarning()
//        // Dispose of any resources that can be recreated.
//    }
//
//    @objc func changeColor(sender: UISegmentedControl) {
//        switch sender.selectedSegmentIndex {
//        case 0:
//            self.view.backgroundColor = UIColor.green
//        case 1:
//            self.view.backgroundColor = UIColor.orange
//        default:
//            self.view.backgroundColor = UIColor.purple
//        }
//    }
//
//
//    func numberOfSections(in collectionView: UICollectionView) -> Int {
//        return 1
//    }
//
//    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
//        return listTopic.count
//    }
//
//
//    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
//        let cell: CustomCollectionViewCell? = (collectionView.dequeueReusableCell(withReuseIdentifier: cellCollection, for: indexPath) as? CustomCollectionViewCell)
//        for viewObject: UIView in (cell?.contentView.subviews)! {
//            if (viewObject is UILabel) {
//                viewObject.removeFromSuperview()
//            }
//        }
//
//        //        lbHeader?.backgroundColor = .red
//        cell?.collectionScroll.contentSize = CGSize(width: CGFloat(((listTopic[indexPath.section] as AnyObject).count * 100) + 170), height: CGFloat((cell?.frame.size.height)!))
//        for viewObject: UIView in (cell?.collectionScroll.subviews)! {
//            viewObject.removeFromSuperview()
//        }
//        scrollXpos = 0.15*CGFloat(self.view.frame.size.width)
//        for i in 0..<(listTopic[indexPath.section] as AnyObject).count {
//            cellView = UIView(frame: CGRect(x: CGFloat(scrollXpos), y: CGFloat(0), width: CGFloat(120), height: CGFloat(180)))
//            scrollXpos += 110
//            cell?.collectionScroll.addSubview(cellView!)
//        }
//        return cell!
//    }
//
//    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
//
//
//    }
//
//    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
//        let padding: CGFloat =  50
//        let collectionViewSize = collectionView.frame.size.width - 10
//        let collectionViewSizeHeight = collectionView.frame.size.height - padding
//        if DeviceType.IS_IPAD || DeviceType.IS_IPAD_PRO{
//            return CGSize(width: collectionViewSize/4, height: collectionViewSizeHeight/4)
//        }else{
//            return CGSize(width: collectionViewSize/2, height: collectionViewSizeHeight/2)
//        }
//    }
//
//    @objc func handleSwipes(sender:UISwipeGestureRecognizer) {
//
//        if (sender.direction == .up) {
//            print("Up")
//        }
//
//        if (sender.direction == .down) {
//            print("Down")
//        }
//    }
//
//}
//
//
//class CustomCollectionViewCell: UICollectionViewCell {
//    var collectionScroll:UIScrollView!
//
//    override init(frame: CGRect) {
//        super.init(frame: frame)
//        addViews(frame: frame)
//    }
//    required init?(coder aDecoder: NSCoder) {
//        fatalError("init(coder:) has not been implemented")
//    }
//    func addViews(frame: CGRect){
//        collectionScroll = UIScrollView()
//        collectionScroll.frame = contentView.frame
//        addSubview(collectionScroll)
//
//    }
//}
//
//extension ViewController: UIScrollViewDelegate {
//    func scrollViewDidScroll(_ scrollView: UIScrollView) {
//        if let _ = scrollView as? UICollectionView {
//            if (scrollView.contentOffset.y >= (scrollView.contentSize.height - scrollView.frame.size.height)) {
//                //reach bottom
//                //                print("reach bottom")
//
//            }
//
//            if (scrollView.contentOffset.y <= 0){
//                //reach top
//                //                print("reach top")
//
//            }
//
//            if (scrollView.contentOffset.y > 0 && scrollView.contentOffset.y < (scrollView.contentSize.height - scrollView.frame.size.height)){
//                //not top and not bottom
//                print("not top and not bottom")
//
//            }
//            let scrollVelocity = scrollView.panGestureRecognizer.velocity(in: scrollView.superview)
//            if (scrollVelocity.y > 0.0) {
//                print("going down\(scrollVelocity.y)")
//            } else if (scrollVelocity.y < 0.0) {
//                print("going up\(scrollVelocity.y)")
//            }
//
//        }
//    }
//
//}

