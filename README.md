# CarouselApp
iOS carousel app built with UIKit and SwiftUI, featuring image paging, searchable item lists, sticky search, and bottom sheet statistics.

## Branches
- feature/UIKit - UIKit implementation
- feature/SwiftUI - SwiftUI implementation

## Requirements
- iOS 16.0+
- Xcode 16+
- No third-party libraries

## Features
- Local mock data and local image assets
- Image carousel with page indicator
- Search by item title and subtitle
- Sticky search bar while scrolling
- Bottom sheet with page statistics
- Unit tests for ViewModel logic

## Architecture
- The project follows MVVM.
- Navigation logic is separated with Router / Builder where needed.

## Statistics Logic
Statistics are calculated for the currently selected carousel page:
- total number of items
- top 3 most frequent letters among item titles and subtitles
