class Brewpy < Formula
  desc "BrewPy - Python Version Manager for Homebrew"
  homepage "https://github.com/landoncrabtree/brewpy"
  url "https://github.com/landoncrabtree/brewpy/archive/refs/tags/v1.0.2.tar.gz"
  sha256 "c935bcdc72be8a30c5dd1b8334c122a4a3ba05a77287e666ca5640b568a957e2"
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
