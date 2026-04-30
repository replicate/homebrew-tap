cask "cog" do
  version "0.19.1"

  on_arm do
    sha256 "6f121e1f9cba93c891f8f65ca0fcf3307dbbada3a5a065acb0d401719978f159"

    url "https://github.com/replicate/cog/releases/download/v#{version}/cog_Darwin_arm64",
        verified: "github.com/replicate/cog/"
  end
  on_intel do
    sha256 "33fc5d801643484a756b219c3f928dc38f5ecf6d0e42bb44fb27743dd9d6f2da"

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
