//
//  ViewController.swift
//  StarRatingView
//
//  Created by Aaron Daub on 2016-06-03.
//  Copyright © 2016 Aaron Daub. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

  override func viewDidLoad() {
    super.viewDidLoad()
    // Do any additional setup after loading the view, typically from a nib.
    let starRatingView = StarRatingView(rating: 0.5, maximumRating: 5)
    starRatingView.translatesAutoresizingMaskIntoConstraints = false
    view.addSubview(starRatingView)
    
//    starRatingView.pinToHorizontalEdges()
    starRatingView.centerHorizontally()
    starRatingView.fixHeight(50)
    starRatingView.centerVertically()
  }

  override func didReceiveMemoryWarning() {
    super.didReceiveMemoryWarning()
    // Dispose of any resources that can be recreated.
  }


}

