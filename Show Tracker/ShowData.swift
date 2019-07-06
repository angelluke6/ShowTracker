//
//  File.swift
//  Show Tracker
//
//  Created by Jason Kornfield on 7/5/19.
//  Copyright © 2019 AJ inc. Designs. All rights reserved.
//

import Foundation

class ShowData {
    let showTitle : String?
    let season : String?
    let episode : String?
    let done : Bool
    init(showTitle: String?, season: String?, episode: String?, done: Bool) {
        self.showTitle = showTitle
        self.season = season
        self.episode = episode
        self.done = done
        
    }
}
