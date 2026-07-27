# Exact-five card-13 distinct-radius source-ingress audit

## Status

**PASS — source-surface audit only.**

This audit reconstructs and traces the complete exact-card-13 distinct-radius
`surface.py` assertion stream for both asymmetric source orbits.  It does **not**
claim UNSAT, does not build a certificate, and does not close a production Lean
theorem.

The main conclusion is narrower and useful: the surface does not currently
expose a new geometric producer gap.  Its semantic facts are already represented
by checked source theorems.  The remaining work is a finite Lean ingress layer,
headed by one combinatorial reachability bridge and two generic packed-rank
adapters.

Machine-readable evidence is in
[`source-surface-audit.json`](source-surface-audit.json).  The deterministic
reconstruction and audit programs are
[`distinct_source_terms.py`](distinct_source_terms.py) and
[`audit_source_surface.py`](audit_source_surface.py).

## Exact audited surface

Each orbit has:

- 58,433 assertions;
- 1,666 variables;
- 2,179 Boolean source bits;
- the same operator vocabulary:
  `and`, Boolean equality and XOR, bit-vector equality/distinctness/order,
  implication, negation, disjunction, and unit-weight pseudo-Boolean
  at-least/at-most/exact constraints.

The source-stream hashes are:

| orbit | roles `(source, third)` | SHA-256 |
| --- | --- | --- |
| `asymmetricSourceLeft` | `(1, 3)` | `a1014dbfbae06dda92263461cfaf50cd14d96a4a645b7569790504b5f1a5dab0` |
| `asymmetricSourceRight` | `(3, 1)` | `1d60fb308d08c1f3aa5f80ea6685d4440f741dfe0e60eec5f49bcdc804c6c663` |

Both use hub `2`, first spoke `1`, second spoke `3`, and the original
`CanonicalCard13Frame`; there is no role reindexing.

The variable inventory is exact:

| category | count |
| --- | ---: |
| selected rows (`m`, `g0`, `g1`) | 507 |
| actual fixed-`H` blockers | 13 |
| exact-five shell | 13 |
| frontier roles (`q`, `w`) | 2 |
| first-apex double row | 13 |
| retained parent first row | 13 |
| retained parent second row | 13 |
| bounded-connectivity auxiliaries | 1,014 |
| distance ranks | 78 |
| **total** | **1,666** |

## Assertion inventory

The block boundaries are identical in both orbits.  The hashes below are
recorded per orbit in the JSON audit because the base block is orbit-sensitive.

| range | count | block | source status |
| --- | ---: | --- | --- |
| `[0, 37363)` | 37,363 | parent/global cover | reusable generic producers; generated instance sweep needed |
| `[37363, 40210)` | 2,847 | retained distinct role | source theorems present; two-parent-row packing needed |
| `[40210, 40224)` | 14 | distinct parent coupling | reusable source facts; small adapter needed |
| `[40224, 41316)` | 1,092 | connectivity | first missing combinatorial ingress bridge |
| `[41316, 41394)` | 78 | rank bounds | reusable producer |
| `[41394, 44232)` | 2,838 | guarded selected-row equalities | reusable schemas; parent-row adapters needed |
| `[44232, 45288)` | 1,056 | complete-class inequalities | exactness present; generic packed rank-inequality guard missing |
| `[45288, 45783)` | 495 | unique K4 at second apex | source producer present; generated quad instances needed |
| `[45783, 46278)` | 495 | unique K4 at first apex | source producer present; generated quad instances needed |
| `[46278, 52713)` | 6,435 | unique K4 at actual critical centers | source producer present; actual-blocker guard needed |
| `[52713, 58433)` | 5,720 | Kalmanson cancellation | reusable producer and generator shape |

Every assertion was traced to its constructor path and source line.  The traced
stream is identical to the ordinary `surface.build` stream, and every expression
is accepted by the verified-expression emitter.  The distinct-only Boolean XOR
has the exact lowering `bnot (bbeq lhs rhs)`; that is finite normalization, not a
new mathematical claim.

## Correct source contract

The same-radius DirectSource coordinator is not a sound drop-in base for the
full distinct surface.  Its selected core could use a constant blocker assignment
because the retained clauses only weakly observed the blocker image.  Here,
6,435 unique-critical assertions and 858 complete-critical-class assertions
depend on the actual blocker image.

The correct composition is therefore:

1. use the asymmetric `SemanticRowTable` for `m`, `g0`, and `g1`;
2. pack the actual `CriticalShellSystem.blockerAt` values following the all-one
   source adapter pattern;
3. add the first-apex double row and both retained parent rows;
4. derive the connectivity bits deterministically from the selected rows;
5. pack the 78 ordinal distance ranks.

In particular, `directCertificateBlockers` and any constant-blocker shortcut are
forbidden on this surface.

## Producer matrix

### Source geometry already present

- The asymmetric main/cover row semantics are available through
  `SemanticRowTable.lean` and the existing DirectSource/all-one base facts.
- The distinct first-apex alternatives are already proved by
  `firstApex_K4_radius_eq_retained_or_double_of_distinctRadius`.
- The retained first parent row is identified with the double-deletion row by
  `parentFirstRow_eq_doubleRow_of_distinctRadius`.
- Second-apex exact-five uniqueness is supplied by `profile.unique_K4_radius`.
- Actual critical-center shell uniqueness follows from
  `CriticalShellSystem.selectedFourClass_support_eq_shell`.
- The exact-class facts needed for membership-XOR distance inequalities are
  already present.
- Finite distance rank bounds and Kalmanson cancellation use the existing
  DirectSource/all-one rank infrastructure.

The theorem-bank registry and indexed Lean search found no replacement for the
missing finite reachability or packed-rank adapters.  They did confirm the
underlying exact-class and first-apex results above.  No new local metric or
finite-pattern contradiction should be derived before reusing these banks.

### Finite/native normalization only

- deterministic variable packing;
- lowering Boolean XOR;
- instantiating generic facts over the fixed 13-point and 78-distance domains;
- the definitions of the 13-step forward/backward recurrence;
- generated four-subset instance sweeps.

These operations should be generated and checked.  They should not be described
as new geometry.

### Genuinely missing Lean ingress

1. `fin13_staticReachability_of_selectedRows`

   From the existing minimality/no-proper-sink or `ReflTransGen` reachability
   theorem, derive the surface's exact forward and backward Boolean recurrences
   for 13 stages and their terminal truth bits.  The source semantics already
   imply graph reachability; the missing theorem connects that semantic relation
   to this fixed finite encoding.

2. `distinct_completeClass_rank_ne_guard`

   For a complete exact radius class, turn membership XOR for two carrier points
   into unequal seven-bit packed ordinal ranks, using
   `finiteOrdinalRank78BitVec_eq_iff`.

3. `distinct_uniqueK4_rank_guard`

   Convert each already-proved unique-K4-radius fact into the guarded packed-rank
   clause used by the source, then generate its four-subset instances for the
   second apex, the first apex, and actual blocker-image centers.

The parent-row distance-equality guards and the 14 parent-coupling bits are small
companion adapters and should live in the same source-ingress packet.

## Recommended implementation boundary

Define one source-faithful packet, provisionally
`CanonicalDistinctCard13SourceIngress`, carrying:

- the asymmetric row table;
- actual blocker indices and exact critical shells;
- `q`, `w`, the first-apex double row, and both retained parent rows;
- the finite rank table; and
- connectivity bits defined from the rows rather than accepted as independent
  hypotheses.

Then implement, in order:

1. the packet and the small parent-row adapters;
2. `fin13_staticReachability_of_selectedRows`;
3. `distinct_completeClass_rank_ne_guard`;
4. `distinct_uniqueK4_rank_guard` and the generated instance sweep.

After an external UNSAT core exists, only the adapters for blocks actually
retained by that core need to enter a certificate coordinator.  Until then, this
audit does not justify a full 58,433-assertion Lean expansion or a certificate
build.

## Reproduction

From the repository root:

```bash
UV_CACHE_DIR=.uv-cache uv run python \
  scratch/atail-force/exact5-card13-distinct-radius-source-ingress-audit/audit_source_surface.py \
  --output scratch/atail-force/exact5-card13-distinct-radius-source-ingress-audit/source-surface-audit.json
```

Acceptance conditions are fail-closed: exact orbit names, roles, counts,
variable layout, block boundaries, expression vocabulary, and stream hashes must
all match the recorded contract.

The recorded JSON was regenerated independently and compared byte-for-byte.
Both copies have SHA-256
`a1e3689d19b95e65e95192e869b973e427ff7c5123250ad25f120b0a9e128570`.
Both Python files pass `uv run python -m py_compile`, and the JSON passes
`jq empty`.
