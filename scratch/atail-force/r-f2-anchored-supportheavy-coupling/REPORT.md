# Anchored F2 support-heavy coupling

## Scope

This scratch lane combines:

- `AnchoredProvenanceF2NormalForm`;
- the support-heavy reduction;
- `F2SupportHeavyReduction.deleted_mem_strictOppCap1`; and
- `NamedF2SupportHeavyWitnesses`.

It owns only:

```text
scratch/atail-force/r-f2-anchored-supportheavy-coupling/
```

No production file, closure document, protected file, other scratch lane, or
proof-blueprint state was changed.

## Theorem-bank preflight

Before formalizing the coupling, I checked:

- `docs/general-n-certificate-bank-mining-2026-07-09.md`;
- `certificates/p97_rvol_general_n_mining.{md,json}`;
- `certificates/erdos97_legacy_general_n_mining.{md,json}`;
- `certificates/erdos_general_theorem_p97_mining.{md,json}`; and
- focused `nthdegree docs search --lean` queries for the anchored
  support-heavy role map, an off-fixed strict-`oppCap2` shell point, and a
  strict-`oppCap1` center separating a second-apex pair.

No banked theorem directly consumes the full role map. The exact reusable
local sinks are:

- `firstCap_center_separates_secondApex_pair`;
- `false_of_common_terminalMarginal_rowPoint`;
- `false_of_secondApexMarginal_hit_on_sourceCircle`;
- `false_of_aligned_secondApexMarginal_hit_in_dangerousBase`;
- `false_of_threeCommonCriticalRowPoints`;
- `false_of_strictOppCap2_row_contains_firstApex_strict_pair`; and
- `BothQCriticalCase.false_of_adjacentBankAntecedents`.

The last six require fields not supplied by the anchored support-heavy
packet. The first applies directly and yields a strict metric inequality.

## Exact support-heavy placement

Let:

```text
C := alignedSharedRowPacket X hcenter
```

and let `s,t` be the two named support-heavy witnesses. The imported
support-heavy data gives:

```text
s,t ∈ C.B₂
s,t ∈ deletedCriticalSupport C
s,t ∈ strictSecondCap S
s ≠ t.
```

The imported deleted-cap theorem, together with the anchored off-surplus
field for `X.point`, gives:

```text
X.point ∈ S.oppCap1 \ (S.surplusCap ∪ S.oppCap2)
X.point ∉ S.oppCap2.
```

Thus the current common-deletion source is strict `oppCap1`, while the two
support-heavy points are strict `oppCap2`.

## At most one fixed support-heavy point

`namedSupportHeavy_inter_fixedClass_card_le_one` proves:

```text
card ({s,t} ∩ SelectedClass D.A S.oppApex1 radius) ≤ 1.
```

The proof uses the anchored theorem:

```text
card (((SelectedClass D.A S.oppApex1 radius \ S.surplusCap) ∩ C.B₂)) ≤ 1.
```

Both named points are off-surplus because they lie in `strictSecondCap S`,
and both lie in `C.B₂`. Therefore any fixed-class membership for either point
lands in the bounded marginal intersection.

`NamedOffFixedSupportHeavyPoint` names one of `s,t`, called `z`, with:

```text
z = s or z = t
z ∈ supportOnlyCell C.B₂ live (deletedCriticalSupport C)
z ∈ C.B₂
z ∈ deletedCriticalSupport C
z ∈ strictSecondCap S
z ∈ D.A
z ∈ (deletedCriticalSupport C).erase X.point
z ∉ live
z ∉ C.B₁
z ∉ SelectedClass D.A S.oppApex1 radius.
```

Because `SelectedClass` is the full ambient radius class, the last two
ambient facts legitimately imply:

```text
dist S.oppApex1 z ≠ radius
dist S.oppApex1 z ≠ dist S.oppApex1 X.point.
```

This inequality does **not** come from selected-support nonmembership.

The point is also excluded from the terminal fixed class:

```text
z ∉ SelectedClass T.carrier S.oppApex1 radius.
```

## Exact metric fan

`AnchoredSupportHeavyCoupling` packages three center relations for `s,t`.

The retained second-apex row gives:

```text
dist S.oppApex2 s = dist S.oppApex2 t.
```

Membership in the fresh source's actual selected critical shell gives:

```text
dist (W.H.centerAt X.point C.q_mem_A) s =
  dist (W.H.centerAt X.point C.q_mem_A) t.
```

But strict cap order applies to the strict-`oppCap1` point `X.point` and the
strict-`oppCap2` pair `s,t`, giving:

```text
dist X.point s ≠ dist X.point t.
```

This is the strongest direct current consumer match. It is a separation
theorem, not a contradiction.

## Consumer audit

### Cap-order sink

`firstCap_center_separates_secondApex_pair` applies exactly and proves the
deleted-source separation above.

The smallest additional field that would close the arm is:

```text
dist X.point s = dist X.point t.
```

`AnchoredSupportHeavyCoupling.false_of_deletedSource_equidistant` is the
kernel-checked conditional contradiction.

The structural strengthening:

```text
∃ Q : SelectedFourClass D.A X.point,
  s ∈ Q.support ∧ t ∈ Q.support
```

also closes, because such a row supplies the forbidden equality.
`false_of_deletedSourceRow_contains_pair` checks that adapter.

No current source produces either field.

### Terminal three-point consumers

The off-fixed point cannot instantiate
`false_of_common_terminalMarginal_rowPoint` or
`false_of_secondApexMarginal_hit_on_sourceCircle`:

- it is not in the terminal fixed class; and
- it is outside the first/live row.

The other support-heavy point might be fixed, but it too is support-only and
therefore outside the first/live row. Hence neither named support-heavy point
is a common first-row/second-row marginal hit.

### Anchored critical-row consumer

`false_of_threeCommonCriticalRowPoints` concerns the intersection of:

```text
the selected critical row at R.deleted
R.sourceRow.
```

The support-heavy points instead lie in the selected critical row at the new
source `X.point`, and both are outside `R.sourceRow`. No required
three-point intersection is produced.

### Strict-pair row consumer

`false_of_strictOppCap2_row_contains_firstApex_strict_pair` would require a
selected row centered at `s` or `t` containing two prescribed strict
first-apex points. The current global-K4 split selects rows at `s,t`, but
does not prescribe those two support incidences.

### Both-q-critical bank consumer

The anchored coupling does not supply any of the three fields still required
by `BothQCriticalCase.false_of_adjacentBankAntecedents`:

```text
actual blocker ∈ generated support at s
actual blocker ∈ generated support at t
t ∈ generated support at s or s ∈ generated support at t.
```

The off-fixed first-apex status of one witness does not imply any of these
incidences.

## Epistemic status

Proven:

- the current deleted source `X.point` is strict `oppCap1`;
- the two support-heavy witnesses are distinct strict-`oppCap2` points in
  the retained second row and in `X.point`'s actual critical shell;
- at most one witness belongs to the fixed first-apex class;
- a named off-fixed witness with every exact row/shell/cap membership;
- a valid first-apex radius inequality for that off-fixed witness;
- equality of the pair at the second apex and at the actual blocker; and
- inequality of the pair at `X.point`.

Not proven:

- unconditional `False`;
- an `X.point`-centered selected row containing both witnesses;
- equality of their distances from `X.point`;
- a terminal fixed-marginal common-row hit;
- the cross-incidences required by the strict-pair row consumer; or
- the three remaining both-q-critical bank incidences.

Accordingly, this lane does not close a production `sorry`.

The exact smallest next producer field for this role map is:

```text
dist X.point s = dist X.point t.
```

Equivalently, a stronger row-form producer may supply a selected four-class
centered at `X.point` containing both named support-heavy witnesses.

## Validation

The authoritative project toolchain is:

```text
leanprover/lean4:v4.27.0
```

The bounded direct check was:

```bash
cd lean
env LEAN_PATH="/private/tmp/p97-r-f2-anchored-provenance-lift-oleans:/private/tmp/p97-r-f2-supportheavy-deleted-cap-oleans:/private/tmp/p97-r-f2-supportheavy-k4-split-oleans:/private/tmp/p97-r-f2-strict-cell-normal-form-oleans:/private/tmp/p97-r-f2-three-row-chain-oleans:/private/tmp/p97-r-f2-supportheavy-reduction-oleans:/private/tmp/p97-r-f2-liveheavy-placement-oleans:/private/tmp/p97-r-two-off-live-oleans:/private/tmp/p97-r-orbit-entry-oleans:/private/tmp/p97-r-live-common-deletion-oleans:/private/tmp/p97-joint-transition-oleans:/private/tmp/p97-r-failure-parent-lift-oleans:$(lake env printenv LEAN_PATH)" \
  lake env lean -R .. -M 16384 \
  -o /private/tmp/p97-r-f2-anchored-supportheavy-coupling-oleans/AnchoredSupportHeavyCoupling.olean \
  ../scratch/atail-force/r-f2-anchored-supportheavy-coupling/AnchoredSupportHeavyCoupling.lean
```

It exited successfully. Every printed theorem depends only on:

```text
propext
Classical.choice
Quot.sound
```

None depends on `sorryAx`. No full build was run.
