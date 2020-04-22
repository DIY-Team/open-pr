import OpenPRCore

let arguments = CommandLine.arguments

// execute installation if the command arguments contain --install
if arguments.count > 1, arguments[1] == "--install" {
    let tool = InstallOpenPR(arguments: arguments)
    do {
        try tool.run()
    } catch {
        print("Whoops! An error occurred: \(error)")
    }
} else {
    // Execute core functionaliy
    let tool = OpenPR()
    do {
        try tool.run()
    } catch {
        print("Whoops! An error occurred: \(error)")
    }
}
