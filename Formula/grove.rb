class Grove < Formula
  desc "The complete AI development workflow — from spec to ship"
  homepage "https://garrickz2.github.io/grove/"
  version "0.8.2"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/GarrickZ2/grove/releases/download/v#{version}/grove-v#{version}-aarch64-apple-darwin.tar.gz"
      sha256 "281f70b9d5ba9cff92c8532016539d080cb52543b9fda609b0a0a8521ed79ad0"
    elsif Hardware::CPU.intel?
      url "https://github.com/GarrickZ2/grove/releases/download/v#{version}/grove-v#{version}-x86_64-apple-darwin.tar.gz"
      sha256 "c8a100343dd4c400ea9edec8ba8fdac8da2642e5a49e10e92f36fa29b6d3b353"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/GarrickZ2/grove/releases/download/v#{version}/grove-v#{version}-aarch64-unknown-linux-musl.tar.gz"
      sha256 "71b818f9f2ad02f122bb4aa0d946ecea4f4485273bcd8547f3c171b05c73d6ec"
    elsif Hardware::CPU.intel?
      url "https://github.com/GarrickZ2/grove/releases/download/v#{version}/grove-v#{version}-x86_64-unknown-linux-musl.tar.gz"
      sha256 "b2eab0e7d9d0291a68774239f32b1948e94db2264109d13a9048c9639f0cc7dd"
    end
  end

  def install
    bin.install "grove"
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/grove --version")
  end
end
