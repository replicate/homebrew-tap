cask "cog" do
  version "0.23.1"

  on_arm do
    sha256 "fb9ec95bbf7ac47960f9323ef2f5f6aa3f13f3dea4653093bec4f31103752d3f"

    url "https://github.com/replicate/cog/releases/download/v#{version}/cog_Darwin_arm64",
        verified: "github.com/replicate/cog/"
  end
  on_intel do
    sha256 "e6e24ce081cc7a1ce82de4b2a7e1b1fd8f68cb5166ef70b75d27cd40d4cdeed7"

    url "https://github.com/replicate/cog/releases/download/v#{version}/cog_Darwin_x86_64",
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
    binary_name = "cog_Darwin_#{Hardware::CPU.arm? ? "arm64" : "x86_64"}"
    system_command "/usr/bin/xattr",
                   args: ["-dr", "com.apple.quarantine", "#{staged_path}/#{binary_name}"]
  end
end
