////
//  CarouselItemCell.swift
//  CarouselApp
//
//  Created by Konstantin Kodolov on 03.06.2026.
//


import UIKit

final class CarouselItemCell: UITableViewCell {
    
    static let reuseIdentifier = String(describing: CarouselItemCell.self)
    
    private let itemImage: UIImageView = {
        let imageView = UIImageView()
        imageView.translatesAutoresizingMaskIntoConstraints = false
        imageView.contentMode = .scaleAspectFill
        imageView.clipsToBounds = true
        imageView.layer.cornerRadius = Constants.CornerRadius.l
        imageView.backgroundColor = .tertiarySystemFill
        return imageView
    }()
    
    private let itemTitle: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.font = .preferredFont(forTextStyle: .headline)
        label.textColor = .label
        return label
    }()
    
    private let itemSubtitle: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.font = .preferredFont(forTextStyle: .subheadline)
        label.textColor = .secondaryLabel
        label.numberOfLines = Constants.Lines.two
        return label
    }()
    
    private lazy var labelsVStack: UIStackView = {
        let stack = UIStackView()
        stack.translatesAutoresizingMaskIntoConstraints = false
        stack.axis = .vertical
        stack.spacing = Constants.Spacing.s
        return stack
    }()
    
    private lazy var mainHStack: UIStackView = {
        let stack = UIStackView()
        stack.translatesAutoresizingMaskIntoConstraints = false
        stack.axis = .horizontal
        stack.spacing = Constants.Spacing.l
        stack.alignment = .center
        return stack
    }()

    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        
        setupUI()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func prepareForReuse() {
        super.prepareForReuse()
        itemImage.image = nil
        itemTitle.text = nil
        itemSubtitle.text = nil
    }
    
    private func setupUI() {
        selectionStyle = .none
        contentView.addSubview(mainHStack)
        [itemImage, labelsVStack].forEach { mainHStack.addArrangedSubview($0) }
        [itemTitle, itemSubtitle].forEach { labelsVStack.addArrangedSubview($0) }
        
        NSLayoutConstraint.activate([
            itemImage.widthAnchor.constraint(equalToConstant: Constants.CustomSizes.imageCellWidth),
            itemImage.heightAnchor.constraint(equalToConstant: Constants.CustomSizes.imageCellHeight),
            
            mainHStack.topAnchor.constraint(equalTo: contentView.topAnchor, constant: Constants.Spacing.l),
            mainHStack.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: Constants.Spacing.m),
            mainHStack.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -Constants.Spacing.m),
            mainHStack.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: -Constants.Spacing.l)
        ])
    }
    
    func configure(with item: CarouselItem) {
        itemImage.image = UIImage(named: item.imageName)
        itemTitle.text = item.title
        itemSubtitle.text = item.subtitle
    }
}
