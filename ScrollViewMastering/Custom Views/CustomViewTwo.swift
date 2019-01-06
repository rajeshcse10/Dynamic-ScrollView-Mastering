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
    
    @IBOutlet var contentView: UIView!
    @IBOutlet weak var descriptionLabel: UILabel!
    @IBOutlet weak var profileImageView: UIImageView!
    
    var parentViewController:UIViewController?
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        guard let view = loadViewFromNib() else { return }
//        DispatchQueue.main.asyncAfter(deadline: .now()+0.1) {
//            self.setData()
//        }
        view.frame = self.bounds
        self.addSubview(view)
        setData()
    }
    func setData(){
        DispatchQueue.main.async {
            self.profileImageView.image = UIImage(named: "profile")
            self.descriptionLabel.text = "I'm making a custom UIView with 2 UILabel in it, with each UILabel having dynamic height. I'm unable to set constraints for dynamic height. (I'm new to Auto-Layout & iOS stuff).Both UILabels are connected to each other from Top & Bottom, and are Horizontally aligned to superview. And when I change content of one of the UILabel, UIView and UILabel does not resize as required.Please suggest. Attaching screenshots for current constraints."
            self.contentView.layoutIfNeeded()
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

    @IBAction func btnAction(_ sender: Any) {
        let storyBoard = UIStoryboard(name: "Main", bundle: nil)
        let profile = storyBoard.instantiateViewController(withIdentifier: "ProfileViewController")
        parentViewController?.navigationController?.pushViewController(profile, animated: true)
    }
}
