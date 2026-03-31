cask "cog" do
  version "0.17.1"

  on_arm do
    sha256 :no_check

    url "https://github.com/replicate/cog/releases/download/v0.17.1/cog_Darwin_arm64",
        verified: "github.com/replicate/cog/"
  end
  on_intel do
    sha256 :no_check

    url "https://github.com/replicate/cog/releases/download/v0.17.1/cog_Darwin_x86_64",
        verified: "github.com/replicate/cog/"
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
