import OpenPRCore

let tool = OpenPR()
do {
    try tool.run()
} catch {
    print("Whoops! An error occurred: \(error)")
}
