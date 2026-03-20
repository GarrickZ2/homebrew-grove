class Grove < Formula
  desc "The complete AI development workflow — from spec to ship"
  homepage "https://garrickz2.github.io/grove/"
  version "0.7.8"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/GarrickZ2/grove/releases/download/v#{version}/grove-v#{version}-aarch64-apple-darwin.tar.gz"
      sha256 "2fd0769743210ccb2c7d800c0e0264f16007d0a6b8fd5ef883dded6f490290d0"
    elsif Hardware::CPU.intel?
      url "https://github.com/GarrickZ2/grove/releases/download/v#{version}/grove-v#{version}-x86_64-apple-darwin.tar.gz"
      sha256 "6810d0c2b0ae00bdce5794f8a39071d88c4d2a117eabb87437e346358419f1c5"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/GarrickZ2/grove/releases/download/v#{version}/grove-v#{version}-aarch64-unknown-linux-musl.tar.gz"
      sha256 "cd602b1c93bb7891b992bb72c36b656651596cf0f131fd5e6f13935c90dd4fd7"
    elsif Hardware::CPU.intel?
      url "https://github.com/GarrickZ2/grove/releases/download/v#{version}/grove-v#{version}-x86_64-unknown-linux-musl.tar.gz"
      sha256 "3ba60152c972c545bcbc36e3c36236f3e838eb7cb9406ec85837345a77a8f6ae"
    end
  end

  def install
    bin.install "grove"
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/grove --version")
  end
end
