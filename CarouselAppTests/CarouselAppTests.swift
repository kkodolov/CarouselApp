////
//  CarouselAppTests.swift
//  CarouselAppTests
//
//  Created by Konstantin Kodolov on 03.06.2026.
//


import XCTest
@testable import CarouselApp

final class CarouselAppTests: XCTestCase {
    
    private func makeViewModel() -> MainViewModel {
        let model = CarouselModel(
            pages: [
                CarouselPage(
                    title: "First",
                    imageName: "first",
                    items: [
                        CarouselItem(imageName: "apple", title: "Apple", subtitle: "Fresh red fruit"),
                        CarouselItem(imageName: "banana", title: "Banana", subtitle: "Sweet yellow fruit"),
                        CarouselItem(imageName: "orange", title: "Orange", subtitle: "Citrus fruit")
                    ]
                ),
                CarouselPage(
                    title: "Second",
                    imageName: "second",
                    items: [
                        CarouselItem(imageName: "carrot", title: "Carrot", subtitle: "Crunchy vegetable"),
                        CarouselItem(imageName: "onion", title: "Onion", subtitle: "Layered vegetable")
                    ]
                )
            ]
        )
        
        return MainViewModel(router: MainRouter(), model: model)
    }
    
    func testInitialStateUsesFirstPage() {
        let viewModel = makeViewModel()
        
        XCTAssertEqual(viewModel.currentPage.title, "First")
        XCTAssertEqual(viewModel.items.count, 3)
        XCTAssertEqual(viewModel.pages.count, 2)
    }
    
    func testSearchFiltersItemsByTitleIgnoringCase() {
        let viewModel = makeViewModel()
        
        viewModel.updateSearchText("app")
        
        XCTAssertEqual(viewModel.items.map(\.title), ["Apple"])
    }
    
    func testSelectingPageUpdatesItemsAndClearsSearch() {
        let viewModel = makeViewModel()
        viewModel.updateSearchText("apple")
        viewModel.selectPage(at: 1)
        XCTAssertEqual(viewModel.currentPage.title, "Second")
        XCTAssertEqual(viewModel.items.map(\.title), ["Carrot", "Onion"])
    }
    
    func testSelectingInvalidPageDoesNotChangeCurrentPage() {
        let viewModel = makeViewModel()
        viewModel.selectPage(at: 99)
        XCTAssertEqual(viewModel.currentPage.title, "First")
        XCTAssertEqual(viewModel.items.count, 3)
    }
    
    func testStatisticsUsesVisibleItemsAndReturnsTopThreeCharacters() {
        let model = CarouselModel(
            pages: [
                CarouselPage(
                    title: "Stats",
                    imageName: "stats",
                    items: [
                        CarouselItem(imageName: "one", title: "Aaa", subtitle: ""),
                        CarouselItem(imageName: "two", title: "Bb", subtitle: ""),
                        CarouselItem(imageName: "three", title: "C", subtitle: "")
                    ]
                )
            ]
        )
        
        let viewModel = MainViewModel(router: MainRouter(), model: model)
        
        let statistics = viewModel.makeStatistics()
        
        XCTAssertEqual(statistics.itemCount, 3)
        XCTAssertEqual(statistics.topCharacters.count, 3)
        XCTAssertEqual(statistics.topCharacters[0].character, "a")
        XCTAssertEqual(statistics.topCharacters[0].count, 3)
        XCTAssertEqual(statistics.topCharacters[1].character, "b")
        XCTAssertEqual(statistics.topCharacters[1].count, 2)
    }
    
}
