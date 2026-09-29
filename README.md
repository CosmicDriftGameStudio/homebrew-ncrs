# homebrew-ncrs

Homebrew tap for [ncrs](https://github.com/CosmicDriftGameStudio/ncrs), a
Norton Commander style dual-panel file manager written in Rust.

```sh
brew tap CosmicDriftGameStudio/ncrs
brew install --cask ncrs
```

The cask is not in [homebrew-cask](https://github.com/Homebrew/homebrew-cask)
upstream. Until it is, this tap is the install path; once it lands upstream,
`brew install --cask ncrs` works without the tap.

## Uninstall

```sh
brew uninstall --cask ncrs
```

`ncrs` writes no preferences or caches, so nothing is left behind. The
`install.sh` path installs into `~/.local/bin` and is not managed by Homebrew —
if you used both, remove the script-installed copy by hand.
