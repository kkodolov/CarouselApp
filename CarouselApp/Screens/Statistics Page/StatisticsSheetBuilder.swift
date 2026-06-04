////
//  StatisticsSheetBuilder.swift
//  CarouselApp
//
//  Created by Konstantin Kodolov on 03.06.2026.
//


import SwiftUI

final class StatisticsSheetBuilder {
    
    private let inputData: StatisticsSheetInputData
    
    init(inputData: StatisticsSheetInputData) {
        self.inputData = inputData
    }
    
    @MainActor
    func build() -> some View {
        let viewModel = StatisticsSheetViewModel(inputData: inputData)
        
        return StatisticsSheetView(viewModel: viewModel)
    }
}
