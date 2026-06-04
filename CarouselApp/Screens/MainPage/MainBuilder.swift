////
//  MainBuilder.swift
//  CarouselApp
//
//  Created by Konstantin Kodolov on 03.06.2026.
//


import UIKit

protocol MainBuilderProtocol {
    func build() -> UIViewController
}

final class MainBuilder: MainBuilderProtocol {
    
    func build() -> UIViewController {
        let router = MainRouter()
        
        let viewModel = MainViewModel(
            router: router,
            model: .mockData
        )
        
        let viewController = MainViewController(viewModel: viewModel)
        router.view = viewController
        
        return viewController
    }
    
}
