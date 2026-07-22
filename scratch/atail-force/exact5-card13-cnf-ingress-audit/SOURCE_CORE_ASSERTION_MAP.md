# Exact-five card-13 direct source-core assertion map

Date: 2026-07-21

Status: **AUDITED. NO NEW GEOMETRIC LEMMA IS EXPOSED BY THE SELECTED BASE
BLOCK. THE FIRST MISSING SOURCE ARTIFACT IS THE TOTAL SEMANTIC WITNESS TABLE.**

This is a source-ingress audit of
`../exact5-card13-same-radius-terminal/direct.source-core.json`. It is not a
SAT certificate replay and does not close a production theorem.

## Reproduction and drift check

`analyze_source_core.py` rebuilds the current Z3 source surface, compares every
saved selected assertion by exact `sexpr`, and records the constructor line
that introduced each selected base assertion.

```bash
UV_CACHE_DIR=/tmp/uv-cache uv run --no-project --with z3-solver \
  python scratch/atail-force/exact5-card13-cnf-ingress-audit/analyze_source_core.py
```

The check succeeds against the current 45,878-assertion source surface. The
selected core has 2,834 assertions:

| block | selected |
| --- | ---: |
| base geometry and row predicates | 272 |
| asymmetric source-role contract | 8 |
| rank bounds | 72 |
| guarded selected-row rank equalities | 424 |
| guarded exact-five-shell rank equalities | 53 |
| strict Kalmanson cancellation implications | 2,005 |

## Exact selected row surface

Only the following nine selected rows appear in guarded rank equalities:

```text
m@0  m@2  m@4  m@12
g0@2 g0@6
g1@2 g1@5
b1@4
```

Here `m` is the arbitrary all-center K4 family, `g0` and `g1` are the two
independent global-cover families, and `b1` is the retained first-apex
double-deletion row. The equality counts are:

| row | equalities |
| --- | ---: |
| `m@0` | 57 |
| `m@2` | 45 |
| `m@4` | 52 |
| `m@12` | 54 |
| `g0@2` | 24 |
| `g0@6` | 65 |
| `g1@2` | 3 |
| `g1@5` | 65 |
| `b1@4` | 59 |

This sparse use does **not** permit a partial source table. Five selected
pair-hit clauses still quantify over every center and every one of `m`, `g0`,
and `g1`; the source assignment must therefore define all three `13 x 13`
row families, or prove an exactly equivalent compact predicate.

## Selected base theorem families

The 272 base assertions split as follows.

| family | count | source status |
| --- | ---: | --- |
| row cardinality four and center exclusion | 16 | `SelectedFourClass` fields |
| within-family cyclic nonalternation | 59 | standard two-circle/convex-order consequence |
| cap at-most-two and endpoint at-most-one | 7 | production cap selected-row counting |
| exact-five shell shape | 7 | `LargeCapUniqueFiveSecondApexRadius` plus physical-cap counting |
| first-apex double row | 12 | `FirstApexShellRolePacket.doubleRow` and deletion support |
| the two global-cover omissions | 2 | `PhysicalGlobalCrossDeletionStar` |
| asymmetric source/blocker row | 5 | `CanonicalAsymmetricRolePrepacket` and its actual critical support |
| blocker-image row synchronization | 20 | `CriticalShellSystem.selectedFourClass_support_eq_shell` |
| cross-family intersection at most two | 3 | `SelectedFourClass.inter_card_le_two` |
| cross-family cyclic nonalternation | 126 | standard two-circle/convex-order consequence |
| first-apex-row cross-family cyclic exclusions | 10 | same source family |
| fixed target-pair carrier-center bound | 5 | `Dumitrescu.perpBisector_apex_bound` |

The five target pairs in the last family are `(3,6)`, `(3,7)`, `(3,8)`,
`(4,8)`, and `(5,7)`.

The asymmetric source/blocker row fixes `blocker_1 = 2`, puts indices `1` and
`3` in `m@2`, and excludes indices `0` and `4`; row self-exclusion separately
excludes `2`. Thus its physical-cap intersection is exactly `{1,3}`. The
common-label scratch theorem already proves that the only source-role orbits
are `(1,2,3)` and `(3,2,1)`.

The selected source-role indices are `0,1,3,4,5,6,7,8`. In particular the
core uses:

- two strict first-opposite-cap hits in `m@4` and in `b1`;
- at least one actual frontier source among the strict hits of `m@4`;
- `m@4 union b1` has cardinality six and covers all four strict indices.

It does not use the separate `q or w in m@4` assertion or the two stronger
first-apex global-cover synchronization assertions. This is a weakening of
the full source encoder, not a source mismatch.

## Theorem-bank preflight

The mandated local registries and indexed Lean corpus were checked before
proposing any new fact:

- `docs/general-n-certificate-bank-mining-2026-07-09.md`;
- the `p97-rvol`, legacy Erdos-97, and older general-theorem concise and JSON
  registries;
- focused `nthdegree docs search --lean` queries for all-center selected-row
  choice, blocker-row support equality, global deletion cover, exact-five
  shell containment, and pair-hit center bounds.

The useful existing declarations include:

- `exists_faithfulCarrierPattern_with_classAt`;
- `CriticalShellSystem.selectedFourClass_support_eq_shell`;
- `Census554.GeneralCarrierBridge.blocker_row_support_eq_shell`;
- `SelectedFourClass.inter_card_le_two`;
- `Dumitrescu.perpBisector_apex_bound`;
- `PhysicalGlobalCrossDeletionStar` and its source constructor;
- `PhysicalGlobalCrossDeletionPair.not_both_mem_actualCriticalSupport`;
- `FirstApexShellRolePacket` and `nonempty_firstApexShellRolePacket`.

No bank contains an already assembled card-13 table with one prescribed main
row and two independent deletion-cover choices. Conversely, no selected base
family requires a new geometric theorem beyond those existing declarations.

## First missing source block

The first missing block is therefore **total witness-table construction**:

1. choose one selected K4 row at every canonical carrier center, preserving
   the retained first-apex row at index `4`;
2. for the star edge `(hub, spoke1)`, independently choose at every center a
   selected row surviving deletion of at least one endpoint;
3. repeat that choice independently for `(hub, spoke2)`;
4. pull each actual critical center back through the canonical `Fin 13`
   enumeration to obtain thirteen blocker indices;
5. pull back the exact five-point second-apex class;
6. transport the first-apex double-deletion row to canonical center `4`.

`SemanticRowTable.lean` implements this construction. The cover families are
two separate dependent choice functions. It deliberately does not equate
them away from blocker-image centers. At a blocker-image center, the theorem
`blocker_image_supports_eq` derives equality of all three supports from
critical-shell uniqueness; the equality is not built into the choices.

After this constructor, the next obligation is finite but still substantive:
prove that these semantic objects satisfy the 272 selected base predicates
and the 485 selected row/shell rank guards, then feed the already constructed
distance ranks and Boolean packers to kernel certificate replay.

## Non-targets

Do not add any of the following at this checkpoint:

- another local cap or perpendicular-bisector contradiction;
- a shared `g0 = g1` cover family;
- exactness of arbitrary selected rows;
- generic bit packing (already in `BooleanPacking.lean`);
- certificate replay mixed into the semantic constructor.

Those would either duplicate existing work or strengthen the source beyond
the actual encoder semantics.
