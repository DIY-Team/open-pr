//
//  GitClient.swift
//  OpenPR
//
//  Created by Vishal Singh on 22/04/20.
//

import Foundation

struct RepoInfo {
    var remoteURL: String
    var client: GitClient
    var accessType: AccessType
    
    init(with url: String) {
        remoteURL = url
        accessType = AccessType.accessType(from: url)
        client = GitClient.clientType(from: url, accessType: accessType)
    }
}

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
    
    func urlForNewPullRequest(sourceBranch: String) -> String {
        return ""
    }
    
    static func clientType(from url: String, accessType: AccessType) -> GitClient {
        for client in GitClient.allCases {
            if url.hasPrefix(accessType.rawValue + client.rawValue) {
                return client
            }
        }
        return .unknown
    }
}
