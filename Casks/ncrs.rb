cask "ncrs" do
  version "1.7.0"

  # Both hashes, because Homebrew picks by the machine it runs on: a cask with
  # only one sha256 fails on the other architecture.
  sha256 arm:   "7ac03dd40a081b3e4a475ddb76917431fbd76e5701343cf6e98fdb0e34b0e36c",
         intel: "97d012365b33bd24a015568b7b4d9e555fc5e423b8d0cd37c16d0440173fa9fb"

  # Homebrew's vocabulary is arm/intel; the release names the files after the
  # Rust target triple.
  arch arm: "aarch64", intel: "x86_64"

  url "https://github.com/CosmicDriftGameStudio/ncrs/releases/download/v#{version}/ncrs-#{arch}-apple-darwin.app.zip"
  name "ncrs"
  desc "Keyboard-first dual-panel file manager with Git, SFTP and AI filing"
  homepage "https://github.com/CosmicDriftGameStudio/ncrs"

  livecheck do
    url :url
    strategy :github_latest
  end

  app "ncrs.app"
  # The command-line entry point is the bundle's own binary, so `ncrs` in a
  # terminal and the app in the Dock are the same signed executable.
  binary "#{appdir}/ncrs.app/Contents/MacOS/ncrs"

  zap trash: [
    "~/.config/ncrs",
    "~/Library/Application Support/ncrs",
  ]
end
