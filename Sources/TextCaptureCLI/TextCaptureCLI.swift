import AppKit
import ArgumentParser
import TextCaptureServer

@main
struct TextCaptureCLI: ParsableCommand {
  static var configuration = CommandConfiguration(
    commandName: "text-capture",
    abstract: "Extract text in target language from shared screen."
  )

  @Flag(name: .shortAndLong, help: "Open the server in the default browser.")
  var open: Bool = false

  @Option(name: .shortAndLong, help: "The port to run the server on.")
  var port: Int = 4444

  @Option(name: [.short, .customLong("client-url")], help: "The URL of the client.")
  var clientUrl = "https://textcapture.surge.sh"

  internal func createClientUrl(client: String, server: String) -> URL? {
    if let url = URL(string: client), var components = URLComponents(url: url, resolvingAgainstBaseURL: false) {
      components.queryItems = [URLQueryItem(name: "server", value: server)]
      return components.url
    }
    return nil
  }

  internal func createServer(clientUrl: URL? = nil) -> TextCaptureServer {
    if let url = clientUrl {
      return TextCaptureServer(clientUrl: url)
    } else {
      return TextCaptureServer()
    }
  }

  mutating func run() throws {
    let semaphore = DispatchSemaphore(value: 0)
    do {
      let serverUrl = "http://localhost:\(port)"
      let clientUrl = self.createClientUrl(client: self.clientUrl, server: serverUrl)
      let server = createServer(clientUrl: clientUrl)
      try server.start(port: port)
      print("Running at \(serverUrl)")
      if let clientUrl = clientUrl {
        print("Client at \(clientUrl.absoluteString)")
        if open {
          NSWorkspace.shared.open(clientUrl)
        }
      }
      semaphore.wait()
    } catch {
      semaphore.signal()
      print("Error: \(error.localizedDescription)")
    }
  }
}
