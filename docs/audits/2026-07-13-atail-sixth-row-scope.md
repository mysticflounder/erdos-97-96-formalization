# ATAIL-FORCE sixth-row theorem-surface audit — 2026-07-13

## Verdict

The card-at-least-12 pair residual and the liveData residual do **not** expose
the same critical-row interface.

- `DoubleApexOffSurplusSharedRadiusPair` receives the five rows packaged by
  `CriticalSourceRows`: the rows sourced at `q`, `t1`, `t2`, `t3`, and `u`.
- `u1_largeCap_routeB_tail_liveData_false` receives those five rows **plus** a
  sixth row sourced at `f2 := t2[0]`, and two explicit maps certifying how that
  sixth row agrees with a named source row when `f2` equals that source.

Consequently a theorem that genuinely consumes the six-row live surface cannot
be stated as a proof from the current pair residual's hypotheses without first
widening that residual or bypassing it at the liveData theorem. The pair theorem
remains a legitimate narrower residual, but it must not be described as already
carrying the six critical rows.

## Source replay

### Five-row packet

`U1Depth5.CriticalSourceRows` in
`lean/Erdos9796Proof/P97/U1Depth5Prefix.lean` has exactly five fields:

```text
qRow, t1Row, t2Row, t3Row, uRow
```

The type contains no field naming a common `CriticalShellSystem`. Its five
`CriticalRowPacket` values can therefore be passed abstractly without proof
that they were selected by one common global system.

### Sixth live row and provenance

`u1_largeCap_routeB_tail_liveData_false` in
`lean/Erdos9796Proof/P97/U1LargeCapRouteBTail.lean` additionally takes:

```text
f2CriticalRow : CriticalRowPacket D (rows.pointOfChoice {source := t2, slot := 0})
hf2Center_eq_rowAt_center
hf2Selected_l1_eq_rowAt_l1
```

The outer wrapper constructs the five rows and `f2CriticalRow` from the same
`Hcritical : CriticalShellSystem D.A`, then proves both comparison maps by
unfolding that shared construction. These are real extra antecedents, not
convenience aliases derivable from an arbitrary `CriticalSourceRows` value.

The source comment on `U1LargeCapRouteBTailLiveData` already states the intended
boundary: the depth-5 five-row surface does not force the metric residual on the
no-collision cell; a closing producer must add a sixth critical row, `(Q)_C5`,
equivalent incidence content, or a complete branch split.

### Current pair residual omits the extra surface

`DoubleApexOffSurplusSharedRadiusPair` takes `rows`, `hcritical`, the dangerous
`p`-centered `t2` row equalities `hcenter`/`hsupport`, and the remaining cap and
live U5 fields. It does not take `f2CriticalRow` or either same-system map.
`hcritical : Nonempty (CriticalShellSystem D.A)` can choose a new row at `f2`,
but does not relate the already-supplied abstract five rows to that chosen
system.

The proved adapter `false_of_center_p_t2_t20` illustrates the exact specialized
use. Under `t2 = t2[0]`, it uses `f2CriticalRow` and
`hf2Center_eq_rowAt_center` to recover the pair theorem's `t2`-row center and
support hypotheses, and only then calls the pair residual. This does not turn
the pair residual itself into a six-row theorem.

## Computational-surface consequence

The completed `census/atail_force/` three-center surface couples selected-four
classes at the three Moser vertices. It includes none of:

- the dangerous exact four-class centered at `p`;
- the sixth critical row centered at the blocker chosen for `f2 = t2[0]`;
- the two same-critical-system provenance maps; or
- the full exact-radius filters required by the shared-radius conclusion.

The Q3 negative result, the 343/343 equality witnesses, and both seven-case
solver timeout pilots are therefore diagnostics below the live theorem
surface. Their failure does not test the missing sixth-row mechanism.

## Closure-grade routes

There are two honest next theorem shapes.

1. **Pair-surface route.** Prove the current five-row
   `DoubleApexOffSurplusSharedRadiusPair` from exactly its existing hypotheses.
   This closes its specialized consumer but cannot appeal to sixth-row
   provenance that is absent from the statement.
2. **Live six-row route.** State a producer or direct contradiction inside
   `u1_largeCap_routeB_tail_liveData_false` that explicitly consumes
   `f2CriticalRow` and the comparison maps. It may produce the joint-fiber
   lower bound, the seven-equality obstruction, or `False` directly. If it is
   intended to replace the pair route, widen and thread the theorem interface
   through an immediate on-spine consumer in the same change.

No new off-spine placeholder, assumption, or `sorry` is authorized by this
audit. The pair declaration is currently anchored by another session, so this
lane made no Lean source edit.

## Next bounded research target

Before any further nonlinear run, encode or prove the smallest statement that
uses the sixth row **as a row**: source membership, exact four-point support,
blocker-center inequality, and same-system comparison in the collision cases.
Only after that field-by-field extraction should cap order, full filters, or a
solver be added. A surface that again forgets the sixth row repeats the already
closed negative diagnostics.
