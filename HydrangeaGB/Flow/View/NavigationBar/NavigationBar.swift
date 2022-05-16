//
//  NavigationBar.swift
//  Custom Navigation Bar
//


import UIKit

@objc protocol NavigationBarDelegate: AnyObject {
    @objc optional func backAction()
    @objc optional func addAction()
}


@IBDesignable
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
        
//        backButton.isHidden = true
//        addButton.isHidden = true
    }
    
    @IBAction func goBack(_ sender: UIButton) {
        delegate?.backAction?()
    }
    
    @IBAction func goNext(_ sender: UIButton) {
        delegate?.addAction?()
    }
}


extension UIButton {
    func doVisible() {
        let button = self
        button.isHidden = false
    }
}

extension UILabel {
    func doHidden() {
        let label = self
        label.isHidden = true
    }
}
