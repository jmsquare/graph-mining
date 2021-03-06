install.packages("igraph")

g <- read_graph("C:/Users/JM/Documents/graph_1.txt", format="ncol",directed=TRUE)


###################################
# Compute the minimum spanning tree
###################################
mst <- minimum.spanning.tree(g)
plot(mst, layout=layout.reingold.tilford, 
       edge.label=E(mst)$weight)

#Connected component
# Nodes reachable from node4
subcomponent(g, 4, mode="out")
# Nodes who can reach node4
subcomponent(g, 4, mode="in")
cl <- clusters(g, mode="weak")

#Shortest path
g <- erdos.renyi.game(12, 0.25)
pa <- get.shortest.paths(g, 5, 9)[[1]]



###################################
######Graphs statistics###########################
###################################
# No of nodes
length(V(g))
# No of edges
length(E(g))

# Density (No of edges / possible edges)
graph.density(g)
# Number of islands
clusters(g)$no


# Global cluster coefficient:
  #(close triplets/all triplets)
transitivity(g, type="global")
# Edge connectivity, 0 since graph is disconnected
edge.connectivity(g)
# Same as graph adhesion
graph.adhesion(g)

# Diameter of the graph
diameter(g)
# Reciprocity of the graph
reciprocity(g)
# Diameter of the graph
diameter(g)
# Reciprocity of the graph
reciprocity(g)
hist(degree.distribution(g))


##########################CENTRALITY MEASURE###########
###Degree######
degree(g)

##### Closeness (inverse of average dist)#########
##actors high in closeness are able to efficiently transmit information and have independance in the sense that they do not need to seek information from other more peripheral actors
closeness(g)

#####Betweenness
##Betweeness centrality measures the extent to which an actor lies between other actors on their goedesics. Able to influence both in direct and indirect.

betweenness(g)

# Local cluster coefficient
transitivity(g, type="local")

# Eigenvector centrality
evcent(g)$vector

# Rank
order(degree(g))
order(closeness(g))
order(betweenness(g))
order(evcent(g)$vector)

# Plot the eigevector and betweenness centrality
plot(evcent(g)$vector, betweenness(g))
text(evcent(g)$vector, betweenness(g), 0:100, 
       cex=0.6, pos=4)
V(g)[12]$color <- 'red'
V(g)[8]$color <- 'green'

lay <- layout.fruchterman.reingold(g)
plot(g, layout=lay, vertex.size=8, 
       vertex.label.cex=0.6)

yo$vector == evcent(g)$vector

j<- cbind(yo$vector,evcent(g)$vector)


centralite <- as.data.frame(cbind(degree = degree(g),closeness = closeness(g),betweeness = betweenness(g),eg_vec = evcent(g)$vector))


