//
//  PodcastViewModel.swift
//  PodcastApp
//
//  Created by Temiloluwa on 11/11/2022.
//

import Foundation
import FeedKit

struct PodcastViewModel: Identifiable, Equatable {
    
    static func == (lhs: PodcastViewModel, rhs: PodcastViewModel) -> Bool {
        return lhs.id == rhs.id &&
        lhs.language == rhs.language &&
        lhs.episodes.count == rhs.episodes.count &&
        lhs.image.count == rhs.image.count &&
        lhs.thumbnail.count == rhs.thumbnail.count
    }
    
    var id: Int
    var title: String
    var publisher: String = ""
    var imageUrl: String
    var thumbnailUrl: String = ""
    var image = Data()
    var thumbnail = Data()
    var author: String = ""
    var totalEpisodes: Int
    var explicitContent: String
    var description: String
    var date: String = ""
    var language: String?
    var country: String
    var genres: [String] = []
    var episodes: [EpisodeViewModel] = []
    var nextEpiosdePubDate: Date
    var feedUrl: String
    var isBookmarked = false
    static var placeHolder: PodcastViewModel {
        
        createPlaceholder(id: 0)

    }
    
    static var listPlaceholder: [PodcastViewModel] {
        
        (0..<10).map {
            
            createPlaceholder(id: $0)
        }
    }
    
    private static func createPlaceholder(id: Int) -> PodcastViewModel {
        
        PodcastViewModel(id: id, title: "Lorem ipsum", imageUrl: "", totalEpisodes: 23, explicitContent: "NO", description: "Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.", country: "NG", nextEpiosdePubDate: Date(), feedUrl: "")
    }
    
}
