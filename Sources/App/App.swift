// The Swift Programming Language
// https://docs.swift.org/swift-book

import DistributedCluster
import Distributed
import Service
import Shared

@main
struct distributed_swift_sdk_demo {
    static func main() async {
      let actorSystem = await ClusterSystem("GreeterCluster")

      let greeter = Service(actorSystem: actorSystem)

      let greetings = try? await greeter.greet(name: "capy")
      print(greetings)

    }
}
