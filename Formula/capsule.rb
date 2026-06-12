class Capsule < Formula
	desc "CLI for the Capsule server"
	homepage "https://github.com/withcapsule/CLI"
	version "0.1.10"
	license "MIT"

	url "https://github.com/withcapsule/CLI/archive/refs/tags/v#{version}.tar.gz"
	sha256 "e1138ff715f4a6ab76893758a53ca33d6ba25cf3d87d2eecae5b9f6f73e37539"

	depends_on "rust" => :build

	on_macos do
		on_arm do
			url "https://github.com/withcapsule/CLI/releases/download/v#{version}/capsule-aarch64-macos.tar.gz"
			sha256 "f128f01ce4d1e15efc6325d55c8449d612aec9378a9ed9f4a6a6a5054b0ef370"
		end
		on_intel do
			url "https://github.com/withcapsule/CLI/releases/download/v#{version}/capsule-x86_64-macos.tar.gz"
			sha256 "3ea2313ff5de81b6d084bacf14d1b747cd17acffdbcf296fe551fc0914ed721f"
		end
	end

	on_linux do
		on_arm do
			url "https://github.com/withcapsule/CLI/releases/download/v#{version}/capsule-aarch64-linux.tar.gz"
			sha256 "f15212c7f8965c616e7d1f72617ddeb4ef103694a87fd14f703b455e084abb32"
		end
		on_intel do
			url "https://github.com/withcapsule/CLI/releases/download/v#{version}/capsule-x86_64-linux.tar.gz"
			sha256 "e81f3abd9ba94b25157cd630a55a1b30dd5e13b2e23a8680528fca33b9cdc1de"
		end
	end

	def install
		if File.exist?("Cargo.toml")
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
