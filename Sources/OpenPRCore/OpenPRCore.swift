import Foundation

public final class OpenPR {
    private let arguments: [String]

    public init(arguments: [String] = CommandLine.arguments) {
        self.arguments = arguments
    }
    
    public func run() throws {
        let bash = Bash()
        guard let currentRemoteURL = bash.execute(commandName: "git", arguments: ["remote", "get-url", "--push", "origin"])?.trimmingCharacters(in: NSCharacterSet.newlines) else { return }
        guard let branchName = bash.execute(commandName: "git", arguments: ["rev-parse", "--abbrev-ref", "HEAD"])?.trimmingCharacters(in: NSCharacterSet.newlines) else {
            return
        }
        let repoInfo = RepoInfo(with: currentRemoteURL)
        let urlForNewPR = repoInfo.urlForNewPR(sourceBranch: branchName)
        print("redirecting to : \(urlForNewPR)")
        let _ = bash.execute(commandName: "open", arguments: [urlForNewPR])
    }
}

