# ATAIL 930-residue producer bridge audit

Date: 2026-07-14

Status: **EXHAUSTIVE WITHIN THE CURRENT FINITE SUPPORT/EQUALITY
ABSTRACTION.**  This report does not assert that any missing field follows
from the live hypotheses.

## Outcome

The current two apex rows hit no existing equality/order consumer on any of
the 930 residues.  The next step is therefore not another classification of
those same two rows: it is a producer for at least one cross-row membership,
blocker placement, or cross-row distance equality.

The exact profile split is unchanged:

| Profile | Residues | Current two-row bank hits |
|---|---:|---:|
| card 11 `(5,5,4)` | 96 | 0 |
| card 12 `(6,5,4)` | 150 | 0 |
| card 12 `(5,5,5)` | 684 | 0 |
| **Total** | **930** | **0** |

Every residue nevertheless has six unordered off-surplus pairs in its
five-point first-apex exact class.  Thus all five candidate sinks below have
the required static pair/class input.  Their missing fields are genuinely
producer fields, not finite-support gaps.

## Ranked producer signatures

### 1. One critical-row cross hit plus ordered-arc placement

Choose distinct off-surplus `q,w` in the five-point first-apex class and use
the actual common-system row selected at source `q`.  The source membership
`q in selectedAt(q)` is automatic.  The missing fields are exactly:

1. `w in selectedAt(q).support`; and
2. `q,w` lie on one open cyclic arc between `oppApex1` and
   `centerAt(q)`.

The card-five single-deletion lemma then makes `centerAt(q) != oppApex1`;
the two circles share `q,w` in the forbidden order and the already proved
`FourPointTwoCircleBisectorOrderCore` closes.  This has the smallest positive
incidence requirement found: one cross membership, plus one order
localization.

Exact potential embeddings (directed source, other point, blocker label) are:

| Profile | Embeddings | Residues covered if produced |
|---|---:|---:|
| `(5,5,4)` | 8,160 | 96 |
| `(6,5,4)` | 14,550 | 150 |
| `(5,5,5)` | 63,648 | 684 |

Neither field is present at the parent boundary.  The boundary has the
chosen blocker term and cap order, but no cross membership and no theorem
placing that blocker relative to the pair in the cyclic order.

### 2. `CardFiveCapOrMutualFields`

For one of the same six pairs, the existing checked consumer asks for:

1. `centerAt(q) != centerAt(w)`; and
2. either a one-way cross membership whose blocker is in the surplus cap, or
   both reciprocal memberships
   `w in selectedAt(q)` and `q in selectedAt(w)`.

The exact static embedding counts are 576 / 900 / 4,104, covering
96 / 150 / 684 residues respectively if the disjunction is produced.  The
five-point class, its positive radius, pair membership, distinctness, and
off-surplus facts are finite-surface fields.  Blocker separation, cross
membership, and surplus-cap localization are absent at the parent boundary.

The current structure carries `centers_ne` even in the cap-local arms, though
those two terminal lemmas do not use it.  A future production interface can
weaken this to a branch-indexed sum, but that refactoring alone proves no new
field.

### 3. Choice-invariant surplus blocker containing the pair

`false_of_existsSurplusPairCriticalBlocker` does not itself require a
cardinality-four apex class.  It can consume any off-surplus pair co-radial
from `oppApex1`, including all six pairs in the current five-point class.
Its exact missing packet is:

1. a deletion-blocking exact four-shell at a center in the surplus cap;
2. that center differs from `oppApex1`; and
3. its support contains both chosen pair points.

Therefore its static counts and conditional coverage are again
576 / 900 / 4,104 and 96 / 150 / 684.  `hcritical` provides an exact blocked
row for each source only after choosing a system; it does not provide a
surplus-localized non-apex center or the second hit.  The choice-invariant
form is important because pointwise override refutes claims about every
arbitrary selector.

### 4. Branch-complete distinct/coincident blocker packet

Equality of the two actual blocker centers gives an exact split.

- In the distinct branch, the missing fields are the two reciprocal source
  incidences.  All center separation needed by the Dumitrescu consumer then
  follows from card-five deletion survival.
- In the coincident branch, the common shell automatically contains the
  pair and has two residual members.  For one residual member `x`, the
  remaining field is that a global-K4 class centered at `x` contains both
  common points.

`D.K4` is present at the parent boundary and supplies some selected global-K4
class at `x`; it does not supply either common-pair membership.  This
branch-complete signature again has six static pairs per residue and covers
all 930 only conditionally on those missing incidences.

### 5. Complete `u1TwoLargeCapObstruction`

An exact injective search over all assignments of `(a,c,d,e,f)` measures the
shortest completion of the seven theorem equalities from the equality closure
of the two current apex rows:

| Profile | Need 3 more | Need 4 more | Need 5 more |
|---|---:|---:|---:|
| `(5,5,4)` | 6 | 54 | 36 |
| `(6,5,4)` | 6 | 72 | 72 |
| `(5,5,5)` | 37 | 344 | 303 |
| **Total** | **49** | **470** | **411** |

Thus a three-equality producer reaches only 49 residues; a budget of four
reaches 519 cumulatively; five reaches all 930.  The inequality `a != c` is
automatic in this injective audit.  The missing `h1`-through-`h7` subset
depends on the residue and chosen embedding; `analysis.json` records the
canonical minimum subset distribution and a checked representative for each
profile.

This improves the earlier fixed-prefix assessment without contradicting it.
The fixed `(c,a,d,f)` prefix still supplies only its first two equalities and
needs five named cross equalities.  Allowing the embedding to vary lets 519
residues reuse three or four equalities from both apex rows.  No parent field
produces the remaining equalities.

## Other equality-core completion

The current two apex rows alone have zero bank hits.  A second universal
conditional completion is a critical source row sharing three points with
the five-point first-apex class.  Source membership is automatic, so it asks
for two additional cross memberships; the card-five deletion argument makes
the row center differ from the apex.  The `equality-duplicate-center` consumer
then closes.

There are 16,128 / 28,800 / 131,328 finite embeddings of this signature in
the three profiles.  It is not ranked above the one-hit ordered signature
because it needs two positive cross memberships.  Neither membership is
present at the parent boundary.

## Exact conditional set cover

With no new fields, the union of all current equality/order consumers covers
**0/930** residues.

If any one full ranked producer signature is proved universally, its matching
sink covers all 930, so the conditional set-cover number is one.  This is a
statement about sink coverage, not producer plausibility.  In particular:

- ordered two-hit: one cross incidence plus one arc placement;
- card-five cap/mutual: blocker separation plus its incidence disjunction;
- choice-invariant surplus blocker: cap-localized non-apex two-hit shell;
- branch-complete blocker split: two hits in the distinct branch or a
  residual K4 two-hit in the coincident branch; or
- `u1TwoLargeCapObstruction`: a residue-dependent completion of at most five
  equalities.

No combination of strict subsets of those antecedents was counted as a
cover.  The checked consumers require their complete antecedent packets.

## Parent common-critical-map boundary

Directly present, after choosing the existential `CriticalShellSystem`:

- one deletion-blocking exact four-shell per carrier source;
- source membership in that shell;
- blocker membership in `D.A`, blocker/source inequality, exact support card
  four, and no-q-free;
- global K4 at every carrier center from `D.K4`; and
- convexity and the leaf packet's cap order.

Not present:

- any cross-source shell membership;
- equality or inequality of the blockers for a chosen pair;
- blocker placement in the surplus cap;
- open-arc placement of a blocker relative to a chosen pair;
- common-pair membership in a residual member's global-K4 class; or
- the extra cross-row equalities required by `u1TwoLargeCapObstruction`.

There is also a provenance break at the current theorem interface:
`hcritical : Nonempty (CriticalShellSystem D.A)` and the separately supplied
`rows`/`hsupport` fields do not state that those rows were constructed from
the same chosen system.  Any producer using that identity must run at the
earlier common-system caller or retain explicit constructor equalities.

## Bank preflight and trust boundary

The required registries were checked before this audit:

- `docs/general-n-certificate-bank-mining-2026-07-09.md`, including the
  sibling `p97-rvol` bank section;
- `certificates/p97_rvol_general_n_mining.{md,json}`;
- `certificates/erdos97_legacy_general_n_mining.{md,json}`; and
- `certificates/erdos_general_theorem_p97_mining.{md,json}`.

Targeted `nthdegree docs search --lean` queries covered the two-large-cap
five-point obstruction, surplus-pair critical blockers, card-five cap/mutual
incidence, coincident-blocker residual membership, and ordered equal-chord
cores.  The nearest indexed reusable sink is the sibling
`u1TwoLargeCapObstruction`; the ordered-cap/equality kernels are already in
the current corpus.  No indexed theorem supplies the missing cross-incidence
producer.

The card-four, card-five, and coincident-blocker consumers are currently
kernel-checked scratch modules, not imported production declarations.  The
finite counts here are Python enumeration results, not Lean proofs.

## Reproduction

```bash
UV_CACHE_DIR=/tmp/uv-cache uv run python \
  scratch/atail-force/residue930-bridge/analyze.py --check
```

The checkpoint is `analysis.json`; `--check` reconstructs the 930 residues,
recomputes every embedding and exact `u1` deficit, and byte-compares the
canonical JSON.
