// RIBs is re-exported so feature modules get the architecture layer
// (Router, Interactor, Builder, ...) through `import Core` alone.
// NeedleFoundation is intentionally NOT re-exported: it declares
// `Dependency`/`Component` that clash with RIBs'. Modules that define
// DI scopes import NeedleFoundation directly.
@_exported import RIBs
