//
//  HorizontalScroller.swift
//  BlueLibrarySwift
//
//  Created by dirtmelon on 16/4/19.
//  Copyright © 2016年 Raywenderlich. All rights reserved.
//

import UIKit

class HorizontalScroller: UIView {
    weak var delegate: HorizontalScrollerDelegate?

    private let VIEW_PADDING = 10
    private let VIEW_DIMENSIONS = 100
    private let VIEWS_OFFSET = 100

    private var scroller: UIScrollView!

    var viewArray = [UIView]()

    override init(frame: CGRect) {
        super.init(frame: frame)
        initialzeScrollView()
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        initialzeScrollView()
    }

    func initialzeScrollView() {
        scroller = UIScrollView()
        addSubview(scroller)

        scroller.translatesAutoresizingMaskIntoConstraints = false

        self.addConstraint(NSLayoutConstraint(item: scroller, attribute: .Leading, relatedBy: .Equal, toItem: self, attribute: .Leading, multiplier: 1.0, constant: 0.0))
        self.addConstraint(NSLayoutConstraint(item: scroller, attribute: .Trailing, relatedBy: .Equal, toItem: self, attribute: .Trailing, multiplier: 1.0, constant: 0.0))
        self.addConstraint(NSLayoutConstraint(item: scroller, attribute: .Top, relatedBy: .Equal, toItem: self, attribute: .Top, multiplier: 1.0, constant: 0.0))
        let tapRecognizer = UITapGestureRecognizer(target: self, action: #selector(scrollerTapped(_:)))
        scroller.addGestureRecognizer(tapRecognizer)
    }

    func scrollerTapped(gesture: UITapGestureRecognizer) {
        let location = gesture.locationInView(gesture.view)
        if let delegate = self.delegate {
            for index in 0..<delegate.numberOfViewsForHorizontalScroller(self) {
                let view = scroller.subviews[index] as UIView
                if CGRectContainsPoint(view.frame, location) {
                    delegate.horizontalScrollerClickedViewAtIndex(self, index: index)
                    scroller.setContentOffset(CGPointMake(view.frame.origin.x - self.frame.size.width/2 + view.frame.size.width/2, 0), animated:true)
                }
            }
        }
    }
}

@objc protocol HorizontalScrollerDelegate {

    func numberOfViewsForHorizontalScroller(scroller: HorizontalScroller) -> Int

    func horizontalScrollerViewAtIndex(scroller: HorizontalScroller, index: Int) -> UIView

    func horizontalScrollerClickedViewAtIndex(scroller: HorizontalScroller, index: Int)

    optional func initialViewIndex(scroller: HorizontalScroller) -> Int
}