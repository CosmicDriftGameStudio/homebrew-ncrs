cask "ncrs" do
  version "1.8.0"

  # Both hashes, because Homebrew picks by the machine it runs on: a cask with
  # only one sha256 fails on the other architecture.
  sha256 arm:   "11ff119f36dcbb15c837145c947dc6aee1f20bc3f482350d9e9efb12356bb469",
         intel: "57ab9d20a08ac2982782f43a333edcd17ee6b336f64d2959012e643e6a9c7f47"

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
