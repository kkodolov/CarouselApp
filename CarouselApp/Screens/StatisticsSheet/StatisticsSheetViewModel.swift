////
//  StatisticsSheetViewModel.swift
//  CarouselApp
//
//  Created by Konstantin Kodolov on 03.06.2026.
//


import Foundation

final class StatisticsSheetViewModel {
    
    private let inputData: StatisticsSheetInputData
    
    let statistics: PageStatistics
    
    init(inputData: StatisticsSheetInputData) {
        self.inputData = inputData
        statistics = inputData.statistics
    }
}
