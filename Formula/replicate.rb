class Replicate < Formula
  desc "Run machine learning models in the cloud"
  homepage "https://github.com/replicate/cli"
  url "https://github.com/replicate/cli/archive/refs/tags/v0.2.3.tar.gz"
  sha256 "1d345fa305818ee5952da1dc02f6d07d9d1b4af4c1920f3d01ad4a77ad5a24e5"
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
