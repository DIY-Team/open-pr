import Foundation

public final class OpenPR {
    private let arguments: [String]

    public init(arguments: [String] = CommandLine.arguments) {
        self.arguments = arguments
    }
    
    public func run() throws {
        openNewPRURL()
    }
    
    private func openNewPRURL() {
        Git.remoteURL.execute(onSuccess: { remoteURL in
            Git.currentBranchName.execute(onSuccess: { currentBranchName in
                let url = RepoInfo(with: remoteURL).urlForNewPR(sourceBranch: currentBranchName)
                print("redirecting to : \(url)")
                Command.openURL.execute(with: [url])
            })
        })
    }
}

