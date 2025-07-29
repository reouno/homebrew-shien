class Shien < Formula
  desc "Background daemon application to support knowledge workers"
  homepage "https://github.com/reouno/shien"
  version "0.1.0"
  license "MIT"
  
  on_macos do
    url "https://github.com/reouno/shien/releases/download/v0.1.0/shien-darwin-arm64.tar.gz"
    sha256 "sha256:e79245675112ac76bac32756263bd222ca9fcac22d2e9f242924ceeea0e8e7cd"
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
