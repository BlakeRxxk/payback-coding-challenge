import PBCore
import TransactionsAPI

extension [PBTransaction] {
    
    /// Fuzzy matching by partnerDisplayName
    /// - Parameter text: search string
    /// - Returns:  Filtered array of PBTransaction if search text not empty
    func apply(filter text: String) -> [Iterator.Element] {
        guard !text.isEmpty else {
            return self
        }

        return filter {
            FuzzyMatching.search(for: text, in: $0.partnerDisplayName)
        }
    }
    
    /// Filter array by category
    /// - Parameter category: selected category
    /// - Returns: Filtered array of PBTransaction if category not nil
    func apply(filter category: Category?) -> [Iterator.Element] {
        guard let category else {
            return self
        }

        return filter { $0.category == category.value }
    }
}
