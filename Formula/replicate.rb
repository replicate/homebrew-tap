class Replicate < Formula
  desc "Run machine learning models in the cloud"
  homepage "https://github.com/replicate/cli"
  url "https://github.com/replicate/cli/archive/refs/tags/v0.5.0.tar.gz"
  sha256 "12dd905be91d95eea4f4b46ead26aa57121db84c2e9ec0cda192ec9301c6648b"
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
