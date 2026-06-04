////
//  CarouselViewModel.swift
//  CarouselApp
//
//  Created by Konstantin Kodolov on 03.06.2026.
//


import Foundation
import Combine

final class CarouselViewModel: ObservableObject {
    
    @Published var searchText = Constants.Texts.empty
    @Published var selectedPageIndex = 0 {
        didSet {
            guard oldValue != selectedPageIndex else { return }
            searchText = Constants.Texts.empty
        }
    }
    
    private let router: CarouselRouterProtocol
    private let model: CarouselModel
    
    var pages: [CarouselPage] {
        model.pages
    }
    
    var currentPage: CarouselPage? {
        guard pages.indices.contains(selectedPageIndex) else { return nil }
        return pages[selectedPageIndex]
    }
    
    var filteredItems: [CarouselItem] {
        guard let currentPage else { return [] }
        
        let query = searchText.trimmingCharacters(in: .whitespacesAndNewlines)
        
        guard !query.isEmpty else { return currentPage.items }
        
        return currentPage.items.filter {
            $0.title.localizedCaseInsensitiveContains(query) ||
            $0.subtitle.localizedCaseInsensitiveContains(query)
        }
    }
    
    var currentStatistics: PageStatistics {
        let items = currentPage?.items ?? []
        let titles = items.map(\.title)
        
        return makeStatistics(from: titles)
    }
    
    init(router: CarouselRouterProtocol, model: CarouselModel = .mockData) {
        self.router = router
        self.model = model
    }
    
    func handleFloatingButton() {
        router.navigate(to: .statistics(currentStatistics))
    }
    
    private func makeStatistics(from strings: [String]) -> PageStatistics {
        let text = strings.joined().lowercased()
        let characters = text.filter { $0.isLetter }
        
        let counts = Dictionary(grouping: characters, by: { $0 })
            .mapValues(\.count)
        
        let topCharacters = counts
            .sorted {
                if $0.value == $1.value {
                    return String($0.key) < String($1.key)
                }
                
                return $0.value > $1.value
            }
            .prefix(3)
            .map {
                TopCharacter(character: $0.key, count: $0.value)
            }
        
        return PageStatistics(itemCount: strings.count, topCharacters: topCharacters)
    }
}
