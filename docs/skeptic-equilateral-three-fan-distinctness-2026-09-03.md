# Skeptic audit: equilateral three-fan distinctness

Date: 2026-09-03

Verdict: **CERTIFIED**, with the source and promotion boundary stated below.
The three new declarations are kernel-checked consequences of their hypotheses,
and the plan accurately limits their force to the conditional profile-1697
packet. They do not close a live endpoint.

## Audited state

- Lean source:
  `lean/Erdos9796Proof/P97/Census554/EquilateralThreeFanCollision.lean`,
  SHA-256 `8726181017557a7846818eaedc686a308bd50ecba84b52f5cefe06497a80dcfb`.
- Plan:
  `docs/plans/2026-09-03-equilateral-three-fan-distinctness.md`, SHA-256
  `bb92ebbeed5886cb59ff927026eec14c81e29fce50b21adc0de59d7684a758d3`.
- Lane base: `927720d0af25f9d370b526aff82a008daf9f2c10`.
- Toolchain: Lean 4.27.0, commit
  `db93fe1608548721853390a10cd40580fe7d22ae`.

The source diff adds 135 lines and does not alter either earlier oriented
theorem statement.

## Claim audit

### C1. Normalized distinctness theorem: certified

The claim at lines 76--78 is:

> `distinct equilateral apexes force the last triple onto a line without`
> `choosing orientation signs.`

The declaration
`normalized_threeFan_signedArea2_eq_zero_of_distinct` begins at line 78.
Its argument handles every algebraic branch:

1. `normalized_equilateralHinge_coordinates` puts both `A` and `S` at
   horizontal coordinate `1/2` and gives `A_y^2 = S_y^2 = 3/4`.
2. Lines 93--105 use `A != S` to prove `A_y != S_y`, factor
   `(S_y-A_y)(S_y+A_y)`, reject the first factor, and obtain `S_y=-A_y`.
   No sign of either apex is selected.
3. Lines 116--126 prove `Q_y != 0`. If `Q_y=0`, the equation
   `dist(Q,O)^2=dist(Q,A)^2`, together with `A_x=1/2` and `A_y^2=3/4`,
   forces `Q_x=0`; hence `Q=B`, contradicting the supplied `B != Q`.
4. Lines 129--133 derive
   `Q_y * signedArea2(S,O,Q)=0`, reject the `Q_y=0` branch, and conclude
   the signed area is zero.

Squaring the six distance equalities is used only in the forward direction.
The proof neither introduces a spurious square-root choice nor cancels a
factor before proving that factor nonzero.

### C2. Similarity transport: certified

The declaration `threeFan_signedArea2_eq_zero_of_distinct` begins at line 212.
For `B != O`, `normSim B O` sends `B` to `(0,0)` and `O` to `(1,0)` and
scales distances by the nonzero factor `dist(B,O)^-1`. Lines 238--245 prove
injectivity as used here from that distance law, so both `A != S` and
`B != Q` survive normalization.

Lines 263--266 transport the zero-area conclusion back using
`signedArea2_normSim`. Its scale is the inverse of the positive squared base
length, and the proof explicitly discharges its nonzeroness. Thus there is no
lost zero-scale branch and no reflection-sign assumption.

### C3. Contradiction corollary: certified

`threeFan_false_of_signedArea2_ne_zero` begins at line 270. It applies the
transported theorem and contradicts the supplied nonzero signed area directly.
It introduces no additional trust boundary.

### C4. Profile-1697 orientation claim: certified within its stated packet

The plan says at lines 33--37:

> `This lemma removes full cyclic-order enumeration and chirality from profile`
> `1697 once its alias classes and row memberships are supplied.`

A current reconstruction of profile 1697 from
`exactfive_hard_source_swap_adaptive_order_nra_piqd.build_planar_system`
returned these relevant classes:

```text
B = c000 = {U,c1}   O = c001 = {O}     Q = c002 = {c2,q}
A = c003 = {a}      S = c005 = {p,s}
```

The fixed row declarations at
`census/card_head/exactfive_hard_source_swap_order_piqd.py:67-70` then supply
the theorem hypotheses as follows:

- `T0`, centered at `O`, supplies `OA=OB`, `OS=OA`, and `OQ=OA`;
- `K1`, centered at `B=c1`, supplies `BA=BO` and `BS=BO`;
- `K2`, centered at `Q=c2`, supplies `QO=QA`.

The source-distinct groups checked at
`census/card_head/exactfive_hard_source_swap_grid.py:680-692` independently
supply `B != O`, `A != S`, and `B != Q` under these aliases: the first two
row groups separate `c1` from `O`, `a` from both `p` and `s`, and the center
group separates `c1` from `c2`. Thus this step does not infer inequality merely
from different generated class labels. The new theorem consumes no rank,
order, or signed-area hypothesis. It therefore removes the two authenticated
cyclic orders from this conditional profile's Euclidean contradiction.

### C5. Source-boundary labels: certified

The plan states at lines 27--29 that the broad source packet does not supply
`p=s` or `c2=q`, and at lines 34--37 denies live-branch coverage, a Lean proof
of alias-profile exhaustiveness, transfer to other survivors, and endpoint
closure. Those restrictions are necessary and accurate.

A source search found the new declaration names only in their defining module,
and found no module importing `EquilateralThreeFanCollision`. There is no live
adapter, aggregate import, publish-spine edge, or Lean-ingress binding for this
checkpoint. Accordingly, the certified result is a standalone conditional
geometry theorem, not a consumer-reachable closure result.

## Validation evidence

- No Lean build was active before the focused checks.
- `lake env lean Erdos9796Proof/P97/Census554/EquilateralThreeFanCollision.lean`:
  exit 0 in 12.78 seconds with no diagnostics.
- A second full source elaboration with `#print axioms` appended through stdin:
  exit 0 in 13.52 seconds.
- Each of
  `normalized_threeFan_signedArea2_eq_zero_of_distinct`,
  `threeFan_signedArea2_eq_zero_of_distinct`, and
  `threeFan_false_of_signedArea2_ne_zero` depends only on `propext`,
  `Classical.choice`, and `Quot.sound`.
- The source scan found no `sorry`, `sorryAx`, named `axiom`, `native_decide`,
  native-reduction primitive, `unsafe`, `implemented_by`, `extern`, or
  `partial`; no source line exceeds 100 characters.

No aggregate build or publish verification was run. Such a run would not make
this currently unimported module consumer-reachable; wiring and the missing
live alias antecedents must come first.
