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
        if accessType == .ssh {
            /// for ssh accesses the PR URL is https only, so, modifying accordingly here
            /// e.g. git@github.com:Organization/repo/ is changed to:
            /// https://github.com/Organisation/repo/
            /// and then the new PR components are added furhter
            let baseURL = remoteURL.replacingOccurrences(of: accessType.rawValue + client.rawValue + ":", with: AccessType.https.rawValue + client.rawValue + "/")
            return baseURL + client.newPRURLComponent + source
        } else {
            return remoteURL + client.newPRURLComponent + source
        }
    }
}
