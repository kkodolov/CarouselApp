////
//  StatisticsSheetView.swift
//  CarouselApp
//
//  Created by Konstantin Kodolov on 03.06.2026.
//


import SwiftUI

struct StatisticsSheetView: View {
    
    private let viewModel: StatisticsSheetViewModel
    
    init(viewModel: StatisticsSheetViewModel) {
        self.viewModel = viewModel
    }
    
    var body: some View {
        VStack(alignment: .leading, spacing: Constants.MediumSpacing.s) {
            Text(Constants.Texts.statistics)
                .font(.title2)
                .fontWeight(.bold)
            
            HStack {
                Text(Constants.Texts.items)
                    .foregroundStyle(.secondary)
                
                Spacer()
                
                Text("\(viewModel.statistics.itemCount)")
                    .fontWeight(.semibold)
            }
            
            VStack(alignment: .leading) {
                Text(Constants.Texts.topCharacters)
                    .font(.headline)
                
                ForEach(viewModel.statistics.topCharacters) { item in
                    HStack {
                        Text(String(item.character))
                            .font(.headline)
                        
                        Spacer()
                        
                        Text("\(item.count)")
                            .foregroundStyle(.secondary)
                    }
                    .padding()
                    .background(.thinMaterial)
                    .clipShape(RoundedRectangle(cornerRadius: Constants.SmallSpacing.xxl))
                }
            }
            
            Spacer()
        }
        .padding(Constants.MediumSpacing.m)
    }
}
