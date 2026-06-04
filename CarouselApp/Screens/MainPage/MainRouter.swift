////
//  MainRouter.swift
//  CarouselApp
//
//  Created by Konstantin Kodolov on 03.06.2026.
//


import UIKit

enum MainRoute {
    case statisticsSheet(_ statistics: PageStatistics)
}

protocol MainRouterProtocol {
    func navigate(to route: MainRoute)
}

final class MainRouter: MainRouterProtocol {
    
    weak var view: UIViewController?
    
    func navigate(to route: MainRoute) {
        guard let view else { return }
        
        switch route {
        case .statisticsSheet(let statistics):
            let statisticsVC = StatisticsSheetBuilder(inputData: .init(
                statistics: statistics
            )).build()
            
            if let sheet = statisticsVC.sheetPresentationController {
                sheet.detents = [.medium()]
                sheet.prefersGrabberVisible = true
            }
            
            view.present(statisticsVC, animated: true)
        }
    }
    
}
