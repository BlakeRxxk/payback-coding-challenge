.PHONY : kill_xcode mock_server format lint generate_di

PACKAGES := $(shell find packages -name Package.swift -not -path "*/.*" -not -path "*/.build/*" -exec dirname {} \; | sort)
SOURCES  := $(shell find apps packages -type d -name Sources -not -path "*/.*" -not -path "*/.build/*" | sort)
JOBS ?= $(shell sysctl -n hw.ncpu)

mock_server:
	python3 tools/mock-server/server.py

kill_xcode:
	killall Xcode || true
	killall Simulator || true

generate_di:
	needle generate apps/payback-app/Sources/AppStart/needle-generated.swift $(SOURCES)

format:
	@printf '%s\n' $(PACKAGES) | xargs -P $(JOBS) -I {} sh -c \
		'echo "Formatting {}" && swift package --package-path {} plugin --allow-writing-to-package-directory format'

lint:
	@printf '%s\n' $(PACKAGES) | xargs -P $(JOBS) -I {} sh -c \
		'echo "Linting {}" && swift package --package-path {} plugin --allow-writing-to-package-directory format --lint'