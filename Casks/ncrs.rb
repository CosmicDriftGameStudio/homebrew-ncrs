cask "ncrs" do
  # A single executable, not an .app bundle: ncrs is a terminal-style file
  # manager drawn with iced, and there is no window bundle to put in
  # /Applications. The cask therefore links the binary into the Homebrew
  # prefix, and `brew uninstall` removes exactly that one file.
  version "0.2.0"

  # Both hashes, because Homebrew picks by the machine it runs on: a cask with
  # only one sha256 fails on the other architecture, and the failure only shows
  # up on a machine the author does not own.
  sha256 arm:   "80dc908441e81def958c2c4b32e4e4ed36368364c634b0189d170043f3b834f7",
         intel: "5f1463049d42d7da46507a26416ca5361351b2635fda14bbcd9bdca28a569692"

  # Homebrew's vocabulary is arm/intel; the release names the files after the
  # Rust target triple, so the mapping is explicit. Without it the cask asks
  # for ncrs-arm-apple-darwin.tar.gz and 404s on every machine.
  arch arm: "aarch64", intel: "x86_64"

  url "https://github.com/CosmicDriftGameStudio/ncrs/releases/download/v#{version}/ncrs-#{arch}-apple-darwin.tar.gz",
      verified: "github.com/CosmicDriftGameStudio/ncrs/"
  name "ncrs"
  desc "Norton Commander style dual-panel file manager"
  homepage "https://github.com/CosmicDriftGameStudio/ncrs"

  livecheck do
    url :url
    strategy :github_latest
  end

  binary "ncrs-#{arch}-apple-darwin/ncrs"

  # No zap stanza on purpose. The app writes no preferences, no caches and no
  # support files, so there is nothing `brew uninstall` would leave behind. The
  # install.sh path installs into ~/.local/bin and is not managed by Homebrew;
  # mixing the two is the user's choice, and `brew uninstall --cask ncrs`
  # removes only what Homebrew installed.
end
