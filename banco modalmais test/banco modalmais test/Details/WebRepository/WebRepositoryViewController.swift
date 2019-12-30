//
//  WebRepositoryViewController.swift
//  banco modalmais test
//
//  Created by zied on 29/12/19.
//  Copyright © 2019 zied. All rights reserved.
//

import UIKit
import WebKit

class WebRepositoryViewController: UIViewController {
    
    //MARK: - Properties
    var urlReopo: String = ""
    
    //MARK: - Outlets
    @IBOutlet var webView: WKWebView!
    @IBOutlet var navHeader: HeaderView!{
        didSet{
            navHeader.leftButton.setImage(.icExit, for: .normal)
            navHeader.titleNavBarLabel.text = ""
            navHeader.clearButton.isHidden = true
            navHeader.saerchButton.isHidden = true
            navHeader.imageNotification.isHidden = true
            navHeader.labelNotification.isHidden = true
            navHeader.filterButton.isHidden = true
            navHeader.leftButton.addTarget(self, action: #selector(exitView(_:)), for: .touchUpInside)
        }
    }
    
    //MARK: - Initializers
    
    override init(nibName nibNameOrNil: String?, bundle nibBundleOrNil: Bundle?) {
        super.init(nibName: nibNameOrNil, bundle: nibBundleOrNil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    //MARK: - Life Cycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        guard let url = URL(string: urlReopo) else { return }
        webView.load(URLRequest(url: url))
    }
    
    //MARK: - Functions
    @objc func exitView(_ sender: UIButton){
        self.dismiss(animated: true, completion: nil)
    }

}
