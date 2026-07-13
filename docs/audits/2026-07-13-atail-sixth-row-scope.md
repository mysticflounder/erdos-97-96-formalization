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

## Kernel-checked sixth-row normalization

The two live comparison maps are stronger than their one-field presentation
initially suggests. Two exact `CriticalRowPacket`s with the same center and the
same selected `l1` have equal radii, since both radii are the distance from
that center to `l1`. Their `CriticalFourShell.support_eq` fields then identify
both supports with the same full radius filter in `D.A`.

The scratch theorem
`CriticalRowPacket.support_eq_of_center_eq_l1` proves this directly, and
`CriticalSourceRows.f2_support_eq_rowAt_of_source_eq` applies it to the two
live comparison maps. Hence every collision

```text
f2 = rows.sourcePoint source
```

identifies the **entire** sixth-row exact support with
`(rows.rowAt source).selected.toCriticalFourShell.support`, not only the two
centers and first labels. The scratch module builds with no `sorry`:

```text
scratch/atail-force/critical_row_coupling.lean
```

This normalization does not close the surviving T1/T3 cells: the common
four-point support can still be presented by different slot permutations.
The cap/two-center producer remains load-bearing. It does, however, rule out
re-enumerating full-shell membership as if the live maps exposed only one
label.

## Dangerous-triple relabeling consequence

The T1 and T3 collision families are not independent residuals after the full
support transfer. `U3FixedTriplePacket`, `CriticalSourceRows`, and
`U1LargeCapRouteBTailLiveData` all transport under a permutation of the three
dangerous labels because the live dangerous set is the finite set
`{t1,t2,t3}`.

The second scratch certificate constructs and checks both adapters:

```text
scratch/atail-force/triple_relabel_adapters.lean
```

- Under `f2 = t1`, relabel `(t1,t2,t3)` as `(t2,t1,t3)`. The transferred old
  `t1Row` is now the existing pair consumer's `t2Row`.
- Under `f2 = t3`, relabel as `(t1,t3,t2)`. The transferred old `t3Row` is now
  that `t2Row`.

Both theorems compile and consume the existing
`false_of_largeCap_pCentered_t2Source_exactDangerousRow`. Consequently the 24
LIVE-T1 and 24 LIVE-T3 textual holes can be replaced by two orbit adapters and
the single K-A-PAIR dependency. This is a dependency reduction, not a closure
claim: the adapters intentionally inherit `sorryAx` from K-A-PAIR until its
shared-radius producer is proved. LIVE-Q and the seven LIVE-C branches do not
follow from this relabeling.

This session is now anchored at LIVE-T1. The ATAIL producer lane leaves the
shared Route-B parent, owned by another live session, untouched; the scratch
relabel adapter is only a checked dependency certificate until that parent can
consume it without an ownership collision.

The seven LIVE-C helper contracts received a separate direct audit. The
generic `CriticalRowPacket.center_ne_source` contradiction requires equality
between the blocker center and the extra row source `t2[0]`, but none of those
contracts contains that equality. They likewise do not expose the p-centered
exact-dangerous `t2Row` center/support pair required by K-A-PAIR. The indexed
theorem-bank search returned the already-used `center = p` consumers, not a
whole-family LIVE-C adapter. Therefore LIVE-C remains independently open; this
is a negative contract audit, not a nonexistence theorem.

## Computational-surface consequence

The completed `census/atail_force/` three-center surface couples selected-four
classes at the three Moser vertices. It includes none of:

- the dangerous exact four-class centered at `p`;
- the sixth critical row centered at the blocker chosen for `f2 = t2[0]`;
- the two same-critical-system provenance maps; or
- the full exact-radius filters required by the shared-radius conclusion.

The Q3 negative result, the 343/343 equality witnesses, the separator pilot,
and both Z3/cvc5 seven-case full-inequality timeout pilots are therefore
diagnostics below the live theorem surface. Their failure does not test the
missing sixth-row mechanism.

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
lane made no shared Lean source edit. The checked theorem remains in the
unimported scratch certificate until an owner can wire it into an immediate
on-spine consumer.

## Next bounded research target

Before any further nonlinear run, encode or prove the smallest statement that
uses the sixth row **as a row**: source membership, exact four-point support,
blocker-center inequality, and same-system comparison in the collision cases.
Only after that field-by-field extraction should cap order, full filters, or a
solver be added. A surface that again forgets the sixth row repeats the already
closed negative diagnostics.
