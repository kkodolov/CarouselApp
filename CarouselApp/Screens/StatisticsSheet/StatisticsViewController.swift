////
//  StatisticsViewController.swift
//  CarouselApp
//
//  Created by Konstantin Kodolov on 03.06.2026.
//


import UIKit

final class StatisticsViewController: UIViewController {
    
    private let viewModel: StatisticsSheetViewModel
    
    // MARK: - Views
    
    private let titleLabel: UILabel = {
        let label = UILabel()
        label.text = Constants.Texts.statistics
        label.font = .preferredFont(forTextStyle: .title2)
        label.textColor = .label
        return label
    }()
    
    private let itemsCountLabel: UILabel = {
        let label = UILabel()
        label.font = .preferredFont(forTextStyle: .headline)
        label.textColor = .label
        return label
    }()
    
    private let charactersVStack: UIStackView = {
        let stack = UIStackView()
        stack.axis = .vertical
        stack.spacing = Constants.Spacing.m
        return stack
    }()
    
    private lazy var contentVStack: UIStackView = {
        let stack = UIStackView()
        stack.translatesAutoresizingMaskIntoConstraints = false
        stack.axis = .vertical
        stack.spacing = Constants.Spacing.xl
        return stack
    }()
    
    // MARK: - Lifecycle
    
    init(viewModel: StatisticsSheetViewModel) {
        self.viewModel = viewModel
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupUI()
    }
    
    private func setupUI() {
        view.backgroundColor = .systemBackground
        view.addSubview(contentVStack)
        [titleLabel, itemsCountLabel, charactersVStack].forEach { contentVStack.addArrangedSubview($0) }
        
        NSLayoutConstraint.activate([
            contentVStack.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: Constants.Spacing.xxxl),
            contentVStack.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: Constants.Spacing.xxxl),
            contentVStack.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -Constants.Spacing.xxxl)
        ])
        
        configure()
    }
    
    private func configure() {
        itemsCountLabel.text = "\(Constants.Texts.items): \(viewModel.statistics.itemCount)"
        
        viewModel.statistics.topCharacters.forEach { item in
            let label = UILabel()
            label.font = .preferredFont(forTextStyle: .body)
            label.textColor = .secondaryLabel
            label.text = "\(item.character) = \(item.count)"
            charactersVStack.addArrangedSubview(label)
        }
    }

}
