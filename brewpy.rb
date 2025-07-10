class Brewpy < Formula
  desc "BrewPy - Python Version Manager for Homebrew"
  homepage "https://github.com/landoncrabtree/brewpy"
  url "https://github.com/landoncrabtree/brewpy/archive/refs/tags/.tar.gz"
  sha256 "172dbbf468f2d83896081a22c4d65964cd0fa3dfda7926bfbd6da8b7d4d91d75"
  license "MIT"

  depends_on "go" => :build

  def install
    cd "src" do
      system "go", "build", *std_go_args(ldflags: "-s -w")
    end
  end

  def post_install
    puts <<~EOS
      BrewPy installed successfully!
      Get started by running  to see the available commands.
    EOS
  end

  test do
    system "bin/brewpy", "--help"
  end
end
