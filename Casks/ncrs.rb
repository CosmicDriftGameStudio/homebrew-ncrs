cask "ncrs" do
  version "0.2.1"

  # Both hashes, because Homebrew picks by the machine it runs on: a cask with
  # only one sha256 fails on the other architecture.
  sha256 arm:   "cbcbe8eec64c4b9d5e729401152186ef8679b45c6bd3cdc82a65f82b8cc03535",
         intel: "4de8ec4237a5139112991f510509b34eeb751595d12edbc7942f51ca98c6588f"

  # Homebrew's vocabulary is arm/intel; the release names the files after the
  # Rust target triple.
  arch arm: "aarch64", intel: "x86_64"

  url "https://github.com/CosmicDriftGameStudio/ncrs/releases/download/v#{version}/ncrs-#{arch}-apple-darwin.app.zip"
  name "ncrs"
  desc "Dual-panel file manager inspired by Norton Commander"
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
