
@title[pattern matching]
@snap[north span-100]
## gremlin ••• cypher
@css[headline](pattern matching)
@snapend

@snap[west span-85 css code-noblend]
``` css

```
@snapend

@snap[south-east span-85 css code-noblend]
``` css

```
@snapend

---
@title[refactor from list]
@snap[north span-100]
## gremlin ••• cypher
@css[headline](refactor from list iterator)
@snapend

@snap[west span-85 css code-noblend]
``` css

```
@snapend

@snap[south-east span-85 css code-noblend]
``` css

```
@snapend

---
@title[use parameters]
@snap[north span-100]
## gremlin ••• cypher
@css[headline](use parameters)
@snapend

@snap[west span-85 css code-noblend]
``` css

```
@snapend

@snap[south-east span-85 css code-noblend]
``` css

```
@snapend

---
@title[optional matching]
@snap[north span-100]
## gremlin ••• cypher
@css[headline](optional matching)
@snapend

@snap[west span-85 css code-noblend]
``` css

```
@snapend

@snap[south-east span-85 css code-noblend]
``` css

```
@snapend

---
@title[static variables]
@snap[north span-100]
## gremlin ••• cypher
@css[headline](create and pass static variable)
@snapend

@snap[west span-85 css code-noblend]
``` css

```
@snapend

@snap[south-east span-85 css code-noblend]
``` css

```
@snapend

---
@title[pattern matching]
@snap[north span-100]
## gremlin ••• cypher
@css[headline](pattern matching)
@snapend

@snap[west span-85 css code-noblend]
``` css

```
@snapend

@snap[south-east span-85 css code-noblend]
``` css

```
@snapend

---
@title[recursion]
@snap[north span-100]
## gremlin ••• cypher
@css[headline](recursive queries)
@snapend

@snap[west span-85 css code-noblend]
``` css

```
@snapend

@snap[south-east span-85 css code-noblend]
``` css

```
@snapend

---
@title[loops]
@snap[north span-100]
## gremlin ••• cypher
@css[headline](loops)
@snapend

@snap[west span-85 css code-noblend]
``` css

```
@snapend

@snap[south-east span-85 css code-noblend]
``` css

```
@snapend

---

@title[xtra: load air-routes to Neo4j]
@snap[north span-100]
@css[headline](load air-routes.graphml file into Neo4j)
@snapend

@snap[span-100 code-noblend code-wrap text-01]
``` css zoom-07
//load air-routes.graphml
WITH "file:///Users/Michael.Moore4@ey.com/Documents/GitHub/learn-gremlin-jupyter-notebook/data/air-routes.graphml" AS url
CALL apoc.import.graphml(url,{readLabels:true,storeNodeIds:true})
YIELD nodes, relationships RETURN nodes, relationships;

// set labels per Neo4j convention
MATCH (n)
WHERE labels(n) = []
WITH n, apoc.text.capitalize(n.labelV) as label
CALL apoc.create.addLabels([n],[label]) YIELD node
RETURN COUNT(node);

// set rels per Neo4j convention
MATCH ()-[r:route]-()
CALL apoc.refactor.setType(r,'ROUTE')
YIELD output
RETURN COUNT(output);

MATCH ()-[r:contains]-()
CALL apoc.refactor.setType(r,'CONTAINS')
YIELD output
RETURN COUNT(output);
```
@snapend

+++
@title[add id constraints]
@snap[north span-100]
@css[headline](add constraint on node .id property)
@snapend

@snap[span-100 code-noblend code-wrap text-01]
``` css zoom-07
// set constraints on id property (not the same as id(n))
CREATE CONSTRAINT ON (n:Airport) ASSERT n.id IS UNIQUE;
CREATE CONSTRAINT ON (n:Country) ASSERT n.id IS UNIQUE;
CREATE CONSTRAINT ON (n:Continent) ASSERT n.id IS UNIQUE;
CREATE CONSTRAINT ON (n:Version) ASSERT n.id IS UNIQUE;
```
@snapend
