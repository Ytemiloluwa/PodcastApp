//
//  EpisodeViewModel.swift
//  PodcastApp
//
//  Created by Temiloluwa on 10/11/2022.
//

import Foundation
import FeedKit

struct EpisodeViewModel: Identifiable {
    
    var id = UUID()
    var title, description: String
    var date: String
    var audioUrl: String
    var audio: Data?
    var audioLength: Double
    var audioSize: String
    var podcast: PodcastViewModel = .placeHolder
    
    static var placeholder: EpisodeViewModel {
        
        createPlaceholder()
    }
    
    static var listPlaceholder: [EpisodeViewModel] {
        
        (0...10).map { _ in
        
            createPlaceholder()
        }
    }

    private static func createPlaceholder() -> EpisodeViewModel {
        
        EpisodeViewModel(title: "Lorem ipsum", description: "Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat.", date:  "20 sept 2020", audio: "", audioLength: 120, audioSize: "13MB", podcast: .placeHolder)
    }
    
    internal init(title: String, description: String, date: String, audio: String, audioLength: Double, audioSize: String, podcast: PodcastViewModel) {
        
        self.title = title
        self.description = description
        self.date = date
        self.audioUrl = audio
        self.audioSize = audioSize
        self.audioLength = audioLength
        self.podcast = podcast

    }
    
    init(downloaded: EpisodeManagedObject, podcast: PodcastViewModel) {
        
        self.id = downloaded.id ?? UUID()
        self.title = downloaded.title ?? ""
        self.description = downloaded.descr ?? ""
        self.date = downloaded.releaseDate?.format() ?? ""
        self.audioUrl = downloaded.sourceAudioUrl ?? ""
        self.audioLength = downloaded.duration
        self.audioSize = downloaded.size ?? ""
        self.audio = downloaded.audio
        self.podcast = podcast
    }

    init(feedItem: RSSFeedItem, podcast: PodcastViewModel) {

        self.title = feedItem.title ?? ""
        self.description = feedItem.description ?? ""
        self.date = feedItem.pubDate.map { $0.format() } ?? ""
        self.audioUrl = feedItem.enclosure?.attributes?.url ?? ""
        self.audioLength = feedItem.iTunes?.iTunesDuration ?? 0
        self.audioSize = feedItem.enclosure?.attributes?.length.map { "\($0 / 1000000)MB" } ?? "0 mb"
        self.podcast = podcast
    }
}
