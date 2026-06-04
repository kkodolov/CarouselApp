////
//  SearchBarView.swift
//  CarouselApp
//
//  Created by Konstantin Kodolov on 03.06.2026.
//


import SwiftUI

struct SearchBarView: View {
    @Binding var text: String
    
    var body: some View {
        HStack(spacing: Constants.SmallSpacing.l) {
            Image(systemName: Constants.ImageNames.magnifyingglass)
                .foregroundStyle(.secondary)
            
            TextField(Constants.Texts.search, text: $text)
                .textInputAutocapitalization(.never)
                .autocorrectionDisabled()
            
            if !text.isEmpty {
                Button {
                    text = Constants.Texts.empty
                } label: {
                    Image(systemName: Constants.ImageNames.xmarkCircleFill)
                        .foregroundStyle(.secondary)
                }
            }
        }
        .padding(.horizontal, Constants.SmallSpacing.xxl)
        .padding(.vertical, Constants.SmallSpacing.xl)
        .background(.thinMaterial)
        .clipShape(RoundedRectangle(cornerRadius: Constants.MediumSpacing.xs))
        .padding(.horizontal)
        .padding(.vertical, Constants.SmallSpacing.m)
    }
}
