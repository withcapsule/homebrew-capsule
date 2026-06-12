# homebrew-capsule

This is the repository hosting the Homebrew tap for [Capsule](https://github.com/withcapsule/CLI), an installable CLI for the Capsule file transfer service.

## Installation

Installation is as simple as:
```zsh
brew tap withcapsule/capsule
brew install capsule
```

Installs a pre-built binary for your platform (macOS arm64/x86_64, Linux arm64/x86_64).

### Build from source

If you'd like to compile from source instead
1. Install [Rust](https://www.rust-lang.org/tools/install)
2. Clone the CLI repository
3. Run `cargo build` from within `CLI/`

## Shell completions

The formula should install zsh, bash, and fish completions. If `capsule <tab>` doesn't show subcommands after installing, follow the steps below for your shell.

### zsh

Your `~/.zshrc` needs two things, in this order:

1. Homebrew's shell environment (adds its completion directory to `$fpath`):
```zsh
eval "$(/opt/homebrew/bin/brew shellenv)"
```

2. zsh's completion system initialised **after** the above:
```zsh
autoload -Uz compinit && compinit
```

A bit off topic, but if you use other tools like `uv` or `fnm`, make sure `compinit` comes **before** their completion lines, since they call `compdef` internally which requires the completion system to already be loaded:
```zsh
autoload -Uz compinit && compinit
eval "$(uv generate-shell-completion zsh)"   # if you use uv
eval "$(fnm completions --shell zsh)"         # if you use fnm
```
That was kind of an annoying hassle for me at first. Before this, I didn't really bother with fixing terminal completions on other Rust-based CLIs.

After editing `~/.zshrc`, rebuild the completion cache:
```zsh
rm -f ~/.zcompdump* && exec zsh
```
