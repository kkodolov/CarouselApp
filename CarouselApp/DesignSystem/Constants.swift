////
//  Constants.swift
//  CarouselApp
//
//  Created by Konstantin Kodolov on 03.06.2026.
//


import UIKit

struct Constants {
    
    enum Images {
        static let ellipsis = "ellipsis"
    }
    
    enum Texts {
        static let empty = ""
        static let searchPlaceHolder = "Search"
        static let statistics = "Statistics"
        static let items = "Items"
    }
    
    enum Frame {
        /// x: 0, y: 0, width: 0, height: 250
        static let headerFrame: CGRect = CGRect(x: 0, y: 0, width: 0, height: 250)
    }
    
    enum CustomSizes {
        /// 56
        static let imageCellHeight: CGFloat = 56
        /// 56
        static let imageCellWidth: CGFloat = 56
        /// 56
        static let searchBarHeight: CGFloat = 56
        /// 56
        static let floatingButtonHeight: CGFloat = 56
        /// 56
        static let floatingButtonWidth: CGFloat = 56
    }
    
    enum Spacing {
        /// 4
        static let s: CGFloat = 4
        /// 8
        static let m: CGFloat = 8
        /// 12
        static let l: CGFloat = 12
        /// 16
        static let xl: CGFloat = 16
        /// 20
        static let xxl: CGFloat = 20
        /// 24
        static let xxxl: CGFloat = 24
    }
    
    enum Lines {
        /// 0
        static let zero = 0
        /// 1
        static let single = 1
        /// 2
        static let two = 2
    }
    
    enum CornerRadius {
        /// 8
        static let s: CGFloat = 8
        /// 10
        static let m: CGFloat = 10
        /// 12
        static let l: CGFloat = 12
        /// 14
        static let xl: CGFloat = 14
        /// 20
        static let xxl: CGFloat = 20
        /// 28
        static let xxxl: CGFloat = 28
    }
    
    enum Alpha {
        /// 0.1
        static let searchBarTextField = 0.1
    }
    
    enum Degrees {
        /// 90
        static let ninety = Double.pi / 2
    }
}
