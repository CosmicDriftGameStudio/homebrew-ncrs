cask "ncrs" do
  version "1.5.1"

  # Both hashes, because Homebrew picks by the machine it runs on: a cask with
  # only one sha256 fails on the other architecture.
  sha256 arm:   "ce372c8cc172357d2d1033beaec436c7de1945bf149a72dda8bcc042db87bcab",
         intel: "7d12d8d87111715334d18f4602d82fea810cb70c98678eb501e3dc641c87cbff"

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
