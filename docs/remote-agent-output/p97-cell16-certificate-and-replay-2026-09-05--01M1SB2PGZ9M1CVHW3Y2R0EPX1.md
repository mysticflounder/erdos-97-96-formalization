# P97 cell-16 compact exact replay package

This self-contained package records the fresh n=12 support table, all eight rhombi, seven midpoint circuits, all sixteen certified seven-row cuts, an exact integer strict-Kalmanson/triangle metric, and a standard-library Python verifier. Copy the Python block into verify_cell16.py and run python verify_cell16.py. No numerical solver, external package, or missing historical artifact is required.

The conclusion concerns this support table only. It does not close the time-limited cell, the radius-ten shell, or global n=12. The checker relies on the elementary planar equal-sided-four-cycle lemma proved in the companion obstruction note: four distinct planar vertices a,b,c,d with equal consecutive sides satisfy a+c=b+d. This is computational exact replay, not Lean kernel verification.

```python
from fractions import Fraction
from itertools import combinations

ROWS = [
 [3,6,7,10], [3,5,8,11], [4,6,9,11], [0,1,4,5],
 [2,3,6,8], [1,3,7,9], [0,2,4,7], [0,5,6,9],
 [1,4,10,11], [2,5,7,10], [0,8,9,11], [1,2,8,10]
]
SEED = [
 [1,2,8,11], [3,5,9,11], [0,1,3,4], [0,6,8,10],
 [2,3,5,8], [1,3,7,9], [4,5,7,8], [0,2,5,9],
 [6,7,9,10], [1,5,7,11], [0,8,9,11], [1,4,6,9]
]
RHOMBI = [
 [0,3,4,6], [0,3,5,7], [0,7,9,10], [1,3,4,8],
 [1,8,10,11], [2,4,8,11], [2,6,7,9], [2,9,10,11]
]
# Each item is (midpoint, endpoints, integer weights on RHOMBI).
CIRCUITS = [
 (6,[0,7],[-1,0,0,1,-1,0,-1,1]),
 (3,[1,5],[0,-1,1,-1,0,-1,0,1]),
 (8,[1,3],[1,0,-1,0,-1,1,-1,0]),
 (10,[2,11],[1,0,-1,-1,1,0,-1,0]),
 (2,[9,10],[-1,0,1,1,-1,0,1,1]),
 (4,[3,5],[1,-1,0,1,-1,0,-1,1]),
 (3,[4,8],[-1,0,1,-1,1,-1,1,0]),
]
# Each item is (active rows, circuit index, equal-distance anchor).
CORES = [
 ([0,1,2,3,4,7,10],0,0),
 ([0,1,2,4,7,8,10],0,0),
 ([0,1,2,4,7,10,11],0,0),
 ([0,1,3,4,5,9,11],1,1),
 ([0,1,3,4,7,9,11],1,1),
 ([0,1,4,6,9,10,11],0,0),
 ([0,2,3,5,8,9,10],1,1),
 ([0,2,3,5,8,9,11],1,1),
 ([0,2,3,6,8,9,11],0,0),
 ([0,3,4,5,8,9,11],1,1),
 ([0,3,6,8,9,10,11],0,0),
 ([1,2,3,7,8,9,10],1,1),
 ([1,3,4,7,9,10,11],1,1),
 ([2,3,4,5,7,8,10],1,1),
 ([2,3,5,7,8,9,10],1,1),
 ([3,4,6,7,8,9,11],0,0),
]
# Values of quotient components, ordered by their lexicographically first edge.
VALUES = [23,24,49,53,43,30,33,27,11,58,56,67,53,70,39,41,
          61,44,67,58,71,55,61,80,73,17,64,62,82,76,33,35,
          70,65,36,52,74,70,32,72,69,18,50]
PAIRS = list(combinations(range(12),2))

def require(condition, message):
    if not condition:
        raise ValueError(message)

def quotient(rows):
    index = {e:i for i,e in enumerate(PAIRS)}
    parent = list(range(len(PAIRS)))
    def find(i):
        while parent[i] != i:
            i = parent[i]
        return i
    for center,row in enumerate(rows):
        for endpoint in row[1:]:
            a = find(index[tuple(sorted((center,row[0])))])
            b = find(index[tuple(sorted((center,endpoint)))])
            parent[b] = a
    return {e:find(i) for e,i in index.items()}

def replay(active, circuit_id, anchor):
    rows = [ROWS[i] if i in active else [] for i in range(12)]
    cl = quotient(rows)
    mid,ends,weights = CIRCUITS[circuit_id]
    target = [0]*12
    for q,w in zip(RHOMBI,weights):
        if not w:
            continue
        edges = [tuple(sorted((q[i],q[(i+1)%4]))) for i in range(4)]
        require(len(set(q)) == 4, 'repeated rhombus label')
        require(len({cl[e] for e in edges}) == 1,
                'equal-side premise absent')
        for i,x in enumerate(q):
            target[x] += w*(1 if i%2 == 0 else -1)
    expected = [0]*12
    expected[mid] = 2
    for x in ends:
        expected[x] = -1
    require(target == expected, 'integer cancellation failed')
    require(anchor in ends, 'anchor not an endpoint')
    other = next(x for x in ends if x != anchor)
    require(cl[tuple(sorted((anchor,mid)))] ==
            cl[tuple(sorted((anchor,other)))], 'anchor equality absent')
    require(Fraction(1)-Fraction(1,2)**2 == Fraction(3,4),
            'collision factor incorrect')

changed = tuple(i for i in range(12) if ROWS[i] != SEED[i])
require(list(combinations(range(12),10)).index(changed) == 16,
        'wrong reconstructed cell')
require(set(range(12))-set(changed) == {5,10}, 'wrong unchanged centers')
replay(set(range(12)),0,0)
for active,circuit_id,anchor in CORES:
    replay(set(active),circuit_id,anchor)

cl = quotient(ROWS)
components = {}
for edge in PAIRS:
    components.setdefault(cl[edge],[]).append(edge)
require(len(components) == len(VALUES) == 43, 'wrong component count')
D = [[0]*12 for _ in range(12)]
for edges,value in zip(components.values(),VALUES):
    for a,b in edges:
        D[a][b] = D[b][a] = value
require(all(D[a][b] > 0 for a,b in PAIRS), 'nonpositive distance')
require(all(len({D[c][x] for x in row}) == 1
            for c,row in enumerate(ROWS)), 'selected equality failed')
slacks = []
for a,b,c,d in combinations(range(12),4):
    slacks.extend([D[a][c]+D[b][d]-D[a][b]-D[c][d],
                   D[a][c]+D[b][d]-D[a][d]-D[b][c]])
require(len(slacks) == 990, 'wrong Kalmanson count')
for a,b,c in combinations(range(12),3):
    slacks.extend([D[a][b]+D[b][c]-D[a][c],
                   D[a][c]+D[c][b]-D[a][b],
                   D[b][a]+D[a][c]-D[b][c]])
require(len(slacks) == 1650 and min(slacks) == 1,
        'strict-metric replay failed')
print('PASS: midpoint contradiction; 16 seven-row cuts; 990 strict '
      'Kalmanson inequalities; 660 strict triangle inequalities; '
      'minimum exact slack 1. Support table has no distinct planar '
      'realization. Cell 16 itself remains OPEN.')
```

## Master integration

For each core, forbid the conjunction that all listed centers have exactly the selected support in ROWS. This is a sound planar necessary-condition cut even when the other five rows are unassigned. A clause is violated only once all seven completed support masks match. These cuts do not assert static-only or Kalmanson-only infeasibility.

The full session bundle additionally preserves numerical LP output, matrix analyses, all raw transcripts, generic-screen source, regression fixtures, C++ filter source and tests, manifest and checksums. Its SHA-256 is 3e6888bc8a2d18c2d0c4cabaa7b9d3978893f57de062aaf7432cc9a95dab1361, with 35,554 compressed bytes. This compact package is independently usable without that bundle.
