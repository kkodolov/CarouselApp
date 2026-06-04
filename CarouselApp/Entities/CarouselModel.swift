////
//  CarouselModel.swift
//  CarouselApp
//
//  Created by Konstantin Kodolov on 03.06.2026.
//


import Foundation

struct CarouselModel {
    let pages: [CarouselPage]
}

struct CarouselPage: Identifiable {
    let id = UUID()
    let title: String
    let imageName: String
    let items: [CarouselItem]
}

struct CarouselItem: Identifiable {
    let id = UUID()
    let imageName: String
    let title: String
    let subtitle: String
}


extension CarouselModel {
    static let mockData = CarouselModel(
        pages: [
            CarouselPage(
                title: MockContent.PageTitles.fruits,
                imageName: MockContent.ImageNames.fruits,
                items: [
                    CarouselItem(
                        imageName: MockContent.ImageNames.apple,
                        title: MockContent.ItemTitles.apple,
                        subtitle: MockContent.ItemSubtitles.apple
                    ),
                    CarouselItem(
                        imageName: MockContent.ImageNames.banana,
                        title: MockContent.ItemTitles.banana,
                        subtitle: MockContent.ItemSubtitles.banana
                    ),
                    CarouselItem(
                        imageName: MockContent.ImageNames.kiwi,
                        title: MockContent.ItemTitles.kiwi,
                        subtitle: MockContent.ItemSubtitles.kiwi
                    ),
                    CarouselItem(
                        imageName: MockContent.ImageNames.mango,
                        title: MockContent.ItemTitles.mango,
                        subtitle: MockContent.ItemSubtitles.mango
                    ),
                    CarouselItem(
                        imageName: MockContent.ImageNames.orange,
                        title: MockContent.ItemTitles.orange,
                        subtitle: MockContent.ItemSubtitles.orange
                    )
                ]
            ),
            CarouselPage(
                title: MockContent.PageTitles.berries,
                imageName: MockContent.ImageNames.berries,
                items: [
                    CarouselItem(
                        imageName: MockContent.ImageNames.blueberry,
                        title: MockContent.ItemTitles.blueberry,
                        subtitle: MockContent.ItemSubtitles.blueberry
                    ),
                    CarouselItem(
                        imageName: MockContent.ImageNames.cranberry,
                        title: MockContent.ItemTitles.cranberry,
                        subtitle: MockContent.ItemSubtitles.cranberry
                    ),
                    CarouselItem(
                        imageName: MockContent.ImageNames.raspberry,
                        title: MockContent.ItemTitles.raspberry,
                        subtitle: MockContent.ItemSubtitles.raspberry
                    ),
                    CarouselItem(
                        imageName: MockContent.ImageNames.strawberry,
                        title: MockContent.ItemTitles.strawberry,
                        subtitle: MockContent.ItemSubtitles.strawberry
                    ),
                    CarouselItem(
                        imageName: MockContent.ImageNames.watermelon,
                        title: MockContent.ItemTitles.watermelon,
                        subtitle: MockContent.ItemSubtitles.watermelon
                    )
                ]
            ),
            CarouselPage(
                title: MockContent.PageTitles.vegetables,
                imageName: MockContent.ImageNames.vegetables,
                items: [
                    CarouselItem(
                        imageName: MockContent.ImageNames.carrot,
                        title: MockContent.ItemTitles.carrot,
                        subtitle: MockContent.ItemSubtitles.carrot
                    ),
                    CarouselItem(
                        imageName: MockContent.ImageNames.cucumber,
                        title: MockContent.ItemTitles.cucumber,
                        subtitle: MockContent.ItemSubtitles.cucumber
                    ),
                    CarouselItem(
                        imageName: MockContent.ImageNames.garlic,
                        title: MockContent.ItemTitles.garlic,
                        subtitle: MockContent.ItemSubtitles.garlic
                    ),
                    CarouselItem(
                        imageName: MockContent.ImageNames.onion,
                        title: MockContent.ItemTitles.onion,
                        subtitle: MockContent.ItemSubtitles.onion
                    ),
                    CarouselItem(
                        imageName: MockContent.ImageNames.tomato,
                        title: MockContent.ItemTitles.tomato,
                        subtitle: MockContent.ItemSubtitles.tomato
                    )
                ]
            )
        ]
    )
}
