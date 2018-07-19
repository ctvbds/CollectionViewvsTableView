//
//  CollectionVerticalView.swift
//  ProjectCode
//
//  Created by CuongK on 7/18/18.
//  Copyright © 2018 CuongK. All rights reserved.
//

import Foundation
import UIKit
class ViewController: UIViewController, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout{
    var tableView:UITableView!
    static var cellId = "cellID"
    var array: NSMutableArray! = nil
    var listTopic: NSMutableArray! = nil
    var scrollXpos: CGFloat = 0.0
    
    var collectionview: UICollectionView!
    var products:[Product] = []
    var customSC = UISegmentedControl()
    var cellView: CustomTableView?
    var cellCollection = "Cell"
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        array = NSMutableArray.init()
        listTopic = NSMutableArray.init()
        for i in 0...5 {
            let keys = ["quantity", "name", "notes"]
            let values = ["\(i)", "SP\(i)", "Good"]
            let dict = Dictionary(uniqueKeysWithValues: zip(keys, values))
            array.add(dict)
        }
      
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
            Product(order_number: "2", received_time: "21m", staff_name: "C1", number_of_guests: "3", array_Items: array),
            Product(order_number: "1", received_time: "20m", staff_name: "C2", number_of_guests: "5", array_Items: array),
            Product(order_number: "1", received_time: "20m", staff_name: "C3", number_of_guests: "5", array_Items: array),
            Product(order_number: "1", received_time: "20m", staff_name: "C4", number_of_guests: "5", array_Items: array),
            Product(order_number: "1", received_time: "20m", staff_name: "C5", number_of_guests: "5", array_Items: array)
            
        ]
        listTopic.add(products)
        products = [ // model
            Product(order_number: "2", received_time: "21m", staff_name: "D1", number_of_guests: "3", array_Items: array),
            Product(order_number: "1", received_time: "20m", staff_name: "D2", number_of_guests: "5", array_Items: array),
            Product(order_number: "1", received_time: "20m", staff_name: "D3", number_of_guests: "5", array_Items: array),
            Product(order_number: "1", received_time: "20m", staff_name: "D4", number_of_guests: "5", array_Items: array),
            Product(order_number: "1", received_time: "20m", staff_name: "D5", number_of_guests: "5", array_Items: array)
            
        ]
        listTopic.add(products)
        products = [ // model
            Product(order_number: "2", received_time: "21m", staff_name: "K1", number_of_guests: "3", array_Items: array),
            Product(order_number: "1", received_time: "20m", staff_name: "K2", number_of_guests: "5", array_Items: array),
            Product(order_number: "1", received_time: "20m", staff_name: "3", number_of_guests: "5", array_Items: array),
            Product(order_number: "1", received_time: "20m", staff_name: "K4", number_of_guests: "5", array_Items: array),
            Product(order_number: "1", received_time: "20m", staff_name: "K5", number_of_guests: "5", array_Items: array)
            
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
        customSC.backgroundColor = UIColor.white
        customSC.tintColor = ColorUtil.COLOR_BACKGROUD
        // Add target action method
        customSC.addTarget(self, action:#selector(changeColor), for: .valueChanged)
        // Add this custom Segmented Control to our view
        self.view.addSubview(customSC)
        
        
        var cellWidth: Double = 0
        var cellHeight: Double = 0
        
        if DeviceType.IS_IPAD_PRO || DeviceType.IS_IPAD {
            cellWidth = Double(self.view.frame.size.width) / Double(4)
            cellHeight = Double(self.view.frame.size.height) / Double(3)
        }else{
            cellWidth = Double(self.view.frame.size.width) / Double(3)
            cellHeight = Double(self.view.frame.size.height) / Double(3)
        }
        
        let layout = UICollectionViewFlowLayout()
        //        layout.sectionInset = UIEdgeInsets(top: 0, left: 0, bottom: 0, right: 0)
        //        layout.itemSize = CGSize(width: cellWidth, height: cellHeight)
        
        collectionview = UICollectionView(frame: self.view.frame, collectionViewLayout: layout)
        collectionview.dataSource = self
        collectionview.delegate = self
        collectionview.register(CustomCollectionViewCell.self, forCellWithReuseIdentifier: cellCollection)
        collectionview.showsVerticalScrollIndicator = false
        collectionview.backgroundColor = UIColor.white
        collectionview.showsVerticalScrollIndicator = false
        self.view.addSubview(collectionview)
        collectionview.frame = CGRect(x: 0, y: customSC.frame.origin.y + customSC.frame.size.height, width: self.view.frame.size.width, height: self.view.frame.size.height - (customSC.frame.origin.y + customSC.frame.size.height))
        
        
        let viewModel = ListViewModel(products: products)
        viewModel.showProductList()
        
        self.view.isUserInteractionEnabled = true
        //        let upGs = UISwipeGestureRecognizer(target: self, action: #selector(ViewController.handleSwipes(sender:)))
        //        let downGs = UISwipeGestureRecognizer(target: self, action: #selector(ViewController.handleSwipes(sender:)))
        //
        //        upGs.direction = .up
        //        downGs.direction = .down
        //
        //        collectionview.addGestureRecognizer(upGs)
        //        collectionview.addGestureRecognizer(downGs)
        // Do any additional setup after loading the view, typically from a nib.
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    override func viewWillTransition(to size: CGSize, with coordinator: UIViewControllerTransitionCoordinator) {
        super.viewWillTransition(to: size, with: coordinator)
        coordinator.animate(alongsideTransition: nil) { context in
            self.collectionview?.performBatchUpdates({
                if let aLayout = self.collectionview?.collectionViewLayout {
                    let frame = self.view.frame
                    self.customSC.frame = CGRect(x: frame.width/2 - frame.width/4, y: 25, width: frame.width/2, height: 44)
                    self.collectionview.frame = CGRect(x: 0, y: self.customSC.frame.origin.y + self.customSC.frame.size.height, width: self.view.frame.size.width, height: self.view.frame.size.height - (self.customSC.frame.origin.y + self.customSC.frame.size.height))
                    self.collectionview?.setCollectionViewLayout(aLayout, animated: true)
                    self.collectionview.reloadData()
                    self.collectionview.layoutIfNeeded()
                }
            })
        }
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
        let cell: CustomCollectionViewCell? = (collectionView.dequeueReusableCell(withReuseIdentifier: cellCollection, for: indexPath) as? CustomCollectionViewCell)
        for viewObject: UIView in (cell?.contentView.subviews)! {
            if (viewObject is UILabel) {
                viewObject.removeFromSuperview()
            }
        }
//        cell?.layer.borderWidth = 1.0
//        cell?.layer.borderColor = UIColor.gray.cgColor
        
        let padding: CGFloat =  50
        var collectionViewSizeWidth = collectionview.frame.size.width - 10
        var collectionViewSizeHeight = collectionview.frame.size.height - padding
        if DeviceType.IS_IPAD || DeviceType.IS_IPAD_PRO {
            collectionViewSizeWidth = collectionview.frame.size.width/2 - 10
            collectionViewSizeHeight = collectionview.frame.size.height - padding
        }
        for i in 0..<products.count {
            cell?.collectionScroll.contentSize = CGSize(width: CGFloat((i * Int(collectionViewSizeWidth)) + 170), height: CGFloat((collectionView.frame.size.height)))
        }
        for viewObject: UIView in (cell?.collectionScroll.subviews)! {
            viewObject.removeFromSuperview()
        }
        scrollXpos = 0.15*CGFloat(collectionViewSizeWidth)
        cell?.collectionScroll.frame = CGRect(x: 0, y: 20, width: collectionview.frame.size.width, height: collectionview.frame.size.height)
        for i in 0..<products.count {
            cellView = CustomTableView(frame: CGRect(x: CGFloat(scrollXpos), y: CGFloat(0), width: CGFloat(collectionViewSizeWidth/2-10), height: CGFloat(collectionViewSizeHeight)))
            scrollXpos += collectionViewSizeWidth/2
            cellView?.layer.borderWidth = 1.0
            cellView?.layer.borderColor = UIColor.gray.cgColor
            cellView?.products = listTopic[indexPath.row] as! [Product]
            cellView?.tableView.frame = CGRect(x: 0, y: 0, width: (cellView?.frame.size.width)!, height: (cellView?.frame.size.height)!)
            cellView?.tableView.backgroundColor = .red
            cellView?.backgroundColor = .yellow
            cellView?.setupDataTable()
            cell?.collectionScroll.addSubview(cellView!)
        }
        return cell!
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        
        
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        let padding: CGFloat =  50
        let collectionViewSize = collectionview.frame.size.width - 10
        let collectionViewSizeHeight = collectionview.frame.size.height - padding
        if DeviceType.IS_IPAD || DeviceType.IS_IPAD_PRO{
            return CGSize(width: collectionViewSize, height: collectionViewSizeHeight)
        }else{
            return CGSize(width: collectionViewSize, height: collectionViewSizeHeight)
        }
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


class CustomCollectionViewCell: UICollectionViewCell {
    var collectionScroll:UIScrollView!
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        addViews(frame: frame)
    }
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    func addViews(frame: CGRect){
        collectionScroll = UIScrollView()
        collectionScroll.frame = contentView.frame
        collectionScroll.backgroundColor = .clear
        addSubview(collectionScroll)
    }
    func setFrameScroll(frame: CGRect) {
        collectionScroll.frame = frame
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
    
}

