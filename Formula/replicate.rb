class Replicate < Formula
  desc "Run machine learning models in the cloud"
  homepage "https://github.com/replicate/cli"
  url "https://github.com/replicate/cli/archive/refs/tags/v0.7.0.tar.gz"
  sha256 "47aea8eef63737bdee50758daec4df5327e9f04a754f9ad179e1c6502214b667"
  license "Apache-2.0"
  head "https://github.com/replicate/cli.git", branch: "main"

  depends_on "go" => :build

  def install
    system "make", "REPLICATE_CLI_VERSION=#{version}"
    bin.install "replicate"
    generate_completions_from_executable(bin/"replicate", "completion")
  end

  test do
    assert_match "replicate version #{version}", shell_output("#{bin}/replicate --version")
  end
end
