.PHONY : kill_xcode mock_server format lint

PACKAGES = \
	packages/core \
	packages/networking \
	packages/design-system \
	packages/features/transactions \
	packages/features/feed

mock_server:
	python3 tools/mock-server/server.py

kill_xcode:
	killall Xcode || true
	killall Simulator || true

format:
	@set -e; \
	for pkg in $(PACKAGES); do \
		echo "Formatting $$pkg"; \
		swift package --package-path $$pkg plugin --allow-writing-to-package-directory format; \
	done

lint:
	@set -e; \
	for pkg in $(PACKAGES); do \
		echo "Linting $$pkg"; \
		swift package --package-path $$pkg plugin --allow-writing-to-package-directory format --lint; \
	done