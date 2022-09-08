//
//  FirstCell.swift
//  iOS7-HW14-Denis Kholodkov
//
//  Created by Денис Холодков on 07.09.2022.
//

import UIKit

class FirstCell: UICollectionViewCell {

    static let identifier = "FirstCell"

    private lazy var image: UIImageView = {
        let imageView = UIImageView()
        imageView.layer.cornerRadius = 8
        imageView.clipsToBounds = true
        imageView.contentMode = .scaleAspectFill
        imageView.translatesAutoresizingMaskIntoConstraints = false
        return imageView
    }()

    lazy var label: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()

    lazy var labelNumber: UILabel = {
        let label = UILabel()
        label.textColor = .systemGray
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()

    private lazy var firstCellStack: UIStackView = {
        let stack = UIStackView()
        stack.distribution = .fill
        stack.axis = .vertical
        stack.alignment = .center
        stack.translatesAutoresizingMaskIntoConstraints = false
        return stack
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

    private func setupHierarchy() {
        contentView.addSubview(firstCellStack)
        firstCellStack.addArrangedSubview(image)
        firstCellStack.addSubview(label)
        firstCellStack.addSubview(labelNumber)
    }

    private func setupLayout() {
        NSLayoutConstraint.activate([
            firstCellStack.heightAnchor.constraint(equalToConstant: 176),
            firstCellStack.widthAnchor.constraint(equalToConstant: 176),

            label.topAnchor.constraint(equalTo: image.bottomAnchor, constant: 3),
            label.leftAnchor.constraint(equalTo: contentView.leftAnchor),

            labelNumber.topAnchor.constraint(equalTo: label.bottomAnchor, constant: 2),
            labelNumber.leftAnchor.constraint(equalTo: contentView.leftAnchor)
        ])

    }

    func configuration(model: Model) {
        self.image.image = UIImage(named: model.image)
        self.label.text = model.label
        self.labelNumber.text = model.labelNumber
    }

    override func prepareForReuse() {
        super.prepareForReuse()
        self.image.image = nil
    }

}
