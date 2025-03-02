//
//  GameRowView.swift
//  BasketballGames
//
//  Created by Krish Patel on 3/2/25.
//

import SwiftUI

struct GameRowView: View {
    let game: Game
    
    var body: some View {
        HStack {
            VStack(alignment: .leading) {
                Text("UNC vs. \(game.opponent) (\(game.team)'s)")
                    .font(.callout)
                Text(game.date)
                    .font(.caption)
                    .foregroundStyle(.secondary)
            }
            Spacer()
            VStack(alignment: .trailing) {
                Text("\(game.score.unc) - \(game.score.opponent)")
                Text(game.isHomeGame ? "Home" : "Away")
                    .font(.caption)
                    .foregroundStyle(.secondary)
            }
        }
    }
}

#Preview {
    let game = Game(id: 1, opponent: "Duke", team: "Men", isHomeGame: true, date: "3/2/25", score: Score(unc: 10, opponent: 5))
    List {
        GameRowView(game: game)
    }
}
