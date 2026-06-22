class Capsule < Formula
	desc "CLI for the Capsule server"
	homepage "https://github.com/withcapsule/CLI"
	version "0.2"
	license "MIT"

	url "https://github.com/withcapsule/CLI/archive/refs/tags/v#{version}.tar.gz"
	sha256 "564b365cf7631f47227cd64b3f344294530ad8f295173001191acd6abfe0c8b6"

	on_macos do
		on_arm do
			url "https://github.com/withcapsule/CLI/releases/download/v#{version}/capsule-aarch64-macos.tar.gz"
			sha256 "9dcb7e9799529d33711d5f8b44a6ca4bc08d561c9b9637cc80e16f91d76631d1"
		end
		on_intel do
			url "https://github.com/withcapsule/CLI/releases/download/v#{version}/capsule-x86_64-macos.tar.gz"
			sha256 "5a0cf0debc8781850019998178bf126a0c90b82895ffbf2bbf26068fbbf69ffd"
		end
	end

	on_linux do
		on_arm do
			url "https://github.com/withcapsule/CLI/releases/download/v#{version}/capsule-aarch64-linux.tar.gz"
			sha256 "1277a20144326c2f5f7f5da227702fb84be12fc69d553e011f1e6e6537a3755e"
		end
		on_intel do
			url "https://github.com/withcapsule/CLI/releases/download/v#{version}/capsule-x86_64-linux.tar.gz"
			sha256 "0ac98ff96b1415bfd193ac2213e377ac05a796bb4e4dc21174e79f2b642c7b54"
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

