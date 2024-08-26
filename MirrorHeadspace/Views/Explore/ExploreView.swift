//
//  ExploreView.swift
//  MirrorHeadspace
//
//  Created by Erica Sampson on 2024-07-29.
//

import SwiftUI

struct ExploreView: View {
    
    let viewModel: ExploreViewModel
    @State private var searchText = ""
    
    var body: some View {
        NavigationStack {
            VStack {
                searchBarView
                ScrollView {
                    VStack {
                        focusAreaGrid
                        collectionList
                    }
                }
                .background(.mainBackground)
                .navigationDestination(for: FocusArea.self) { focusArea in
                    FocusAreaView(focusArea: focusArea)
                }
                .navigationDestination(for: ActivityCollection.self) { collection in
                    ActivityCollectionView(collection: collection)
                }
                .navigationDestination(for: Activity.self) { activity in
                    ActivityDetailView(activity: activity)
                }
            }
            .background(.mainBackground)
            
        }
        .toolbarBackground(.mainBackground, for: .tabBar)
        
    }
    
    private var searchBarView: some View {
        HStack {
            Image(systemName: "magnifyingglass")
                .font(.title2)
                
            TextField("Search",
                      text: $searchText,
                      prompt: Text("Search")
                                .fontWeight(.bold)
                                .foregroundStyle(.mainAccent))
            .foregroundColor(.white)
        }
        .background(.mainBackground)
        .foregroundStyle(.mainAccent)
        .padding(10)
        .padding(.bottom, 15)
    }
    
    private var focusAreaGrid: some View {
        LazyVGrid(columns: [GridItem(.adaptive(minimum: 150, maximum: 400), spacing: 12)]) {
            ForEach(viewModel.focusAreas) { focusArea in
                focusAreaGridItem(for: focusArea)
            }
        }
        .padding(.horizontal, 4)
        .padding(.bottom, 5)
    }
    
    private var collectionList: some View {
        VStack {
            ForEach(viewModel.collections) { collection in
                collectionListItem(for: collection)
            }
        }
    }
    
    private func focusAreaGridItem(for focusArea: FocusArea) -> some View{
        NavigationLink(value: focusArea) {
            ZStack {
                backgroundView(for: focusArea.colorTheme)
                    .frame(maxWidth: .infinity)
                    .containerRelativeFrame(.vertical, count: 19, span: 2, spacing: 0)
                    .padding(0)
                
                Text(focusArea.title)
                    .frame(maxWidth: .infinity)
                    .foregroundStyle(.white)
                    .font(.title3)
                    .fontWeight(.bold)
            }
        }
    }
    
    private func collectionListItem(for collection: ActivityCollection) -> some View {
        
        let randomColor = randomColor()
        
        return NavigationLink(value: collection) {
            ZStack(alignment: .leading) {
                Rectangle()
                    .frame(maxWidth: .infinity)
                    .containerRelativeFrame(.vertical, count: 10, spacing: 0)
                    .cornerRadius(15)
                    .foregroundStyle(randomColor)
                    .padding(.horizontal, 4)
                    .padding(.vertical, 2)
                
                Text(collection.title)
                    .foregroundStyle(randomColor == .yellow ? .black : .white)
                    .font(.headline)
                    .padding(.horizontal, 30)
            }
        }
    }
    
    @ViewBuilder private func backgroundView(for theme: ColorTheme) -> some View {
        switch theme {
        case .orange:
            SunshineBGView(palette: ColorPaletteManager.shared.colorPalette(for: .orange))
        case .purple:
            StarryNightBGView(palette: ColorPaletteManager.shared.colorPalette(for: .purple))
        case .blue:
            CirclesBGView(palette: ColorPaletteManager.shared.colorPalette(for: .blue))
        case .pink:
            TriangleBGView(palette: ColorPaletteManager.shared.colorPalette(for: .pink))
        default:
            SunshineBGView(palette: ColorPaletteManager.shared.colorPalette(for: .orange))
        }
    }
    
    func randomColor() -> Color {
        let selectedColor = ColorTheme.allCases.randomElement()
        
        switch selectedColor {
        case .orange:
            return .orangeMain
        case .purple:
            return .purpleMain
        case .blue:
            return .blueMain
        case .pink:
            return .pinkMain
        case .yellow:
            return .yellow
        case .green:
            return Color(red: 0.2, green: 0.6, blue: 0.4)
        case .none:
            return .blueMain
        }
    }
}

#Preview {
    ExploreView(viewModel: ExploreViewModel(dataService: PreviewHelper.shared))
    
}
