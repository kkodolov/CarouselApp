////
//  StatisticsSheetBuilder.swift
//  CarouselApp
//
//  Created by Konstantin Kodolov on 03.06.2026.
//


import UIKit

protocol StatisticsSheetBuilderProtocol {
    func build() -> UIViewController
}

final class StatisticsSheetBuilder: StatisticsSheetBuilderProtocol {
    
    private let inputData: StatisticsSheetInputData
    
    init(inputData: StatisticsSheetInputData) {
        self.inputData = inputData
    }
    
    func build() -> UIViewController {
        let viewModel = StatisticsSheetViewModel(inputData: inputData)
        let viewController = StatisticsViewController(viewModel: viewModel)
        
        return viewController
    }
    
}
