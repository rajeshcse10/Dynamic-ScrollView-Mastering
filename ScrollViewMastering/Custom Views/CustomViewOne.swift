//
//  CustomViewOne.swift
//  ScrollViewMastering
//
//  Created by Rajesh Karmaker on 2/1/19.
//  Copyright © 2019 Rajesh Karmaker. All rights reserved.
//

import UIKit

class CustomViewOne: UIView {

    let nibName = "CustomViewOne"
    
    @IBOutlet weak var contentView: UIView!
    @IBOutlet weak var label1: UILabel!
    @IBOutlet weak var label2: UILabel!
    @IBOutlet weak var label3: UILabel!
    @IBOutlet weak var label4: UILabel!
    
    
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        guard let view = loadViewFromNib() else { return }
        view.frame = self.bounds
        self.addSubview(view)
        setdata()
    }
    func setdata(){
        DispatchQueue.main.async {
            let result = ["1. Set the Lines property of both labels to 0 in interface builder.",
                             "2. Make sure there are no constraints on uiview which force it to a certain size, for example, if you have a constraint on uiview for certain distance from top of superview and another constraint of certain distance from bottom of superview, it will not work.",
                             "3. I'm making a custom UIView with 2 UILabel in it, with each UILabel having dynamic height. I'm unable to set constraints for dynamic height. (I'm new to Auto-Layout & iOS stuff).Both UILabels are connected to each other from Top & Bottom, and are Horizontally aligned to superview. And when I change content of one of the UILabel, UIView and UILabel does not resize as required.Please suggest. Attaching screenshots for current constraints.",
                             "4. As long as you make sure that labels in your custom view are pinned to all sides (Title Label pinned to: Leading, Top, Trailing of the superview and Bottom to Content Label; Content Label pinned to: Leading, Bottom, Trailing of the superview and Top to Title Label) you will have your superview change it's height according to the content."]
            self.label1.text = result[0]
            self.label2.text = result[1]
            self.label3.text = result[2]
            self.label4.text = result[3]
            UIView.animate(withDuration: 0.2, animations: {
                self.contentView.layoutIfNeeded()
            })
            self.invalidateIntrinsicContentSize()
        }
    }
    func loadViewFromNib() -> UIView? {
        let bundle = Bundle(for: type(of: self))
        let nib = UINib(nibName: nibName, bundle: bundle)
        return nib.instantiate(withOwner: self, options: nil).first as? UIView
    }
    override open var intrinsicContentSize: CGSize{
        get{
            return contentView.frame.size
        }
    }
}
