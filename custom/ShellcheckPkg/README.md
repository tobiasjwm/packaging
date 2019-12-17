# ShellCheck Installer

## Background

[Armin Briegel](https://scriptingosx.com/about/) has a great write-up about this in [Install shellcheck binary on macOS](https://scriptingosx.com/2019/11/install-shellcheck-binary-on-macos-updated/).

## Process

1. Download the latest build.

	https://shellcheck.storage.googleapis.com/shellcheck-latest.darwin.x86_64.tar.xz

2. Get the version number from the [GitHub Releases Page](https://github.com/koalaman/shellcheck/releases).
3. Make a package directory whereever you need.

	mkdir -p ShellcheckPkg/payload

4. Move the installer into the `payload` directory.

	cp ~/Downloads/shellcheck-latest/shellcheck ShellcheckPkg/payload

5. Build the package. Replace the version number with the current version from step 2.

	pkgbuild --root ShellcheckPkg/payload --identifier com.globalmacit.shellcheck --version 0.7.0 --install-location /usr/local/bin shellcheck-0.7.0.pkg