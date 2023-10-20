import Foundation

// MARK: - Array.Unique

extension Array {
    public func unique<T: Hashable>(by: (Element) -> (T)) -> [Element] {
        var set = Set<T>()
        var arrayOrdered = [Element]()

        forEach {
            if !set.contains(by($0)) {
                set.insert(by($0))
                arrayOrdered.append($0)
            }
        }

        return arrayOrdered
    }
}
