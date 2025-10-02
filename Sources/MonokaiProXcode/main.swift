import Foundation

struct Options {
    var destination: URL
    var dryRun: Bool
}

enum InstallerError: Error, CustomStringConvertible {
    case missingResourceBundle
    case missingThemesDirectory(URL)
    case invalidArgument(String)

    var description: String {
        switch self {
        case .missingResourceBundle:
            return "Unable to locate bundled themes."
        case .missingThemesDirectory(let url):
            return "Themes directory not found at \(url.path)."
        case .invalidArgument(let argument):
            return "Invalid argument: \(argument)."
        }
    }
}

@discardableResult
func parseOptions() throws -> Options {
    let defaultDestination = FileManager.default
        .homeDirectoryForCurrentUser
        .appendingPathComponent("Library/Developer/Xcode/UserData/FontAndColorThemes")

    var destination = defaultDestination
    var dryRun = false

    var arguments = CommandLine.arguments.dropFirst()
    while let argument = arguments.first {
        arguments = arguments.dropFirst()
        switch argument {
        case "--destination":
            guard let value = arguments.first else {
                throw InstallerError.invalidArgument("--destination requires a path")
            }
            arguments = arguments.dropFirst()
            destination = URL(fileURLWithPath: value).standardizedFileURL
        case "--dry-run":
            dryRun = true
        case "--help", "-h":
            printUsage()
            exit(0)
        default:
            throw InstallerError.invalidArgument(argument)
        }
    }

    return Options(destination: destination, dryRun: dryRun)
}

func printUsage() {
    let executable = URL(fileURLWithPath: CommandLine.arguments.first ?? "installer")
        .lastPathComponent
    print("Usage: \(executable) [--destination <path>] [--dry-run]")
    print("\nInstalls all bundled Monokai Pro Xcode color themes.")
    print("\nOptions:")
    print("  --destination <path>  Override the destination directory")
    print("  --dry-run             Preview actions without copying files")
    print("  -h, --help            Show this message")
}

func locateThemesDirectory() throws -> URL {
    guard let resourceURL = Bundle.module.resourceURL else {
        throw InstallerError.missingResourceBundle
    }

    let themesURL = resourceURL.appendingPathComponent("Themes", isDirectory: true)
    guard FileManager.default.fileExists(atPath: themesURL.path) else {
        throw InstallerError.missingThemesDirectory(themesURL)
    }
    return themesURL
}

func installThemes(from sourceDirectory: URL, options: Options) throws {
    let fm = FileManager.default

    if !options.dryRun {
        try fm.createDirectory(at: options.destination, withIntermediateDirectories: true)
    }

    let themes = try fm.contentsOfDirectory(
        at: sourceDirectory,
        includingPropertiesForKeys: nil,
        options: [.skipsHiddenFiles]
    ).filter { $0.pathExtension == "xccolortheme" }

    if themes.isEmpty {
        print("No themes found to install at \(sourceDirectory.path)")
        return
    }

    for theme in themes {
        let destination = options.destination.appendingPathComponent(theme.lastPathComponent)
        if options.dryRun {
            print("Would copy \(theme.lastPathComponent) to \(destination.path)")
            continue
        }

        if fm.fileExists(atPath: destination.path) {
            try fm.removeItem(at: destination)
        }

        try fm.copyItem(at: theme, to: destination)
        print("Installed \(theme.lastPathComponent)")
    }
}

func runInstaller() {
    do {
        let options = try parseOptions()
        let themesDirectory = try locateThemesDirectory()
        try installThemes(from: themesDirectory, options: options)
        if options.dryRun {
            print("Dry run completed. No files were written.")
        } else {
            print("All themes installed to \(options.destination.path)")
        }
    } catch {
        fputs("Error: \(error)\n", stderr)
        printUsage()
        exit(1)
    }
}

runInstaller()
