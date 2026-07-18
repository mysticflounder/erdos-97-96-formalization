# Exact-card-seven period-three occurrence audit

## Status

**CHECKED OCCURRENCE REDUCTION; NOT A DIRECT CONTRADICTION.**

The exact-card-seven leaf of the `FullParentExactFiveAllReverseData` surface
does force new structure.  It does **not**, with the currently indexed
theorem bank, close the parent or any production `sorry`.

The checked scratch file is:

- `ExactSevenSourceBlockerOccurrence.lean`

Its three public theorems elaborate with `-DwarningAsError=true`.  Their
reported axiom closures contain only `propext`, `Classical.choice`, and
`Quot.sound`; in particular, they do not contain `sorryAx`.

## Bank preflight

Before proving the reduction I checked the required registries:

- `docs/general-n-certificate-bank-mining-2026-07-09.md`;
- `certificates/p97_rvol_general_n_mining.{md,json}`;
- `certificates/erdos97_legacy_general_n_mining.{md,json}`;
- `certificates/erdos_general_theorem_p97_mining.{md,json}`; and
- the indexed Lean corpora via `nthdegree docs search --lean`, including
  searches for a blocker equal to a transition successor, a source/blocker
  collision, and a period-three all-reverse terminal.

No indexed theorem consumes the equality proved below as a contradiction.
The closest indexed declarations are the existing successor-deletion
survival and blocker-row exactness results; both are compatible with the
equality.

This agrees with the earlier period-three and period-four/five audits: the
current source proves that blockers are pairwise distinct and differ from
their two incident sources, but deliberately permits a blocker to equal the
nonincident cycle source.

## Checked exact-card-seven deduction

Assume:

```lean
A : FullParentExactFiveAllReverseData L profile continuation
hcardSeven : S.oppCap2.card = 7
```

The closed physical cap has two endpoints, so its strict interior has
cardinality five.  The period-three cycle supplies three distinct physical
sources `q0,q1,q2`.  Global reverse membership and the transition packet
supply three pairwise-distinct actual blockers `b0,b1,b2` in that same
five-point interior.  Shared cap order proves

```text
b0 != q0, b0 != q1
b1 != q1, b1 != q2
b2 != q2, b2 != q0.
```

If none of `b0=q2`, `b1=q0`, or `b2=q1` held, the six named points would be
distinct members of a five-element finset.  The checked generic counting
lemma therefore gives one of those three equalities.

Because `bi` is the actual blocker of the successor of `qi`, each alternative
has the same transition-invariant conclusion:

```lean
theorem exists_source_blocker_eq_transition_successor_of_secondCap_card_eq_seven
    (hcardSeven : S.oppCap2.card = 7) :
    exists q : PhysicalVertex profile,
      H.centerAt q.1 (PhysicalVertex.mem_A q) =
        (A.transition.successor q).1
```

Equivalently, the transition successor of some physical source is that
source's chosen critical blocker.

This is also the exact order-theoretic picture.  If the three source indices
are `x < y < z`, the blockers for the two short source gaps occupy the two
remaining non-source positions.  Pairwise blocker distinctness then forces
the blocker straddling the outer source pair to be `y`.

## Whole-carrier manifest

The second checked theorem preserves the complete critical system rather
than replacing it with a conditional packet:

```lean
theorem exists_source_blocker_eq_successor_with_global_manifest_of_secondCap_card_eq_seven
    (hcardSeven : S.oppCap2.card = 7) :
    exists q : PhysicalVertex profile,
      H.centerAt q.1 (PhysicalVertex.mem_A q) =
          (A.transition.successor q).1
      /- and: -/
      -- every faithful carrier table uses q's exact chosen shell at successor q
      -- q belongs to that row
      -- deleting q destroys all K4 radii at successor q
```

More explicitly, for every `P : FaithfulCarrierPattern D.A`, the row at
`A.transition.successor q` has support exactly
`(H.selectedAt q ...).toCriticalFourShell.support`, contains `q`, and

```lean
not HasNEquidistantPointsAt 4 (D.A.erase q.1)
  (A.transition.successor q).1.
```

These facts use the retained `CriticalShellSystem` and its `no_qfree_at`
field; no new provenance hypothesis is introduced.

## Why this is not yet terminal

The equality is internally consistent with all currently retained fields:

- the critical center must differ from its own source, and the transition
  successor is already distinct from that source;
- the source's exact shell is centered at the successor and contains the
  source, but need not contain its center;
- deleting the source fails K4 at that center, exactly as `no_qfree_at`
  requires; and
- deleting the successor can still preserve K4 at that same point, as the
  existing transition theorem requires.

Existing terminal consumers instead require one of the following stronger
outputs:

1. two distinct sources with the same actual blocker;
2. a first-apex co-radial transition reverse outside pair;
3. a second same-cap center through a common outside pair; or
4. the named additional row incidences required by a U5/source-unit
   consumer.

The checked occurrence supplies none of these by itself.

## Exact remaining consumer gap

The next load-bearing theorem must consume the **source-as-successor-blocker
edge while retaining the full parent packet**.  A useful direct target is:

```lean
FullParentExactFiveAllReverseData L profile continuation
  -> S.oppCap2.card = 7
  -> (exists q, H.centerAt q = transition.successor q)
  -> False
```

But the new premise must be combined with one genuinely global field not yet
used by the occurrence argument.  The plausible choices are:

- first-apex frontier geometry/minimality/no-`M44`, proving that this directed
  source-blocker edge returns to a retained first-apex radius class; or
- a nonlinear Euclidean/MEC theorem that turns the two adjacent exact shells
  into a repeated blocker or a common outside-pair incidence.

Merely restating the exact row, its source membership, or `no_qfree_at` would
produce another nonterminal adapter.

## Cardinality boundary

This result is **exact-card-seven only**.  It must not be advertised as a
uniform card-at-least-seven theorem.  At closed-cap cardinality eight, the
strict interior can have six points, so the six source/blocker roles need not
collide.  Higher cardinalities require a different geometric or global
minimality argument.

## Validation

From `lean/`:

```text
lake env lean -M 16384 -DwarningAsError=true \
  ../scratch/atail-force/card-ge-seven-periodthree-occurrence-audit/ExactSevenSourceBlockerOccurrence.lean
```

completed successfully.  The scratch Lean file contains no `sorry`, `admit`,
new `axiom`, `native_decide`, or `unsafe` declaration.
