class Pget < Formula
  desc "Parallel file downloader & extractor"
  homepage "https://github.com/replicate/pget"
  url "https://github.com/replicate/pget/archive/refs/tags/v0.3.2.tar.gz"
  sha256 "7fa25866d62637235f954d9d5306da98636a07aed31dcc065c8ad8e47a76bd3d"

  license "Apache-2.0"
  head "https://github.com/replicate/pget.git", branch: "main"

  depends_on "go" => :build

  def install
    system "make"
    bin.install "pget"
  end

  test do
    shell_output("#{bin}/pget --help")
  end
end
