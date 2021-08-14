//import Foundation
//
solution()
func solution() {
    
    // Number of nodes (n).
    let n = Int(readLine()!)!
    
    // n-1 edges list.
    var edges = [[Int]](repeating: [], count: n-1)
    for i in 0..<n-1 {
        let edge = readLine()!.split(separator: " ")
        edges[i] = edge.map { Int($0)! }
    }
    
    // Number of LCMs to find (m).
    let m = Int(readLine()!)!
    
    // m-1 LCMs list.
    var lcms = [[Int]](repeating: [], count: m)
    for i in 0..<m {
        let lcm = readLine()!.split(separator: " ")
        lcms[i] = lcm.map { Int($0)! }
    }
    
    for i in 0..<edges.count {
        if edges[i][1] < edges[i][0] {
            let newEdge = [edges[i][1], edges[i][0]]
            edges[i] = newEdge
        }
    }
    
    edges.sort { $0[0] < $1[0] }
    
//    print(n)
//    for i in 0..<edges.count {
//        print(edges[i])
//    }
//    print(m)
//    for i in 0..<lcms.count {
//        print(lcms[i])
//    }
    
    func exists(_ u: Int) -> Bool { nodes[u].0 }
    func hasParent(_ u: Int) -> Bool { nodes[u].1 != -1 }
    
    // AdjList (Array) of parent for each node and if the node exists.
    var nodes = [(Bool, Int)](repeating: (false, -1), count: n+1)
    
    for i in 0..<edges.count {
        
        let u = edges[i][0]
        let v = edges[i][1]
        
        if u == 1 {
            nodes[v].1 = 1
            nodes[u].0 = true
            nodes[v].0 = true
        } else if v == 1 {
            nodes[u].1 = v
            nodes[u].0 = true
            nodes[v].0 = true
        } else {
            
        }
    }
    
    var edgesAddedCount = -1
    while edgesAddedCount != 0 {
//        print(edgesAddedCount)
        edgesAddedCount = 0
        for i in 0..<edges.count {
            
            let u = edges[i][0]
            let v = edges[i][1]
            
            if hasParent(u) && hasParent(v) {
//                print("??")
            } else if !hasParent(u) && hasParent(v) {
                nodes[u].1 = v
                nodes[u].0 = true
                nodes[v].0 = true
                edgesAddedCount += 1
            } else if hasParent(u) && !hasParent(v) {
                nodes[v].1 = u
                nodes[u].0 = true
                nodes[v].0 = true
                edgesAddedCount += 1
            } else if !hasParent(u) && !hasParent(v) {
                
                if exists(u) && exists(v) {
                    print("??")
                } else if !exists(u) && exists(v) {
                    nodes[v].1 = u
                    nodes[u].0 = true
                    nodes[v].0 = true
                    edgesAddedCount += 1
                } else if exists(u) && !exists(v) {
                    nodes[u].1 = v
                    nodes[u].0 = true
                    nodes[v].0 = true
                    edgesAddedCount += 1
                } else if !exists(u) && !exists(v) {
    //                if v < u {
    //                    nodes[u].1 = v //
    //                        print(u, v)
    //                } else {
    //                    nodes[v].1 = u //
    //                        print(u, v)
    //                }
                }
            }
        }
    }
            // nodes[u][1]
            
//        }
//    }
//    for i in 0..<edges.count {
//
//        let u = edges[i][0]
//        let v = edges[i][1]
//    }
    
//    for i in 0..<nodes.count {
//        print(i, nodes[i])
//    }
    
    func getAncestor(_ u: Int, _ ancestors: inout [Int]) {
        ancestors.append(u)
        
        if u != 1 {
            getAncestor(nodes[u].1, &ancestors)
        }
    }
    
    func getLCA(_ u:Int, _ v:Int) -> Int {
        var ancestorsOfNode1:[Int] = []
        var ancestorsOfNode2:[Int] = []
        getAncestor(u, &ancestorsOfNode1)
        getAncestor(v, &ancestorsOfNode2)

        for i in ancestorsOfNode1 {
            for j in ancestorsOfNode2 {
                if i == j { return i }
            }
        }
        return -1
    }
    
    for lcm in lcms {
        print(getLCA(lcm[0], lcm[1]))
    }
}

//
//func solution() {
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
//    let firstLine = readLine()!
//    let n = Int(firstLine)!
//
//    // Adjacency list.
//    var nodeList = [Bool](repeating: false, count: n + 1)
//    var adjList = [[Int]](repeating: [], count: n + 1)
//
//    //
//
//
//    // Populate children.
////    let edges = graphInput.split(separator: "\n")
//    for _ in 1..<n {
//      let edge = readLine()!.split(separator: " ")
////    }
////    print(edges)
////    for i in 0..<edges.count {
////        let edge = edges[i].split(separator: " ")
////        print(edge)
//
//        let u = Int(edge[0])!
//        let v = Int(edge[1])!
//        if u == 1 {
//            adjList[u].append(v)
//            nodeList[u] = true
//            nodeList[v] = true
//        } else if v == 1 {
//            adjList[v].append(u)
//            nodeList[u] = true
//            nodeList[v] = true
//        } else if true {//nodeList[u] && nodeList[v] {
//            if u < v {
//                adjList[u].append(v)
//                nodeList[u] = true
//                nodeList[v] = true
//            } else {
//                adjList[v].append(u)
//                nodeList[u] = true
//                nodeList[v] = true
//            }
////        } else if nodeList[u] && !nodeList[v] {
////            adjList[u].append(v)
////            nodeList[u] = true
////            nodeList[v] = true
////        } else if !nodeList[u] && nodeList[v] {
////            adjList[v].append(u)
////            nodeList[u] = true
////            nodeList[v] = true
////        } else {
////            adjList[u].append(v)
////            nodeList[u] = true
////            nodeList[v] = true
//        }
//
//    }
//
//    func lca(_ current: Int, _ nodeA: Int, _ nodeB: Int) -> Bool {
////        print(adjList[current].count)
//
//        let count = (current == nodeA || current == nodeB) ? 1 : 0
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
//                results[i] = lca(adjList[current][i], nodeA, nodeB)
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
//    let lcaLine = readLine()!
////    print(lcaLine)
//    let m = Int(lcaLine)!
////    print(">>>>>>", m)
//    var lcaList = [String](repeating: "", count: n + 1)
//
//    for i in 0..<m {
//      lcaList[i] = readLine()!
//    }
////    print("...")
//
//        for i in 1..<adjList.count {
//            print("\(i): \(adjList[i])")
//        }
//
//    for i in 0..<m {
//      let lcaItem = lcaList[i].split(separator: " ")
////        print(">>>>", lcaItem)
//
//////    print(edges)
////    for i in 0..<edges.count {
////        let edge = edges[i].split(separator: " ")
////        print(edge)
//
//        let nodeA = Int(lcaItem[0])!
//        let nodeB = Int(lcaItem[1])!
//        print(nodeA, "<->", nodeB)
//        let _ = lca(1, nodeA, nodeB)
//    }
//
//
//
//}
//
//
//
//
////import Foundation
////
////func ProblemSet5LCA(_ nInput: String, _ graphInput: String, _ mInput: String, _ LCAInput: String) {
////
//////    /// Helper Tree class.
//////    class Tree {
//////
//////        /// Helper Node class.
//////        private class Node {
//////            private var value: Int // do i need value?
//////            private var children: [Node]?
//////            public init(value: Int) {
//////                self.value = value
//////            }
//////        }
//////
//////        private var nodes: [Node]?
//////
//////        public init() {}
//////
//////        public func addNode(_ value: Int) {
//////            nodes?.append(Node(value: value))
//////        }
//////
//////    }
////
////    // Number of of vertices
////    let n = Int(nInput)!
////
////    // Adjacency list.
////    var adjList = [[Int]](repeating: [], count: n + 1)
////
////    //
////
////
////    // Populate children.
////    let edges = graphInput.split(separator: "\n")
//////    print(edges)
////    for i in 0..<edges.count {
////        let edge = edges[i].split(separator: " ")
//////        print(edge)
////
////        let u = Int(edge[0])!
////        let v = Int(edge[1])!
////
////        if adjList[u].count == 0 && adjList[v].count == 0 { adjList[u].append(v) }
////        else if adjList[u].count != 0 && adjList[v].count == 0 { adjList[u].append(v) }
////        else if adjList[u].count == 0 && adjList[v].count != 0 { adjList[v].append(u) }
////        else {
////            print("ERROR")
////
////        }
////
////    }
////
//////    for i in 1..<adjList.count {
//////        print("\(i): \(adjList[i])")
//////    }
////
////    func dfs(_ current: Int) -> Bool {
//////        print(adjList[current].count)
////
////        let count = (current == 11 || current == 6) ? 1 : 0
////
//////        var mid: Bool
//////        if (current == 11 || current == 6) {
//////            mid = true
////////            print("XXXXX", current, mid)
//////        } else {
//////            mid = false
//////        }
////
////        if adjList[current].count == 0 {
////            return count > 0
////        } else {
////            var results = [Bool](repeating: false, count: adjList[current].count)
////            for i in 0..<adjList[current].count {
////                results[i] = dfs(adjList[current][i])
//////                print("--->", adjList[current][i], results[i])
////            }
////
//////            print(results)
////            if count + results.reduce(0, { $0 + ($1 ? 1 : 0) }) == 2 {
////                print(current)
////                return true
////            } else if count + results.reduce(0, { $0 + ($1 ? 1 : 0) }) >= 1 {
////                return true
////            } else {
////                return false
////            }
////        }
////    }
////
////    dfs(1)
////}
////
////
