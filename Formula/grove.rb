class Grove < Formula
  desc "The complete AI development workflow — from spec to ship"
  homepage "https://garrickz2.github.io/grove/"
  version "0.7.14"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/GarrickZ2/grove/releases/download/v#{version}/grove-v#{version}-aarch64-apple-darwin.tar.gz"
      sha256 "0f4a1e5ba639a4decae1281398d8893707af599adcf3c3382130761f600b4ae9"
    elsif Hardware::CPU.intel?
      url "https://github.com/GarrickZ2/grove/releases/download/v#{version}/grove-v#{version}-x86_64-apple-darwin.tar.gz"
      sha256 "56435a0fa6405b8618b2fadd4527123d0df359c40e3838e9f4768f9389506060"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/GarrickZ2/grove/releases/download/v#{version}/grove-v#{version}-aarch64-unknown-linux-musl.tar.gz"
      sha256 "af4c43c77ed139069fdb20843816916d9e4a292f689b5aa19e1faf75cc5ddcc0"
    elsif Hardware::CPU.intel?
      url "https://github.com/GarrickZ2/grove/releases/download/v#{version}/grove-v#{version}-x86_64-unknown-linux-musl.tar.gz"
      sha256 "b8f9fe81d325a896ac5de50034ff8b2de5bd44466b8309c1d086982e94e9cd5e"
    end
  end

  def install
    bin.install "grove"
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/grove --version")
  end
end
