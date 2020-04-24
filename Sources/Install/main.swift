import InstallSwiftScriptCore

let arguments = CommandLine.arguments

var target: String = "OpenPR" // default target
var commandName: String = "open-pr"

if arguments.count > 2 {
    // both target and command name provided
    target = arguments[1]
    commandName = arguments[2]
} else if arguments.count == 2 {
    // assuming it is the expected command name
    commandName = arguments[1]
}

let tool = InstallSwiftScript(arguments: [arguments.first ?? "", target, commandName])

do {
    try tool.run()
} catch {
    print("Whoops! An error occurred: \(error)")
}
