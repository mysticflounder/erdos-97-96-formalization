# V36 selected-row alternation pilot

## Status

Terminal Boolean pilot: **12 SAT, 0 UNSAT, 0 UNKNOWN** in both variants.
This is neither a P97 counterexample nor a retained-frontier closure.  It shows
that the already-proved selected-four-class alternation theorem, even applied
globally to all selected seed rows, does not make the v35 hard Boolean canary
infeasible.  No full metric round was launched.

## Sound added constraints

The pilot instantiates
`Problem97.selectedFourClass_shared_pair_separated` for selected four-class
supports that v33 deliberately does not register as full physical circles.

1. `qrow`: between the first-apex selected row and every selected seed row
   with a distinct center: 24 constraints per case.
2. `pairwise`: the preceding 24 constraints plus every pair of selected seed
   rows with distinct centers: 180 additional constraints per case.

Both variants were run on the 12 v35 `DDD` hard-canary role tuples.  Each case
was solved only in `round5_cegar_v12.build_boolean_relaxation`.

## Survivor classification

The pairwise diagnostic records one Boolean model for each role tuple.  Every
model satisfies the global escape requirement.  Let the *same branch* be the
left or right adjacent-cap label set containing the selected endpoint `J`.
Among escaping selected rows whose center belongs to that same branch, the
maximum overlap with `Q.row.support` is:

- zero in 5 of 12 models;
- one in 7 of 12 models;
- at least two in 0 of 12 models.

Thus the models evade the geometric consumer before alternation matters: they
put every two-hit escaping row outside `J`'s adjacent-cap branch.  This
identified a candidate intermediate producer: an escaping selected row whose
center is in the branch containing `J` and whose support has at least two
points in `Q.row.support`.  The v37 follow-up below shows that this producer is
not terminal-strength.

The independent Lean/API audit also found that the local two-circle packet is
realizable and that `endpointFresh_sharedBlocker_pair_alternates` already
extracts its complete cyclic-order consequence.  Therefore a same-side order
assertion cannot be derived from the current local shell facts alone.

## Mandatory global theorem-bank audit

The post-round audit of the import-reachable Lean corpus and the three existing
P97 theorem-bank registries found no producer for the required conjunction.
The closest results split into two noncomposable groups:

- `endpointFresh_exists_selectedRow_escape_twoShellSeed` and its prescribed-row
  variant force an escaping selected row, but neither localizes its center nor
  forces two `Q.row.support` hits;
- the cap-localization, shared-pair separation, and outside-overlap theorems are
  consumers whose hypotheses already contain the missing two-hit or cap-side
  information.

The smallest unbanked producer visible at v36 was therefore a
left/right-parametrized statement giving an escaping selected row centered in
the adjacent-cap branch containing `J` with intersection cardinality at least
two against `Q.row.support`.  It was only an intermediate producer: the
subsequent consumer also needs nonalternation of the common pair or both shared
points outside the chosen adjacent cap.

## V37 terminal follow-up

V37 tested that distinction instead of promoting the candidate producer.  It
added, simultaneously:

1. the banked exact adjacent-cap intersection
   `endpointFresh_frontierRadiusClass_inter_leftAdjacentCap_eq_singleton` or
   its right-hand mirror;
2. all pairwise selected-row alternation constraints from v36; and
3. the hypothetical branch-localized escaping-row/two-hit producer.

All twelve hard role tuples remained SAT: **12 SAT, 0 UNSAT, 0 UNKNOWN** in
79.644 seconds.  The hypothetical producer therefore does not close even this
Boolean abstraction after the exact adjacent-cap singleton theorem is present.
The surviving overlap may split one point inside and one point outside the
chosen adjacent cap, which is not forbidden by the current alternation
consumer.

This is a terminal no-go for the proposed v36 successor.  A useful next theorem
must be role- and order-sensitive: it must rule out the one-inside/one-outside
placement, force both shared points into a forbidden side, or directly produce
one of the existing five-role Kalmanson placement packets.  More aggregate
row-overlap or alternation cuts should not be mined from this contract.

V37 artifacts:

- pilot source SHA-256:
  `53469c8304895efa22dcb1f1642bb8302ea75fde6489963b503f6aa39e70034f`;
- result SHA-256:
  `1daff449ec9516e6085822ce3b76621ff1d069355ee8c182213bcd6129c89c23`;
- result:
  `v37-adjacent-frontier-singleton-forced-producer.json`.

## Reproduction and provenance

- repository commit: `51960df34c88a4a42710b9f171d41a7506b6dc35`
- pilot source SHA-256:
  `cca1b5a0afefbaaaf981b3830903b36723a913f6ba8646060b6c64f8643513e0`
- qrow diagnostic SHA-256:
  `b547fecf0389e6724c8c1330caf95faa930d75ededfe5e6653efff0e4c592680`
- pairwise diagnostic SHA-256:
  `0809c9dfb10a813cd4479ac594bac1c4c7701a1751c37d90836985cdd105531d`

Commands:

```bash
PYTHONDONTWRITEBYTECODE=1 uv run python \
  scratch/retained-omission-e1/round5-general-cegar/v36_selected_row_alternation_pilot.py \
  --timeout-ms 120000 --workers 12

PYTHONDONTWRITEBYTECODE=1 uv run python \
  scratch/retained-omission-e1/round5-general-cegar/v36_selected_row_alternation_pilot.py \
  --timeout-ms 120000 --workers 12 --pairwise
```

The imported v8/v12/v33/v35 sources were clean at the recorded commit when the
diagnostics ran.

The pilot source was subsequently extended with the hypothetical-producer
diagnostic used to design v37. Its current SHA-256 is
`c18a9871dd4b0e0cd1ea52f42cb03f1fdc92feaa3dbf7c4ae1669ab2f1489cfe`,
so the historical v36 source digest above no longer matches the working-tree
file. The recorded pairwise result still authenticates against its digest;
this report does not claim a fresh v36 reproduction through the modified
source.
