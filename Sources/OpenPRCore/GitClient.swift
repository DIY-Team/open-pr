//
//  GitClient.swift
//  OpenPR
//
//  Created by Vishal Singh on 22/04/20.
//

import Foundation

enum AccessType: String, CaseIterable {
    case ssh = "git@"
    case https = "https://"
    case unhandled

    static func accessType(from url: String) -> AccessType {
        for accessType in AccessType.allCases {
            if url.hasPrefix(accessType.rawValue) {
                return accessType
            }
        }
        return .unhandled
    }
}

enum GitClient: String, CaseIterable {
    case github = "github.com"
    case bitbucket = "bitbucket.org"
    case unknown
    
    static func clientType(from url: String, accessType: AccessType) -> GitClient {
        for client in GitClient.allCases {
            if url.hasPrefix(accessType.rawValue + client.rawValue) {
                return client
            }
        }
        return .unknown
    }

    var newPRURLComponent: String {
        switch self {
        case .github: return "pull/new/"
        case .bitbucket: return "TO BE UPDATED"
        case .unknown: return ""
        }
    }
}
