# CarouselApp
iOS carousel app built with UIKit and SwiftUI, featuring image paging, searchable item lists, sticky search, and bottom sheet statistics.

## Branches
- `feature/UIKit` - UIKit implementation
- `feature/SwiftUI` - SwiftUI implementation

## Features
- Local mock data
- Local image assets
- MVVM architecture
- Search by item title and subtitle
- Sticky search behavior
- Bottom sheet statistics
- Unit tests for ViewModel logic

## Architecture
The project follows MVVM.

## Statistics Logic
Statistics are calculated for the current carousel page.
For the current page list, the app calculates:
- total number of items
- top 3 most frequent letters among item titles
