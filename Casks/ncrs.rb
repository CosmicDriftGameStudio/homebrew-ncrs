cask "ncrs" do
  version "1.7.1"

  # Both hashes, because Homebrew picks by the machine it runs on: a cask with
  # only one sha256 fails on the other architecture.
  sha256 arm:   "21dba8d3cc0d18f9260f8ce4ad1a88aa12705156db361c9379efabc22bc0ea60",
         intel: "0a435e655e2054cc9155b8bae93ec0a4d8c30f71fb3674c3aee2c5374b6c2363"

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
