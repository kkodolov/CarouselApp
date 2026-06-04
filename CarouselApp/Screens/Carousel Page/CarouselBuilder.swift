////
//  CarouselBuilder.swift
//  CarouselApp
//
//  Created by Konstantin Kodolov on 03.06.2026.
//


import SwiftUI

final class CarouselBuilder {
    
    @MainActor
    func build() -> some View {
        let router = CarouselRouter()
        let viewModel = CarouselViewModel(
            router: router,
            model: .mockData
        )
        
        return CarouselView(
            viewModel: viewModel,
            router: router
        )
    }
    
}
