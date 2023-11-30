class Pget < Formula
  desc "Parallel file downloader & extractor"
  homepage "https://github.com/replicate/pget"
  url "https://github.com/replicate/pget/archive/refs/tags/v0.3.0.tar.gz"
  sha256 "4fd0611f960728a0f802b8f99423b90843197bf97bbd786903055a384f910e99"

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
