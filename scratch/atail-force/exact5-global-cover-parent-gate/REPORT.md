# Exact-five global-cover parent gate at card 13

## Scope and status

This lane tests a necessary-condition abstraction of the exact-card-13 part of
the exact-five second-cap parent. It does **not** close the exact-five Lean
branch, and it says nothing about the separate card-at-least-14 branch.

The fixed cyclic labeling is

```text
carrier       = {0, ..., 12}
third vertex  = 0
first apex    = 4
second apex   = 8
caps          = {4,5,6,7,8}, {8,9,10,11,12,0}, {0,1,2,3,4}
strict physical second-cap interior P = {1,2,3}
```

The cap profile is therefore exactly `(5,6,5)`. This is the equality case of
the production lower bound `carrier_card_ge_thirteen`.

Current results:

| Rung | Scope | Result | Epistemic status |
| --- | --- | --- | --- |
| B0 | all five source-role orbits | SAT in every orbit | exact within the encoded Boolean relaxation |
| L1 | two asymmetric orbits, both signed negations | bounded `UNKNOWN` in all four cases | empirical search evidence only |

Every current B0 artifact was regenerated after the source-faithfulness audit
and checked by the independent verifier. The corrected core-guided L1 runs
checked 164 decoded B0 assignments, all exact-LRA `UNSAT`. The outer Boolean
surfaces were not exhausted and there is no whole-surface UNSAT certificate.
Thus no orbit, theorem branch, or source `sorry` is closed by this checkpoint.

## Preflight

Before adding the encoder, the existing general-n theorem-bank registries and
indexed Lean corpus were searched, including the sibling `p97-rvol`, legacy
P97, and older general-theorem inventories. No existing aggregate theorem was
found that consumes this full exact-card-13 parent surface. The search therefore
targets the missing aggregate producer rather than another local row
contradiction.

## Five source-role orbits

The three strict physical points are denoted `1,2,3`. The five retained orbits
are:

| Orbit | hub | source | third point | spokes |
| --- | ---: | ---: | ---: | --- |
| `asymmetricSourceLeft` | 2 | 1 | 3 | 1, 3 |
| `asymmetricSourceRight` | 2 | 3 | 1 | 1, 3 |
| `allOneHitHubLeft` | 1 | 1 | 1 | 2, 3 |
| `allOneHitHubMiddle` | 2 | 2 | 2 | 1, 3 |
| `allOneHitHubRight` | 3 | 3 | 3 | 1, 2 |

The two asymmetric orientations are deliberately separate. Reflection is not
a free quotient here because it swaps named parent roles and the adjacent cap
chains.

## B0 contract

`encode.py` encodes the following finite necessary conditions:

- one selected four-point row `m[c]` for every carrier center;
- one fixed actual blocker for every source, locked to its selected row;
- neither robust apex occurs in the blocker image;
- one complete exact-five radius class at the second apex, containing all
  three strict physical-cap points and exactly one point from each adjacent
  chain;
- distinct off-surplus frontier points `q,w`, co-rowed at the first apex and
  omitted from the selected second-apex **double-deletion** row;
- a separate first-apex double-deletion row `b1`;
- two **separate** carrier-wide cover-row tables `g0,g1` for the two star
  edges;
- equality `g0[c] = g1[c] = m[c]` at every center `c` in the fixed blocker
  image, where `no_qfree_at` makes the ambient K4 row unique;
- containment `g0[O2], g1[O2] ⊆ E` in the complete exact-five shell;
- the five source-role orbit constraints;
- selected-row strong connectivity independently for `m`, `g0`, and `g1`;
- within-family and cross-family distinct-center circle-intersection,
  alternation, cap-hit, and outside-pair restrictions.

The two cover tables remain independent away from the fixed blocker image. If
deletion of the hub destroys one radius class, the two spoke deletions may be
witnessed by different radius classes. At a blocker-image center, however,
criticality makes every ambient K4 witness the same exact-four class, so both
cover tables must equal `m`. `smoke_test.py` checks both sides of this boundary.

The selected row `m[O2]` is the second-apex double-deletion row. It is
constrained only to be a four-subset of the complete five-point class and is
not identified with that class. It is **not** the retained parent row
`R.common.packet.B2`.

### Deliberately omitted from B0

- distances and shell equalities;
- positivity, strict triangle, and Kalmanson inequalities;
- exact blocker filters and the complete `no_qfree_at` condition;
- full minimality beyond the three selected-row strong-connectivity tests;
- the global no-`(m,4,4)` condition over alternative support packets;
- planar Euclidean rank-two realization;
- MEC containment, support, and nonobtuse conditions;
- metric terminal negations;
- the retained parent rows `R.common.packet.B1` and `B2`, including their
  overlap/provenance packet;
- an all-one-hit terminal-negation or metric rung.

Consequently, B0 SAT means only that the encoded incidence relaxation has a
model. It is neither a Euclidean realization nor a Problem 97 counterexample.

## B0 result

With a 20-second budget per orbit, all five corrected orbits are SAT:

```text
asymmetricSourceLeft     SAT
asymmetricSourceRight    SAT
allOneHitHubLeft         SAT
allOneHitHubMiddle       SAT
allOneHitHubRight        SAT
```

The generated `*.b0.json` files contain decoded assignments. `verify.py` checks
their complete combinatorial contract without invoking Z3. All five pass.

## L1 asymmetric metric rung

`l1.py` adds a homogeneous exact linear-distance relaxation to the two
asymmetric orbits. It introduces one rational variable for every unordered
carrier pair and imposes:

- distance positivity, normalized to `d >= 1`;
- all strict triangle inequalities with unit slack;
- both strict Kalmanson inequalities for every cyclic quadruple, with unit
  slack;
- equal-distance constraints for every `m`, `g0`, `g1`, `b1`, and complete
  second-apex-shell row;
- first-apex equality and second-apex inequality for `q,w`;
- one of the two signed negations of first-apex co-radiality for the ordered
  outside pair.

Exact rationals are serialized as numerator/denominator strings. Any SAT result
must pass `verify_l1.py`, which rechecks the B0 contract and every L1 inequality
using Python `Fraction`, without Z3.

There is no corresponding L1 rung for the three all-one-hit orbits. Their B0
SAT artifacts therefore do not test the complement of the existing ordered or
same-cap `CriticalFiberClosingCore` consumers.

## Core-guided L1 checkpoint

All row equalities and the frontier/terminal literals are now named assumption
constraints. For each L1-UNSAT assignment, the solver extracts an assumption
core and deletion-minimizes it. The outer solver then blocks the conjunction of
row memberships and fixed role values that activate those exact constraints,
rather than blocking the entire decoded assignment. Such blocks are valid only
inside their fixed orbit/sign run and are not merged across signed surfaces.
`verify_core.py` replays each recorded core in exact Z3 rational arithmetic and
confirms that removing any one tracked constraint makes the system SAT. It
imports the L1 encoder, so it is a replay/irreducibility check rather than an
independent encoder audit or proof certificate.

The four corrected 15-second runs record one verified deletion-minimal core per
orbit/sign:

| Orbit | Sign | Checked | L1 UNSAT | Core blocks | Core size | Core families | Status |
| --- | --- | ---: | ---: | ---: | ---: | --- | --- |
| left | lower farther | 41 | 41 | 41 | 4 | `m` only | `UNKNOWN` (wall budget) |
| left | higher farther | 43 | 43 | 43 | 4 | `m` only | `UNKNOWN` (wall budget) |
| right | lower farther | 40 | 40 | 40 | 4 | `m` only | `UNKNOWN` (wall budget) |
| right | higher farther | 40 | 40 | 40 | 4 | `m` only | `UNKNOWN` (wall budget) |

Both left cases record the same four-equality core:

```text
m[0]:  dist(0,4) = dist(0,5)
m[6]:  dist(6,5) = dist(6,11)
m[7]:  dist(7,3) = dist(7,4)
m[7]:  dist(7,3) = dist(7,11)
```

Both right cases record the same four-equality core:

```text
m[0]:  dist(0,4) = dist(0,6)
m[1]:  dist(1,0) = dist(1,2)
m[1]:  dist(1,0) = dist(1,6)
m[12]: dist(12,2) = dist(12,4)
```

These first cores use only the primary selected-row table `m`. They use neither
the complete shell, `b1`, `g0`, `g1`, the frontier pair literals, nor the signed
terminal negation. This is useful evidence that the first rejected candidates
are eliminated by already-available cyclic Kalmanson row consumers, not by the
new exact-five parent data. The encoder now also records every minimized core
up to increasing-order normalization. Across the four corrected runs it found
156 schema entries with 143 distinct schema identifiers. Three recorded schema
entries used the terminal-sign literal, none used the complete shell, one used
`b1`, 10 used a cover table, and eight used a frontier equality. Every schema
still used `m`.

Therefore the sampled L1 workload is overwhelmingly eliminating generic
selected-row/Kalmanson shadows before it reaches exact-five-specific structure.
This is a route diagnosis, not a closure claim: the Boolean gate still lacks
enough aggregate ordinal-distance closure.

## Reproduction

From the repository root:

```bash
UV_CACHE_DIR=/tmp/uv-cache uv run python \
  scratch/atail-force/exact5-global-cover-parent-gate/smoke_test.py

for f in scratch/atail-force/exact5-global-cover-parent-gate/*.b0.json; do
  UV_CACHE_DIR=/tmp/uv-cache uv run python \
    scratch/atail-force/exact5-global-cover-parent-gate/verify.py "$f"
done

for f in scratch/atail-force/exact5-global-cover-parent-gate/*.l1.json; do
  UV_CACHE_DIR=/tmp/uv-cache uv run python \
    scratch/atail-force/exact5-global-cover-parent-gate/verify_core.py "$f"
done

UV_CACHE_DIR=/tmp/uv-cache uv run python \
  scratch/atail-force/exact5-global-cover-parent-gate/l1.py \
  --orbit asymmetricSourceLeft \
  --sign outsideLowerIndexFarther \
  --seconds 15
```

Python compilation, the smoke gate, all five independent B0 verifications, and
all four exact-LRA minimal-core replays pass in the current tree. Ruff is not
installed in the repository environment, so no Ruff result is claimed.

## Next checkpoint

Do not preload any pre-audit schema. The corrected surface first needs one of
two source-level expansions: add the retained `R.common.packet.B1/B2` packet as
separate rows, or add an explicit all-one-hit terminal-negation rung. The first
option strengthens both the parent projection and its provenance; the second
is required before the three all-one-hit orbits can contribute to terminal
coverage. Any future normalized core transport must preserve its orbit/sign
metadata. MARCO-style enumeration remains out of scope until a source-faithful
schema and a Lean consumer are identified.
