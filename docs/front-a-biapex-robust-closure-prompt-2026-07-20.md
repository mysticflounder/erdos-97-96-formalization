# Exact-five mutual-parent closure

Prove the current live theorem:

```lean
Problem97.ATailFrontierLiveClosure
  .false_of_frontierBiApexRobustExactFiveMutualParentResidual
    {D : CounterexampleData} {S : SurplusCapPacket D.A} {radius : ℝ}
    {H : CriticalShellSystem D.A}
    (F : CriticalPairFrontier D S radius H)
    (R : FrontierCommonDeletionParentResidual F)
    (B : FrontierBiApexRobustResidual R)
    (Q : FrontierBiApexRobustExactFiveSecondCapResidual B)
    (profile : LargeCapUniqueFiveSecondApexRadius D S)
    (M : FrontierBiApexRobustExactFiveMutualParentResidual Q profile) :
    False
```

## Available source-faithful data

`M.pair` is an arbitrary pair of distinct strict physical second-cap points
whose actual `H.selectedAt` supports omit one another.  The physical set has
exactly three points.  The fixed `H`, full frontier `F`, minimality and
`noM44` in `R`, bi-apex deletion robustness in `B`, exact-five cap data in
`Q`, and both retained parent rows remain available.

The retained-row coupling is already proved and stored in `M`:

```text
exists x, x is physical and x in B2 and x notin B1
pair.source in B2 or pair.target in B2
pair.source notin B1 or pair.target notin B1
```

`M.endpointRowDichotomy` sharpens this to either one mutual endpoint in
`B2 \ B1`, or one endpoint in `B1 ∩ B2` while the other is outside both
retained rows.

`M.oneHit` is also kernel-checked: at least one of the two actual critical
supports meets the three-point physical set in exactly one point.  The
double-two-hit case is impossible because blocker localization would make
the blockers swap endpoints and force an equilateral physical triple.
Therefore the only remaining local cases are both-one-hit or one of the two
mirror asymmetric two-hit/one-hit cases.  Pure one-row cap geometry and bare
total criticality admit regressions; a closing proof must visibly use a
full-parent field such as global K4 coupled back to these named rows,
`R.minimal`, or a complete alternative `IsM44` packet contradicted by
`R.noM44`.

## Required result

Derive `False` from exactly the theorem inputs above.  A useful proof must
produce one of:

1. a second named cross-row incidence feeding an existing same-cap,
   Kalmanson, or critical-fiber terminal;
2. a source-faithful third selected class completing an existing metric
   contradiction; or
3. a genuine alternative non-obtuse MEC support packet with `IsM44`.

Do not re-prove the parent-row bridge, the all-reverse split, or the
double-two-hit classifier: all are already kernel-checked in
`ATail/ParentExactFiveSecondCap.lean`, and the all-reverse arm is impossible.

## Rigor requirements

- Use the fixed `H`; do not reassign blockers.
- Keep complete radius classes distinct from selected four-point supports.
- Do not assume genericity, distinct radii, distinct blockers, or unproved
  MEC-boundary membership.
- Every constructed row or packet must be the exact antecedent of a named
  existing consumer, or be consumed immediately.
- Label claims `PROVEN`, `EMPIRICALLY VERIFIED`, `CONJECTURED`, or
  `HEURISTIC`.
- If closure fails, report only the first missing source-level implication,
  the exact parent fields it uses, and the named terminal it would feed.
