class Pget < Formula
  desc "Parallel file downloader & extractor"
  homepage "https://github.com/replicate/pget"
  url "https://github.com/replicate/pget/archive/refs/tags/v0.3.1.tar.gz"
  sha256 "58d4fead27d9009fe9a83b5992247035054903604b34ab63da7164f7195077b7"

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
