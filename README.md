The final prompt can be customized to match the preferred terminal style.

### Installation

### 1\. Clone the repository

### 2\. Enter the project directory

### 3\. Make the installer executable

### 4\. Run the installer

### 5\. Reload Bash

The installer will guide through the available customization options.

### Configuration

During installation, the following options can be configured:

### Prompt identity

* Username

* User icon

* Directory icon

* Arrow icon

* Prompt icon

* Prompt symbol

### Prompt colors

Each prompt element can have its own color.

Supported ANSI colors include:

### Themes

JINX PS1 includes several built-in themes:

| Theme       | Description                         |
| ----------- | ----------------------------------- |
| JINX Cyan   | Default cyan-focused style          |
| Dracula     | Dark purple and pink inspired style |
| Tokyo Night | Blue and violet inspired style      |
| Gruvbox     | Warm retro terminal style           |
| Nord        | Cool blue and muted style           |
| Custom      | Fully customizable prompt           |

### Bash Configuration

The installer adds a marked JINX PS1 block to `.bashrc`:

The marked block makes it easier to safely reinstall or update the prompt without repeatedly adding duplicate configuration.

Before modifying `.bashrc`, the installer creates a backup.

Example backup:

### Reinstallation

Run the installer again:

The existing JINX PS1 configuration block will be replaced instead of duplicated.

A new backup of `.bashrc` will be created before changes are applied.

### Project Structure

### Troubleshooting

### Prompt does not change

Reload `.bashrc`:

Or restart the terminal.

### Icons appear as boxes

Install and use a Nerd Font.

Recommended fonts include:

* JetBrainsMono Nerd Font

* FiraCode Nerd Font

* Hack Nerd Font

* MesloLGS Nerd Font

The terminal must also be configured to use the installed font.

### Colors look incorrect

Make sure the terminal supports ANSI colors and true-color output.

Check the terminal environment:

### Prompt appears duplicated

Run the installer again to replace the existing JINX PS1 block.

If needed, restore the previous `.bashrc` backup:

### Removing JINX PS1

Open `.bashrc`:

Remove the section between:

and:

Then reload Bash:

### Roadmap

* More built-in themes

* Live prompt preview

* Configuration file support

* Import and export settings

* Automatic Nerd Font detection

* Multiple prompt layouts

* Git branch and Git status support

* Optional system information

* Optional Fastfetch integration

* Improved Termux support
