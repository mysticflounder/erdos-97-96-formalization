# Post-v37 alternating placements: exact Euclidean local probe

## Verdict

**EMPIRICALLY VERIFIED by exact rational arithmetic:** both surviving cyclic
placements are realizable under the distilled endpoint/shared-blocker
Euclidean packet currently proved in Lean.  The two placements are reflections
of one eight-point configuration.  Consequently there is no polynomial/order
contradiction in this local packet; a terminal must consume an additional
global fact not represented here.

This strengthens the earlier `a-x-two-exact-circles` witness by checking the
post-v37 cap-side facts: the first-cap strict-interior exclusion, membership in
one adjacent closed cap, and exact singleton intersection of that cap with the
full first-apex radius class.

## Exact witness

Let the first apex / selected-row centre and the shared blocker be

```text
A = (6/5, 0),        B = (0, 0).
```

For the `A-X-B-J` placement use

```text
J = (3/5, -4/5),     X = (3/5, 4/5),
K = (7/25, -24/25), L = (9/41, -40/41),
U = (53/65, 12/13), V = (23/25, 24/25).
```

The exact CCW boundary is

```text
A V U X B L K J.
```

Reflecting every point across the x-axis gives the `A-J-B-X` boundary

```text
A J K L B X U V.
```

In both cases the full positive unit shells in this carrier are exactly

```text
shell(A,1) = {J, X, U, V},
shell(B,1) = {J, X, K, L}.
```

Thus their intersection is exactly `{J,X}`.  `K,L` are outside the full
first-apex radius class, giving the named `K` and unique unnamed `L` portion of
`endpointFresh_sharedBlocker_frontierRadius_fourth_packet`.

For `A-X-B-J`, take the acute structural triangle in order `(A,X,B)`, first
closed cap `X B`, and adjacent closed cap `B L K J A`.  For `A-J-B-X`, take
the reflected triangle order `(A,B,X)`, first cap `B X`, and adjacent cap
`A J K L B`.  In either case the triangle side lengths are `1,1,6/5`, the
first cap has empty strict interior, the adjacent cap has cardinality five,
and

```text
shell(A,1) ∩ adjacentCap = {J},
J ∉ firstCapInterior,
X ∉ adjacentCap.
```

The three closed boundary arcs have sizes `2,5,4`, hence cap sum `11 = 8+3`;
the size-five adjacent cap can be designated surplus.  Every supporting-line
determinant is checked positive, not merely the consecutive turns.

## Hypothesis ledger

Encoded and exactly checked:

- injective strictly convex Euclidean boundary;
- the two full exact four-point radius classes, equal radii, and exact common
  pair `{J,X}`;
- the endpoint fourth-point exclusions from the first-apex selected row and
  full first-apex radius class;
- both oriented alternating placements;
- an acute structural Moser triangle and its three contiguous closed cap arcs;
- `J` outside the first strict cap, in a size-five adjacent cap, with exact
  singleton first-apex-radius intersection; and
- the post-v37 outside-overlap count, which is exactly one (`X`).

Omitted, so this is not a `CounterexampleData` construction:

- the MEC-boundary promotion fields of `SurplusCapPacket`;
- `HasNEquidistantProperty 4` at every carrier point and all critical-row
  choices away from the displayed two centres;
- retained-walk/deletion provenance and the all-large three-apex context; and
- any escaping selected row from the later v36/v37 hypothetical producer.

The result therefore authenticates insufficiency of the **distilled local
endpoint/shared-blocker Euclidean consequences**, not consistency of the full
P97 counterexample hypotheses.

## Reproduction

```bash
PYTHONDONTWRITEBYTECODE=1 uv run python \
  scratch/retained-omission-e1/post-v37-alternating/verify.py
```

Authentication:

```bash
shasum -a 256 \
  scratch/retained-omission-e1/post-v37-alternating/verify.py \
  scratch/retained-omission-e1/post-v37-alternating/RESULT.txt \
  lean/Erdos9796Proof/P97/ATail/FrontierLiveClosure.lean \
  lean/Erdos9796Proof/P97/Phase3SharedPairSeparation.lean
```

Recorded SHA-256 values:

```text
29de09a10c3673f1982956e88c35f717a8981ff78d7899c1d76516ce2626c792  verify.py
aed2dff68fc9209121c5238c7e5de4cb0488fcfcecdef77636fc314be53cce6a  RESULT.txt
9e08ff84eda9f7dbf3219d03401e80571537bb8fabaf8e5ca8d5e3946ba9fbdd  FrontierLiveClosure.lean
cd6af40c90ce6aff789caf7dca08ac6467f00be7112f31540d3c992dad9a9537  Phase3SharedPairSeparation.lean
```

## Producer / consumer / terminal classification

- The Lean declarations `endpointFresh_support_eq_of_sharedBlocker`,
  `endpointFresh_commonSupport_inter_firstApexRow_eq_pair_of_sharedBlocker`,
  `endpointFresh_sharedBlocker_frontierRadius_fourth_packet`, the adjacent-cap
  singleton theorems, and `endpointFresh_sharedBlocker_pair_alternates` are
  **proved producers** of the distilled packet.
- The two cyclic placements are **realizable local consumers' inputs**, not
  obstructions.
- This exact probe is an **external witness/checker**, not a Lean producer and
  not kernel-checked.
- Terminal status: **negative local no-go**.  It closes no Lean obligation and
  proves no full counterexample exists; it shows the checked local packet does
  not itself yield `False`.
