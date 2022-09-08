//
//  HeaderCell.swift
//  iOS7-HW14-Denis Kholodkov
//
//  Created by Денис Холодков on 07.09.2022.
//

import UIKit

class HeaderCell: UICollectionReusableView {
    
    static let identifier = "HeaderCell"
    
    lazy var labelTitle: UILabel = {
        let label = UILabel()
        label.font = UIFont.systemFont(ofSize: 24, weight: .bold)
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    lazy var labelRaightTitle: UILabel = {
        let label = UILabel()
        label.textColor = .systemBlue
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    private lazy var separatorView: UIView = {
        let separatorView = UIView()
        separatorView.backgroundColor = .systemGray
        separatorView.translatesAutoresizingMaskIntoConstraints = false
        return separatorView
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        clipsToBounds = true
        setupHierarchy()
        setupLayout()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func setupHierarchy(){
        addSubview(labelTitle)
        addSubview(labelRaightTitle)
        addSubview(separatorView)
    }
    
    private func setupLayout(){
        NSLayoutConstraint.activate([
            labelTitle.leftAnchor.constraint(equalTo: self.leftAnchor),
            labelTitle.bottomAnchor.constraint(equalTo: self.bottomAnchor),
            
            labelRaightTitle.rightAnchor.constraint(equalTo: self.rightAnchor),
            labelRaightTitle.bottomAnchor.constraint(equalTo: self.bottomAnchor),
            
            separatorView.topAnchor.constraint(equalTo: self.topAnchor),
            separatorView.heightAnchor.constraint(equalToConstant: 3),
            separatorView.leadingAnchor.constraint(equalTo: labelTitle.leadingAnchor),
            separatorView.trailingAnchor.constraint(equalTo: self.trailingAnchor)
            
        ])
        
    }
    
    override func prepareForReuse() {
        super.prepareForReuse()
        labelTitle.text = nil
        labelRaightTitle.text = ""
    }
}
