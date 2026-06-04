////
//  CarouselPageCell.swift
//  CarouselApp
//
//  Created by Konstantin Kodolov on 03.06.2026.
//


import UIKit

final class CarouselPageCell: UICollectionViewCell {
    static let reuseIdentifier = String(describing: CarouselPageCell.self)
    
    private let imageView: UIImageView = {
        let imageView = UIImageView()
        imageView.translatesAutoresizingMaskIntoConstraints = false
        imageView.contentMode = .scaleAspectFill
        imageView.clipsToBounds = true
        imageView.layer.cornerRadius = Constants.CornerRadius.xxl
        return imageView
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        setupUI()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func prepareForReuse() {
        super.prepareForReuse()
        imageView.image = nil
    }
    
    private func setupUI() {
        contentView.addSubview(imageView)
        
        NSLayoutConstraint.activate([
            imageView.topAnchor.constraint(equalTo: contentView.topAnchor),
            imageView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: Constants.Spacing.m),
            imageView.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -Constants.Spacing.m),
            imageView.bottomAnchor.constraint(equalTo: contentView.bottomAnchor)
        ])
    }
    
    func configure(with page: CarouselPage) {
        imageView.image = UIImage(named: page.imageName)
    }
}
