class Grove < Formula
  desc "The complete AI development workflow — from spec to ship"
  homepage "https://garrickz2.github.io/grove/"
  version "0.7.6"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/GarrickZ2/grove/releases/download/v#{version}/grove-v#{version}-aarch64-apple-darwin.tar.gz"
      sha256 "ef584464c1d2c9a81388edd917d5ddb7641955bf4606e99a634e98acf5f4a00d"
    elsif Hardware::CPU.intel?
      url "https://github.com/GarrickZ2/grove/releases/download/v#{version}/grove-v#{version}-x86_64-apple-darwin.tar.gz"
      sha256 "a476e95e5e83d8eb1a21ed500ba054420cf259635eaf88d0dc3a2eea43c9844e"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/GarrickZ2/grove/releases/download/v#{version}/grove-v#{version}-aarch64-unknown-linux-musl.tar.gz"
      sha256 "f897a6fa3778270922192cabc0809512fd123bee6466816223195d8355cd203f"
    elsif Hardware::CPU.intel?
      url "https://github.com/GarrickZ2/grove/releases/download/v#{version}/grove-v#{version}-x86_64-unknown-linux-musl.tar.gz"
      sha256 "b6595282da49781661734f77d24453ee18dd217bc3a6fad2318ae9a4d9cd96e8"
    end
  end

  def install
    bin.install "grove"
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/grove --version")
  end
end
