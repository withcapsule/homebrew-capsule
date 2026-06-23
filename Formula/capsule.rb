class Capsule < Formula
	desc "CLI for the Capsule server"
	homepage "https://github.com/withcapsule/CLI"
	version "0.2.1"
	license "MIT"

	url "https://github.com/withcapsule/CLI/archive/refs/tags/v#{version}.tar.gz"
	sha256 "51fd5ea8df834d35e153a568235e0ff9a53110e843641b30369e335e53c90336"

	on_macos do
		on_arm do
			url "https://github.com/withcapsule/CLI/releases/download/v#{version}/capsule-aarch64-macos.tar.gz"
			sha256 "f07497c3cce9857910dc36d2d41408f379b8e2f7e6ca3e9c81ffe750d9210198"
		end
		on_intel do
			url "https://github.com/withcapsule/CLI/releases/download/v#{version}/capsule-x86_64-macos.tar.gz"
			sha256 "d43120ca619a22796f853a208d600ab8d656c606c37591d636ac56003b0d51af"
		end
	end

	on_linux do
		on_arm do
			url "https://github.com/withcapsule/CLI/releases/download/v#{version}/capsule-aarch64-linux.tar.gz"
			sha256 "cc4bf89d97fe9d4d492d044830040f6799ff5f450a87c8b50425fd318156a91f"
		end
		on_intel do
			url "https://github.com/withcapsule/CLI/releases/download/v#{version}/capsule-x86_64-linux.tar.gz"
			sha256 "6b8a2baa87498fa35fdb2d361eb419ceab3dd6f67ffb90c88fcb21595a9de351"
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

