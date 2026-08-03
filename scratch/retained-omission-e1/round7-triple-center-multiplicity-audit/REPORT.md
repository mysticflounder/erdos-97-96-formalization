# Round 7 triple-center multiplicity audit (source-frozen)

## Verdict

**Recommended as a sound CEGAR relaxation cut.**  For every three *distinct*
carrier points, at most one carrier point can be equidistant from all three.
The exact geometry is already proved in the current Lean source, and convex
independence supplies its non-collinearity premise.  This is a global cut, not
an E1-only fact.

It does **not** presently turn an UNSAT result into a Lean closure by itself:
the project has no checked theorem transporting the retained-omission target
to the Python/Z3 distance-label encoding.  See `Encoder-to-Lean bridge` below.

## Lean evidence

| claim | status | source |
| --- | --- | --- |
| Two Euclidean centers equidistant from the same three non-collinear points coincide | **PROVEN in current Lean source** | `lean/Erdos9796Proof/P97/U5GlobalIncidenceBasic.lean:128-136`, theorem `Problem97.eq_of_equidistant_three_noncollinear` |
| Any three distinct carrier points have nonzero signed area under `ConvexIndep` | **PROVEN pattern already used in current Lean source** | `lean/Erdos9796Proof/P97/N8/N8CapCoordNorm.lean:769-773` |
| The retained-omission target import graph reaches U5 basic incidence | **SOURCE-VERIFIED** | `lean/Erdos9796Proof/P97/ATail/FrontierLiveClosure.lean:15` imports `ATail.FiveCenterDeletionBoundary`; `lean/Erdos9796Proof/P97/ATail/FiveCenterDeletionBoundary.lean:2` imports `P97.U5GlobalIncidenceBasic` |

The non-collinearity transport is exactly:

```lean
have hncoll : ∀ {a b c : ℝ²}, a ∈ A → b ∈ A → c ∈ A →
    a ≠ b → a ≠ c → b ≠ c → signedArea2 a b c ≠ 0 := by
  intro a b c ha hb hc hab hac hbc hz
  exact ConvexIndep.not_three_collinear S.hconv ha hb hc hab hac hbc
    (collinear_of_signedArea2_eq_zero a b c hz)
```

Combining `hncoll` with
`eq_of_equidistant_three_noncollinear` proves the desired `≤ 1` statement for
all carrier triples.  No restriction that either proposed center be outside
the triple is needed: a carrier center equal to one triple point has one zero
distance and two strictly positive distances, hence its two equalities are
false.

The theorem-bank registry was checked before source navigation; it classifies
this as the existing U5 global-incidence route rather than a new finite-row
contradiction.  One indexed Lean search for “three noncollinear points
equidistant centers are equal” returned this exact declaration.

## Exact CEGAR semantics

The round-6 encoding subclasses round-5 and retains the global pair cut:

```python
for x, y in itertools.combinations(POINTS, 2):
    equidistant_centers = [self.d(c, x) == self.d(c, y) for c in POINTS]
    self.add("pair_center_multiplicity", at_most(equidistant_centers, 2))
```

Source: `scratch/retained-omission-e1/round5-general-cegar/round5_cegar.py:421-429`.
Round 6 extends only `_build_normal_form` with the cap-localized rich-double-hit
cut; it calls `super()` first, so that pair capacity is inherited unchanged.
Source: `scratch/retained-omission-e1/round6-full-multiplicity/run_full_multiplicity_caplocal.py:39-61`.

For actual Euclidean realizations the proposed triple predicate has the exact
meaning

```python
self.d(center, a) == self.d(center, b) and \
self.d(center, a) == self.d(center, c)
```

because `d` denotes an unsquared distance label.  The cut must stay on `d`,
not `s`: the existing encoding only transports `d`-equalities to `s`
equalities, so an `s`-only version would not have the same audited semantic
bridge.

## Minimal v7 schema

Place this in a new round-7 subclass and invoke it from `_build` immediately
after `super()._build()` (rather than treating it as fresh-arm normal-form
data):

```python
def _build_triple_center_multiplicity(self) -> None:
    for a, b, c in itertools.combinations(base.POINTS, 3):
        centers = [
            z3.And(self.d(p, a) == self.d(p, b),
                   self.d(p, a) == self.d(p, c))
            for p in base.POINTS
        ]
        self.add("triple_center_multiplicity", base.at_most(centers, 1))
```

`itertools` must be imported by the new script.  Do not guard the cardinality
constraint by `used(p)`: the Euclidean theorem holds for every carrier center,
and the unguarded form is strictly stronger while still sound.

## Size estimate

For the fixed fifteen-label encoding:

| item | count |
| --- | ---: |
| triple cardinality constraints | `C(15,3) = 455` |
| conjunction literals | `455 × 15 = 6,825` |
| distance-equality occurrences | `2 × 6,825 = 13,650` |
| current pair constraints / equality literals | `105` / `1,575` |

Thus the addition is about `4.33×` the existing pair-cut count in pseudo-Boolean
constraints and `8.67×` in equality occurrences.  **Runtime impact is
HEURISTIC**: Z3 may structurally share the equality atoms, but the additional
PB constraints are nontrivial.  The expected cost is moderate relative to a
full nonlinear-coordinate phase and should be measured only after preserving
the source-frozen baseline.

## Encoder-to-Lean bridge

The following implication is **CONJECTURED / not currently formalized**, not
established by this audit:

> Every retained-omission E1 target realization can be mapped to the fifteen
> named CEGAR labels with `d(i,j) = dist(point_i, point_j)`, preserving the
> Python row, cap, equality, and selected-full-circle predicates.

Conditioned on that map, the new clause is a **PROVEN mathematical necessary
condition** of every target realization.  An UNSAT result after adding it is
therefore external pruning evidence until a certificate/replay plus the mapping
theorem is banked.  This is the same scope limitation as the existing pair
capacity; it is not a new weakness of the triple cut.

No Lean build, solver execution, or source mutation was performed for this
audit.

## Supplement (2026-08-01): Phase-3 projected-static-v2 is not a pinned-multiplicity encoding

This supplement separates three easily conflated notions:

| notion | fixed object being counted | present in Phase-3 projected-static-v2? | present in round-7 v7? |
| --- | --- | --- | --- |
| pinned multiplicity `μ(p,A)` | the largest full equal-radius class about one fixed centre `p` | no | no |
| selected-four row | four chosen equal-distance witnesses about one fixed centre | yes | not the v7 addition |
| co-centre capacity | how many centres can be equidistant from a fixed target pair/triple | pair capacity two | triple capacity one |

`pinnedMultiplicity A p` is defined as the maximum cardinality of a *full*
radius class in `lean/Erdos9796Proof/P97/PinnedMultiplicity.lean:154-166`.
The source-level theorem
`hasNEquidistantProperty_iff_forall_le_pinnedMultiplicity` at lines 200-209
relates the four-witness property to `μ(p,A) ≥ 4`; failure is equivalent to
some `μ(p,A) ≤ 3` at lines 211-220.  That is Lean mathematics, not a field or
constraint in either CEGAR encoding.

### Phase-3 static CNF

The projected-static-v2 generator allocates only selected-edge `s[p,q]`,
optional legacy blocker `b[x,d]`, and cap annotation `f[x,i]` variables
(`census/p97_search/sat_generate.py:239-253`).  It has no radius label,
radius-class cardinality, `μ`, full-shell, or off-support-disequality variable.

Its relevant hard clauses are:

- `S-EXACT` (`:292-297`): exactly four selected outgoing `s[p,q]` edges per
  centre.  Under an actual Euclidean realization/adapter this supplies a
  *chosen* four-point equal-radius witness and hence establishes only
  `μ(p,A) ≥ 4`.  It does not say the full radius class has size exactly four.
- `S-CIRC2` (`:299-312`): two selected rows share at most two targets.  This
  is a selected-row intersection constraint, not a radius multiplicity bound.
- projected `B-INDEG` (`:324-329`): every target has some incoming selected
  edge, the existential projection of legacy B1 blocker membership.
- `DUAL2` (`:331-345`): at most two selected centres can jointly select a
  fixed target pair.  This is the pair co-centre capacity, not the number of
  points on a circle about one centre.
- exact-ten `S-MINCUT` (`:347-359`): every nonempty proper target set has an
  entering selected edge.

The projected-static-v2 Phase-3 configuration enables only projected blockers,
static `DUAL2`, and (at `n = 10`) `S-MINCUT`
(`census/p97_search/phase3_structural_cegar.py:514-524`).  Its regression test
records `10` `B-INDEG`, `2,520` `DUAL2`, and `1,022` `S-MINCUT` clauses, for
`8,624` clauses and `114` variables
(`census/p97_search/tests/test_sat_generate_projected_static_v2.py:159-180`).
None is a pinned-multiplicity constraint.

The corresponding Lean exact-ten min-cut result expressly selects *any* four
equal-distance witnesses (`lean/Erdos9796Proof/P97/ExactTenSelectedShellMincut.lean:10-22`,
`:67-98`).  `SelectedFourClass` likewise records an arbitrary four-element
support (`U1CarrierInjection.lean:397-414`).  The distinct
`CriticalFourShell` structure records the *whole* radius class and exactness
(`:536-554`); it is not what Phase-3 emits.

### Phase-3 dynamic CEGAR clauses

The metric detector constructs rows with `exact=False`
(`census/p97_search/phase3_structural_cegar.py:1010-1058`).  Its ordinary
row/certificate/membership explanations add negative literals for the selected
`s` memberships (`:2299-2326`, `:2566-2575`, and `:2665-2695`).  Thus a learned
clause forbids a local selected equality/cap pattern.  It never asserts that an
unselected label has a different radius, and it does not bound or enumerate a
full radius class.  Dynamic CEGAR therefore does not add the missing
pinned-multiplicity semantics either.

### How v7 relates to this distinction

The current v7 script is
`scratch/retained-omission-e1/round7-triple-center-multiplicity/run_full_multiplicity_triple_center.py`.
It sets `SCHEMA_VERSION = 7` at line 22, subclasses v6 at lines 30-37, and
adds, for every target triple `(a,b,c)`, a pseudo-Boolean constraint

```python
at_most([
    And(d(center,a) == d(center,b), d(center,a) == d(center,c))
    for center in POINTS
], 1)
```

at lines 39-52.  This is a sound **dual** constraint: three non-collinear
targets have at most one equidistant centre.  It is stronger than the inherited
pair co-centre capacity in arity, but it is still not a statement of the form
`pinnedMultiplicity A p ≤ k` or `= k`.

For the fixed `POINTS = range(15)` carrier
(`round5-general-cegar/round5_cegar.py:34`), the v7 addition has exactly
`C(15,3) = 455` PB capacity constraints, each over fifteen conjunctions:
`6,825` conjunction occurrences and `13,650` syntactic `d`-equality
occurrences.  The inherited pair family has `C(15,2) = 105` PB constraints and
`1,575` equality occurrences.  Counting these two global capacity families
only gives `560` PB constraints and `15,225` equality occurrences before any
solver simplification or term sharing; this is not a count of the Phase-3 CNF
or the full v6/v7 encoding.

The v7 condition deliberately uses unguarded unsquared `d` equalities, not
selected `s` edges and not `used` guards.  It is therefore a separate
retained-omission Z3 relaxation rule, not an extension of Phase-3
projected-static-v2's selected-row language.

### Verification boundary

All statements in this supplement are **SOURCE-VERIFIED** only.  No solver,
generator, test, Lean/Lake build, proof-blueprint query, or transitive axiom
audit was run.  The Lean theorems cited above were inspected in source but not
freshly kernel-verified in this audit.  In particular, neither a Phase-3 nor a
v7 UNSAT outcome may be presented as a Lean closure without the relevant
encoding-to-Lean transport and a checked certificate/replay path.
