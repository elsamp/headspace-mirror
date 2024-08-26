//
//  ProfileStatsView.swift
//  MirrorHeadspace
//
//  Created by Erica Sampson on 2024-08-09.
//

import SwiftUI

struct ProfileStatsView: View {
    
    let totalMeditationMinutes: Int
    let averageSessionMinutes: Int
    let numberOfSessions: Int
    
    var body: some View {
        VStack(alignment: .leading) {
            Text("Stats")
                .font(.title2)
                .fontWeight(.bold)
                .foregroundStyle(.white)
            
            statRowItem(statText: "\(averageSessionMinutes) minutes", subText: "Average meditation length") {
                HourglassIconView()
            }
            
            statRowItem(statText: totalMeditationMinutes <= 120 ? "\(totalMeditationMinutes) minutes" : "\(totalMeditationMinutes / 60) hours" , subText: "Total meditation time") {
                ClockIconView()
            }
            
            statRowItem(statText: "\(numberOfSessions) sessions", subText: "Sessions completed") {
                Triangle()
                    .rotation(Angle(degrees: 90))
                    .stroke(.green, style: StrokeStyle(lineWidth: 8, lineCap: .round, lineJoin: .round))
                    .fill(.green)
                    .frame(width: 15, height: 13)
            }
            
        }
    }
    
    private func statRowItem(statText: String, subText: String, @ViewBuilder iconView: () -> some View) -> some View {
        HStack {
            iconView()
                .frame(width: 25, height: 25)
                .foregroundStyle(.mainAccent)
            
            VStack(alignment: .leading) {
                Text(statText)
                    .font(.title2)
                    .fontWeight(.bold)
                    .foregroundStyle(.white)
                Text(subText)
                    .font(.subheadline)
                    .foregroundStyle(.mainAccent)
            }
            .padding(.leading, 10)
            Spacer()
        }
    }
}

#Preview {
    ZStack {
        Color.mainBackground
        ProfileStatsView(totalMeditationMinutes: 930, averageSessionMinutes: 18, numberOfSessions: 51)
    }
    .ignoresSafeArea()
}
