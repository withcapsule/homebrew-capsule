class Capsule < Formula
  desc "CLI for the Capsule server"
  homepage "https://github.com/withcapsule/CLI"
  version "0.1.0"
  license "MIT"

  # build from source
  on_macos do
    depends_on "rust" => :build

    url "https://github.com/withcapsule/CLI/archive/refs/tags/v#{version}.tar.gz"
    sha256 "REPLACE_WITH_SHA256_OF_SOURCE_TARBALL"
  end

  # install precompiled binary
  on_linux do
    on_arm do
      url "https://github.com/withcapsule/CLI/releases/download/v#{version}/capsule-aarch64-linux.tar.gz"
      sha256 "REPLACE_WITH_SHA256_FOR_LINUX_AARCH64"
    end
    on_intel do
      url "https://github.com/withcapsule/CLI/releases/download/v#{version}/capsule-x86_64-linux.tar.gz"
      sha256 "REPLACE_WITH_SHA256_FOR_LINUX_X86_64"
    end
  end

  def install
    if OS.mac?
      system "cargo", "install", "--locked", "--root", prefix, "--path", "."
    else
      bin.install "capsule"
    end

    generate_completions_from_executable(bin/"capsule", "completions")
  end

  test do
    system bin/"capsule", "--version"
  end
end

