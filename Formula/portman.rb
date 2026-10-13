class Portman < Formula
  desc "Inspect processes listening on a local TCP port"
  homepage "https://github.com/arps18/portman"
  version "0.1.0"
  license "MIT"

  depends_on :macos

  on_arm do
    url "https://github.com/arps18/portman/releases/download/v0.1.0/portman_darwin_arm64.tar.gz"
    sha256 "dccd8e2bfb2669ab3407eacf88f2af3bbe5ad0de85afb41f97394d49e4f2d9c2"
  end

  on_intel do
    url "https://github.com/arps18/portman/releases/download/v0.1.0/portman_darwin_amd64.tar.gz"
    sha256 "dbb5e70174ae832ce680acc74ad0a2b3ec48fe898358b6ca26f3aa93a3e7249f"
  end
  
  def install
    bin.install "portman"
  end

  test do
    output = shell_output("#{bin}/portman 70000 2>&1", 1)
    assert_match "port must be between 1 and 65535", output
  end
end