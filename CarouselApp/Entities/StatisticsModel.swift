////
//  StatisticsModel.swift
//  CarouselApp
//
//  Created by Konstantin Kodolov on 03.06.2026.
//


import Foundation

struct PageStatistics {
    let itemCount: Int
    let topCharacters: [TopCharacter]
}

struct TopCharacter: Identifiable {
    let id = UUID()
    let character: Character
    let count: Int
}
