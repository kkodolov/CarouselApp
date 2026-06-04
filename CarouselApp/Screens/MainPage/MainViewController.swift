////
//  MainViewController.swift
//  CarouselApp
//
//  Created by Konstantin Kodolov on 03.06.2026.
//


import UIKit

class MainViewController: UIViewController {
    
    private let viewModel: MainViewModel
    
    // MARK: - Views
    
    private lazy var tableView: UITableView = {
        let tableView = UITableView(frame: .zero, style: .plain)
        tableView.translatesAutoresizingMaskIntoConstraints = false
        tableView.dataSource = self
        tableView.delegate = self
        tableView.keyboardDismissMode = .interactive
        tableView.sectionHeaderTopPadding = Constants.Spacing.m
        tableView.register(CarouselItemCell.self, forCellReuseIdentifier: CarouselItemCell.reuseIdentifier)
        return tableView
    }()
    
    private lazy var carouselHeaderView = CarouselHeaderView(frame: Constants.Frame.headerFrame)
    
    private lazy var searchBar: UISearchBar = {
        let searchBar = UISearchBar()
        searchBar.placeholder = Constants.Texts.searchPlaceHolder
        searchBar.delegate = self
        searchBar.searchBarStyle = .minimal
        searchBar.searchTextField.backgroundColor = .systemGray6.withAlphaComponent(Constants.Alpha.searchBarTextField)
        return searchBar
    }()
    
    private lazy var floatingButton: UIButton = {
        let button = UIButton(type: .system)
        button.translatesAutoresizingMaskIntoConstraints = false
        button.setImage(UIImage(systemName: Constants.Images.ellipsis), for: .normal)
        button.transform = CGAffineTransform(rotationAngle: Constants.Degrees.ninety)
        button.tintColor = .white
        button.backgroundColor = .systemBlue
        button.layer.cornerRadius = Constants.CornerRadius.xxxl
        return button
    }()
    
    // MARK: - Lifecycle
    
    init(viewModel: MainViewModel) {
        self.viewModel = viewModel
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setupUI()
        keyboardDismissGesture()
    }
    
    // MARK: - Methods

    private func setupUI() {
        view.backgroundColor = .systemBackground
        
        setupSubviews()
        setupHeaderView()
        setupConstraints()
        setupActions()
    }
    
    private func setupSubviews() {
        view.addSubview(tableView)
        view.addSubview(floatingButton)
    }
    
    private func setupConstraints() {
        NSLayoutConstraint.activate([
            tableView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor),
            tableView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: Constants.Spacing.m),
            tableView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -Constants.Spacing.m),
            tableView.bottomAnchor.constraint(equalTo: view.bottomAnchor),
            
            floatingButton.widthAnchor.constraint(equalToConstant: Constants.CustomSizes.floatingButtonWidth),
            floatingButton.heightAnchor.constraint(equalToConstant: Constants.CustomSizes.floatingButtonHeight),
            floatingButton.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -Constants.Spacing.xxxl),
            floatingButton.bottomAnchor.constraint(equalTo: view.keyboardLayoutGuide.topAnchor, constant: -Constants.Spacing.xxxl)
        ])
    }
    
    private func setupActions() {
        carouselHeaderView.onPageChanged = { [weak self] index in
            guard let self else { return }
            
            view.endEditing(true)
            searchBar.text = nil
            viewModel.selectPage(at: index)
            tableView.reloadData()
        }
        
        floatingButton.addTarget(self, action: #selector(didTapFloatingButton), for: .touchUpInside)
    }
    
    private func setupHeaderView() {
        carouselHeaderView.configure(with: viewModel.pages)
        tableView.tableHeaderView = carouselHeaderView
    }
    
    private func keyboardDismissGesture() {
        let tapGesture = UITapGestureRecognizer(
            target: self,
            action: #selector(hideKeyboardOnTap)
        )
        
        tapGesture.cancelsTouchesInView = true
        view.addGestureRecognizer(tapGesture)
    }
    
    @objc private func didTapFloatingButton() {
        viewModel.handleFloatingButton()
    }
    
    @objc private func hideKeyboardOnTap() {
        view.endEditing(true)
    }
}

// MARK: - Extensions

extension MainViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        viewModel.items.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let item = viewModel.items[indexPath.row]
        let cell = tableView.dequeueReusableCell(
            withIdentifier: CarouselItemCell.reuseIdentifier,
            for: indexPath
        ) as? CarouselItemCell
        
        guard let cell else { return UITableViewCell() }
        cell.configure(with: item)
        
        return cell
    }
}

extension MainViewController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        searchBar
    }
    
    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        Constants.CustomSizes.searchBarHeight
    }
}

extension MainViewController: UISearchBarDelegate {
    func searchBar(_ searchBar: UISearchBar, textDidChange searchText: String) {
        viewModel.updateSearchText(searchText)
        tableView.reloadData()
    }
}

