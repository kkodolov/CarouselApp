////
//  CarouselView.swift
//  CarouselApp
//
//  Created by Konstantin Kodolov on 03.06.2026.
//


import SwiftUI

struct CarouselView: View {
    @StateObject private var viewModel: CarouselViewModel
    @StateObject private var router: CarouselRouter
    
    init(viewModel: CarouselViewModel, router: CarouselRouter) {
        _viewModel = StateObject(wrappedValue: viewModel)
        _router = StateObject(wrappedValue: router)
    }
    
    var body: some View {
        ZStack(alignment: .bottomTrailing) {
            ScrollView {
                TabView(selection: $viewModel.selectedPageIndex) {
                    ForEach(Array(viewModel.pages.enumerated()), id: \.element.id) {
                        index, page in
                        VStack() {
                            Image(page.imageName)
                                .resizable()
                                .scaledToFill()
                                .frame(height: Constants.Sizes.imageHeight)
                                .clipShape(RoundedRectangle(cornerRadius: Constants.MediumSpacing.m))
                        }
                        .padding(.horizontal)
                        .tag(index)
                    }
                }
                .frame(height: Constants.Sizes.tabViewHeight)
                .tabViewStyle(.page(indexDisplayMode: .never))
                
                HStack(spacing: Constants.SmallSpacing.m) {
                    ForEach(viewModel.pages.indices, id: \.self) { index in
                        Circle()
                            .fill(index == viewModel.selectedPageIndex ? Color.blue : Color.gray)
                            .frame(width: Constants.SmallSpacing.m, height: Constants.SmallSpacing.m)
                    }
                }
                .padding(.top, Constants.SmallSpacing.xs)
                .padding(.bottom)
                
                LazyVStack(spacing: Constants.SmallSpacing.xl, pinnedViews: [.sectionHeaders]) {
                    Section {
                        VStack(spacing: Constants.SmallSpacing.s) {
                            ForEach(viewModel.filteredItems) { item in
                                HStack(spacing: Constants.SmallSpacing.xl) {
                                    Image(item.imageName)
                                        .resizable()
                                        .scaledToFill()
                                        .frame(width: Constants.Frames.image, height: Constants.Frames.image)
                                        .clipShape(RoundedRectangle(cornerRadius: Constants.SmallSpacing.xl))
                                    
                                    VStack(alignment: .leading, spacing: Constants.SmallSpacing.xs) {
                                        Text(item.title)
                                            .font(.headline)
                                        
                                        Text(item.subtitle)
                                            .font(.subheadline)
                                            .foregroundStyle(.secondary)
                                    }
                                    
                                    Spacer()
                                }
                                .padding()
                                .background(.thinMaterial)
                                .clipShape(RoundedRectangle(cornerRadius: Constants.MediumSpacing.xs))
                            }
                        }
                        .padding(.horizontal)
                    } header: {
                        SearchBarView(text: $viewModel.searchText)
                            .background(.background)
                    }
                }
                .padding(.bottom, Constants.LargeSpacing.xxxl)
            }
            .padding(.top)
            .hideKeyboardOnTap()
            
            Button {
                viewModel.handleFloatingButton()
            } label: {
                Image(systemName: Constants.ImageNames.ellipsis)
                    .rotationEffect(.degrees(Constants.Degrees.ninetyDegrees))
                    .font(.title2)
                    .foregroundStyle(.white)
                    .frame(width: Constants.Frames.image, height: Constants.Frames.image)
                    .background(.blue)
                    .clipShape(Circle())
                    .shadow(radius: Constants.SmallSpacing.m)
            }
            .padding(.bottom, Constants.MediumSpacing.m)
            .padding(.trailing, Constants.MediumSpacing.m)
        }
        .sheet(item: $router.currentSheet) { route in
            route.destination
        }
    }
}
