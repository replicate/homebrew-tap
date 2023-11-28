class Pget < Formula
  desc "Parallel file downloader & extractor"
  homepage "https://github.com/replicate/pget"
  url "https://github.com/replicate/pget/archive/refs/tags/v0.2.0.tar.gz"
  sha256 "fbd57a42fc7062c735d300c417b9df1a672bd2f8f102d81153ac1d65f1697a7c"

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
