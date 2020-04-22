import InstallSwiftScriptCore

public final class InstallOpenPR {
    private let arguments: [String]

    public init(arguments: [String] = CommandLine.arguments) {
        self.arguments = arguments
    }
    
    public func run() throws {
        let projectName = "OpenPR"
        let toolName: String
        if self.arguments.count > 2 {
            toolName = arguments[2]
        } else {
            toolName = "open-pr"
        }
        let tool = InstallSwiftScript(arguments: [arguments.first ?? "", projectName, toolName])

        do {
            try tool.run()
        } catch {
            print("Whoops! An error occurred: \(error)")
        }
    }
}



