# homebrew-beecon

Homebrew tap for [Beecon](https://github.com/beeconsh/cli).

## Install

```bash
brew tap beeconsh/beecon
brew install beecon
```

## Upgrade

```bash
brew upgrade beecon
```

## Supported Platforms

- macOS (Apple Silicon / arm64)
- macOS (Intel / amd64)
- Linux (arm64)
- Linux (amd64)

## Release Process

The formula is updated automatically when a new release is published in [beeconsh/cli](https://github.com/beeconsh/cli). The `update-formula` workflow downloads release artifacts, computes SHA256 checksums, and commits the updated formula.

Manual trigger:

```bash
gh workflow run update-formula.yml -f version=X.Y.Z
```

## Development

- Release artifacts must follow the naming convention: `beecon_{os}_{arch}.tar.gz`
- Tags must use v-prefixed semver (e.g., `v0.1.0`)
- Each tarball must contain a single binary named `beecon` at the root
