//
//  NavigationBar.swift
//  Custom Navigation Bar
//


import UIKit

@objc protocol NavigationBarDelegate: AnyObject {
    @objc optional func backAction()
    @objc optional func addAction()
    @objc optional func searchAction()
    @objc optional func searchBarAction()
}


//@IBDesignable
class NavigationBar: UIView {
    
    weak var delegate: NavigationBarDelegate?
    
    @IBOutlet var contentView: UIView!
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var backButton: UIButton!
    @IBOutlet weak var addButton: UIButton!
    @IBOutlet weak var searchButton: UIButton!
    
    @IBOutlet weak var searchBar: UISearchBar!
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        commonInit()
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
//        print(coder)
        commonInit()
    }
        
    private func commonInit() {
        let bundle = Bundle(for: NavigationBar.self)
        bundle.loadNibNamed("NavigationBar", owner: self, options: nil)
        contentView.frame = bounds
        contentView.autoresizingMask = [.flexibleWidth, .flexibleHeight]
        addSubview(contentView)
    }
    
    @IBAction func goBack(_ sender: UIButton) {
        delegate?.backAction?()
    }
    
    @IBAction func goNext(_ sender: UIButton) {
        delegate?.addAction?()
    }
    
    @IBAction func goSearch(_ sender: UIButton) {
        delegate?.searchAction?()
    }
}

extension UIButton {
    func hiddenFalse() {
        let button = self
        button.isHidden = false
    }
}

extension UILabel {
    func hiddenTrue() {
        let label = self
        label.isHidden = true
    }
}
