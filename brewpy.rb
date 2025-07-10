class Brewpy < Formula
  desc "🍺 BrewPy - Python Version Manager for Homebrew"
  homepage "https://github.com/landoncrabtree/brewpy"
  url "https://github.com/landoncrabtree/brewpy/archive/refs/tags/v1.0.1.tar.gz"
  sha256 "31a3b4cbfffaecdc20e39b2c5384a83171b0f2dea7700a1eea8a3d88a3e4982c"
  license "MIT"

  depends_on "go" => :build

  def install
    cd "src" do
      system "go", "build", *std_go_args(ldflags: "-s -w")
    end
  end

  def post_install
    puts <<~EOS
      🍺 BrewPy installed successfully!
      
      Usage:
        brewpy versions        # List available Python versions
        brewpy use [version]   # Switch Python version
        brewpy current         # Show current version
    EOS
  end

  test do
    system "#{bin}/brewpy", "--help"
  end
end
