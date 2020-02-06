import Foundation

public final class OpenPRCore {
    private let arguments: [String]

    public init(arguments: [String] = CommandLine.arguments) {
        self.arguments = arguments
    }
    
    public func run() throws {
//        let bash = Bash()
//        let projectName = Folder.current.name
//        let scriptName: String
//        if CommandLine.arguments.count > 1 {
//            scriptName = CommandLine.arguments[1]
//        } else {
//            scriptName = "unknown"
//        }
//
//        _ = bash.execute(commandName: "swift", arguments: ["build", "-c", "release"])
//        _ = bash.execute(commandName: "cd", arguments: [".build/release"])
//        _ = bash.execute(commandName: "cp", arguments: ["-f", projectName, "/usr/local/bin/\(scriptName)"])
//        print("Installed \(projectName) as \(scriptName)")
        // git remote get-url --push origin
        let bash = Bash()
        guard let currentRemoteURL = bash.execute(commandName: "git", arguments: ["remote", "get-url", "--push", "origin"])?.trimmingCharacters(in: NSCharacterSet.newlines) else { return }
        print(currentRemoteURL)
//        guard let branchName = bash.execute(commandName: "git", arguments: ["rev-parse", "--abbrev-ref", "HEAD"])?.trimmingCharacters(in: NSCharacterSet.newlines) else {
//            return
//        }
//        if CommandLine.argc < 2 {
//            let commitMessage = "\(branchName) no message"
//            print(bash.execute(commandName: "git", arguments: ["commit", "-m", commitMessage]) ?? "")
//        } else {
//            var message = CommandLine.arguments
//            message.remove(at: 0)
//            let commitMessage = "\(branchName) \(message.joined(separator: " "))"
//            print(bash.execute(commandName: "git", arguments: ["commit", "-m", commitMessage]) ?? "")
//        }
//
    }
}

