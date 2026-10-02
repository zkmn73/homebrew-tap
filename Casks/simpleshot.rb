cask "simpleshot" do
  version "1.5.2"
  sha256 "bb298df756ea55344059a17d22976a7df6e789603ffd6dff0ce50df734983073"

  url "https://github.com/zkmn73/SimpleShot/releases/download/v#{version}/SimpleShot.dmg"
  name "SimpleShot"
  desc "Minimal native macOS screenshot and annotation tool"
  homepage "https://github.com/zkmn73/SimpleShot"

  livecheck do
    url :url
    strategy :github_latest
  end

  depends_on macos: :monterey

  app "SimpleShot.app"

  postflight_steps do
    run "/usr/bin/xattr", args: ["-dr", "com.apple.quarantine", "{{appdir}}/SimpleShot.app"]
  end

  caveats "This build is not notarized. Screen Recording permission must be granted again after each upgrade."
  uninstall quit: "com.zkmn73.simpleshot"

  zap trash: [
    "~/Library/Application Scripts/com.zkmn73.simpleshot",
    "~/Library/Containers/com.zkmn73.simpleshot",
    "~/Library/Preferences/com.zkmn73.simpleshot.plist",
  ]
end
