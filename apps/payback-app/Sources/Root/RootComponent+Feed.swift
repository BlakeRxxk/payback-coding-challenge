import Core
import FeedAPI
import FeedImplementation

extension RootComponent: FeedDependency {
    var feed: FeedComponent {
        FeedComponent(dependency: self)
    }
}
