import AppKit

private let openerPath = FileManager.default.homeDirectoryForCurrentUser
  .appendingPathComponent(".bin/tmux-nvim-open")

private func openInTmuxNvim(_ paths: [String]) {
  for path in paths {
    let process = Process()
    process.executableURL = openerPath
    process.arguments = [path]

    do {
      try process.run()
      process.waitUntilExit()
    } catch {
      let alert = NSAlert(error: error)
      alert.messageText = "Nvim Link could not run tmux-nvim-open"
      alert.runModal()
    }
  }
}

final class AppDelegate: NSObject, NSApplicationDelegate {
  func application(_ application: NSApplication, openFiles filenames: [String]) {
    openInTmuxNvim(filenames)
    application.reply(toOpenOrPrint: .success)
    application.terminate(nil)
  }

  func application(_ application: NSApplication, open urls: [URL]) {
    openInTmuxNvim(urls.filter(\.isFileURL).map(\.path))
    application.terminate(nil)
  }

  func applicationDidFinishLaunching(_ notification: Notification) {
    NSApp.setActivationPolicy(.accessory)
  }
}

let application = NSApplication.shared
let delegate = AppDelegate()
application.delegate = delegate
application.run()
