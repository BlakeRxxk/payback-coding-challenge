import Foundation
import SwiftUI

struct CategoryMenu: View {

    // MARK: Lifecycle

    init(viewModel: CategoryMenu.ViewModel, selectedCategory: Binding<Category?>, action: @escaping (Category) -> Void) {
        self.viewModel = viewModel
        self.action = action
        _selectedCategory = selectedCategory
    }

    // MARK: Internal

    @Binding var selectedCategory: Category?

    var body: some View {
        Menu {
            ForEach(viewModel.categories) { category in
                Button {
                    action(category)
                } label: {
                    if let selectedCategory, selectedCategory.value == category.value {
                        Label(category.title, systemImage: "checkmark")
                    } else {
                        Label(
                            title: { Text(category.title) },
                            icon: { })
                    }
                }
            }
        } label: {
            Label("Category Filter", systemImage: "line.3.horizontal.decrease.circle")
        }
    }

    // MARK: Private

    private let viewModel: CategoryMenu.ViewModel
    private let action: (Category) -> Void
}
