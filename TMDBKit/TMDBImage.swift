//
//  TMDBImage.swift
//  TMDBKit
//
//  Created by Davi Cabral de Oliveira on 29/10/20.
//

import Foundation

protocol TMDBImageRepresentable {
    var value: String { get }
}

extension TMDBImageRepresentable where Self: RawRepresentable, Self.RawValue == String  {
    var value: String {
        return self.rawValue
    }
}

struct TMDBImage {
    private static let imageBaseUrl: String = "https://image.tmdb.org/t/p/"
    
    static func pathFrom(imagePath: String, withSize size: TMDBImageRepresentable) -> URL? {
        return URL(string: "\(imageBaseUrl)\(size.value)\(imagePath)")
    }
}

public enum TMDBPosterSize: String, TMDBImageRepresentable  {
    case w92
    case w154
    case w185
    case w342
    case w500
    case w780
    case original
}

public enum TMDBBackdropSize: String, TMDBImageRepresentable {
    case w300
    case w780
    case w1280
    case original
}

public enum TMDBLogoSize: String, TMDBImageRepresentable {
    case w45
    case w92
    case w154
    case w185
    case w300
    case w500
    case original
}

public enum TMDBProfileSize: String, TMDBImageRepresentable {
    case w45
    case w185
    case h632
    case original
}

public enum TMDBStillSize: String, TMDBImageRepresentable {
    case w92
    case w185
    case w300
    case original
}
