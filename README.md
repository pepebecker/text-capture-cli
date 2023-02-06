# Text Capture CLI
A command-line interface for the text-capture-server package. This package allows you to extract text in target language from a shared screen.

# Installation
```sh
brew tap pepebecker/tap
brew install text-capture
```

# Usage
```sh
USAGE: text-capture [--open] [--port <port>] [--client-url <client-url>]

OPTIONS:
  -o, --open              Open the server in the default browser.
  -p, --port <port>       The port to run the server on. (default: 4444)
  -c, --client-url <client-url>
                          The URL of the client. (default: https://textcapture.surge.sh)
  -h, --help              Show help information.
```

# Example
To start the server with the default port and open the client in the default browser:
```sh
text-capture --open
```

To start the server with a custom port and not open the client in the browser:
```sh
text-capture --port 8080
```

## Contributing

If you **have a question**, **found a bug** or want to **propose a feature**, have a look at [the issues page](https://github.com/pepebecker/text-capture-cli/issues).
