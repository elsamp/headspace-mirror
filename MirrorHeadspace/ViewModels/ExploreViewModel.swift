//
//  ExploreViewModel.swift
//  MirrorHeadspace
//
//  Created by Erica Sampson on 2024-07-31.
//

import Foundation

class ExploreViewModel {
    
    var focusAreas: [FocusArea]
    var collections: [ActivityCollection]
    
    var selectedFocusArea: FocusArea?
    var selectedCollection: ActivityCollection?
    
    init(dataService: FocusAreaDataServiceProtocol) {
        
        let sampleFocusAreas = dataService.getFocusAreas()
        self.focusAreas = sampleFocusAreas
        
        self.collections = [ActivityCollection]()
        
        for focusArea in focusAreas {
            self.collections.append(contentsOf: focusArea.collections)
        }
    }
    
    func didSelect(_ focusArea: FocusArea) {
        selectedFocusArea = focusArea
    }
    
    func didSelect(_ collection: ActivityCollection) {
        selectedCollection = collection
    }

}

