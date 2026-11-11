cask "ncrs" do
  version "1.4.1"

  # Both hashes, because Homebrew picks by the machine it runs on: a cask with
  # only one sha256 fails on the other architecture.
  sha256 arm:   "c0549fe6ac31b55a67ab6fb0f6c99ae4a8ea8d74e8c8a9b8806f958b0e9fd4ff",
         intel: "7cfa0f4e522cf98b71794ba2fff48841101267519f7a4efa1389f45031822b01"

  # Homebrew's vocabulary is arm/intel; the release names the files after the
  # Rust target triple.
  arch arm: "aarch64", intel: "x86_64"

  url "https://github.com/CosmicDriftGameStudio/ncrs/releases/download/v#{version}/ncrs-#{arch}-apple-darwin.app.zip"
  name "ncrs"
  desc "Fast, keyboard-first dual-panel file manager"
  homepage "https://github.com/CosmicDriftGameStudio/ncrs"

  livecheck do
    url :url
    strategy :github_latest
  end

  app "ncrs.app"
  # The command-line entry point is the bundle's own binary, so `ncrs` in a
  # terminal and the app in the Dock are the same signed executable.
  binary "#{appdir}/ncrs.app/Contents/MacOS/ncrs"

  # No zap stanza: the app writes no preferences, caches or support files.
end
