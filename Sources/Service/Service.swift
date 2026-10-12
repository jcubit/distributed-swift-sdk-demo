package import Distributed
import DistributedCluster
package import Shared

typealias DefaultDistributedActorSystem = ClusterSystem

package distributed actor Service: Greeter {
  package distributed func greet(name: String) -> String {
    "hello, my name is \(name)"
  }

  package init(actorSystem: ActorSystem) {
    self.actorSystem = actorSystem
  }
}
