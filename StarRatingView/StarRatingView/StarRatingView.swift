//
//  StarRatingView.swift
//  StarRatingView
//
//  Created by Aaron Daub on 2016-06-03.
//  Copyright © 2016 Aaron Daub. All rights reserved.
//

import UIKit

public protocol StarRatingViewDelegate: class {
  func starRatingView(starRatingView: StarRatingView, didChangeRating: Float)
}

@objc(OriginateStarRatingView)
public final class StarRatingView: UIView {
  public var rating: Float {
    didSet(oldValue) {
      renderRating()
      delegate?.starRatingView(self, didChangeRating: rating)
    }
  }
  
  public var axis: UILayoutConstraintAxis = .Horizontal {
    didSet(oldValue) {
      requiresRender = true
    }
  }
  
  public var maximumRating: UInt { // minimum is 1
    didSet(oldValue) {
      // TODO: properly scale rating if `scaleRatingWithMaximum` is true
      if scaleRatingWithMaximum {
        let oldNormalizedValue = rating / Float(oldValue)
        let scaledRating = oldNormalizedValue * Float(maximumRating)
        rating = scaledRating
      } else {
        rating = min(rating, Float(maximumRating))
      }
      requiresRender = true
    }
  }
  
  public var interitemSpacing: CGFloat = 5 {
    didSet(oldValue) {
      requiresRender = true
    }
  }
  
  public weak var delegate: StarRatingViewDelegate?
  
  public var scaleRatingWithMaximum: Bool = false
  
  public var unratedImage: UIImage
  public var ratedImage: UIImage
  
  private var ratingViews: [UIButton] = []
  
  // view needs to be rendered again
  private var requiresRender: Bool = false {
    didSet(oldValue) {
      if !oldValue && requiresRender {
        setNeedsUpdateConstraints()
      }
    }
  }
  
  // MAYBE take out all colour from the rated image to use as unrated iff unrated image is nil
  init(rating: Float,
       maximumRating: UInt = 5,
       unratedImage: UIImage = UIImage(named: "empty-star-image")!,
       ratedImage: UIImage = UIImage(named: "star-image")!) {
    (self.rating, self.maximumRating, self.unratedImage, self.ratedImage) = (rating, maximumRating, unratedImage, ratedImage)
    super.init(frame: CGRectZero)
    requiresRender = true
  }
  
  @objc private func ratingButtonPressed(sender: UIButton) {
    let proposedRating = Float(sender.tag) + 1
    if proposedRating == floorf(rating) {
      let alreadyFractional = (rating - floorf(rating)) > 0
      if !alreadyFractional {
        rating = proposedRating - 0.5
        return
      }
    }
    rating = proposedRating
  }
  
  required public init?(coder aDecoder: NSCoder) {
    guard let unratedImage = UIImage(named: "empty-star-image"),
          let ratedImage = UIImage(named: "star-image") else { return nil }
    (self.rating, self.maximumRating, self.unratedImage, self.ratedImage) = (1, 5, unratedImage, ratedImage)
    super.init(coder: aDecoder)
    requiresRender = true
  }
  
  public override func updateConstraints() {
    super.updateConstraints()
    guard requiresRender else { return }
    requiresRender = false
    
    for view in subviews {
      view.removeFromSuperview()
    }
    
    buildViewHierarchy()
    renderRating()
  }

  private func renderRating() {
    var leftOverRating = rating
    for i in 0..<ratingViews.count {
      let ratingView = ratingViews[i]
      let isRated = leftOverRating >= 1
      let fractionalRating = leftOverRating - floorf(leftOverRating)
      let isFractionalRated = !isRated && fractionalRating > 0
      
      let image: UIImage
      if isRated {
        image = ratedImage
      } else if isFractionalRated {
        image = ratedImage.fractionalImage(CGFloat(fractionalRating), axis: axis)!.placeAboveImage(unratedImage)
      } else {
        image = unratedImage
      }
      
      ratingView.setImage(image, forState: .Normal)
      if isRated {
        leftOverRating -= 1
      }
      
      if isFractionalRated {
        leftOverRating = 0
      }
    }
  }
  
  private func buildViewHierarchy() {
    let (primarySizeAttribute, secondarySizeAttribute): (NSLayoutAttribute, NSLayoutAttribute) = (axis == .Horizontal) ? (.Width, .Height) : (.Height, .Width)
    let centeringAttribute: NSLayoutAttribute = (axis == .Horizontal) ? .CenterY : .CenterX
    
    ratingViews = (0..<maximumRating).map { i in
      let button = UIButton(type: .Custom)
      button.tag = Int(i)
      button.contentMode = .ScaleAspectFit
      button.translatesAutoresizingMaskIntoConstraints = false
      button.addTarget(self, action: #selector(StarRatingView.ratingButtonPressed(_:)), forControlEvents: .TouchUpInside)
      self.addSubview(button)
      return button
    }
    
    for ratingView in ratingViews {
      let primaryDimensionConstraint = NSLayoutConstraint(item: ratingView,
                                                          attribute: primarySizeAttribute,
                                                          relatedBy: .Equal,
                                                          toItem: self,
                                                          attribute: secondarySizeAttribute,
                                                          multiplier: 1,
                                                          constant: 0)
      
      let secondaryDimensionConstraint = NSLayoutConstraint(item: ratingView,
                                                           attribute: .Width,
                                                           relatedBy: .Equal,
                                                           toItem: ratingView,
                                                           attribute: .Height,
                                                           multiplier: 1,
                                                           constant: 0)
      
      let centeringConstraint = NSLayoutConstraint(item: ratingView,
                                                   attribute: centeringAttribute,
                                                   relatedBy: .Equal,
                                                   toItem: self,
                                                   attribute: centeringAttribute,
                                                   multiplier: 1,
                                                   constant: 0)
      
      NSLayoutConstraint.activateConstraints([primaryDimensionConstraint, secondaryDimensionConstraint, centeringConstraint])
    }
    
    if axis == .Horizontal {
      self.horizontallyListViews(ratingViews, padding: interitemSpacing)
    } else {
      self.verticallyListViews(ratingViews, padding: interitemSpacing)
    }
    
    let (primaryEdgeAttribute, secondaryEdgeAttribute): (NSLayoutAttribute, NSLayoutAttribute) = (axis == .Horizontal) ? (.Left, .Right) : (.Top, .Bottom)
    
    if let firstView = ratingViews.first {
      let firstEdgeConstraint = NSLayoutConstraint(item: firstView,
                                              attribute: primaryEdgeAttribute,
                                              relatedBy: .Equal,
                                                 toItem: self,
                                              attribute: primaryEdgeAttribute,
                                             multiplier: 1,
                                               constant: 0)
      NSLayoutConstraint.activateConstraints([firstEdgeConstraint])
    }
    
    if let lastView = ratingViews.last {
      let lastEdgeConstraint = NSLayoutConstraint(item: lastView,
                                             attribute: secondaryEdgeAttribute,
                                             relatedBy: .Equal,
                                                toItem: self,
                                             attribute: secondaryEdgeAttribute,
                                            multiplier: 1,
                                              constant: 0)
      NSLayoutConstraint.activateConstraints([lastEdgeConstraint])
    }
  }
}
