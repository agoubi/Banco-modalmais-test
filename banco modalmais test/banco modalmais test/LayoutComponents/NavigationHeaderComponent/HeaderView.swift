//
//  HeaderView.swift
//  banco modalmais test
//
//  Created by zied on 26/12/19.
//  Copyright © 2019 zied. All rights reserved.
//

import Foundation
import UIKit

class HeaderView: UIView {
    
    //MARK: - Outlets
    
    @IBOutlet var navBarView: UIView!
    @IBOutlet var leftButton: UIButton!
    @IBOutlet var titleNavBarLabel: UILabel!
    @IBOutlet var clearButton: UIButton!
    @IBOutlet var saerchButton: UIButton!
    @IBOutlet var imageNotification: UIImageView!
    @IBOutlet var labelNotification: UILabel!
    @IBOutlet var filterButton: UIButton!
    
    //MARK: - Initializers
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        commonInit()
    }

    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        commonInit()
    }

    func commonInit() {
        let bundle = Bundle.init(for: HeaderView.self)
        if let viewsToAdd = bundle.loadNibNamed("HeaderView", owner: self, options: nil), let contentView = viewsToAdd.first as? UIView {
            addSubview(contentView)
            contentView.frame = self.bounds
            contentView.autoresizingMask = [.flexibleHeight,
                                            .flexibleWidth]
        }
    }
    
    //MARK: - Configuration
    
    func configure(title: String){
        self.titleNavBarLabel.text = title
    }
        
}
