import 'package:flutter/material.dart';
import 'package:graphview/GraphView.dart';

class FamilyTreeApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(title: Text('Family Tree')),
        body: FamilyTree(),
      ),
    );
  }
}

class FamilyTree extends StatelessWidget {
  BuchheimWalkerConfiguration builder = BuchheimWalkerConfiguration();
  @override
  Widget build(BuildContext context) {
    final graph = Graph();
    final john = Node.Id(1);
    final mary = Node.Id(2);
    final peter = Node.Id(3);
    final sarah = Node.Id(4);

    graph.addNode(john);
    graph.addNode(mary);
    graph.addNode(peter);
    graph.addNode(sarah);

    graph.addEdge(john, mary);
    graph.addEdge(john, peter);
    graph.addEdge(peter, sarah);

    final treeView = GraphView(
      graph: graph,
      algorithm: BuchheimWalkerAlgorithm(builder,TreeEdgeRenderer(builder)),
      paint: Paint()
        ..color = Colors.black
        ..strokeWidth = 2
        ..style = PaintingStyle.stroke,
      builder: (Node node) {
        return CircleAvatar(
          child: Text(node.size.toString()),
        );
      },
    );

    return Center(
      child: AspectRatio(
        aspectRatio: 1.0,
        child: Container(
          padding: EdgeInsets.all(32),
          child: treeView,
        ),
      ),
    );
  }
}

void main() {
  runApp(FamilyTreeApp());
}
