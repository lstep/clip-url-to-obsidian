# clip-url-to-obsidian

Apple QuickAction to capture a URL and title from the active browser tab and append it to your weekly note in Obsidian.

## What is obsidian-clip.scpt?

The `obsidian-clip.scpt` file is an AppleScript that serves as a macOS QuickAction (formerly known as a Workflow). It runs as a standalone AppleScript application or can be triggered via a keyboard shortcut using tools like FastScripts or Keyboard Maestro.

## What It Does

1. **Captures the current URL** from the frontmost browser (Safari, Arc, Chrome, etc.)
2. **Extracts the page title** from the active tab
3. **Formats the entry** as an Obsidian-friendly link with the title
4. **Appends to weekly note** - Automatically finds and appends to your current week's note (e.g., `2024-W03.md`)

## Installation

1. Download or clone this repository
2. Open `obsidian-clip.scpt` in Script Editor (macOS)
3. Configure the `vaultPath` variable to point to your Obsidian vault
4. Save the script
5. (Optional) Set up a keyboard shortcut via System Settings > Keyboard > Shortcuts > Quick Actions, or use a third-party tool like FastScripts

## Usage

With a URL open in your browser:

- **Option 1**: Right-click > Quick Actions > Run Script
- **Option 2**: Use your assigned keyboard shortcut

The script will append the following to your weekly note:

```markdown
- [Page Title](https://example.com)
```

## Requirements

- macOS
- Obsidian
- A weekly note naming convention like `YYYY-W##.md` (configurable in the script)
