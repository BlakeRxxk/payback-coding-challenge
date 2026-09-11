import Foundation
import SwiftUI

@MainActor
public protocol Viewable {
    associatedtype V: View

    var view: V { get }
}
