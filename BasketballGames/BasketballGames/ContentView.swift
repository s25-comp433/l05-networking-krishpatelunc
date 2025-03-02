//
//  ContentView.swift
//  BasketballGames
//
//  Created by Samuel Shi on 2/27/25.
//

import SwiftUI

struct Game: Codable, Identifiable {
    let id: Int
    let opponent: String
    let team: String
    let isHomeGame: Bool
    let date: String
    let score: Score
}

struct Score: Codable {
    let unc: Int
    let opponent: Int
}

struct ContentView: View {
    @State private var games = [Game]()
    var body: some View {
        NavigationStack {
            List(games) { game in
                GameRowView(game: game)
            }
            .navigationTitle("UNC Basketball")
            .task {
                await loadData()
            }
        }
    }
    
    func loadData() async {
        let url = URL(string: "https://api.samuelshi.com/uncbasketball")!
        do {
            let (data, _) = try await URLSession.shared.data(from: url)
            let decodedResp = try JSONDecoder().decode([Game].self, from: data)
            games = decodedResp
        } catch {
            print("Failed to fetch and decode basket ball data")
        }
    }
}

#Preview {
    ContentView()
}
