//
//  LeaderBoardView.swift
//  Slider
//
//  Created by apple on 2022/10/01.
//

import SwiftUI

struct LeaderBoardView: View {
    @Binding var leaderboardIsShowing: Bool
    @Binding var game: Game
    
    var body: some View {
        ZStack {
            Color("backGroundColor")
            VStack(spacing: 10) {
                HeaderView(leaderboardIsShowing: $leaderboardIsShowing)
                LabelView()
                ScrollView {
                    VStack(spacing: 10) {
                        ForEach(game.leaderboardEntries.indices) { i in
                            let leaderboardEntry = game.leaderboardEntries[i]
                            RowView(index: i, score: leaderboardEntry.score, date: leaderboardEntry.date)
                            
                        }
                    }
                }
            }
        }
    }
}

struct RowView: View {
    let index: Int
    let score: Int
    let date: Date
    
    var body: some View {
        HStack {
            RoundedTextView(text: String(index))
            Spacer()
            ScoreText(score: score)
                .frame(width: Constants.Leaderboard.leaderboardScoreColWodth)
            DateText(date: date)
                .frame(width: Constants.Leaderboard.leaderboardDateColWidth)
        }
        .background(
            RoundedRectangle(cornerRadius: .infinity)
                .strokeBorder(Color("LeaderboardRowColor"))
        )
        .padding(.leading)
        .padding(.trailing)
        .frame(maxWidth: Constants.Leaderboard.leaderboardMaxRowWidth)
    }
}

struct HeaderView: View {
    @Binding var leaderboardIsShowing: Bool
    @Environment(\.verticalSizeClass) var verticalSizeClass
    @Environment(\.horizontalSizeClass) var horizontalSizeClass
    var body: some View {
        ZStack {
            HStack {
                if verticalSizeClass == .regular && horizontalSizeClass == .compact {
                    BigBoldTex(text: "Leaderboard")
                        .padding()
                    Spacer()
                } else {
                    BigBoldTex(text: "Leaderboard")
                }
            }
            .padding(.top)
            HStack {
                Spacer()
                Button(action: {
                    leaderboardIsShowing = false
                }
                ) {
                    RoundedImageViewFilled(systemName: "xmark")
                        .padding(.trailing)
                }
            }
        }
    }
}

struct LabelView: View {
    var body: some View {
        HStack {
            Spacer()
                .frame(width: Constants.General.roundViewLength)
            Spacer()
            LabelText(text: "Score")
                .frame(width: Constants.Leaderboard.leaderboardScoreColWodth)
            Spacer()
            LabelText(text: "Date")
                .frame(width: Constants.Leaderboard.leaderboardDateColWidth)
            
        }
        .padding(.leading)
        .padding(.trailing)
        .frame(maxWidth: Constants.Leaderboard.leaderboardMaxRowWidth)
    }
}

struct LeaderBoardView_Previews: PreviewProvider {
    static private var leaderboardIsShowing = Binding.constant(false)
    static private var game = Binding.constant(Game(loadTestData: true))
    static var previews: some View {
        LeaderBoardView(leaderboardIsShowing: leaderboardIsShowing, game: game)
            .preferredColorScheme(.light)
        LeaderBoardView(leaderboardIsShowing: leaderboardIsShowing, game: game)
            .previewLayout(.fixed(width: 568, height: 320))
        LeaderBoardView(leaderboardIsShowing: leaderboardIsShowing, game: game)
            .preferredColorScheme(.dark)
        LeaderBoardView(leaderboardIsShowing: leaderboardIsShowing, game: game)
            .preferredColorScheme(.dark)
            .previewLayout(.fixed(width: 568, height: 320))
    }
}
