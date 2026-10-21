class Grove < Formula
  desc "The complete AI development workflow — from spec to ship"
  homepage "https://garrickz2.github.io/grove/"
  version "0.12.11"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/GarrickZ2/grove/releases/download/v#{version}/grove-v#{version}-aarch64-apple-darwin.tar.gz"
      sha256 "cc643a048a6c81d3814fba6b4742f0a0f690137de6540f0dac5328381550b9a3"
    elsif Hardware::CPU.intel?
      url "https://github.com/GarrickZ2/grove/releases/download/v#{version}/grove-v#{version}-x86_64-apple-darwin.tar.gz"
      sha256 "c7edd938c2b2402a6866a3b31777d5bba2be2c2dcd8ba9ef90f7f683823a6d36"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/GarrickZ2/grove/releases/download/v#{version}/grove-v#{version}-aarch64-unknown-linux-musl.tar.gz"
      sha256 "4a8fbfa0c017728191debaece8a11b6d9a06330aa45b1f3a3a4efed18b47ea0f"
    elsif Hardware::CPU.intel?
      url "https://github.com/GarrickZ2/grove/releases/download/v#{version}/grove-v#{version}-x86_64-unknown-linux-musl.tar.gz"
      sha256 "8fe0f5c8b55dcf4890c8191a5e2ed59bcefc69ca24cbf22aa17275309581b871"
    end
  end

  def install
    bin.install "grove"
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/grove --version")
  end
end
