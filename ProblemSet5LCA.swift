import Foundation

solution()

func solution() {
    
//    /// Helper Tree class.
//    class Tree {
//
//        /// Helper Node class.
//        private class Node {
//            private var value: Int // do i need value?
//            private var children: [Node]?
//            public init(value: Int) {
//                self.value = value
//            }
//        }
//
//        private var nodes: [Node]?
//
//        public init() {}
//
//        public func addNode(_ value: Int) {
//            nodes?.append(Node(value: value))
//        }
//
//    }
    
    // Number of of vertices
    let firstLine = readLine()!
    let n = Int(firstLine)!
    
    // Adjacency list.
    var adjList = [[Int]](repeating: [], count: n + 1)
    
    //
    
    
    // Populate children.
//    let edges = graphInput.split(separator: "\n")
    for _ in 1..<n {
      let edge = readLine()!.split(separator: " ")
//    }
//    print(edges)
//    for i in 0..<edges.count {
//        let edge = edges[i].split(separator: " ")
//        print(edge)
        
        let u = Int(edge[0])!
        let v = Int(edge[1])!
        
        if adjList[u].count == 0 && adjList[v].count == 0 { adjList[u].append(v) }
        else if adjList[u].count != 0 && adjList[v].count == 0 { adjList[u].append(v) }
        else if adjList[u].count == 0 && adjList[v].count != 0 { adjList[v].append(u) }
        else {
            print("ERROR")
            
        }
        
    }
    
    
    
    for i in 1..<adjList.count {
        print("\(i): \(adjList[i])")
    }
    
    func lca(_ current: Int, _ nodeA: Int, _ nodeB: Int) -> Bool {
//        print(adjList[current].count)
        
        let count = (current == nodeA || current == nodeB) ? 1 : 0
        
//        var mid: Bool
//        if (current == 11 || current == 6) {
//            mid = true
////            print("XXXXX", current, mid)
//        } else {
//            mid = false
//        }
        
        if adjList[current].count == 0 {
            return count > 0
        } else {
            var results = [Bool](repeating: false, count: adjList[current].count)
            for i in 0..<adjList[current].count {
                results[i] = lca(adjList[current][i], nodeA, nodeB)
//                print("--->", adjList[current][i], results[i])
            }
            
//            print(results)
            if count + results.reduce(0, { $0 + ($1 ? 1 : 0) }) == 2 {
                print(current)
                return true
            } else if count + results.reduce(0, { $0 + ($1 ? 1 : 0) }) >= 1 {
                return true
            } else {
                return false
            }
        }
    }
    
    let lcaLine = readLine()!
    let m = Int(lcaLine)!
    print(">>>>>>", m)
    
    for _ in 0..<m {
      let lcaItem = readLine()!.split(separator: " ")
        //print(">>>>", lcaItem)
//    }
//    print(edges)
//    for i in 0..<edges.count {
//        let edge = edges[i].split(separator: " ")
//        print(edge)
        
        let nodeA = Int(lcaItem[0])!
        let nodeB = Int(lcaItem[1])!
        print(nodeA, "<->", nodeB)
        lca(1, nodeA, nodeB)
    }
    
}




//import Foundation
//
//func ProblemSet5LCA(_ nInput: String, _ graphInput: String, _ mInput: String, _ LCAInput: String) {
//
////    /// Helper Tree class.
////    class Tree {
////
////        /// Helper Node class.
////        private class Node {
////            private var value: Int // do i need value?
////            private var children: [Node]?
////            public init(value: Int) {
////                self.value = value
////            }
////        }
////
////        private var nodes: [Node]?
////
////        public init() {}
////
////        public func addNode(_ value: Int) {
////            nodes?.append(Node(value: value))
////        }
////
////    }
//
//    // Number of of vertices
//    let n = Int(nInput)!
//
//    // Adjacency list.
//    var adjList = [[Int]](repeating: [], count: n + 1)
//
//    //
//
//
//    // Populate children.
//    let edges = graphInput.split(separator: "\n")
////    print(edges)
//    for i in 0..<edges.count {
//        let edge = edges[i].split(separator: " ")
////        print(edge)
//
//        let u = Int(edge[0])!
//        let v = Int(edge[1])!
//
//        if adjList[u].count == 0 && adjList[v].count == 0 { adjList[u].append(v) }
//        else if adjList[u].count != 0 && adjList[v].count == 0 { adjList[u].append(v) }
//        else if adjList[u].count == 0 && adjList[v].count != 0 { adjList[v].append(u) }
//        else {
//            print("ERROR")
//
//        }
//
//    }
//
////    for i in 1..<adjList.count {
////        print("\(i): \(adjList[i])")
////    }
//
//    func dfs(_ current: Int) -> Bool {
////        print(adjList[current].count)
//
//        let count = (current == 11 || current == 6) ? 1 : 0
//
////        var mid: Bool
////        if (current == 11 || current == 6) {
////            mid = true
//////            print("XXXXX", current, mid)
////        } else {
////            mid = false
////        }
//
//        if adjList[current].count == 0 {
//            return count > 0
//        } else {
//            var results = [Bool](repeating: false, count: adjList[current].count)
//            for i in 0..<adjList[current].count {
//                results[i] = dfs(adjList[current][i])
////                print("--->", adjList[current][i], results[i])
//            }
//
////            print(results)
//            if count + results.reduce(0, { $0 + ($1 ? 1 : 0) }) == 2 {
//                print(current)
//                return true
//            } else if count + results.reduce(0, { $0 + ($1 ? 1 : 0) }) >= 1 {
//                return true
//            } else {
//                return false
//            }
//        }
//    }
//
//    dfs(1)
//}
//
//
