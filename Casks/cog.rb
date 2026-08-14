cask "cog" do
  version "0.22.0"

  on_arm do
    sha256 "c0a213763ffc6e73beef0b4b8aeb2387187a192e1dcbaeb0acf30c34bc7dac1d"

    url "https://github.com/replicate/cog/releases/download/v#{version}/cog_Darwin_arm64",
        verified: "github.com/replicate/cog/"
  end
  on_intel do
    sha256 "42a7f0fbf1c6b34dc552311ebb8d20c06a94d4229854d36619c3c194aab646fb"

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
