////
//  Constants.swift
//  CarouselApp
//
//  Created by Konstantin Kodolov on 03.06.2026.
//


import Foundation

struct Constants {
    
    enum Sizes {
        /// 220
        static let tabViewHeight: CGFloat = 220
        /// 220
        static let imageHeight: CGFloat = 220
    }
    
    enum Frames {
        /// 56
        static let image: CGFloat = 56
    }
    
    enum ImageNames {
        static let magnifyingglass = "magnifyingglass"
        static let xmarkCircleFill = "xmark.circle.fill"
        static let ellipsis = "ellipsis"
    }
    
    enum Texts {
        /// ""
        static let empty = ""
        /// Search
        static let search = "Search"
        /// Statistics
        static let statistics = "Statistics"
        /// Items
        static let items = "Items"
        /// Top characters
        static let topCharacters = "Top characters"
    }
    
    enum RouteId {
        /// statistics
        static let statistics = "statistics"
    }
    
    enum SmallSpacing {
        /// 4
        static let xs: CGFloat = 4
        /// 6
        static let s: CGFloat = 6
        /// 8
        static let m: CGFloat = 8
        /// 10
        static let l: CGFloat = 10
        /// 12
        static let xl: CGFloat = 12
        /// 14
        static let xxl: CGFloat = 14
    }
    
    enum MediumSpacing {
        /// 16
        static let xs: CGFloat = 16
        /// 20
        static let s: CGFloat = 20
        /// 24
        static let m: CGFloat = 24
        /// 28
        static let l: CGFloat = 28
        /// 32
        static let xl: CGFloat = 32
        /// 36
        static let xxl: CGFloat = 36
    }
    
    enum LargeSpacing {
        /// 42
        static let xs: CGFloat = 42
        /// 50
        static let s: CGFloat = 50
        /// 58
        static let m: CGFloat = 58
        /// 64
        static let l: CGFloat = 64
        /// 72
        static let xl: CGFloat = 72
        /// 80
        static let xxl: CGFloat = 80
        /// 88
        static let xxxl: CGFloat = 88
    }
    
    enum Degrees {
        /// 90
        static let ninetyDegrees = 90.0
    }
    
}
