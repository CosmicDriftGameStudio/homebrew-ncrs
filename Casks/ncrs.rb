cask "ncrs" do
  version "1.1.1"

  # Both hashes, because Homebrew picks by the machine it runs on: a cask with
  # only one sha256 fails on the other architecture.
  sha256 arm:   "aac7f4fe83dc39b4c061b834de780e85bf5d39cf093e44ee597f20f228dffcd2",
         intel: "5b57c6dca648cba283fa93fdbed1292c9d5045b5cfcfece58407fdd21c96f314"

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
