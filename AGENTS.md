# AGENTS.md

iOS SwiftUI app (test assignment). No README, no CI, no single top-level `Package.swift`.

## Layout

- Monorepo. App shell lives in `apps/payback-app/`: `WorldOfPAYBACK.xcodeproj` (single scheme `WorldOfPAYBACK`), `Sources/` (`AppStart/`, `Root/`, `Resources/`, `Preview Content`), `Tests/`, `UITests/`, `TestPlans/`. Build/run from Xcode — there is no root-level Swift package to build.
- Packages in `packages/`: `core`, `design-system`, `networking`, and `features/transactions`, `features/feed`. Each feature package is its **own** SPM package (swift-tools 5.9, iOS 15) with its own `Package.swift`. Cross-package deps use local paths: `package(name: "Networking", path: "../../networking")`, `package(name: "Core", path: "../../core")`, `package(name: "Transactions", path: "../transactions")`.
- Modules: `Feed`, `Transactions`, `NetworkingAPI`, `Core`, `DesignSystem`. The xcodeproj references local packages via `XCLocalSwiftPackageReference` (`relativePath` from `apps/payback-app/`, e.g. `../../packages/core`) plus `XCSwiftPackageProductDependency` — adding a product means changing **both** the package and the xcodeproj.
- `tools/mock-server/` holds the mock HTTP server.

## Architecture convention

- Interface/implementation split per module: `<Name>API` target = protocols + models (framework-agnostic), `<Name>Implementation` target = concrete services + SwiftUI views. Consumers `import <Name>API`, never the Implementation of a module. The app shell wires implementations explicitly.
- Manual DI via PBCore `Dependency` / `Component` / `shared` graph (the module was renamed `Core`; the `Component`/`Dependency` types keep their original names): `AppComponent` -> `RootComponent` -> per-feature components, assembled in `RootComponent+<Feature>.swift` extensions (`apps/payback-app/Sources/Root/`).
- Config lives in `apps/payback-app/Sources/AppStart/AppComponent.swift`: 20s request timeout, cache disabled (`reloadIgnoringLocalAndRemoteCacheData`) — caching is intentionally off.

## Commands

- Run the mock server: `make mock_server` (runs `python3 tools/mock-server/server.py`; stdlib only, no venv/deps).
- `make kill_xcode` kills Xcode + Simulator (use carefully).
- Lint/format all packages: `make lint` / `make format` (run the `FormatSwift` command plugin via SPM, covered below). There's no root build/test target in the Makefile. Use Xcode for the app, and `swift test --package-path ...` per package for tests.
- Focused tests per module: `swift test --package-path packages/features/transactions` (and likewise for `packages/features/feed`, `packages/networking`, `packages/core`, `packages/design-system`).

## Tests

- Real tests live in `packages/<Name>/Tests/<Name>Tests/`. `TransactionsTests` is the substantive suite (injects mock services; real data path is covered elsewhere).
- `apps/payback-app/TestPlans/TransactionsImplementation.xctestplan` exists solely to run `TransactionsTests` (every other target disabled). `WorldOfPAYBACKTests`/`WorldOfPAYBACKUITests` are default Xcode boilerplate — don't add real tests there.

## Mock server quirks (by design)

`tools/mock-server/server.py` serves `GET localhost:3000/transactions` from `PBTransactions.json` but is **deliberately flaky**: ~20% 500 errors and a random 0.2–3s delay. The loading/error states in the app are driven by this. Don't "fix" or document away the flakiness, and don't be surprised when CI-like runs intermittently fail — retry.

## Lint & format

- Every module `Package.swift` depends on `https://github.com/BlakeRxxk/swift-style-guide` and every target wires its `FormatSwift` command plugin (bundles SwiftFormat + SwiftLint with a shared style guide). Run it from Xcode (right-click a package → Plugin → `FormatSwift`) or via `make lint` / `make format`. Cleanup only runs with `make format`; `make lint` checks SwiftFormat conformance + SwiftLint `--strict` and fails on violations.

## Gotchas

- Commit style is terse and ad-hoc (`init`, `Update .gitignore`); no enforced conventions.
- `.swiftpm/` dirs and `TransactionsTests.xctestplan` references in the pbxproj are stale/ignored artifacts.