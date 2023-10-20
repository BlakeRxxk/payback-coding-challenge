import SwiftUI

// MARK: - ButtonLoading

public struct ButtonLoading: EnvironmentKey {
    public static let defaultValue = false
}

extension EnvironmentValues {
    public var isLoading: Bool {
        get { self[ButtonLoading.self] }
        set { self[ButtonLoading.self] = newValue }
    }
}

extension Button {
    /// isLoading env helper for Buttons
    public func isLoading(_ value: Bool) -> some View {
        environment(\.isLoading, value)
    }
}
