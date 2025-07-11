class Brewpy < Formula
  desc "A Python version manager designed for macOS and Homebrew"
  homepage "https://github.com/landoncrabtree/brewpy"
  url "https://github.com/landoncrabtree/brewpy/archive/refs/tags/v1.0.3.tar.gz"
  sha256 "9b99c83e6cf1b98e1402d5a4acae4ce4abc41672461a18979a1c1f503f20943b"
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
      Get started by running brewpy to see the available commands.
    EOS
  end

  test do
    system "bin/brewpy", "--help"
  end
end
