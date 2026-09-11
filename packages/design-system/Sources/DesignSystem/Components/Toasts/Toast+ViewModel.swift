import Foundation

// MARK: ToastView.ViewModel

extension Toast {
    public struct ViewModel {
        var title: String
        var description: String
        var actionTitle: String
        var duration: Double = 3

        public init(title: String, description: String, actionTitle: String, duration: Double = 3.0) {
            self.title = title
            self.description = description
            self.actionTitle = actionTitle
            self.duration = duration
        }
    }
}
