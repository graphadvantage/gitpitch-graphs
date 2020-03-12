
---

@title[title]
# gremlin

for cypher developers

*** michael moore, ph.d. ***

*** march, 2020 ***
---
@title[gremlin vs cypher]
@snap[north span-100]
## gremlin ••• cypher
@snapend

@snap[west span-48]
#### gremlin
@box[bg-blue text-white waved box-padding](...is a functional graph language with declarative support)
@snapend

@snap[east span-48]
#### cypher
@box[bg-green text-white waved  box-padding](...is a declarative graph language with functional support)
@snapend

---
@title[things to know]
@snap[north span-100]
## gremlin ••• cypher
@css[headline](things to know about gremlin)
@snapend

@snap[span-100 text-07 ]
* One label per node (no label-based set logic operations)
* Data can be stored on vertices (nodes) and edges (rels)
* Import data: `graph.io(graphml()).readGraph(‘file’)`
* Delete graph: `g.V().drop().iterate()`
* `.next()` is used  to manage output rowsets => `RETURN`
* `.fold()` makes lists => like `COLLECT`
* `.unfold()` pivots lists (into maps) => (kind of) like `UNWIND`
* `.group()` makes maps
* `.valueMap()` to access property maps
@snapend

---
@title[resources]
@snap[north-east span-100]
## resources
@snapend

@snap[south-west span-50 text-06]
#### cheatsheet
[gremlin cheatsheet](https://dkuppitz.github.io/gremlin-cheat-sheet/101.html)

#### repos and documentation
[gremlin console and server](http://tinkerpop.apache.org/downloads.html)
[learn gremlin jupyter notebooks](https://github.com/AndrewChau/learn-gremlin-jupyter-notebook)
[practical gremlin book](https://github.com/krlawrence/graph  & http://kelvinlawrence.net/book/PracticalGremlin.html)
[gremlin documentation](http://tinkerpop.apache.org/docs/current/reference/#_tinkerpop_documentation)
[gremlin recipes](http://tinkerpop.apache.org/docs/current/recipes/)
[gremlin neptune sample code](https://github.com/aws-samples/amazon-neptune-samples)
[neptune tools](https://github.com/awslabs/amazon-neptune-tools)
[openCypher](https://github.com/opencypher/openCypher)
[cypher for gremlin](https://github.com/opencypher/cypher-for-gremlin)
[graph plugin for intelliJ](https://github.com/neueda/jetbrains-plugin-graph-database-support)
[neptune tinkerpop 3.4](https://aws.amazon.com/blogs/database/amazon-neptune-now-supports-tinkerpop-3-4-features/)
@snapend

@snap[east span-50 text-06 code-noblend]
#### docker images
```docker zoom-08
docker pull gremlin-local_neptune-ui            
docker pull tinkerpop/gremlin-server
docker pull tinkerpop/gremlin-console
docker pull neueda/cypher-gremlin-server
docker pull neueda/cypher-gremlin-console
```
@snapend
---
@title[gremlin docs]
@snap[north-east span-100]
## docs
[gremlin tinkerpop documentation](http://tinkerpop.apache.org/docs/current/reference/#_tinkerpop_documentation)
@snapend

@snap[south-west]
![](/assets/img/gremlin-docs.png)
@snapend

---
@title[gremlin book]
@snap[north-east span-100]
## book
[practical gremlin by k. lawrence](https://github.com/krlawrence/graph  & http://kelvinlawrence.net/book/PracticalGremlin.html)
@snapend

@snap[south-east span=100]
![width=575](/assets/img/practical-gremlin.png)
@snapend

---
@title[gremlin cheatsheet]
@snap[north-west span-100]
## cheatsheet
[gremlin cheatsheet](https://dkuppitz.github.io/gremlin-cheat-sheet/101.html)
@snapend

@snap[south-west span=100]
![width=650](/assets/img/gremlin-cheatsheet.png)
@snapend

---

@title[let's start]

let's start

---
@title[setup a sandbox]
@snap[north-east span-100]
## a learning sandbox
@css[headline](... yes, there is no gremlin IDE ...)
@snapend

@snap[west span-100 text-06]
1. install and start gremlin console `$ bin/gremlin.sh`  [download](http://tinkerpop.apache.org/downloads.html)
1. install and start gremlin server `$ bin/gremlin-server.sh console`  [download](http://tinkerpop.apache.org/downloads.html)
1. install anaconda /jupyter notebook [download](https://www.anaconda.com/distribution/)
1. from terminal `$ pip install gremlinpython`
1. and `$ pip install nbfinder`
1. and `$ pip install jupyter notebook==5.7.8 tornado==4.5.3` [why?](https://github.com/jupyter/notebook/issues/3397)
1. clone [learn-gremlin-jupyter-notebooks](https://github.com/AndrewChau/learn-gremlin-jupyter-notebook)
1. run anaconda, start jupyter, open and run loader.ipynb, trust the notebook
1. install node.js, clone, install and start [gremlin-visualizer](https://github.com/prabushitha/gremlin-visualizer)
1. open gremlin console, remote to gremlin server, load air-routes graph (next slide)
@snapend

---
@title[gremlin server]
@snap[north-east span-100]
## gremlin server
@snapend

@snap[south span-100 plaintext code-noblend code-wrap text-02]
``` plaintext zoom-06

Usage: bin/gremlin-server.sh {start|stop|restart|status|console|install <group> <artifact> <version>|<conf file>}
    start        Start the server in the background using conf/gremlin-server.yaml as the default configuration file
    stop         Stop the server
    restart      Stop and start the server
    status       Check if the server is running
    console      Start the server in the foreground using conf/gremlin-server.yaml as the default configuration file
    install      Install dependencies
If using a custom YAML configuration file then specify it as the only argument for Gremlin
Server to run in the foreground or specify it via the GREMLIN_YAML environment variable.

(base) USC02ZX15JMD6R:apache-tinkerpop-gremlin-server-3.4.6 Michael.Moore4@ey.com$ bin/gremlin-server.sh console

[INFO] GremlinServer - 3.4.6
         \ooo/
         (o o)
=====oOOo-(3)-oOOo=====
[INFO] GremlinServer - Configuring Gremlin Server from /Users/Michael.Moore4@ey.com/Documents/apache-tinkerpop-gremlin-server-3.4.6/conf/gremlin-server.yaml
[INFO] MetricManager - Configured Metrics ConsoleReporter configured with report interval=180000ms
*** many messages later ***
[INFO] GremlinServer$1 - Gremlin Server configured with worker thread pool of 1, gremlin pool of 16 and boss thread pool of 1.
[INFO] GremlinServer$1 - Channel started at port 8182.


```
@snapend

---
@title[gremlin-console]
@snap[north-east span-100]
## gremlin console
@snapend

@snap[south span-100 plaintext code-noblend code-wrap text-02]
``` plaintext zoom-06
(base) USC02ZX15JMD6R:apache-tinkerpop-gremlin-console-3.4.4 Michael.Moore4@ey.com$ bin/gremlin.sh
         \ooo/
         (o o)
=====oOOo-(3)-oOOo=====
plugin activated: tinkerpop.server
plugin activated: tinkerpop.utilities
plugin activated: opencypher.gremlin
plugin activated: tinkerpop.tinkergraph

gremlin> :remote connect tinkerpop.server conf/remote.yaml
==>Configured localhost/127.0.0.1:8182, localhost/0:0:0:0:0:0:0:1:8182

gremlin> :remote list
==>*0 - Gremlin Server - [localhost/127.0.0.1:8182, localhost/0:0:0:0:0:0:0:1:8182]

gremlin> :> graph.io(graphml()).readGraph('/Users/Michael.Moore4@ey.com/Documents/GitHub/learn-gremlin-jupyter-notebook/data/air-routes.graphml')
==>null

gremlin> :> g.V().count()
==>3619

gremlin> :remote console
==>All scripts will now be sent to Gremlin Server - [localhost/127.0.0.1:8182, localhost/0:0:0:0:0:0:0:1:8182] - type ':remote console' to return to local mode

```
@snapend
---
@title[gremlin notebooks]
@snap[north-east span-100]
## gremlin
## notebooks
[learn-gremlin-jupyter-notebooks](https://github.com/AndrewChau/learn-gremlin-jupyter-notebook)
@snapend

@snap[west span-30 text-04]
01. V, Has, HasLabel, HasId, Count, ValueMap, Values, Unfold, Fold, HasNot, Not.ipynb
02. E, OutE, InV, Out, InE, OuV, In.ipynb
03. GroupCount, Group.ipynb
04. Gt, Lt, Between, Within, Mean, Dedup, Where, Neq, Limit, Range, Skip, Tail, TimeLimit.ipynb
05. Path, Repeat, Times, From, To.ipynb
06. Select, Project.ipynb
07. ToList, Join, ToSet, ToBulkSet, Size, UniqueSize, AsBulk, Fill.ipynb
08. Label.ipynb
09. Mean, Local, Sum, Max, Min.ipynb
10. Eq, Neq, Not, And, Or, Gt, Gte, Lt, Lte, Inside, Outside, Within, Without, Between.ipynb
11. Coin, Sample.ipynb
12. Order.ipynb
13. Where, Filter.ipynb
14. Choose, Constant, Option, Match.ipynb
15. Union, Identity.ipynb
16. SideEffect, Aggregate, Inject, Coalesce, Optional.ipynb
17. Both, BothE, BothV, OtherV.ipynb
18. SimplePath, Until, Loops, Emit, CyclicPath.ipynb
19. Math.ipynb
20. loader.ipynb
@snapend

@snap[south-east]
![width=650](/assets/img/gremlin-notebooks.png)
@snapend

---
@title[gremlin visualizer]
@snap[north-east span-100]
## gremlin visualizer
@snapend

@snap[south-east]
![width=850](/assets/img/gremlin-visualizer.png)
@snapend

@snap[west span-15 text-08]
[gremlin-visualizer](https://github.com/prabushitha/gremlin-visualizer)
example:
```css code-noblend zoom-07
g.V().limit(30)
```

** no tabular output **


@snapend

---
@title[get some nodes]
@snap[north span-100]
## gremlin ••• cypher
@css[headline](get some nodes)
@snapend

@snap[west span-48 css code-noblend]
``` css
g.V().limit(5)

==>v[0]
==>v[1]
==>v[2]
==>v[3]
==>v[4]
```
** see the vertex ids? **
@snapend

@snap[east span-48 css code-noblend]
``` css
MATCH (n)
RETURN n LIMIT 5
```
@snapend

---
@title[get node properties]
@snap[north span-100]
## gremlin ••• cypher
@css[headline](get node properties)
@snapend

@snap[west span-48 css code-noblend]
``` css
g.V(3).valueMap().unfold()

==>country=[US]
==>code=[AUS]
==>longest=[12250]
==>city=[Austin]
==>elev=[542]
```
** rows of key value pairs **
@snapend

@snap[east span-48 css code-noblend]
``` css
MATCH (n) WHERE id(n) = 3
RETURN n
```
@snapend

---
@title[count graph nodes]
@snap[north span-100]
## gremlin ••• cypher
@css[headline](count the nodes)
@snapend

@snap[west span-48 css code-noblend]
``` css
g.V().count().next()

==>3619
```
** .next() terminator is not needed in the gremlin console (but is for groovy scripts) **
@snapend

@snap[east span-48 css code-noblend]
``` css
MATCH (n)
RETURN COUNT(n)
```
@snapend

---
@title[count graph rels]
@snap[north span-100]
## gremlin ••• cypher
@css[headline](count the relationships)
@snapend


@snap[west span-48 css code-noblend]
``` css
g.E().count().next()

==>50148
```
** what is referencing the graph edges? **
@snapend

@snap[east span-48 css code-noblend]
``` css
MATCH (n)-[r]-()
RETURN COUNT(r)
```
@snapend

---
@title[collect nodes to list]
@snap[north span-100]
## gremlin ••• cypher
@css[headline](collect the nodes)
@snapend

@snap[west span-66 css code-noblend]
``` css
g.V().limit(5).fold()

==>[v[0], v[1], v[2], v[3], v[4]]
```
** list of nodes on a single row **
@snapend

@snap[south-east span-48 css code-noblend]
``` css
MATCH (n)
WITH n LIMIT 5
RETURN COLLECT(n)
```
@snapend

---
@title[get property values]
@snap[north span-100]
## gremlin ••• cypher
@css[headline](get property values)
@snapend

@snap[south-west span-48 css code-noblend]
``` css
g.V().valueMap('code').
      limit(5)

==>{code=[0.77]}
==>{code=[ATL]}
==>{code=[ANC]}
==>{code=[AUS]}
==>{code=[BNA]}
```
** returns values of "code" property **
@snapend

@snap[east span-48 css code-noblend]
``` css
MATCH (n)
RETURN n.code LIMIT 5
```
@snapend

---
@title[map projection]
@snap[north span-100]
## gremlin ••• cypher
@css[headline](map projection from labeled node)
@snapend

@snap[west span-75 css code-noblend]
``` css
g.V().hasLabel('airport').
      limit(10).
      project('airport_code','elevation').
      by('code').by('elev')

==>{airport_code=ATL, elevation=1026}
==>{airport_code=ANC, elevation=151}
==>{airport_code=AUS, elevation=542}
```
** How are .project() and .by() related? **
@snapend

@snap[south-east span-75 css code-noblend]
``` css
MATCH (n:Airport)
WITH n LIMIT 10
RETURN {'airport_code':n.code,
        'elevation':n.elev}
```
@snapend

---

@title[traversers]
@snap[north span-100]
## gremlin ••• cypher
@css[headline](gremlin traversal functions with cypher equivalents)
@table[text-05](/assets/tables/gremlin-traversers.csv)
@snapend

---
@title[count outgoing rels]
@snap[north span-100]
## gremlin ••• cypher
@css[headline](count outgoing relationship paths)
@snapend

@snap[west span-75 css code-noblend]
``` css
g.V().hasLabel('airport').
      has('code','AUS').out().
      path().count()

==>59
```
** what would .both() instead of .out() do? **
@snapend

@snap[south-east span-75 css code-noblend]
``` css
MATCH
p = (n:Airport {code:'AUS'})-->()
RETURN COUNT(p)
```
@snapend

---
@title[traverse and count distinct]
@snap[north span-100]
## gremlin ••• cypher
@css[headline](count distinct end node properties)
@snapend

@snap[west span-75 css code-noblend]
``` css
g.V().hasLabel('airport').
      has('code','AUS').out('route').
      path().by('region').
      dedup().count()
==>33
```
** what, exactly, is being deduped? **
@snapend

@snap[south-east span-75 css code-noblend]
``` css
MATCH (n:Airport {code:'AUS'})-[:ROUTE]->(d)
RETURN COUNT(distinct d.region)
```
@snapend


---
@title[order by property on rel]
@snap[north span-100]
## gremlin ••• cypher
@css[headline](order by relationship property)
@snapend

@snap[west span-100 css code-noblend]
``` css
g.V().hasLabel('airport').
      has('code','LAX').inE('route').as('distance').
      outV().as('airport').
      select('airport','distance').by('city').by('dist').
      order().by('distance',decr).next()

==>airport=Abu Dhabi
==>distance=8372
```
** what traversal objects are being aliased? **
@snapend

@snap[south-east span-85 css code-noblend]
``` css
MATCH (n:Airport {code:'LAX'})<-[r:ROUTE]-(o)
RETURN {'airport':o.city, 'distance':r.dist}
ORDER BY r.dist DESC LIMIT 1
```
@snapend

---
@title[make a node]
@snap[north span-100]
## gremlin ••• cypher
@css[headline](make a node)
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
@title[update node props]
@snap[north span-100]
## gremlin ••• cypher
@css[headline](update properties)
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
@title[make a rel]
@snap[north span-100]
## gremlin ••• cypher
@css[headline](make a relationship)
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
@title[grouping]
@snap[north span-100]
## gremlin ••• cypher
@css[headline](grouping)
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
