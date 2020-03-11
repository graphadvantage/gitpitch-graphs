
---


# gremlin

[for cypher developers]

---

@snap[west span-45]
## gremlin
@box[bg-blue text-white waved box-padding](...is a functional graph language with declarative support)
@snapend

@snap[east span-45]
## cypher
@box[bg-green text-white waved  box-padding](...is a declarative graph language with functional support)
@snapend

---
@snap[north span-100]
@css[headline](get the nodes)
@snapend

@snap[west span-45 java code-noblend]
## gremlin
```
g.V().limit(10)

```
@snapend

@snap[east span-45 java code-noblend]
## cypher
```
MATCH (n)
RETURN n LIMIT 10

```
@snapend

---
@snap[north span-100]
@css[headline](count the nodes)
@snapend


@snap[west span-45 java code-noblend]
## gremlin
@code[sql zoom-12 code-max code-box-shadow code-noblend](/src/count-nodes.gremlin)
@snapend

@snap[east span-45 java code-noblend]
## cypher
@code[sql zoom-12 code-max code-box-shadow code-noblend](/src/count-nodes.cyp)
@snapend

---
@snap[north span-100]
@css[headline](count the relationships)
@snapend


@snap[west span-45 java code-noblend]
## gremlin
```zoom-12
g.E().count().next()

```
@snapend

@snap[east span-45 java code-noblend]
## cypher
```zoom-12
MATCH (n)-[r]-()
RETURN COUNT(r)

```
@snapend

---
@snap[north span-100]
@css[headline](collect the nodes)
@snapend

@snap[west span-45 java code-noblend]
## gremlin
```sql zoom-12
g.V().limit(10).fold()
```
@snapend

@snap[east span-45 java code-noblend]
## cypher
```sql zoom-12
MATCH (n)
WITH n LIMIT 10
RETURN COLLECT(n)
```
@snapend
