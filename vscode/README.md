// TODO make vscode setup as this guy: https://github.com/benmatselby/dotfiles/tree/main/vscode

## Keybindings

```json
// Place your key bindings in this file to override the defaults
[
    {
        "key":     "ctrl+`",
        "command": "workbench.action.terminal.focus"
    },
    {
        "key":     "ctrl+`",
        "command": "workbench.action.focusActiveEditorGroup",
        "when":    "terminalFocus"
    }
]
```