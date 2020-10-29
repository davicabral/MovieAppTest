//
//  TMDBImageTests.swift
//  TMDBKitTests
//
//  Created by Davi Cabral de Oliveira on 28/10/20.
//

import XCTest
@testable import TMDBKit

class TMDBImageTests: XCTestCase {
    
    func test_urlCreation_TMDBPosterSize() {
        let url92 = TMDBImage.pathFrom(imagePath: "/test.jpg", withSize: TMDBPosterSize.w92)
        XCTAssertNotNil(url92)
        XCTAssertEqual(url92!.absoluteString, "https://image.tmdb.org/t/p/w92/test.jpg")
        
        let url154 = TMDBImage.pathFrom(imagePath: "/test.jpg", withSize: TMDBPosterSize.w154)
        XCTAssertNotNil(url154)
        XCTAssertEqual(url154!.absoluteString, "https://image.tmdb.org/t/p/w154/test.jpg")
        
        let url185 = TMDBImage.pathFrom(imagePath: "/test.jpg", withSize: TMDBPosterSize.w185)
        XCTAssertNotNil(url185)
        XCTAssertEqual(url185!.absoluteString, "https://image.tmdb.org/t/p/w185/test.jpg")
        
        let url342 = TMDBImage.pathFrom(imagePath: "/test.jpg", withSize: TMDBPosterSize.w342)
        XCTAssertNotNil(url342)
        XCTAssertEqual(url342!.absoluteString, "https://image.tmdb.org/t/p/w342/test.jpg")
        
        let url500 = TMDBImage.pathFrom(imagePath: "/test.jpg", withSize: TMDBPosterSize.w500)
        XCTAssertNotNil(url500)
        XCTAssertEqual(url500!.absoluteString, "https://image.tmdb.org/t/p/w500/test.jpg")
        
        let url780 = TMDBImage.pathFrom(imagePath: "/test.jpg", withSize: TMDBPosterSize.w780)
        XCTAssertNotNil(url780)
        XCTAssertEqual(url780!.absoluteString, "https://image.tmdb.org/t/p/w780/test.jpg")
        
        let urlOriginal = TMDBImage.pathFrom(imagePath: "/test.jpg", withSize: TMDBPosterSize.original)
        XCTAssertNotNil(urlOriginal)
        XCTAssertEqual(urlOriginal!.absoluteString, "https://image.tmdb.org/t/p/original/test.jpg")
        
    }
}
