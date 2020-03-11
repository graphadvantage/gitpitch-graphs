
---


# gremlin

[for cypher developers]

---
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
@snap[north span-100]
## gremlin ••• cypher
@css[headline](get some nodes)
@snapend

@snap[west span-48 java code-noblend]
```
g.V().limit(5)

==>v[0]
==>v[1]
==>v[2]
==>v[3]
==>v[4]
```
@snapend

@snap[east span-48 java code-noblend]
```
MATCH (n)
RETURN n LIMIT 5
```
@snapend

---
@snap[north span-100]
## gremlin ••• cypher
@css[headline](get node properties)
@snapend

@snap[west span-48 java code-noblend]
```
g.V(3).valueMap().unfold()

==>country=[US]
==>code=[AUS]
==>longest=[12250]
==>city=[Austin]
==>elev=[542]
```
@snapend

@snap[east span-48 java code-noblend]
```
MATCH (n) WHERE id(n) = 3
RETURN n
```
@snapend

---
@snap[north span-100]
## gremlin ••• cypher
@css[headline](count the nodes)
@snapend

@snap[west span-48 java code-noblend]
```js
g.V().count().next()

==>3619
```
@snapend

@snap[east span-48 java code-noblend]
```js
MATCH (n)
RETURN COUNT(n)
```
@snapend

---
@snap[north span-100]
## gremlin ••• cypher
@css[headline](count the relationships)
@snapend


@snap[west span-48 java code-noblend]
```js
g.E().count().next()

==>50148
```
@snapend

@snap[east span-48 java code-noblend]
```js
MATCH (n)-[r]-()
RETURN COUNT(r)
```
@snapend

---
@snap[north span-100]
## gremlin ••• cypher
@css[headline](collect the nodes)
@snapend

@snap[west span-48 java code-noblend]
```js
g.V().limit(5).fold()

==>[v[0], v[1], v[2], v[3], v[4]]
```
@snapend

@snap[east span-48 java code-noblend]
```js
MATCH (n)
WITH n LIMIT 5
RETURN COLLECT(n)
```
@snapend

---
@snap[north span-100]
## gremlin ••• cypher
@css[headline](get property values)
@snapend

@snap[west span-48 java code-noblend]
```js
g.V().valueMap('code') \
  .limit(5)

==>{code=[0.77]}
==>{code=[ATL]}
==>{code=[ANC]}
==>{code=[AUS]}
==>{code=[BNA]}
```
@snapend

@snap[east span-48 java code-noblend]
```js
MATCH (n)
RETURN n.code LIMIT 5
```
@snapend

---
@snap[north span-100]
## gremlin ••• cypher
@css[headline](map projection from labeled node)
@snapend

@snap[west span-75 java code-noblend]
```js
g.V().hasLabel('airport') \
  .limit(10) \
  .project('airport_code','elevation') \
  .by('code').by('elev')

==>{airport_code=ATL, elevation=1026}
==>{airport_code=ANC, elevation=151}
==>{airport_code=AUS, elevation=542}
```
@snapend

@snap[south-east span-75 java code-noblend]
```js
MATCH (n:Airport)
WITH n LIMIT 10
RETURN {'airport_code':n.code,
        'elevation':n.elev}
```
@snapend

---
@snap[north span-100]
## gremlin ••• cypher
@css[headline](count outgoing relationships)
@snapend

@snap[west span-75 java code-noblend]
```js
g.V().hasLabel('airport') \
.has('code','AUS').out() \
.path().count()

==>59
```
@snapend

@snap[south-east span-75 java code-noblend]
```js
MATCH
p = (n:Airport {code:'AUS'})-->()
RETURN COUNT(p)
```
@snapend

---
@snap[north span-100]
## gremlin ••• cypher
@css[headline](count distinct end node properties)
@snapend

@snap[west span-75 java code-noblend]
```js
g.V().hasLabel('airport') \
.has('code','AUS').out('route') \
.path().by('region').dedup().count()

==>33
```
@snapend

@snap[south-east span-75 java code-noblend]
```js
MATCH (n:Airport {code:'AUS'})-[:ROUTE]->(d)
RETURN COUNT(distinct d.region)
```
@snapend


---
@snap[north span-100]
## gremlin ••• cypher
@css[headline](order by relationship property)
@snapend

@snap[west span-85 java code-noblend]
```js
g.V().hasLabel('airport') \
.has('code','LAX').inE('route').as('distance') \
.outV().as('airport') \
select('airport','distance').by('city').by('dist') \
order().by('distance',decr).next()

==>airport=Abu Dhabi
==>distance=8372
```
@snapend

@snap[south-east span-85 java code-noblend]
```js
MATCH (n:Airport {code:'LAX'})<-[r:ROUTE]-(o)
RETURN {'airport':o.city, 'distance':r.dist}
ORDER BY r.dist DESC LIMIT 1
```
@snapend

---
@snap[north span-100]
## gremlin ••• cypher
@css[headline](make a node)
@snapend

@snap[west span-85 java code-noblend]
```js

```
@snapend

@snap[south-east span-85 java code-noblend]
```js

```
@snapend

---
@snap[north span-100]
## gremlin ••• cypher
@css[headline](update properties)
@snapend

@snap[west span-85 java code-noblend]
```js

```
@snapend

@snap[south-east span-85 java code-noblend]
```js

```
@snapend

---
@snap[north span-100]
## gremlin ••• cypher
@css[headline](make a relationship)
@snapend

@snap[west span-85 java code-noblend]
```js

```
@snapend

@snap[south-east span-85 java code-noblend]
```js

```
@snapend

---
@snap[north span-100]
## gremlin ••• cypher
@css[headline](refactor from list iterator)
@snapend

@snap[west span-85 java code-noblend]
```js

```
@snapend

@snap[south-east span-85 java code-noblend]
```js

```
@snapend

---
@snap[north span-100]
## gremlin ••• cypher
@css[headline](use parameters)
@snapend

@snap[west span-85 java code-noblend]
```js

```
@snapend

@snap[south-east span-85 java code-noblend]
```js

```
@snapend

---
@snap[north span-100]
## gremlin ••• cypher
@css[headline](optional matching)
@snapend

@snap[west span-85 java code-noblend]
```js

```
@snapend

@snap[south-east span-85 java code-noblend]
```js

```
@snapend

---
@snap[north span-100]
## gremlin ••• cypher
@css[headline](create and pass static variable)
@snapend

@snap[west span-85 java code-noblend]
```js

```
@snapend

@snap[south-east span-85 java code-noblend]
```js

```
@snapend

---
@snap[north span-100]
## gremlin ••• cypher
@css[headline](pattern matching)
@snapend

@snap[west span-85 java code-noblend]
```js

```
@snapend

@snap[south-east span-85 java code-noblend]
```js

```
@snapend

---
@snap[north span-100]
## gremlin ••• cypher
@css[headline](recursive queries)
@snapend

@snap[west span-85 java code-noblend]
```js

```
@snapend

@snap[south-east span-85 java code-noblend]
```js

```
@snapend

---
@snap[north span-100]
## gremlin ••• cypher
@css[headline](loops)
@snapend

@snap[west span-85 java code-noblend]
```js

```
@snapend

@snap[south-east span-85 java code-noblend]
```js

```
@snapend

---
@snap[north span-100]
## gremlin ••• cypher
@css[headline](grouping)
@snapend

@snap[west span-85 java code-noblend]
```js

```
@snapend

@snap[south-east span-85 java code-noblend]
```js

```
@snapend
