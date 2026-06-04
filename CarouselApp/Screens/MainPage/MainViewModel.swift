////
//  MainViewModel.swift
//  CarouselApp
//
//  Created by Konstantin Kodolov on 03.06.2026.
//


import Foundation

final class MainViewModel {
    
    private let router: MainRouterProtocol
    private let model: CarouselModel
    private(set) var currentPageIndex = 0
    private var searchText = Constants.Texts.empty
    
    var currentPage: CarouselPage {
        model.pages[currentPageIndex]
    }
    
    var items: [CarouselItem] {
        guard !searchText.isEmpty else { return currentPage.items }
        
        return currentPage.items.filter {
            $0.title.localizedCaseInsensitiveContains(searchText) ||
            $0.subtitle.localizedCaseInsensitiveContains(searchText)
        }
    }
    
    var pages: [CarouselPage] {
        model.pages
    }
    
    init(router: MainRouterProtocol, model: CarouselModel = .mockData) {
        self.router = router
        self.model = model
    }
    
    func handleFloatingButton() {
        let statistics = makeStatistics()
        router.navigate(to: .statisticsSheet(statistics))
    }
    
    func selectPage(at index: Int) {
        guard model.pages.indices.contains(index) else { return }
        currentPageIndex = index
        searchText = Constants.Texts.empty
    }
    
    func updateSearchText(_ text: String) {
        searchText = text.trimmingCharacters(in: .whitespacesAndNewlines)
    }
    
    func makeStatistics() -> PageStatistics {
        let text = items
            .map(\.title)
            .joined()
            .lowercased()
            .filter { $0.isLetter }
        
        let counts = Dictionary(grouping: text, by: { $0 })
            .mapValues(\.count)
        
        let topCharacters = counts
            .sorted { $0.value == $1.value ? $0.key < $1.key : $0.value > $1.value }
            .prefix(3)
            .map { (character: $0.key, count: $0.value) }
        
        return PageStatistics(itemCount: items.count, topCharacters: topCharacters)
    }
}
