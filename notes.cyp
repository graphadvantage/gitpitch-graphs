docker run -it -v /Users/Michael.Moore4@ey.com/Documents/GitHub/gitpitch-graphs:/repo -p 9000:9000 gitpitch/desktop:pro

WITH "file:///Users/Michael.Moore4@ey.com/Documents/GitHub/learn-gremlin-jupyter-notebook/data/air-routes.graphml" AS url
CALL apoc.import.graphml(url,{readLabels:true,storeNodeIds:true})
YIELD nodes, relationships RETURN nodes, relationships;

MATCH (n)
WHERE labels(n) = []
WITH n, apoc.text.capitalize(n.labelV) as label
CALL apoc.create.addLabels([n],[label]) YIELD node
RETURN COUNT(node);

MATCH ()-[r:route]-()
CALL apoc.refactor.setType(r,'ROUTE')
YIELD output
RETURN COUNT(output);

MATCH ()-[r:contains]-()
CALL apoc.refactor.setType(r,'CONTAINS')
YIELD output
RETURN COUNT(output);

CREATE CONSTRAINT ON (n:Airport) ASSERT n.id IS UNIQUE;
CREATE CONSTRAINT ON (n:Country) ASSERT n.id IS UNIQUE;
CREATE CONSTRAINT ON (n:Continent) ASSERT n.id IS UNIQUE;
CREATE CONSTRAINT ON (n:Version) ASSERT n.id IS UNIQUE;
