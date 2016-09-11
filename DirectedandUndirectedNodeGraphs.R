# The nodes are placed randomly, therefore in order to get consistent graphs the random seed has to be manually set.
library(igraph)
set.seed(100)

# ###Undirected Graph

# Undirected graphs are created with `graph()` and the parameter `directed=FALSE` from an array of pairs of nodes, which determine the edges.
graph.nondirected <- graph(c(1,2, 2,3, 3,1, 2,4, 5,5, 3,6, 7,1, 7,5), directed=FALSE)
plot(graph.nondirected)

# ###Directed Graph 

# Directed graphs are created with `graph()` from an array of pairs of nodes, which determine the edges.
graph.directed <- graph(c(1,2, 2,3, 3,1, 2,4, 5,5, 3,6, 7,1, 7,5))
plot(graph.directed)
