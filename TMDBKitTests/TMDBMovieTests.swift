//
//  TMDBMovieTests.swift
//  TMDBKitTests
//
//  Created by Davi Cabral de Oliveira on 29/10/20.
//

import XCTest
@testable import TMDBKit

class TMDBMovieTests: XCTestCase {

    var movie: TMDBMovie?
    
    override func setUp() {
        super.setUp()
        let bundle = Bundle(for: TMDBMovieTests.self)
        if let path = bundle.url(forResource: "MovieMock", withExtension: "json"), let data = try? Data(contentsOf: path, options: .mappedIfSafe) {
            
            let jsonDecoder = JSONDecoder()
            movie = try? jsonDecoder.decode(TMDBMovie.self, from:data)
            
        }
    }
    
    override func tearDown() {
        movie = nil
        super.tearDown()
    }


    func test_movie_parse() {
        XCTAssertNotNil(movie)
    }
    
    func test_movie_posterURL() {
        let url = movie?.posterImage(withSize: .w154)
        XCTAssertNotNil(url)
        let expectedUrl = "https://image.tmdb.org/t/p/w154\(movie!.posterPath!)"
        XCTAssertEqual(url!.absoluteString, expectedUrl)
    }
    
    func test_movie_backdropURL() {
        let url = movie?.backdropImage(withSize: .w780)
        XCTAssertNotNil(url)
        let expectedUrl = "https://image.tmdb.org/t/p/w780\(movie!.backdropPath!)"
        XCTAssertEqual(url!.absoluteString, expectedUrl)
    }
    
    

}
