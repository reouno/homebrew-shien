class Shien < Formula
  desc "Background daemon application to support knowledge workers"
  homepage "https://github.com/reouno/shien"
  version "0.1.2"
  license "MIT"
  
  on_macos do
    url "https://github.com/reouno/shien/releases/download/v0.1.2/shien-darwin-arm64.tar.gz"
    sha256 "d151184989c26a09b8655bde9be2c4ed334b30cd43464960226459d32036a720"
  end

  def install
    bin.install "shien"
    bin.install "shienctl"
  end

  service do
    run [opt_bin/"shien"]
    keep_alive true
    log_path var/"log/shien.log"
    error_log_path var/"log/shien.err.log"
  end

  test do
    # Test shienctl help
    assert_match "shienctl", shell_output("#{bin}/shienctl --help 2>&1", 1)
    
    # Test that binaries exist
    assert_predicate bin/"shien", :exist?
    assert_predicate bin/"shienctl", :exist?
  end
end
