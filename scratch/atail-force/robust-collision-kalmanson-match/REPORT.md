# Robust-collision / Kalmanson terminal match

Date: 2026-07-17

Status: **KERNEL-CHECKED CAP PROJECTION; THE PINNED DIRECT-SCHEMA AVOIDER IS
ORDINAL-UNSAT, BUT ONE ANONYMOUS COLLISION IS NONTERMINAL. NO PRODUCTION
`sorry` IS CLOSED.**

## Question and bank preflight

This lane audited the global same-blocker exact card-four shell from
`first-apex-robust-global-consumer` against:

- `CapSelectedRowCounting.outsidePair_unique_capCenter`;
- the production ordinal and five-point Kalmanson consumers;
- ordered-cap localization; and
- the U5 general-n incidence bank.

Before deriving the finite cap projection, it checked the registries required
by `AGENTS.md`:

- `docs/general-n-certificate-bank-mining-2026-07-09.md`, especially the
  sibling `p97-rvol` section;
- `certificates/p97_rvol_general_n_mining.{md,json}`;
- `certificates/erdos97_legacy_general_n_mining.{md,json}`; and
- `certificates/erdos_general_theorem_p97_mining.{md,json}`.

Indexed `nthdegree docs search --lean` queries covered same-blocker exact
shells, outside-pair cap-center uniqueness, cyclic-order shell equalities,
and U5 common-support consumers. They found the existing consumers but no
theorem that creates the missing second center or second ordered collision
row from one anonymous blocker fiber.

## Kernel-checked cap-role reduction

`RobustCollisionKalmansonMatch.lean` proves two source-clean theorems.

First,

```lean
nonempty_robustCollisionCapOutsidePair
```

shows that any selected four-class whose center is a carrier point has an
indexed closed cap containing the center and two distinct support points
outside that cap. The two colliding source points are simultaneously placed
in the exhaustive four-way cap-role split (both in, left only, right only,
both out). The proof uses the existing ordered-cap bound

```lean
selectedFourClass_inter_capByIndex_card_le_two
```

and exact support cardinality four. Applied to the robust blocker collision,
this gives a common blocker in one cap and a distinct equidistant outside
pair.

Second,

```lean
false_of_secondCapCenter_bisecting_collisionOutsidePair
```

feeds that packet to `outsidePair_unique_capCenter`. Its only new hypotheses
are exactly:

1. a second center in the same indexed cap;
2. distinctness from the common blocker; and
3. equality of its two distances to the extracted outside pair.

Thus the first missing antecedent for the ordered-cap terminal is not another
cap classification. It is a **second same-cap center bisecting the same
outside pair**.

Focused elaboration succeeded. Both displayed theorems have axiom closure
exactly:

```text
propext
Classical.choice
Quot.sound
```

## Direct-schema avoider replay

The additional audit requested against
`kalmanson-bank-cegar/direct_schema_coverage_checkpoint.json` is decisive.
The pinned checkpoint has status

```text
SAT_DIRECT_SCHEMA_AVOIDING_CORRECTED_SHADOW
```

and SHA-256

```text
f3d36762c63be39b77aaaae2d2de34199eeffca4cbc5cdad8e919e8f444d182a.
```

`audit_shadow.py` verifies that the terminal shadow already has the robust
blocker-map pattern:

- `O` is omitted from the blocker image;
- four blocker fibers are nontrivial, centered at `A`, `C`, `X`, and `Y`;
- each of those centers has one exact card-four row; and
- every source in each fiber belongs to that center's exact row.

Three fibers also instantiate the checked live cap projection directly:

| common blocker | fiber sources | exact support | outside-pair projection |
| --- | --- | --- | --- |
| `A` | `C,G,K,O` | `C,G,K,O` | yes, in either cap containing `A` |
| `C` | `I,X,t1` | `I,O,X,t1` | yes, in either cap containing `C` |
| `X` | `F,J,Y` | `F,J,K,Y` | yes, outside pair `F,K` |

The `Y` row lies wholly in its modeled cap and therefore violates the
production cap-intersection bound. This is a useful reminder that the
checkpoint is a corrected finite structural abstraction, not a full
Euclidean/MEC model. The `A`, `C`, and `X` fibers nevertheless show that the
new robust collision plus cap projection is genuinely present in the SAT
shadow; adding that one pattern as a cut would not eliminate it.

## Full ordinal Kalmanson result

The direct five-point schema is not the full ordinal closure. Replaying the
equality-quotient ordinal checker gives:

```text
one collision row alone                         no strict cycle
one collision row + ambient first-apex row      no strict cycle
all collision rows + ambient first-apex row     strict cycle
all exact blocker-image rows + ambient row       strict cycle
all stored rows                                 strict cycle
```

An inclusion-minimal collision-row certificate uses centers

```text
O, A, X
```

with the fixed hull order and rows

```text
O-row: A,C,D,E,J
A-row: C,G,K,O
X-row: F,J,K,Y.
```

These three rows yield a two-edge ordinal strict cycle. A second minimal
collision-row core uses `O,A,Y,C` and yields an immediate equality/strictness
clash. Therefore the direct-schema avoider is **UNSAT under full ordinal
Kalmanson closure**. A linear Kalmanson/Farkas run is unnecessary for this
witness: the weaker ordinal system already rejects it.

This computation is exact within the pinned fixed fourteen-role finite
shadow and uses the already-audited ordinal checker. It is not a live Lean
coverage theorem.

## Exact terminal-match verdict

### One anonymous blocker collision: nonterminal

- `outsidePair_unique_capCenter` still lacks its second center and equality.
- A single Kalmanson row produces strict comparisons but no strict cycle,
  even after adding the ambient first-apex row.
- The U5 consumers require one fixed deleted source with **distinct**
  q-critical row centers, a dangerous-triple placement, and further named
  cross-row incidences. The robust collision instead gives two deleted
  sources sharing one row center. Finite cap roles do not reverse those
  quantifiers.

### Available all-row finite packet: terminal under ordinal closure

The SAT avoider is killed only after retaining multiple exact collision rows
and their common boundary order. Hence collision mining is not wrong, but the
current one-fiber normal form is too weak. The next live producer must retain
at least one of:

1. a second collision center and the boundary roles needed to form an
   ordinal two-cycle (the finite minimal model is `O,A,X`); or
2. a general source-indexed theorem mapping the retained global critical rows
   to a `SelectedRowOrdinalComparison` cycle.

Merely classifying the two sources of one fiber among the three caps cannot
close the branch. The load-bearing new information is **multi-fiber/order
coupling**, not another local shell or cap-role case split.

## Validation and scope

Replayed with:

```text
UV_CACHE_DIR=/tmp/uv-cache-atail uv run python \
  scratch/atail-force/robust-collision-kalmanson-match/audit_shadow.py
```

The replay pins the checkpoint, terminal-row, and blocker-map hashes. No
production file, closure document, protected unique-row artifact,
`SurplusM44`, or shell-curvature file was modified.
