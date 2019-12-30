//
//  SearchFilterTabBar.swift
//  banco modalmais test
//
//  Created by zied on 25/12/19.
//  Copyright © 2019 zied. All rights reserved.
//

import Foundation
import UIKit

@IBDesignable public class SearchFilterTabBar: UIView {

    //MARK: - Private Proprties
    public var selectedIndex = -1
    public var filterArray = [FilterModel]()
    
    public var arrayChosenFilters = [FilterModel]()
    
    //MARK: - Private outlets
    private lazy var filterCollectionViewLayout: UICollectionViewFlowLayout = {
        let flowLayout = UICollectionViewFlowLayout()
        flowLayout.scrollDirection = .horizontal
        flowLayout.estimatedItemSize = CGSize(width: 100, height: 40)
        return flowLayout
    }()

    public lazy var filterCollectionView: UICollectionView = {
        let filterCollectionView = UICollectionView(frame: .zero, collectionViewLayout: filterCollectionViewLayout)
        filterCollectionView.delegate = self
        filterCollectionView.dataSource = self
        filterCollectionView.backgroundColor = .lightGray
        filterCollectionView.showsVerticalScrollIndicator = false
        filterCollectionView.showsHorizontalScrollIndicator = false
        filterCollectionView.translatesAutoresizingMaskIntoConstraints = false
        filterCollectionView.contentInset = UIEdgeInsets(top: 0, left: 16, bottom: 0, right: 16)
        if #available(iOS 11.0, *) {
            filterCollectionView.contentInsetAdjustmentBehavior = .always
        }
        filterCollectionView.register(FilterTabBarCell.self, forCellWithReuseIdentifier: FilterTabBarCell.className)
        return filterCollectionView
    }()

    //MARK: - API
    public weak var delegate: SearchFilterTabBarDelegate?

    //MARK: - INITIALIZERS

    init(isAddingFilters: Bool) {
        super.init(frame: .zero)
        FilterTabBarCell.isAddingFilters = isAddingFilters
        constraintUI()
    }

    public override init(frame: CGRect) {
        super.init(frame: .zero)
        constraintUI()
    }

    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    //MARK: - Setup

    public func constraintUI() {

        addSubview(filterCollectionView)
        NSLayoutConstraint.activate([
            filterCollectionView.leadingAnchor.constraint(equalTo: leadingAnchor),
            filterCollectionView.topAnchor.constraint(equalTo: topAnchor),
            filterCollectionView.trailingAnchor.constraint(equalTo: trailingAnchor),
            filterCollectionView.bottomAnchor.constraint(equalTo: bottomAnchor)
        ])
    }
    
    private func setIsSelected(isSelected: Bool, index: Int) {
        filterArray[index].isSelected = isSelected
    }

    private func fillArrayOfTypes(array: [FilterModel]) {
        arrayChosenFilters.removeAll()
        for item in array {
            if item.isSelected {
                arrayChosenFilters.append(item)
            }
        }
    }
    
    func deleteFilter(index:Int) {
        filterArray.remove(at: index)
    }
    
    func deleteAllFilters() {
        for (index,_) in filterArray.enumerated() {
            setIsSelected(isSelected: false, index: index)
        }
        filterCollectionView.reloadData()
    }
    
    @objc func deleteFilter(_ sender: UIButton) {
        selectedIndex = sender.tag
        if selectedIndex != -1 {
            deleteFilter(index: selectedIndex)
            filterCollectionView.reloadData()
        }
        delegate?.updateWhenFilterDeleted(self, filterArray: filterArray)
    }

}

extension SearchFilterTabBar: UICollectionViewDelegate, UICollectionViewDataSource {

    public func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return filterArray.count
    }

    public func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: FilterTabBarCell.className, for: indexPath) as? FilterTabBarCell
        else { return UICollectionViewCell() }
        cell.titleLabel.preferredMaxLayoutWidth = 500
        cell.configure(title: filterArray[indexPath.row].title)
        if FilterTabBarCell.isAddingFilters {
            cell.setBackgroundColorCellElements(isSelected: filterArray[indexPath.row].isSelected)
        }else{
            cell.exitButton.tag = indexPath.row
            cell.exitButton.addTarget(self, action: #selector(deleteFilter(_:)), for: .touchUpInside)
        }
        return cell
    }

    public func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        
        if FilterTabBarCell.isAddingFilters {
            let cell = collectionView.cellForItem(at: indexPath) as? FilterTabBarCell
                if filterArray[indexPath.row].isSelected == true {
                    setIsSelected(isSelected: false, index: indexPath.row)
                    cell?.setBackgroundColorCellElements(isSelected: filterArray[indexPath.row].isSelected)
                    for (index,item) in arrayChosenFilters.enumerated() {
                        if item.title == filterArray[indexPath.row].title {
                            arrayChosenFilters.remove(at: index)
                        }
                    }
                    let section = IndexSet.init(integer: indexPath.section)
                    collectionView.reloadSections(section)
                } else {
                    setIsSelected(isSelected: true, index: indexPath.row)
                    cell?.setBackgroundColorCellElements(isSelected: filterArray[indexPath.row].isSelected)
                    let section = IndexSet.init(integer: indexPath.section)
                    collectionView.reloadSections(section)
                }
            fillArrayOfTypes(array: filterArray)
            delegate?.ChosenFilters(self, selectedFilters: arrayChosenFilters)
        }
    }

}

public class FilterTabBarCell: UICollectionViewCell {

    //MARK : - Private outlets

    var widthTabBarHeader: NSLayoutConstraint!
    var widthCheckedImage: NSLayoutConstraint!
    public static var isAddingFilters = false
    
    public lazy var globalView: UIView = {
        let globalView = UIView(frame: .zero)
        globalView.translatesAutoresizingMaskIntoConstraints = false
        globalView.layer.borderColor = UIColor.black.cgColor
        globalView.layer.borderWidth = 1
        globalView.layer.cornerRadius = 4
        return globalView
    }()

    public lazy var titleLabel: UILabel = {
        let titleLabel = UILabel(frame: .zero)
        titleLabel.translatesAutoresizingMaskIntoConstraints = false
        titleLabel.font = UIFont.bancoModalFont(ofSize: 12, weight: .arial_narrow_bolditalic)
        titleLabel.textAlignment = .center
        titleLabel.numberOfLines = 1
        titleLabel.setContentCompressionResistancePriority(.required, for: .horizontal)
        titleLabel.setContentHuggingPriority(.required, for: .horizontal)
        return titleLabel
    }()
    
    public lazy var exitButton: UIButton = {
        let exitButton = UIButton(frame: .zero)
        exitButton.translatesAutoresizingMaskIntoConstraints = false
        exitButton.setImage(.icExitBlack, for: .normal)
        return exitButton
    }()
    
    public lazy var checkedImage: UIImageView = {
        let checkedImage = UIImageView(frame: .zero)
        checkedImage.translatesAutoresizingMaskIntoConstraints = false
        checkedImage.contentMode = .scaleAspectFit
        checkedImage.image = .icCheckboxWhite
        return checkedImage
    }()

    public lazy var leftViewBorder: UIView = {
        let leftViewBorder = UIView(frame: .zero)
        leftViewBorder.translatesAutoresizingMaskIntoConstraints = false
        leftViewBorder.backgroundColor = .clear
        return leftViewBorder
    }()

    public lazy var rightViewBorder: UIView = {
        let rightViewBorder = UIView(frame: .zero)
        rightViewBorder.translatesAutoresizingMaskIntoConstraints = false
        rightViewBorder.backgroundColor = .clear
        return rightViewBorder
    }()

    //MARK : - INITIALIZERS

    init() {
        super.init(frame: .zero)
        constraintUI()
    }

    public override init(frame: CGRect) {
        super.init(frame: frame)
        constraintUI()
    }

    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    //MARK : - Setup

    private func constraintUI() {

        contentView.addSubview(globalView)
        globalView.addSubview(rightViewBorder)
        globalView.addSubview(titleLabel)
        globalView.addSubview(leftViewBorder)

        NSLayoutConstraint.activate([

            globalView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor),
            globalView.trailingAnchor.constraint(equalTo: contentView.trailingAnchor),
            globalView.centerYAnchor.constraint(equalTo: contentView.centerYAnchor),
            globalView.heightAnchor.constraint(equalToConstant: 40),

            leftViewBorder.leadingAnchor.constraint(equalTo: globalView.leadingAnchor),
            leftViewBorder.widthAnchor.constraint(equalToConstant: 10),
            leftViewBorder.heightAnchor.constraint(equalToConstant: 32),
            leftViewBorder.centerYAnchor.constraint(equalTo: globalView.centerYAnchor),

            rightViewBorder.trailingAnchor.constraint(equalTo: globalView.trailingAnchor),
            rightViewBorder.widthAnchor.constraint(equalToConstant: 10),
            rightViewBorder.heightAnchor.constraint(equalToConstant: 32),
            rightViewBorder.centerYAnchor.constraint(equalTo: globalView.centerYAnchor),
            
        ])
        
        if FilterTabBarCell.isAddingFilters {
            
            globalView.addSubview(checkedImage)
            widthCheckedImage = checkedImage.widthAnchor.constraint(equalToConstant: 28)
            widthCheckedImage.isActive = true
            NSLayoutConstraint.activate([

                checkedImage.leadingAnchor.constraint(equalTo: leftViewBorder.trailingAnchor),
                checkedImage.centerYAnchor.constraint(equalTo: globalView.centerYAnchor),
                checkedImage.heightAnchor.constraint(equalToConstant: 28),
                
                titleLabel.leadingAnchor.constraint(equalTo: checkedImage.trailingAnchor),
                titleLabel.trailingAnchor.constraint(equalTo: rightViewBorder.leadingAnchor),
                titleLabel.topAnchor.constraint(equalTo: globalView.topAnchor),
                titleLabel.bottomAnchor.constraint(equalTo: globalView.bottomAnchor),
            ])
        } else {
            
            globalView.addSubview(exitButton)
            
            NSLayoutConstraint.activate([
                titleLabel.leadingAnchor.constraint(equalTo: leftViewBorder.trailingAnchor),
                titleLabel.trailingAnchor.constraint(equalTo: exitButton.leadingAnchor),
                titleLabel.topAnchor.constraint(equalTo: globalView.topAnchor),
                titleLabel.bottomAnchor.constraint(equalTo: globalView.bottomAnchor),
                
                exitButton.trailingAnchor.constraint(equalTo: rightViewBorder.leadingAnchor),
                exitButton.heightAnchor.constraint(equalToConstant: 20),
                exitButton.widthAnchor.constraint(equalToConstant: 20),
                exitButton.centerYAnchor.constraint(equalTo: globalView.centerYAnchor),
            ])
        }
        
        
    }

    public func configure(title: String) {
        titleLabel.text = title
    }
    
    public func setBackgroundColorCellElements(isSelected: Bool) {
        if FilterTabBarCell.isAddingFilters {
            if isSelected {
                globalView.backgroundColor = .darkGray
                titleLabel.textColor = .white
                widthCheckedImage.constant = 28
            } else {
                globalView.backgroundColor =  .clear
                titleLabel.textColor =  .black
                widthCheckedImage.constant = 0
            }
        }
        
    }

}

public struct FilterModel {

    public var title: String
    public var isSelected: Bool

    init(title: String, isSelected: Bool) {
        self.title = title
        self.isSelected = isSelected
    }

}
