////
//  CarouselHeaderView.swift
//  CarouselApp
//
//  Created by Konstantin Kodolov on 03.06.2026.
//


import UIKit

final class CarouselHeaderView: UIView {
    
    var onPageChanged: ((Int) -> Void)?
    
    private var pages: [CarouselPage] = []
    
    private lazy var collectionView: UICollectionView = {
        let layout = UICollectionViewFlowLayout()
        layout.scrollDirection = .horizontal
        layout.minimumLineSpacing = .zero
        
        let collectionView = UICollectionView(frame: .zero, collectionViewLayout: layout)
        collectionView.translatesAutoresizingMaskIntoConstraints = false
        collectionView.isPagingEnabled = true
        collectionView.showsHorizontalScrollIndicator = false
        collectionView.dataSource = self
        collectionView.delegate = self
        collectionView.register(
            CarouselPageCell.self,
            forCellWithReuseIdentifier: CarouselPageCell.reuseIdentifier
        )
        
        return collectionView
    }()
    
    private let pageControl: UIPageControl = {
        let pageControl = UIPageControl()
        pageControl.translatesAutoresizingMaskIntoConstraints = false
        pageControl.currentPage = .zero
        pageControl.currentPageIndicatorTintColor = .systemBlue
        pageControl.pageIndicatorTintColor = .systemGray
        pageControl.isUserInteractionEnabled = false
        return pageControl
    }()
    
    private let vStack: UIStackView = {
        let stack = UIStackView()
        stack.translatesAutoresizingMaskIntoConstraints = false
        stack.axis = .vertical
        stack.spacing = Constants.Spacing.s
        stack.alignment = .fill
        return stack
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        setupUI()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func setupUI() {
        collectionView.backgroundColor = .clear

        addSubview(vStack)
        [collectionView, pageControl].forEach { vStack.addArrangedSubview($0) }
        
        NSLayoutConstraint.activate([
            vStack.topAnchor.constraint(equalTo: topAnchor, constant: Constants.Spacing.xl),
            vStack.leadingAnchor.constraint(equalTo: self.leadingAnchor),
            vStack.trailingAnchor.constraint(equalTo: self.trailingAnchor),
            vStack.bottomAnchor.constraint(equalTo: self.bottomAnchor),
            
            pageControl.heightAnchor.constraint(equalToConstant: Constants.Spacing.xxl)
        ])
    }

    func configure(with pages: [CarouselPage]) {
        self.pages = pages
        pageControl.numberOfPages = pages.count
        collectionView.reloadData()
    }
}

extension CarouselHeaderView: UICollectionViewDataSource {
    func collectionView(
        _ collectionView: UICollectionView,
        numberOfItemsInSection section: Int
    ) -> Int { pages.count }
    
    func collectionView(
        _ collectionView: UICollectionView,
        cellForItemAt indexPath: IndexPath
    ) -> UICollectionViewCell {
        let page = pages[indexPath.item]
        
        let cell = collectionView.dequeueReusableCell(
            withReuseIdentifier: CarouselPageCell.reuseIdentifier,
            for: indexPath
        ) as? CarouselPageCell
        
        guard let cell else { return UICollectionViewCell() }
        cell.configure(with: page)
        
        return cell
    }
}

extension CarouselHeaderView: UICollectionViewDelegateFlowLayout {
    func collectionView(
        _ collectionView: UICollectionView,
        layout collectionViewLayout: UICollectionViewLayout,
        sizeForItemAt indexPath: IndexPath
    ) -> CGSize { CGSize(
        width: collectionView.bounds.width,
        height: collectionView.bounds.height
    ) }
    
    func scrollViewDidEndDecelerating(_ scrollView: UIScrollView) {
        guard scrollView.bounds.width > 0 else { return }
        let pageIndex = Int(round(scrollView.contentOffset.x / scrollView.bounds.width))
        
        guard pages.indices.contains(pageIndex) else { return }
        pageControl.currentPage = pageIndex
        
        onPageChanged?(pageIndex)
    }
}
