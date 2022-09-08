//
//  TableCell.swift
//  iOS7-HW14-Denis Kholodkov
//
//  Created by Денис Холодков on 07.09.2022.
//

import UIKit

class TableCell: UICollectionViewCell {

    static let identifier = "TableCell"

    private lazy var image: UIImageView = {
        let image = UIImageView()
        image.contentMode = .scaleAspectFit
        image.layer.cornerRadius = 8
        image.tintColor = .systemBlue
        image.translatesAutoresizingMaskIntoConstraints = false
        return image
    }()

    private lazy var label: UILabel = {
        let label = UILabel()
        label.textColor = .systemBlue
        label.font = .systemFont(ofSize: 20)
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()

    private lazy var labelNumber: UILabel = {
        let labelNumber = UILabel()
        labelNumber.textColor = .systemGray
        labelNumber.translatesAutoresizingMaskIntoConstraints = false
        return labelNumber
    }()

    private lazy var imageRight: UIImageView = {
        let icon = UIImage(systemName: "chevron.right")
        let image = UIImageView(image: icon)
        image.contentMode = .scaleToFill
        image.tintColor = .systemGray2
        image.translatesAutoresizingMaskIntoConstraints = false
        return image
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
        setupView()
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    private func setupHierarchy() {
        contentView.addSubview(image)
        contentView.addSubview(label)
        contentView.addSubview(labelNumber)
        contentView.addSubview(imageRight)
        contentView.addSubview(separatorView)
    }

    private func setupView() {
        NSLayoutConstraint.activate([
            image.centerYAnchor.constraint(equalTo: contentView.centerYAnchor),
            image.leftAnchor.constraint(equalTo: contentView.leftAnchor),
            image.heightAnchor.constraint(equalToConstant: 30),
            image.widthAnchor.constraint(equalToConstant: 30),

            label.centerYAnchor.constraint(equalTo: contentView.centerYAnchor),
            label.leftAnchor.constraint(equalTo: image.rightAnchor, constant: 20),

            labelNumber.centerYAnchor.constraint(equalTo: contentView.centerYAnchor),
            labelNumber.rightAnchor.constraint(equalTo: contentView.rightAnchor, constant:  -30),

            imageRight.centerYAnchor.constraint(equalTo: contentView.centerYAnchor),
            imageRight.rightAnchor.constraint(equalTo: contentView.rightAnchor, constant:  -10),

            separatorView.bottomAnchor.constraint(equalTo: contentView.bottomAnchor),
            separatorView.heightAnchor.constraint(equalToConstant: 1),
            separatorView.trailingAnchor.constraint(equalTo: contentView.trailingAnchor),
            separatorView.leadingAnchor.constraint(equalTo: label.leadingAnchor)
        ])
    }

    func cofiguration(model: Model) {
        self.image.image = UIImage(systemName: model.image)
        self.label.text = model.label
        self.labelNumber.text = model.labelNumber
    }

    override func prepareForReuse() {
        super.prepareForReuse()
        self.image.image = nil
    }

    func separatorHide(hide: Bool) {
        separatorView.isHidden = hide
    }
}
