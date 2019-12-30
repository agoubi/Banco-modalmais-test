//
//  SearchView.swift
//  banco modalmais test
//
//  Created by zied on 25/12/19.
//  Copyright © 2019 zied. All rights reserved.
//

import UIKit

class SearchView: UIView {

    //MARK: - Properties
    
    //MARK: - Outlets
    @IBOutlet var titleSearchView: UILabel!
    @IBOutlet var bottomBorderView: UIView!
    @IBOutlet var searchBar: UISearchBar! {
        didSet {
            searchBar.searchTextField.backgroundColor = .lightGreen
            searchBar.searchTextField.leftView?.isHidden = true
        }
    }
    
    
    //MARK: - Initializers
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        commonInit()
        if #available(iOS 11.0, *) {
            self.layer.maskedCorners = [.layerMinXMaxYCorner, .layerMinXMinYCorner]
        }
        self.backgroundColor = .lightGreen
    }

    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        commonInit()
        backgroundColor = .black
    }

    func commonInit() {
        let bundle = Bundle.init(for: SearchView.self)
        if let viewsToAdd = bundle.loadNibNamed("SearchView", owner: self, options: nil), let contentView = viewsToAdd.first as? UIView {
            addSubview(contentView)
            contentView.frame = self.bounds
            contentView.autoresizingMask = [.flexibleHeight,
                                            .flexibleWidth]
            contentView.layer.cornerRadius = 8
            contentView.layer.maskedCorners = [.layerMinXMinYCorner, .layerMaxXMinYCorner]
            
        }
    }
    
    //MARK: - Configuration
    func configure(title: String) {
        titleSearchView.text = title
    }
    
    
    
}
