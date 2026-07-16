# Strict-`oppCap1` cross classifier

Status: **PROVEN** in
`StrictOppCapCrossClassifier.lean` by a direct single-file Lean check.

## Checked theorems

- `mem_strictOppCap1_of_mem_A_of_not_mem_adjacentCaps`: an ambient point
  outside `surplusCap` and `oppCap2` lies in
  `oppCap1 \ (surplusCap ∪ oppCap2)`.  The proof explicitly eliminates all
  three shared Moser-endpoint cases before using exact non-Moser cap coverage.
- `forward_cross_blocker_mem_strictOppCap1` and
  `reverse_cross_blocker_mem_strictOppCap1`: for a strict-`oppCap1`
  card-five survivor pair, either directed cross hit forces its actual blocker
  into strict `oppCap1`.  Ordered-cap uniqueness first excludes the blocker
  from each of the two caps containing `oppApex1`.
- `exists_relocationPair_with_strict_cross_classifiers`: its `hextract`
  hypothesis is exactly the existential conclusion of
  `ATailSecondApexDoubleSurvivorScratch.exists_strictOppCap1_pair_double_deletion_survives_secondApex_of_card_five`.
  It constructs the actual `SurvivorPairRelocationPacket`, retains the
  second-apex double-deletion witness, and installs both directed classifiers.
- `forward_cross_selected_support_inter_oppCap1_eq_pair`: after a forward
  cross hit, the blocker row meets `oppCap1` in exactly `{q, w}`.
- `forward_cross_selected_support_sdiff_oppCap1_card_eq_two`: the other two
  support points lie outside `oppCap1`.
- `forward_cross_excludes_third_strictOppCap1_source`: a third strict
  `oppCap1` source distinct from `q,w` cannot occur in that blocker row.

All printed axiom audits report only `propext`, `Classical.choice`, and
`Quot.sound`; none reports `sorryAx`.

Validation command (from `lean/`):

```text
lake env lean -M 16384 \
  ../scratch/atail-force/strict-oppcap-cross-classifier/StrictOppCapCrossClassifier.lean
```

No full Lake build was run.

## Exact residual

This classifier does **not** close K-A-PAIR.  Selected-row cap multiplicity is
saturated rather than violated: the two cross endpoints consume the permitted
two `oppCap1` support slots.  With three strict sources, the checked consequence
is only that a blocker row already containing one other strict source cannot
contain the third.  A directed three-cycle is still compatible with that
out-degree bound, and the reciprocal-omission/robust cross-deletion branch has
no directed hit to classify.  Closure therefore still needs a producer that
either rules out robust cross-deletion survival or couples the two outside-row
support points to an existing global contradiction.
