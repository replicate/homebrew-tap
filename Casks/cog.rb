cask "cog" do
  version "0.19.3"

  on_arm do
    sha256 "04d74f5825aa460fd5d61c16481276f52e9d7110f6a26b4e00406ba0c889a7e4"

    url "https://github.com/replicate/cog/releases/download/v#{version}/cog_Darwin_arm64",
        verified: "github.com/replicate/cog/"
  end
  on_intel do
    sha256 "8a79a1a95147cfda7b96a48e8f1784d6fd7f6199237c1da53cef1f397845692c"

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
