# v30 exact-15 S-profile mutual-class cut audit

## Scope

This is a validated live-prefix efficiency audit, not a terminal v30 result
and not a closure certificate.  It measures a Boolean clause family licensed
by the source-clean exact-fifteen Lean bank against the authenticated v30
production2 assignment journals.

## Sound clause family

For an exact-fifteen S-profile cap with apex `P` and distinct strict-interior
points `C,M`, the full physical-shell semantics validate

```text
k4[C,P] and k4[C,M] and k4[M,C] -> k4[M,P].
```

Equivalently, the Boolean encoding may add

```text
not k4[C,P] or not k4[C,M] or not k4[M,C] or k4[M,P].
```

The Lean producer is

```text
Problem97.ATailExactFifteenSProfileMutualClassPair.
  false_of_sProfile_interiorPair_of_card_eq_fifteen
```

It combines exact-fifteen cap-interior exhaustion with the general banked
mutual-class contradiction.  A fresh-source axiom audit reports only
`propext`, `Classical.choice`, and `Quot.sound`; there is no `sorryAx`.
The module is still off the publish spine, and finite S-profile coverage is a
separate obligation.

This family was absent from the pre-v29 static equality-triangle bank because
nonapex `k4` atoms then denoted selected critical classes rather than exact
physical full-shell membership.  Under v29/v30 full nonapex multiplicity
semantics, the implication is sound.

## Authenticated live-prefix census

The census validated each journal with `AssignmentJournal.recover` before
reading proposals.  At the snapshot:

- 23 journals;
- 11,620 proposals;
- 11,601 completed proposals, all `UNSAT`;
- 21 proposals violated at least one new clause;
- all 21 violating proposals were already completed `UNSAT`;
- 9 distinct ordered cuts occurred;
- 20 proposals violated one cut and one proposal violated two cuts.

Thus the family would have rejected 21 of 11,620 observed proposals in the
Boolean prepass, about 0.18%.  It is an essentially free, exact theorem-backed
cut, but this measured yield is too small to call convergence-changing by
itself.  It should be included in the next source-frozen schema rather than
mutating the active v30 source.

## Reproduction hashes

```text
dc28254f35f7a98e5b8199a565137e49d99a9bd0c388b7895c452455dc54ca75  v30_s_profile_mutual_class_cut_census.py
2c6c5b56d861ed62a22f8b86c34003f71e15244aeff4dcf27daf3267776fbdfc  v30-production2-s-profile-mutual-class-cut-census-20260802.json
aa5a0d15f75e751e53d621cc45d7b00cd5efbeb192c4fd216d2972ef5a23cce6  ExactFifteenSProfileMutualClassPair.lean
```
