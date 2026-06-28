class Capsule < Formula
	desc "CLI for the Capsule server"
	homepage "https://github.com/withcapsule/CLI"
	version "0.3.1"
	license "MIT"

	url "https://github.com/withcapsule/CLI/archive/refs/tags/v#{version}.tar.gz"
	sha256 "164e63c6c43226f4171e6fe60fd36025dbe9e15cf6c9a86603f04e046ce91ba0"

	on_macos do
		on_arm do
			url "https://github.com/withcapsule/CLI/releases/download/v#{version}/capsule-aarch64-macos.tar.gz"
			sha256 "cb231e3dd4ac7fe1ce4f336f25627b1d4a308cfd00a20faceed803064093e874"
		end
		on_intel do
			url "https://github.com/withcapsule/CLI/releases/download/v#{version}/capsule-x86_64-macos.tar.gz"
			sha256 "3512f7b2b8325ccaa358d53478b9dd0ba447cbfcca28afbcb06fc39d586fbc2f"
		end
	end

	on_linux do
		on_arm do
			url "https://github.com/withcapsule/CLI/releases/download/v#{version}/capsule-aarch64-linux.tar.gz"
			sha256 "860ee43c54916062cd4263863069e86b19bdf8f4fcd8dd72d98a340c34481395"
		end
		on_intel do
			url "https://github.com/withcapsule/CLI/releases/download/v#{version}/capsule-x86_64-linux.tar.gz"
			sha256 "826d2c4bfbb788c6de4f958f67e2ee8cd9a5ea8a77aead9bafc4bc09e4c7104b"
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

