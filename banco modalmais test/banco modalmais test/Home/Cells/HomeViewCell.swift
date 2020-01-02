//
//  HomeViewCell.swift
//  banco modalmais test
//
//  Created by zied on 26/12/19.
//  Copyright © 2019 zied. All rights reserved.
//

import UIKit

class HomeViewCell: UITableViewCell {

    //MARK: - Outlets
    ///Top view
    @IBOutlet var imageRepo: UIImageView! {
        didSet {
            self.imageRepo.clipsToBounds = true
            self.imageRepo.contentMode = .scaleAspectFit
        }
    }
    @IBOutlet var nameRepo: UILabel!
    @IBOutlet var totalStartsValue: UILabel!
    //Bottom view
    @IBOutlet var nbrFollowersValue: UILabel!
    @IBOutlet var dateValue: UILabel!
    @IBOutlet var nbrBranches: UILabel!
    
    //MARK: - Initializer
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
    }
    
    //MARK: - Life cycle
    override func awakeFromNib() {
        super.awakeFromNib()
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
    }
    
    //MARK: - Configuration
    func configure(repository: RepositoryModel) {
        DispatchQueue.main.async {
            let url = URL(string: repository.owner?.avatar_url ?? "")
            self.imageRepo?.load(url: url!)
        }
        
        nameRepo.text = repository.name ?? ""
        totalStartsValue.text = "\(repository.stargazers_count ?? 0)"
        nbrFollowersValue.text = "\(repository.watchers_count ?? 0)"
        dateValue.text = toDate(repository.created_at!)
        nbrBranches.text = "\(repository.open_issues_count ?? 0)"
    }
    
     func toDate(_ value: String) -> String? {
           let dateFormatter = DateFormatter()
           dateFormatter.dateFormat = "yyyy'-'MM'-'dd'T'HH':'mm':'ssZZZ"
           guard let date = dateFormatter.date(from: value) else {return nil}
           dateFormatter.dateFormat = "dd-MM-yyyy"
           dateFormatter.string(from: date)
           return dateFormatter.string(from: date)
    }
    
}
