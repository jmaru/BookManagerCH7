//
//  ReadingStatus.swift
//  BookManagerCH7
//
//  Created by Jorge Gabriel Marin Urias on 4/6/26.
//

enum ReadingStatus: String, CaseIterable {
    case planToRead = "Plan to read"
    case reading = "Reading"
    case dropped = "Dropped"
    case finished = "Finished"
    // Base case
    case unknown = "Unknown"
}
