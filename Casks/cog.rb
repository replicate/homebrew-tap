cask "cog" do
  version "0.17.1"

  on_arm do
    sha256 "3a677dccb770caae8c1ac387304a4742263c9af343a40b0d9ce3864d1674b1a1"

    url "https://github.com/replicate/cog/releases/download/v0.17.1/cog_Darwin_arm64"
  end
  on_intel do
    sha256 "dd9f756348e33da9f968c4a4de6da63c8f14365ebee8c25cc9dd98a5ae0a05fa"

    url "https://github.com/replicate/cog/releases/download/v0.17.1/cog_Darwin_x86_64"
  end

  name "Cog"
  desc "Containers for machine learning"
  homepage "https://cog.run/"

  binary "cog_Darwin_#{on_intel do
    "x86_64"
  end
                       on_arm do
                         "arm64"
                       end}", target: "cog"

  postflight do
    system_command "/usr/bin/xattr",
                   args: ["-dr", "com.apple.quarantine", "#{staged_path}/cog"]
  end
end
