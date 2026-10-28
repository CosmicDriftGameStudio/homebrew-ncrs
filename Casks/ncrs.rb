cask "ncrs" do
  version "0.8.0"

  # Both hashes, because Homebrew picks by the machine it runs on: a cask with
  # only one sha256 fails on the other architecture.
  sha256 arm:   "14c17558f8fcd862fff19ad56356afb62ff83ac884edff8dcb5996bd44aa9cd6",
         intel: "7a6654d461e234444616e773d24b219a1c6ee54451c4778319a196f3168bbb19"

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
