# Independent audit: three-center common-deletion RHS versus U5 consumers

Date: 2026-08-06

## Scope and verdict

This audit concerns only the non-card-12 RHS of
`pentagonOffClass_threeCenterDeletion_or_card_eq_twelve_probe` and the live
leaf
`false_of_exactFourRigid221_sourceHeavy_secondOppositeLarge_pentagonOffClassBlocker`.

**Verdict:** the RHS maps directly, with no new geometric premise, to three
exact `U5QDeletedK4Class` rows for one common deletion. It does **not** map to
an imported contradiction consumer. The closest bank theorem is the sibling
three-class tetrahedron incompatibility, but that theorem is not present in
the current anchored import environment and, more importantly, its eight
positive cross-support incidences are not supplied by the RHS or the anchored
packet. The imported overlap theorem yields only three pairwise
`intersection.card <= 2` facts, not `False`.

## Evidence checked

- Read `AGENTS.md` and all three requested theorem-bank censuses and JSON
  registries. The sibling census explicitly classifies the U5 bank as real
  consumers with a missing live-packet classification/incidence producer
  (`docs/general-n-certificate-bank-mining-2026-07-09.md:348-405`). The two
  legacy censuses expose bounded local N9 metric/scalar certificates, not a
  matching ambient packet consumer.
- The live leaf remains the explicit `sorry` at
  `Rigid221SourceHeavy.lean:3591-3663`; its named assumptions constrain the
  five physical points and selected row traces, not the two new blocker
  centers.
- The probe RHS at `PentagonOffClassProducerProbe.lean:1576-1596` supplies one
  deletion `q = u` or `q = xv`, three pairwise distinct centers
  `c1`, `c2`, `O = oppApex2`, and K4 survival after erasing `q` at all three.
- In the anchored module environment, Lean accepts
  `U5QDeletedK4Class.exists_card_four_of_hasNEquidistantPointsAt_skeleton`,
  `U5QDeletedK4Class.inter_card_le_two`, and the imported metric kernels. It
  reports
  `U5QDeletedK4Class.three_exact_classes_tetrahedron_incompatibility` as an
  unknown constant.

## What the RHS does derive

Write the three centers as `O`, `c1`, `c2`. Since
`CounterexampleData.skeleton q = D.A.erase q`, the imported constructor at
`U5GlobalIncidenceBasic.lean:350-353` gives supports `BO`, `B1`, `B2` and

```lean
KO : U5QDeletedK4Class D q O  BO
K1 : U5QDeletedK4Class D q c1 B1
K2 : U5QDeletedK4Class D q c2 B2
```

with all three supports of cardinality four. No additional premise is needed
for this packaging.

The anchor also derives `q in D.A`, all three centers in `D.A`, and their
pairwise distinctness. Consequently it can package any of the three center
pairs as `CommonDeletionTwoCenterPacket`, and
`U5QDeletedK4Class.inter_card_le_two` gives

```text
card (BO inter B1) <= 2
card (BO inter B2) <= 2
card (B1 inter B2) <= 2.
```

There is no imported theorem turning three cardinality-four sets with those
upper overlap bounds into a contradiction; such set systems plainly exist.

For the `O` row one can do slightly better than arbitrary trimming. The
packet's exact physical class and `P.hfive`, with `q = u` or `q = xv`, let one
choose `BO` as the four surviving physical-class points. Thus membership of
any chosen surviving named physical point in `BO` is derivable.

## Closest tetrahedron consumer and exact missing premises

The sibling registry records the source-proved theorem
`U5QDeletedK4Class.three_exact_classes_tetrahedron_incompatibility`
(`certificates/p97_rvol_general_n_mining.json`, entry beginning at line
38548). A current scratch adapter states the same incidence core at
`scratch/atail-force/tetrahedron-bank-adapter/TetrahedronBankAdapter.lean:26-38`.

Use the best permutation, putting the known physical center in the theorem's
`x` role:

```text
x = O, y = c1, b = c2,
Kx = KO, Ky = K1, Kb = K2.
```

After the three exact classes, the consumer requires exactly an auxiliary
point `a` and these eight memberships:

```text
c1 in BO,  a in BO,
O  in B1,  a in B1,  c2 in B1,
O  in B2,  c1 in B2,  a in B2.
```

This permutation minimizes required localization into the known physical row:
only one of `c1,c2` must lie in `BO`. Putting `O` in the theorem's `b` or `y`
role requires both new blocker centers in `BO`.

Derivability from the anchored packet:

| Premise | Status |
|---|---|
| Three exact q-deleted classes and card four | **Derivable** directly from the RHS |
| `q in A`, centers in `A`, pairwise center distinctness | **Derivable** |
| A named surviving physical `a in BO` | **Derivable**, by choosing the canonical physical `O` row |
| `c1 in BO` (or symmetrically `c2 in BO`) | **Not derivable**; the RHS gives only `c1 != O`, `c2 != O` |
| `O,a,c2 in B1` | **Not derivable** |
| `O,c1,a in B2` | **Not derivable** |
| The same `a` in all three rows | **Not derivable** |

The two facts `source_i notin Kxv.support` concern the **source points**, not
the blocker centers `ci` and not the newly trimmed supports `Bi`. Survival at
`ci` also does not identify `Bi` with the selected row at `source_i` or name
any member of `Bi`. The anchored trace bounds concern the five named rows
(`u,xu,deleted,v,xv`); they do not transfer to the two existential sources or
their exact surviving classes. The sole off-class hypothesis concerns
`centerAt xv`, not `c1` or `c2`.

Therefore the exact missing semantic producer is a tetrahedral cross-incidence
producer (equivalently the eight memberships above), beginning with at least
one new blocker-center localization into the surviving physical `O` row and
then the two blocker-row cross incidences plus a common auxiliary point.

## Other bank consumers

An exhaustive scan of the sibling U5Q contradiction statements found no
consumer whose hypotheses stop at common deletion, three exact rows, and
distinct centers. The closest non-triple-record consumers are the tetrahedron
theorem and the six imported metric/class kernels. The latter require an
equilateral or dangerous-`p`-circle frame, positive named support incidences,
and in some cases an off-circle premise. The anchor supplies a five-point
physical circle but neither puts `c1,c2` on/off that circle nor puts the needed
named points in `B1,B2`. The remaining U5 consumers require
`U5DangerousTriple`, `U5QCriticalTripleClass`, or a full finite-audit labeling;
none is produced here.

**Conclusion:** the probe is a valid exact-class producer but not a theorem-bank
closure. Porting/importing the tetrahedron theorem alone would be bookkeeping;
the load-bearing gap is the positive cross-incidence/localization producer.
