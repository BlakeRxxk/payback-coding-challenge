import Foundation
import SwiftUI

public protocol Viewable {
    associatedtype V: View

    var view: V { get }
}
