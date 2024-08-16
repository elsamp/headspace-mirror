//
//  ActivityCollectionView.swift
//  MirrorHeadspace
//
//  Created by Erica Sampson on 2024-08-15.
//

import SwiftUI

struct ActivityCollectionCardStackView: View {

    var collections: [ActivityCollection]
    
    var body: some View {
        ScrollView {
            VStack(alignment: .leading, spacing: 20) {
                
                ForEach(collections) { collection in
                    NavigationLink(value: collection) {
                        collectionCard(for: collection)
                    }
                }
            }
        }
        .frame(maxWidth: .infinity)
        .background(.mainBackground)
    }
    
    func collectionCard(for collection: ActivityCollection) -> some View {
        ZStack {
            RoundedRectangle(cornerRadius: 20)
                .fill(.mainCardBackground)
            
            HStack {
                VStack(alignment: .leading) {
                    Text(collection.title)
                        .multilineTextAlignment(.leading)
                        .foregroundStyle(.white)
                        .font(.subheadline)
                        .fontWeight(.bold)
                        .padding(.bottom, 5)
                    
                    Text(collection.description)
                        .multilineTextAlignment(.leading)
                        .foregroundStyle(.lightGrey)
                        .font(.caption)
                }
                Spacer()
                Group{
                    Image(systemName: "photo")
                        .resizable()
                        .scaledToFit()
                        .foregroundStyle(.mainAccent)
                }
                .containerRelativeFrame(.horizontal, count: 5, spacing: 0, alignment: .trailing)
                .padding(.leading, 20)
            }
            .padding(20)
        }
    }
    
    
}

#Preview {
    ActivityCollectionCardStackView(collections: [PreviewHelper.shared.exampleCollection(), PreviewHelper.shared.exampleCollection()])
}
