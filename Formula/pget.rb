class Pget < Formula
  desc "Parallel file downloader & extractor"
  homepage "https://github.com/replicate/pget"
  url "https://github.com/replicate/pget/archive/refs/tags/v0.6.0.tar.gz"
  sha256 "cf823f1d7e695135ff14b75b3b74ac174e612108cb64dc37bd1715d169ca6b58"

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
