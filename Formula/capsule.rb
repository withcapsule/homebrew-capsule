class Capsule < Formula
	desc "CLI for the Capsule server"
	homepage "https://github.com/withcapsule/CLI"
	version "0.1.9"
	license "MIT"

	url "https://github.com/withcapsule/CLI/archive/refs/tags/v#{version}.tar.gz"
	sha256 "f0c77c320ffbef5314c3ec4374411985a8c1ef0691cd50c21bff3a061d0605b5"

	depends_on "rust" => :build

	on_macos do
		on_arm do
			url "https://github.com/withcapsule/CLI/releases/download/v#{version}/capsule-aarch64-macos.tar.gz"
			sha256 "76dc937787d71cde7a8466c435bf2ee3af856b29c477507501c40e6becddb390"
		end
		on_intel do
			url "https://github.com/withcapsule/CLI/releases/download/v#{version}/capsule-x86_64-macos.tar.gz"
			sha256 "6fcff11bd65a9091d51d0bd1fc3718ddd0870f84f2166ac6e132e740afb88e9b"
		end
	end

	on_linux do
		on_arm do
			url "https://github.com/withcapsule/CLI/releases/download/v#{version}/capsule-aarch64-linux.tar.gz"
			sha256 "0812f20b904699d1786f653742444380cd80cb755740a2e6835d03d6f39354ae"
		end
		on_intel do
			url "https://github.com/withcapsule/CLI/releases/download/v#{version}/capsule-x86_64-linux.tar.gz"
			sha256 "613086ecb7774acc187c020cb30116f7c1a48b3c3b351cd73358aec67c75e5bc"
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
