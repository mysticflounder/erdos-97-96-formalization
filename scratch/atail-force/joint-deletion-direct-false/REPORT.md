# Joint-deletion direct-`False` bank-match audit

Date: 2026-07-17

Status: **BOUNDED NEGATIVE BANK MATCH. This source-return leaf is a fallback,
not the primary parent route. The existing survival-cover producer and
uniform physical-second-apex consumer already reduce the card-at-least-
fourteen parent surface to physical-second-apex robustness or protected
swapped FA-UNIQ4. On the residual robust surface, the joint-deletion leaf
does not reach a registered direct-`False` consumer. No production `sorry`
is closed.**

## Scope and preflight

This audit uses the exact existing leaf

```text
N.strictInterior = matchingSourceReturn walk (.jointDeletion data ingress)
```

together with

```text
N.frontierEscape
B.secondApex_robust
L.firstOppCap_card_ge_six
L.secondOppCap_card_ge_six.
```

Before matching a local incidence contradiction, I checked the required
registries:

- `docs/general-n-certificate-bank-mining-2026-07-09.md`, including the
  sibling `p97-rvol` section;
- `certificates/p97_rvol_general_n_mining.{md,json}`;
- `certificates/erdos97_legacy_general_n_mining.{md,json}`; and
- `certificates/erdos_general_theorem_p97_mining.{md,json}`.

Focused `nthdegree docs search --lean` queries covered retained source return,
joint deletion, four deletion-survival centers, dangerous triples,
q-critical and q-deleted rows, common pairs, and cap-ordered consumers. The
closest exact hit is the existing
`U5QCriticalTripleClass.two_triple_points_incompatibility`; none of the banks
derives its positive pair incidence from the live fields.

The result must be read after the already-checked primary reduction:

```text
card >= 14 survival cover
  -> CommonDeletionTwoCenterPacket ... arbitraryCenter S.oppApex2
  -> FullyDeletionRobustAt D S.oppApex2
     or SwappedFirstApexUniqueFourFrontier D S H.
```

That route is recorded in `../survival-cover-bank-match/` and
`../common-deletion-uniform-consumer/`. This report does not replace it and
does not nominate source return as the next parent theorem.

## Exact live information on the joint leaf

Let

```text
q  = data.source
p  = S.oppApex1
p' = S.oppApex2
b1 = H.centerAt walk.first  walk.first_mem_A
b2 = H.centerAt walk.second walk.second_mem_A
c  = H.centerAt q ...
```

The existing structures give:

1. `q` lies in the retained first-apex radius class and differs from the two
   source-return walk sources.
2. `q` is absent from the exact selected critical supports at both walk
   sources.
3. `data.firstPacket` and `data.secondPacket` give q-deleted rows at
   `(p,b1)` and `(p,b2)`.
4. `ingress.dangerous` gives a three-point set `T` on the `p`-circle through
   `q`.
5. `ingress.actualCriticalRow` gives the three surviving companions to `q`
   in the exact q-critical row centered at `c`.
6. `B.secondApex_robust` gives deletion survival at `p'`.

The four deletion-survival centers

```text
{p, p', b1, b2}
```

are pairwise distinct. The packet center inequalities separate `p` from
`b1,b2`; source return separates `b1` and `b2`; second-apex robustness
separates `p'` from both actual blockers; and the two physical apices are
distinct. Moreover `c` is distinct from all four: both joint packets separate
it from `p,b1,b2`, and second-apex robustness separates it from `p'`.

This is a strong five-center configuration, but all four robust rows are
q-deleted. Deletion survival does not put `q`, a dangerous point, or any
other prescribed point into those rows.

## Why `N.frontierEscape` and `L` do not complete a bank antecedent

`N.frontierEscape` retains the original frontier pair and supplies:

- one point of the original physical-second-apex row outside the deleted
  frontier source's actual critical support and outside the first-apex
  marginal;
- a directed split: either one frontier cross membership or a companion
  common-deletion packet; and
- one of three refined escape/common-deletion outcomes.

No field identifies any of those frontier/escape sources with `q`, either
walk source, either actual blocker, or a member of `ingress.T`. Therefore its
positive support facts cannot be rewritten into the source-return U5 roles.

The two cap-six fields of `L` imply the card-at-least-fourteen carrier surface
and provide fresh carrier capacity. They do not identify a fresh point's
actual row or produce a prescribed support membership. That cardinal force is
already consumed more effectively by the primary survival-cover theorem.

## Precise finite scope model

`verify_scope_model.py` records a 14-label incidence fixture with the normalized
cap profile

```text
surplus = {0,1,2,3,4}
opp1    = {4,5,6,7,8,9}
opp2    = {9,10,11,12,13,0}.
```

It checks all finite projections relevant to this bank match:

- cap sizes `(5,6,6)` and endpoint overlaps;
- two strict `opp1` walk sources;
- exact four-point supports, center/source exclusions, and the q-critical
  source membership;
- one common five-point first-apex radius class and two disjoint
  physical-second-apex four-classes, the latter witnessing deletion
  robustness for every carrier source in the incidence abstraction;
- the five common-deletion overlap bounds;
- at most two common support points for distinct centers;
- the cap-intersection bounds `<= 2`, sharpened to `<= 1` at cap endpoints;
- four distinct q-deletion centers plus a fifth q-critical center;
- the frontier escape's original-row membership and critical-support
  omissions; and
- only one dangerous point in the actual q-critical triple.

Replay:

```bash
uv run scratch/atail-force/joint-deletion-direct-false/verify_scope_model.py
```

Expected output:

```text
PASS: joint-deletion named incidence/cap scope is compatible
four q-deletion centers = {0, 4, 10, 11}; q-critical center = 12
actual q-critical triple intersects dangerous T in exactly one point
scope only: not a Euclidean realization and not a theorem counterexample
```

This is an **abstract incidence/cap scope model**, not a Euclidean realization
and not a counterexample to the intended theorem. Its role is narrower: it
shows that projection-only bank matching cannot manufacture the missing
positive pair incidence.

## Smallest additional incidence with an immediate checked consumer

The narrowest exact addition is not another packet. It is the positive pair
incidence

```text
exists t1 t2,
  t1 in ingress.T /\
  t2 in ingress.T /\
  t1 != t2 /\
  t1 in support ingress.actualCriticalRow /\
  t2 in support ingress.actualCriticalRow.
```

This closes the leaf immediately with the existing checked theorem

```text
U5QCriticalTripleClass.two_triple_points_incompatibility
```

because `data.firstPacket.actual_blocker_ne_center1` supplies
`c != p`. The critical row already has the implicit common point `q`; two
distinct points of `T` would therefore give three common points on the
distinct `c`- and `p`-centered circles.

The live data does not force this pair. Indeed the existing theorem implies
that the actual q-critical triple can contain at most one point of `T`. Thus
the displayed incidence is an exact direct-`False` antecedent, not a plausible
standalone producer target. A viable geometric proof must instead force a
different registered pattern or derive `False` before packaging that
impossible pair.

## Verdict

- **PROVEN/checked elsewhere:** the source-return joint-deletion and U5
  ingress structures, the robust deletion facts, the primary card-fourteen
  survival-cover reduction, and its uniform physical-second-apex consumer.
- **SOURCE-VERIFIED here:** the exact five-center distinction and the absence
  of any identification from `N.frontierEscape` into the joint U5 roles.
- **EMPIRICALLY VERIFIED in the stated abstraction:** the finite scope fixture
  passes all checks listed above.
- **OPEN:** a direct contradiction on the robust physical-second-apex branch.
- **NON-PRIMARY:** further work on the joint-deletion leaf should stop unless
  the primary robust/FA-UNIQ4 route fails or supplies a new cross-incidence.
- **NOT RUN:** Lean/Lake, axiom audit, production build, proof-blueprint, or
  production/doc edits, in accordance with the active gates.
