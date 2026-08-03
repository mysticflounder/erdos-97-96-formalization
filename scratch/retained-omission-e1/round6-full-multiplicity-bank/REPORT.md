# Round 6: full-multiplicity theorem-bank pass

## Scope and status

Read-only source audit for the exact external `n = 15` CEGAR shell around
`Problem97.ATailFrontierLiveClosure.false_of_retainedOmission_triApexAllLarge_core`
(`lean/Erdos9796Proof/P97/ATail/FrontierLiveClosure.lean:6918-6927`). This
anchor is currently a `sorry`; this report neither verifies nor promotes it.
No Lean/Lake build, solver run, or source change was made. Every proposed
clause is a necessary condition for a genuine Euclidean counterexample, not a
Lean closure and not an interpretation of either `UNKNOWN` as a survivor or
`UNSAT` as a universal theorem.

The directly inspected theorem files contain no literal `sorry` or `axiom`,
but their transitive imported-axiom status was not kernel-audited in this pass.
The source import chain is available through
`U1CarrierInjection -> WitnessPacketInterface -> PinnedMultiplicity`; the
anchor imports its ATail consumers rather than this file directly. Thus the
results below are **source-visible and semantically applicable**, with no
claim of current transitive kernel closure.

## What schema-v4 already captures

Schema-v4 replaces schema-v3's arbitrary selected four-subset with a full
positive radius fiber at each non-apex global-K4 centre:

```
k4[c,x] <-> (d(c,x) = k4_radius[c])       (x != c)
k4_radius[c] >= 1
card {x | k4[c,x]} >= 4
used(c) -> k4[c,x] <-> row[c,x]
```

See `round6-full-multiplicity/run_full_multiplicity.py:52-84`. It also adds
each such full fiber to the circle-overlap family. Frozen schema-v3 already
has, for every used blocker centre, an exact full critical row of cardinality
four and an at-most-three bound on every non-row equality class
(`round5-general-cegar/round5_cegar.py:255-302`). The rich apex classes are
also already full equality fibers of exact S6 or D4/D4 size
(`round5-general-cegar/round5_cegar.py:324-393`).

Consequently, none of the following is an additional v4 constraint:

| Source result | Exact content | Current encoding coverage |
| --- | --- | --- |
| `hasNEquidistantProperty_iff_forall_le_pinnedMultiplicity` (`PinnedMultiplicity.lean:202-210`) | Global K4 iff every carrier point has pinned multiplicity at least four. | One full `>= 4` fiber is already selected at each non-apex; the exact rich fiber(s) supply one at every apex. |
| `exists_selectedClass_card_ge_four_of_hasNEquidistantProperty` (`WitnessPacketInterface.lean:114-120`) | Each centre has some positive full `SelectedClass` of size at least four. | Exactly the schema-v4 global-K4 family. |
| `CriticalFourShell` fields (`U1CarrierInjection.lean:542-556`) | A selected critical row is the *entire* ambient radius class, has exact size four, has positive radius, and contains its deleted source. | `critical_full_row`, `source_in_critical_row`, and v4's `used -> globalK4Full = row`. |
| `source_mem_selectedFourClass` and `selectedFourClass_support_eq_shell` (`U1CarrierInjection.lean:1069-1113`) | Any selected K4 at a chosen blocker centre contains its source and equals the canonical critical shell. | `source_in_critical_row`, exact row, and `used -> k4 = row`; no competing K4 is already encoded. |

In particular, do **not** add exact cardinality four to generic v4 global K4:
the global hypothesis only gives a radius class of cardinality *at least* four.
Exact four is valid only for a canonical critical shell at a used blocker.

## One sound additional family: full-shell squared separation

The frozen relaxation intentionally keeps `s` independent of `d` except for
equal-distance transport:

```
d(c,x) = d(c,y)  ->  s(c,x) = s(c,y)
```

(`round5-general-cegar/round5_cegar.py:217-233`). A full critical shell gives
the converse *disequality* needed by the DDD normal form:

* `CriticalFourShell.dist_ne_radius_of_mem_A_not_mem_support`
  (`U1CarrierInjection.lean:606-614`) says that an ambient nonmember is at a
  distance different from the shell radius.
* A shell member is at that radius by
  `CriticalFourShell.support_eq_radius` (`U1CarrierInjection.lean:569-576`).
* For actual nonnegative Euclidean distances, unequal distances have unequal
  squares. This last step is elementary metric arithmetic; it is **not** a
  separately identified P97 theorem declaration.

Therefore this is a sound strengthening of the abstract `d/s` relaxation:

```
used(c) and row[c,q] and not row[c,x]
    -> s(c,q) != s(c,x)                         [critical_shell_squared_separation]
```

The hypotheses are deliberately only for a **used canonical critical row**:
there, `row` is an exact full radius class. No strict order or positive
numeric gap follows, so do not strengthen `!=` to `<`, `>`, or `>= 1`.

### Smallest DDD instances

Let `k` be kept, `d` deleted, `f` fresh, and let `c_d` be the blocker
selected by source `d`. The fresh arm already asserts
`dynamic_row_member(d,k)`, `not dynamic_row_member(d,f)`, and that `c_d`
is a first-cap interior blocker
(`round5-general-cegar/round5_cegar.py:536-548`). Because
`dynamic_row_member(source, point)` is the disjunction
`block[source,c] and row[c,point]` (`:165-169`), at the selected `c_d`
this licenses the single targeted instance

```
block[d,c_d] -> s(c_d,k) != s(c_d,f)            [fresh_DDD_shell_sqsep]
```

This is the smallest recommended first experiment: one implication for every
allowed `c_d`, not a new all-pairs theory. It directly consumes the fresh
full-shell exclusion which schema-v4 already makes semantically meaningful,
and connects it to the otherwise weak squared-distance side of DDD.

For the paired arm, two analogous optional clauses are sound:

```
block[k,c_k] -> s(c_k,k) != s(c_k,d)
block[d,c_d] -> s(c_d,d) != s(c_d,k)            [paired_shell_sqsep]
```

Here the two negative dynamic-row facts occur at `:517-533`. These are less
directly relevant to the requested DDD unknowns but are the same source-level
consequence.

### Generalization and non-recommendations

The general family over every used centre and every `(q,x)` pair is sound and
is equivalent, under the exact-row semantics, to separation of squared
distance for a row member and a row nonmember. It is not necessary to add it
before testing the one DDD instance above. A global
`d(c,x) != d(c,y) -> s(c,x) != s(c,y)` is also sound for real distances, but
is not pinned-multiplicity-specific and is much broader than the evidence
requested here.

No further membership/cardinality clause was found that is both new and
justified by the inspected full-shell bank:

* full equality membership, positive radius, and `>= 4` are schema-v4;
* exact four/source membership/no competing K4 at blockers are schema-v3;
* apex full fibers and their no-third-K4 exhaustion are schema-v3; and
* full-shell nonmembership supplies only distance/squared-distance
  disequality, not a sign, order, chord, or cross-centre membership fact.

## Recommended encoding order

1. Add only `fresh_DDD_shell_sqsep`, using a new provenance family and retaining
   the existing v4 full-shell circles unchanged.
2. Run the same bounded fresh DDD probes. If still `UNKNOWN`, record that this
   theorem-bank pass has exhausted the direct pinned/full-shell consequences.
3. Only then consider the paired instances or the broader all-critical-row
   family; neither should be presented as a new multiplicity theorem.

This proposal is source-sound for the anchored counterexample model but remains
external CEGAR pruning until a separately authorized Lean producer and kernel
audit are completed.
