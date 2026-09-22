cask "cog" do
  version "0.23.0"

  on_arm do
    sha256 "3cba2968b9427ca5a57ee78636bb080a4769440296fd6243b76e79b5a642af9b"

    url "https://github.com/replicate/cog/releases/download/v#{version}/cog_Darwin_arm64",
        verified: "github.com/replicate/cog/"
  end
  on_intel do
    sha256 "13754294e2b43ac12392d031dd98719d4ee5c7f4677d93d6ad3ebb8c861f34a4"

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
