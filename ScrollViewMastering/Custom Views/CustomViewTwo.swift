//
//  CustomViewTwo.swift
//  ScrollViewMastering
//
//  Created by Rajesh Karmaker on 2/1/19.
//  Copyright © 2019 Rajesh Karmaker. All rights reserved.
//

import UIKit

class CustomViewTwo: UIView {

    let nibName = "CustomViewTwo"
    
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        guard let view = loadViewFromNib() else { return }
        view.frame = self.bounds
        self.addSubview(view)
    }
    func loadViewFromNib() -> UIView? {
        let bundle = Bundle(for: type(of: self))
        let nib = UINib(nibName: nibName, bundle: bundle)
        return nib.instantiate(withOwner: self, options: nil).first as? UIView
    }
    override open var intrinsicContentSize: CGSize{
        get{
            return CGSize(width: self.bounds.size.width, height: 150)
        }
    }

}
