//
//  NavigationBar.swift
//  Custom Navigation Bar
//
//  Created by Michael Tseitlin on 08.12.2019.
//  Copyright © 2019 Michael Tseitlin. All rights reserved.
//

import UIKit

@objc protocol NavigationBarDelegate: AnyObject {
    @objc optional func backAction()
    @objc optional func addAction()
}

//@IBDesignable
class NavigationBar: UIView {
    
    weak var delegate: NavigationBarDelegate?
        
    @IBOutlet var contentView: UIView!
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var backButton: UIButton!
    @IBOutlet weak var addButton: UIButton!
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        commonInit()
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
        commonInit()
    }
    
    private func commonInit() {
        let bundle = Bundle(for: NavigationBar.self)
        bundle.loadNibNamed("NavigationBar", owner: self, options: nil)
        contentView.frame = self.bounds
        contentView.autoresizingMask = [.flexibleWidth, .flexibleHeight]
        addSubview(contentView)
    }
    
    @IBAction func goBack(_ sender: UIButton) {
        delegate?.backAction?()
    }
    
    @IBAction func goAdd(_ sender: UIButton) {
        delegate?.addAction?()
    }
    
}
