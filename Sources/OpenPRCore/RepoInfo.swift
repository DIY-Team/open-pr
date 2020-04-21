//
//  RepoInfo.swift
//  OpenPRCore
//
//  Created by Vishal Singh on 22/04/20.
//

import Foundation

struct RepoInfo {
    var remoteURL: String
    var client: GitClient
    var accessType: AccessType
    
    init(with url: String) {
        remoteURL = url.replacingOccurrences(of: ".git", with: "/")
        accessType = AccessType.accessType(from: url)
        client = GitClient.clientType(from: url, accessType: accessType)
    }

    func urlForNewPR(sourceBranch source: String) -> String {
        return remoteURL + client.newPRURLComponent + source
    }
}
