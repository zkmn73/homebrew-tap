cask "simpleshot" do
  version "1.1.0"
  sha256 "036226e8a3c0c1015cda526dcdb3b8e82bb16839b7e73fb53b89e4560d24621d"

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

  postflight do
    system_command "/usr/bin/xattr",
                   args: ["-dr", "com.apple.quarantine", "#{appdir}/SimpleShot.app"]
  end

  caveats "This build is not notarized. Screen Recording permission must be granted again after each upgrade."
  uninstall quit: "com.zkmn73.simpleshot"

  zap trash: [
    "~/Library/Application Scripts/com.zkmn73.simpleshot",
    "~/Library/Containers/com.zkmn73.simpleshot",
    "~/Library/Preferences/com.zkmn73.simpleshot.plist",
  ]
end
