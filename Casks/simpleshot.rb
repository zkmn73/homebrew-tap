cask "simpleshot" do
  version "1.3.0"
  sha256 "52eec55d7ca53d72982d25d63ab53948b60ef74952c8efea4d64665aa0f74e36"

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
