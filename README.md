# Monokai Pro for Xcode

A collection of Monokai Pro color themes packaged for Xcode, now distributable through the Swift Package Manager and accompanied by a Swift installer script.

Original color themes by [Monokai Pro](https://monokai.pro).

## Themes

The package includes the following variants:

- Monokai Classic
- Monokai Light
- Monokai Light (Filter Sun)
- Monokai Pro
- Monokai Pro (Filter Machine)
- Monokai Pro (Filter Octagon)
- Monokai Pro (Filter Ristretto)
- Monokai Pro (Filter Spectrum)

## Preview

<table>
  <tr>
    <td align="center">
      <img src="Preview/Monokai%20Pro%20Preview.png" alt="Monokai Pro" width="320"/><br/>
      <sub>Monokai Pro</sub>
    </td>
    <td align="center">
      <img src="Preview/Monokai%20Pro%20(Filter%20Machine)%20Preview.png" alt="Monokai Pro (Filter Machine)" width="320"/><br/>
      <sub>Monokai Pro (Filter Machine)</sub>
    </td>
    <td align="center">
      <img src="Preview/Monokai%20Pro%20(Filter%20Octagon)%20Preview.png" alt="Monokai Pro (Filter Octagon)" width="320"/><br/>
      <sub>Monokai Pro (Filter Octagon)</sub>
    </td>
    <td align="center">
      <img src="Preview/Monokai%20Pro%20(Filter%20Restretto)%20Preview.png" alt="Monokai Pro (Filter Ristretto)" width="320"/><br/>
      <sub>Monokai Pro (Filter Ristretto)</sub>
    </td>
  </tr>
  <tr>
    <td align="center">
      <img src="Preview/Monokai%20Pro%20(Filter%20Spectrum)%20Preview.png" alt="Monokai Pro (Filter Spectrum)" width="320"/><br/>
      <sub>Monokai Pro (Filter Spectrum)</sub>
    </td>
    <td align="center">
      <img src="Preview/Monokai%20Preview.png" alt="Monokai Classic" width="320"/><br/>
      <sub>Monokai Classic</sub>
    </td>
    <td align="center">
      <img src="Preview/Monokai%20Light%20Preview.png" alt="Monokai Light" width="320"/><br/>
      <sub>Monokai Light</sub>
    </td>
    <td align="center">
      <img src="Preview/Monokai%20Light%20(Filter%20Sun)%20Preview.png" alt="Monokai Light (Filter Sun)" width="320"/><br/>
      <sub>Monokai Light (Filter Sun)</sub>
    </td>
  </tr>
</table>

## Installation

### Swift Package Manager

```
# Clone the repository
$ git clone https://github.com/inekipelov/monokai-pro-xcode.git
$ cd monokai-pro-xcode

# Run the installer
$ swift run monokai-pro-xcode
```

By default the installer copies all bundled themes to:

```
~/Library/Developer/Xcode/UserData/FontAndColorThemes
```

#### Options

- `--destination <path>` – copy the themes to a custom directory.
- `--dry-run` – list the actions without copying files.
- `--help`/`-h` – show the help message.

### Manual Installation

1. Copy the `.xccolortheme` files from `Sources/MonokaiProXcode/Themes`.
2. Paste them into `~/Library/Developer/Xcode/UserData/FontAndColorThemes`.
3. Restart Xcode and select the theme in **Preferences → Themes**.
