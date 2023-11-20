class Replicate < Formula
  desc "Run machine learning models in the cloud"
  homepage "https://github.com/replicate/cli"
  url "https://github.com/replicate/cli/archive/refs/tags/v0.4.0.tar.gz"
  sha256 "dbfdbf132256c4270cdfe42c73848d76b31d127918d75b4017404d7f6ac6d742"
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
