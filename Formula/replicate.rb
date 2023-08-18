class Replicate < Formula
  desc "Run machine learning models in the cloud"
  homepage "https://github.com/replicate/cli"
  url "https://github.com/replicate/cli/archive/refs/tags/v0.2.2.tar.gz"
  sha256 "41a68da5f5196f7e0a742cddfabe6c4dfc258723ec5eed5f293300df73fdc806"
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
