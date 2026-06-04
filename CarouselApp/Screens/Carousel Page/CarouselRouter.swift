////
//  CarouselRouter.swift
//  CarouselApp
//
//  Created by Konstantin Kodolov on 03.06.2026.
//


import SwiftUI
import Combine

enum CarouselRoute: Identifiable {
    case statistics(PageStatistics)
    
    var id: String {
        switch self {
        case .statistics:
            return Constants.RouteId.statistics
        }
    }
    
    @ViewBuilder
    var destination: some View {
        switch self {
        case .statistics(let statistics):
            StatisticsSheetBuilder(
                inputData: .init(statistics: statistics)
            ).build()
                .presentationDetents([.medium])
                .presentationDragIndicator(.visible)
        }
    }
}

protocol CarouselRouterProtocol: AnyObject {
    func navigate(to route: CarouselRoute)
}

final class CarouselRouter: ObservableObject, CarouselRouterProtocol {
    @Published var currentSheet: CarouselRoute?
    
    func navigate(to route: CarouselRoute) {
        currentSheet = route
    }
    
    func dismiss() {
        currentSheet = nil
    }
}
