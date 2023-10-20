.PHONY : kill_xcode

mock_server:
	python3 MockServer/server.py

kill_xcode:
	killall Xcode || true
	killall Simulator || true