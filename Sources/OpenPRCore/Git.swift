//
//  Git.swift
//  CommitWithBranchName
//
//  Created by Vishal Singh on 24/04/20.
//

import Foundation
import RunsShellCommand

enum Git: AnyShellCommand {
    case currentBranchName
    case remoteURL
    
    var command: String {
        get {
            return "git"
        }
        set {}
    }
    
    var defaultArguments: [String] {
        get {
            switch self {
            case .currentBranchName: return ["rev-parse", "--abbrev-ref", "HEAD"]
            case .remoteURL: return ["remote", "get-url", "--push", "origin"]
            }
        }
        set {}
    }
}

enum Command: AnyShellCommand {
    case openURL

    var command: String {
        get {
            return "open"
        }
        set {}
    }
}
