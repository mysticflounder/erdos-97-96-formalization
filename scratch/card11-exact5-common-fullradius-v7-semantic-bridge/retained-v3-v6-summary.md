# Exact retained V3--V6 census

This is a clause-map audit artifact, not a Lean proof.

- retained clauses: `15475`
- full CNF SHA-256: `94bc1ddb59166cc86e146c036ab7229a7eea878c28579e2df0520eec1b2a892d`
- core CNF SHA-256: `ee65de56f8b1f733957bd17b939efae63dbc9afbab21c0837af35f3cdae8b24c`

## Counts by family

| Family | Retained |
|---|---:|
| `convex-five-point-core-forward-exclusions` | 395 |
| `duplicate-center-core-exclusions` | 188 |
| `first-apex-exact-five-global-equality-seeds` | 10 |
| `first-apex-named-exact-five-entire-class` | 7 |
| `global-edge-equality-transitivity` | 1464 |
| `local-equality-transitivity` | 73 |
| `perpendicular-bisector-core-exclusions` | 172 |
| `selected-row-global-equality-seeds` | 8214 |
| `selected-row-internal-radius-equalities` | 4642 |
| `source-center-iff-some-source-row-choice` | 164 |
| `source-choice-implies-entire-blocker-radius-class` | 16 |
| `source-choice-no-qfree-after-that-source-deletion` | 101 |
| `used-center-iff-some-source-center-map` | 1 |
| `v6-local-four-class-witness-iff` | 12 |
| `v6-qdeleted-pair-witness-iff` | 4 |
| `v6-u5-common-bisector-triple-incompatibilities` | 2 |
| `v6-u5-nontriple-equilateral-incompatibilities` | 10 |

## Sparse V6 clauses

Each line is `input-id: signed semantic atoms`.

### `v6-local-four-class-witness-iff`

- `928058`: +local_four({"center":1,"support":[0,2,6,8]}), -local_equality({"center":1,"left":0,"right":2}), -local_equality({"center":1,"left":0,"right":6}), -local_equality({"center":1,"left":0,"right":8})
- `928070`: +local_four({"center":1,"support":[0,2,7,8]}), -local_equality({"center":1,"left":0,"right":2}), -local_equality({"center":1,"left":0,"right":7}), -local_equality({"center":1,"left":0,"right":8})
- `933867`: -local_four({"center":8,"support":[0,1,2,5]}), +local_equality({"center":8,"left":0,"right":1})
- `933868`: -local_four({"center":8,"support":[0,1,2,5]}), +local_equality({"center":8,"left":0,"right":2})
- `934588`: -local_four({"center":8,"support":[3,4,7,9]}), +local_equality({"center":8,"left":3,"right":7})
- `934589`: -local_four({"center":8,"support":[3,4,7,9]}), +local_equality({"center":8,"left":3,"right":9})
- `934659`: -local_four({"center":8,"support":[4,5,9,10]}), +local_equality({"center":8,"left":4,"right":5})
- `934661`: -local_four({"center":8,"support":[4,5,9,10]}), +local_equality({"center":8,"left":4,"right":10})
- `934671`: -local_four({"center":8,"support":[4,6,9,10]}), +local_equality({"center":8,"left":4,"right":6})
- `934673`: -local_four({"center":8,"support":[4,6,9,10]}), +local_equality({"center":8,"left":4,"right":10})
- `934687`: -local_four({"center":8,"support":[5,6,9,10]}), +local_equality({"center":8,"left":5,"right":6})
- `934688`: -local_four({"center":8,"support":[5,6,9,10]}), +local_equality({"center":8,"left":5,"right":9})

### `v6-qdeleted-pair-witness-iff`

- `984804`: -local_four({"center":1,"support":[0,2,7,8]}), +qdeleted_pair({"center":1,"deleted":6,"first":0,"second":8})
- `984958`: -local_four({"center":1,"support":[0,2,7,8]}), +qdeleted_pair({"center":1,"deleted":6,"first":2,"second":8})
- `985351`: -local_four({"center":1,"support":[0,2,7,8]}), +qdeleted_pair({"center":1,"deleted":6,"first":7,"second":8})
- `993271`: -local_four({"center":1,"support":[0,2,6,8]}), +qdeleted_pair({"center":1,"deleted":7,"first":6,"second":8})

### `v6-u5-common-bisector-triple-incompatibilities`

- `1167097`: -source_choice({"center":8,"row_index":43,"source":6}), -local_equality({"center":1,"left":0,"right":8}), -local_equality({"center":1,"left":2,"right":8}), -local_equality({"center":1,"left":7,"right":8})
- `1167601`: -source_choice({"center":8,"row_index":43,"source":7}), -local_equality({"center":1,"left":0,"right":8}), -local_equality({"center":1,"left":2,"right":8}), -local_equality({"center":1,"left":6,"right":8})

### `v6-u5-nontriple-equilateral-incompatibilities`

- `1101133`: -source_choice({"center":8,"row_index":124,"source":6}), -qdeleted_pair({"center":1,"deleted":6,"first":0,"second":8}), -qdeleted_pair({"center":0,"deleted":6,"first":1,"second":8})
- `1101187`: -source_choice({"center":8,"row_index":130,"source":6}), -qdeleted_pair({"center":1,"deleted":6,"first":0,"second":8}), -qdeleted_pair({"center":0,"deleted":6,"first":1,"second":8})
- `1101242`: -source_choice({"center":8,"row_index":136,"source":6}), -qdeleted_pair({"center":1,"deleted":6,"first":2,"second":8}), -qdeleted_pair({"center":2,"deleted":6,"first":1,"second":8})
- `1101259`: -source_choice({"center":8,"row_index":137,"source":6}), -qdeleted_pair({"center":1,"deleted":6,"first":0,"second":8}), -qdeleted_pair({"center":0,"deleted":6,"first":1,"second":8})
- `1101596`: -source_choice({"center":8,"row_index":179,"source":6}), -qdeleted_pair({"center":7,"deleted":6,"first":1,"second":8}), -qdeleted_pair({"center":1,"deleted":6,"first":7,"second":8})
- `1101650`: -source_choice({"center":8,"row_index":185,"source":6}), -qdeleted_pair({"center":7,"deleted":6,"first":1,"second":8}), -qdeleted_pair({"center":1,"deleted":6,"first":7,"second":8})
- `1101698`: -source_choice({"center":8,"row_index":191,"source":6}), -qdeleted_pair({"center":7,"deleted":6,"first":1,"second":8}), -qdeleted_pair({"center":1,"deleted":6,"first":7,"second":8})
- `1101716`: -source_choice({"center":8,"row_index":192,"source":6}), -qdeleted_pair({"center":7,"deleted":6,"first":1,"second":8}), -qdeleted_pair({"center":1,"deleted":6,"first":7,"second":8})
- `1103336`: -source_choice({"center":8,"row_index":202,"source":7}), -qdeleted_pair({"center":6,"deleted":7,"first":1,"second":8}), -qdeleted_pair({"center":1,"deleted":7,"first":6,"second":8})
- `1103390`: -source_choice({"center":8,"row_index":206,"source":7}), -qdeleted_pair({"center":6,"deleted":7,"first":1,"second":8}), -qdeleted_pair({"center":1,"deleted":7,"first":6,"second":8})

