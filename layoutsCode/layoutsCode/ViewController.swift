//
//  ViewController.swift
//  layoutsCode
//
//  Created by Orient Technologies Mac on 7/9/18.
//  Copyright © 2018 Orient. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        
        let date = Date()
        let calendar = Calendar.current
        
        let year = calendar.component(.year, from: date)
        let month = calendar.component(.month, from: date)
        let day = calendar.component(.day, from: date)
        
        print(year)
        print(month)
        print(day)
        
        let date1 = Date()
        let formatter = DateFormatter()
        
        formatter.dateFormat = "dd.MM.yyyy"
       
        let result = formatter.string(from: date1)
        
        let str = self.getUTCFormateDate
        print(self.UTCToLocal(date: result))
        /*
        let labelOne: UILabel = {
            let label = UILabel()
            label.text = "Scroll Top of view in this side stay on this line please wait some time"
            label.lineBreakMode = .byWordWrapping
            label.numberOfLines = 0
            label.backgroundColor = .blue
            label.translatesAutoresizingMaskIntoConstraints = false
            return label
        }()
        
        let labelTwo: UILabel = {
            let label = UILabel()
            label.text = "Scroll Bottom to fit som text in ios label in Swift this is udai from ios"
            label.lineBreakMode = .byWordWrapping
            label.numberOfLines = 0
            label.backgroundColor = .green
            label.translatesAutoresizingMaskIntoConstraints = false
            return label
        }()
        
        let labelThree: UILabel = {
            let label = UILabel()
            label.text = "Scroll Top of view in this side stay on this line please wait some time"
            label.lineBreakMode = .byWordWrapping
            label.numberOfLines = 0
            label.backgroundColor = .blue
            label.translatesAutoresizingMaskIntoConstraints = false
            return label
        }()
        
        let labelFour: UILabel = {
            let label = UILabel()
            label.text = "labelFourin ios label in Swift this is udai from ios"
            label.lineBreakMode = .byWordWrapping
            label.numberOfLines = 0
            label.backgroundColor = .green
            label.translatesAutoresizingMaskIntoConstraints = false
            return label
        }()
        
        let spacerView: UIView = {
            let view = UIView()
            view.backgroundColor = .red
            view.translatesAutoresizingMaskIntoConstraints = false
            return view
        }()
        let myScroll: UIScrollView = {
            let scrollView = UIScrollView()
            scrollView.backgroundColor = .yellow
            scrollView.translatesAutoresizingMaskIntoConstraints = false
            return scrollView
        }()
        let screensize: CGRect = UIScreen.main.bounds
        let screenWidth = screensize.width
        let screenHeight = screensize.height
        
        
        view.addSubview(myScroll)
        // myScroll.contentSize = CGSize(width: 1000, height: 2000)
        
        
        let leading = NSLayoutConstraint(item: myScroll,
                                         attribute: .leading,
                                         relatedBy: .equal,
                                         toItem: self.view,
                                         attribute: .leading,
                                         multiplier: 1.0,
                                         constant: 0.0)
        let trailing = NSLayoutConstraint(item: myScroll,
                                          attribute: .trailing,
                                          relatedBy: .equal,
                                          toItem: self.view,
                                          attribute: .trailing,
                                          multiplier: 1.0,
                                          constant: 0.0)
        let top = NSLayoutConstraint(item: myScroll,
                                     attribute: .top,
                                     relatedBy: .equal,
                                     toItem: self.view,
                                     attribute: .top,
                                     multiplier: 1.0,
                                     constant: 0.0)
        let bottom = NSLayoutConstraint(item: myScroll,
                                        attribute: .bottom,
                                        relatedBy: .equal,
                                        toItem: self.view,
                                        attribute: .bottomMargin,
                                        multiplier: 1.0,
                                        constant: 0.0)
        NSLayoutConstraint.activate([leading, trailing, top, bottom])
        
         myScroll.addSubview(spacerView)
        // myScroll.contentSize = CGSize(width: 1000, height: 2000)
        //SpacerView
        NSLayoutConstraint(item: spacerView, attribute: .top, relatedBy: .equal, toItem: myScroll, attribute: .topMargin, multiplier: 1, constant: 10).isActive = true
        
        NSLayoutConstraint(item: spacerView, attribute: .width, relatedBy: .equal, toItem: nil, attribute: .notAnAttribute, multiplier: 1, constant: 10).isActive = true
        
        NSLayoutConstraint(item: spacerView, attribute: .height, relatedBy: .equal, toItem: nil, attribute: .notAnAttribute, multiplier: 1, constant: 300).isActive = true
        //NSLayoutConstraint(item: spacerView, attribute: .bottom, relatedBy: .equal, toItem: myScroll, attribute: .bottom, multiplier: 1, constant: 10).isActive = true
         NSLayoutConstraint(item: spacerView, attribute: .centerX, relatedBy: .equal, toItem: myScroll, attribute: .centerX, multiplier: 1, constant: 0.0).isActive = true
 

        
        //Label1
       
        myScroll.addSubview(labelTwo)
        NSLayoutConstraint(item: labelTwo, attribute: .leading, relatedBy: .equal, toItem: myScroll, attribute: .leading, multiplier: 1, constant: 10).isActive = true
         NSLayoutConstraint(item: labelTwo, attribute: .top, relatedBy: .equal, toItem: myScroll, attribute: .topMargin, multiplier: 1, constant: 5).isActive = true
         NSLayoutConstraint(item: labelTwo, attribute: .height, relatedBy: .greaterThanOrEqual, toItem: nil, attribute: .notAnAttribute, multiplier: 1, constant: 30).isActive = true
       NSLayoutConstraint(item: labelTwo, attribute: .trailing, relatedBy: .equal, toItem: spacerView, attribute: .leading, multiplier: 1, constant: 1.0).isActive = true
        
        
        //Label2
        
        myScroll.addSubview(labelOne)
        NSLayoutConstraint(item: labelOne, attribute: .leading, relatedBy: .equal, toItem: spacerView, attribute: .leading, multiplier: 1, constant: 10).isActive = true
         NSLayoutConstraint(item: labelOne, attribute: .trailing, relatedBy: .equal, toItem: self.view, attribute: .trailingMargin, multiplier: 1, constant: 0.0).isActive = true
        NSLayoutConstraint(item: labelOne, attribute: .top, relatedBy: .equal, toItem: myScroll, attribute: .topMargin, multiplier: 1, constant: 5).isActive = true
        NSLayoutConstraint(item: labelOne, attribute: .height, relatedBy: .greaterThanOrEqual, toItem: nil, attribute: .notAnAttribute, multiplier: 1, constant: 30).isActive = true
       
      //label3
        myScroll.addSubview(labelThree)
        NSLayoutConstraint(item: labelThree, attribute: .leading, relatedBy: .equal, toItem: myScroll, attribute: .leading, multiplier: 1, constant: 5).isActive = true
        NSLayoutConstraint(item: labelThree, attribute: .top, relatedBy: .equal, toItem: labelTwo, attribute: .bottom, multiplier: 1, constant: 5).isActive = true
       // NSLayoutConstraint(item: labelThree, attribute: .trailing, relatedBy: .lessThanOrEqual, toItem: spacerView, attribute: .trailing, multiplier: 1, constant: 5).isActive = true
        NSLayoutConstraint(item: labelThree, attribute: .height, relatedBy: .greaterThanOrEqual, toItem: nil, attribute: .notAnAttribute, multiplier: 1, constant: 30).isActive = true
        NSLayoutConstraint(item: labelThree, attribute: .trailing, relatedBy: .equal, toItem: spacerView, attribute: .leading, multiplier: 1, constant: 1.0).isActive = true
        // Do any additional setup after loading the view, typically from a nib.
        //label4
        
        myScroll.addSubview(labelFour)
        NSLayoutConstraint(item: labelFour, attribute: .leading, relatedBy: .equal, toItem: spacerView, attribute: .leading, multiplier: 1, constant: 10).isActive = true
        NSLayoutConstraint(item: labelFour, attribute: .trailing, relatedBy: .equal, toItem: self.view, attribute: .trailingMargin, multiplier: 1, constant: 5).isActive = true
       // NSLayoutConstraint(item: labelFour, attribute: .top, relatedBy: .equal, toItem: labelOne, attribute: .bottom, multiplier: 1, constant: 5).isActive = true
        NSLayoutConstraint(item: labelFour, attribute: .height, relatedBy: .greaterThanOrEqual, toItem: nil, attribute: .notAnAttribute, multiplier: 1, constant: 30).isActive = true
        NSLayoutConstraint(item: labelThree, attribute: .firstBaseline, relatedBy: .greaterThanOrEqual, toItem: labelFour, attribute: .firstBaseline, multiplier: 1, constant: 0.0).isActive = true
        NSLayoutConstraint(item: labelFour, attribute: .firstBaseline, relatedBy: .equal, toItem: labelThree, attribute: .firstBaseline, multiplier: 1, constant: 0.0).isActive = true
       
    */
 
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
  /*
    func localToUTC(date:String) -> String {
        
        let date = Date()
        let dateFormatter = DateFormatter()
        let dt = dateFormatter.date(from: date)
        dateFormatter.timeZone = TimeZone(abbreviation: "UTC")
        dateFormatter.dateFormat = "H:mm:ss"
        
        return dateFormatter.string(from:dt!)
    }
    */
    func UTCToLocal(date:String) -> String {
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "Z"
        dateFormatter.timeZone = TimeZone(abbreviation: "UTC")
        
        let dt = dateFormatter.date(from: date)
        dateFormatter.timeZone = TimeZone.current
        dateFormatter.dateFormat = "h:mm a"
        
        return "\(dt)"
    }
    
    func getUTCFormateDate() -> String {
        let utcTimestamp = Date().timeIntervalSince1970
        print("timeStamp = \(utcTimestamp)")
        return String(utcTimestamp)
    }
}

