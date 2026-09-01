# Rigid221 S0 faithful named-subset escape

**Lane:** `rigid221-s0-coupled-two-row-residue-lantern-20260831`

**Base HEAD:** `15a7e2d1d9c0`
**Status:** source-faithful residual only; no Lean construction or
contradiction claim

## 1. Smallest named seed and its cardinality envelope

Write

```text
C  := SelectedClass D.A O rho,                  |C| = 5
Q  := a selected four-subset of C,               |Q| = 4
Ku := support of the named exact row at cu,      |Ku| = 4
Kv := support of the named exact row at cv,      |Kv| = 4
Kd := support of the named exact row at cdelta,  |Kd| = 4
F1 := support of the named exact row at c1,      |F1| = 4
Z  := {cu, cv, cdelta, c1}
B  := Q ∪ Ku ∪ Kv ∪ Kd ∪ F1 ∪ Z.
```

Here `Q` is required instead of the complete physical five-class `C`: a
`SelectedFourClass` always has support-cardinality four. The current S0-I
packet authenticates the distinct-role identity
`C={u,xu,delta,v,xv}`. The source-natural choice is therefore
`Q=C\{delta}`; if this residual is detached from that authenticated packet,
only an arbitrary four-subset is justified and the generic bounds below weaken
from `20` to `21` and from `15-s` to `16-s`.

The support information supplied by S0 is
`Ku ∩ C = {u,xu}`, `Kv ∩ C = {v,xv}`, and `delta ∉ Ku ∪ Kv`.  Put
`s := |Ku ∩ Kv|`; then `0 ≤ s ≤ 2`, since each row has only two points
outside `C`.  If `e := 1` when `delta ∈ Q` and `e := 0` otherwise, and

```text
d := |Kd \ (Q ∪ Ku ∪ Kv)|,
f := |F1 \ (Q ∪ Ku ∪ Kv ∪ Kd)|,
m := |Z \ (Q ∪ Ku ∪ Kv ∪ Kd ∪ F1)|,
```

then the sharp parameterized envelope is

```text
|Q ∪ Ku ∪ Kv| ≤ 8 - s + e,
|B| = 8 - s + e + d + f + m,
d ≤ 4 - e,  f ≤ 4,  m ≤ |Z| ≤ 4.
```

Thus the raw uniform source-derived envelope is `|B| ≤ 20` (attained only
when all available off-row and center contributions are fresh).  If
`c1 = cv` or `c1 = cdelta` (the requested `oppApex1` aliases), a compatible
faithful pattern requires `F1` to equal the row at that same center, hence
`f = 0` and `|Z| ≤ 3`; the compatible envelope is then `|B| ≤ 15 - s`.
If the aliased rows are not equal, the raw union still has the looser bound
`≤19`, but no faithful pattern can preserve both prescriptions.  Further
center aliases or row overlaps are represented by the parameters above; no
stronger numerical bound follows without their explicit fields.  Choosing
`Q = C \ {delta}` does not lower the worst-case generic final bound: it
removes `delta` before `Kd`, which then contributes one extra point.

The row-only seed

```text
Brow := Q ∪ Ku ∪ Kv ∪ Kd ∪ F1
```

is the smallest seed containing all five named row supports. Use `B` when
the escaped point must be fresh from both named rows and named centers; use
`Brow` when the escaped center must be a named support point.  The current
source API does not guarantee both properties simultaneously: escape from
`B` gives a center in `B` but it may be a named center, while escape from
`Brow` gives a named support center but the escaped point may equal a named
center.

## 2. Faithful-carrier compatibility

`FaithfulCarrierPattern` is declared at
`lean/Erdos9796Proof/P97/U1CarrierInjection.lean:1492-1503`:

```text
classAt : ∀ center, center ∈ A → SelectedFourClass A center
```

It stores exactly one selected four-class per center, not a complete
five-class and not a `CriticalShellSystem`.

`exists_faithfulCarrierPattern_with_classes_on`,
`U1CarrierInjection.lean:1731-1758`, preserves prescribed classes on any
finite nonempty `V ⊆ A` and fills all other centers from global K4.  It can
preserve `Q`, `Ku.toSelectedFourClass`, `Kv.toSelectedFourClass`,
`Kd.toSelectedFourClass`, and `F1.toSelectedFourClass` only after grouping
aliases by center.  If two prescribed rows have the same center, their
`SelectedFourClass` values must be equal; otherwise no `classAt` can satisfy
both prescriptions.  In particular:

* if `oppApex1 = cv`, preserving both F1 and Kv requires `F1 = Kv` as
  selected classes (or an independently proved support equality);
* if `oppApex1 = cdelta`, preserving both F1 and Kdelta requires the
  analogous equality.

The two-row adapter
`exists_faithfulCarrierPattern_with_exact_and_critical`,
`U1CarrierInjection.lean:1844-1867`, explicitly requires distinct centers;
it does not resolve these aliases.  The five-row adapter in
`FiveCenterDeletionBoundary.lean:217-280` has the same one-row-per-center
limitation.

## 3. Proper-subset escape and the honest residual

All supports and centers in `B` are subsets of `D.A` when the named rows are
typed `CriticalSelectedFourClass` values (`center_mem` supplies center
membership).  Therefore, if `B.Nonempty`, `B ⊆ D.A`, and `B ≠ D.A`, the exact
source theorem

```text
FaithfulCarrierPattern.exists_row_escape_of_proper_subset
  (U1CarrierInjection.lean:1563-1568)
```

gives, for a faithful pattern `P`,

```text
∃ a ∈ B, ∃ z,
  z ∈ (P.classAt a ...).support ∧ z ∉ B.
```

The quantifier-normalized form
`exists_center_all_selectedFourClass_escape_of_proper_subset`,
`U1CarrierInjection.lean:1767-1793`, removes the prior choice of `P` but
still gives only `a ∈ B`.  If `B = D.A`, there is no escape conclusion.  The
equality theorem `eq_carrier_of_nonempty_closed`, `:1538-1559`, says exactly
that a nonempty subset closed under all selected rows is the whole carrier;
named-row closure is not enough to invoke it.

For the frozen packet, retain only:

```text
a ∈ B,
z ∉ B,
z ∈ Ka.support,
Ka : SelectedFourClass D.A a,
```

where `Ka` is the actual selected class supplied by the escape witness.  If
the stronger `a ∈ Brow` branch is separately recorded, then `a` is a named
support point.  Without that branch, `a` may be one of the named centers.
The source does not force `a ≠ O`, `a ≠ cu`, `a ≠ cv`, `a ≠ cdelta`, or
`a ≠ c1` when those points lie in `B`; such exclusions must not be added.
Likewise, the remaining support point `z` has no forced location beyond
`z ∉ B`: it is neither a guessed cross-incidence nor a certified member of
any named row.  With the full `B`, it is authenticated outside all named
rows and centers.

At `a`, global K4 gives a selected four-point class directly:

```text
exists_selectedFourClass_of_globalK4
  (U1CarrierInjection.lean:1439-1472)
  (D.K4) (ha : a ∈ D.A) : Nonempty (SelectedFourClass D.A a).
```

This supplies support inclusion, cardinality four, positive radius, and
`a ∉ Ka.support`.  It does not identify `Ka` with `Ku`, `Kv`, `Kd`, `F1`, or
`Q`, and it does not provide an H-blocker at center `a`.

## 4. Missing source fields and import boundary

`CriticalShellSystem` and its dependent projections are
`U1CarrierInjection.lean:1116-1147`; each source has a carrier subtype,
one chosen blocker center, one complete critical shell, and `no_qfree`.
The support-member override (`:1356-1391`) needs a typed critical shell and
explicit deletion blocking.  The named rows can be overridden uniformly at
`cu` only after deriving universal memberwise blocking from
`exists_criticalSelectedFourClass_of_mem_of_not_fullyDeletionRobust`,
`MinimalUniqueFourCover.lean:380-388`.

For the new row centered at `a`, the first missing H-level antecedent is

```text
∃ q ∈ Ka.support,
  ¬ HasNEquidistantPointsAt 4 (D.A.erase q) a.
```

Given this blocking fact, `criticalSelectedFourClass_at_of_no_qfree`,
`CriticalPairFrontier.lean:108-125`, uses global K4 to build the exact critical
shell through `q`; `overrideAt` can then insert it into `H`. Without blocking,
the selected class supplied by the faithful pattern need not be the complete
radius class and cannot be passed to
`CriticalSelectedFourClass.exists_of_exactSelectedClass`. No pre-Rigid theorem
turns the escape point or a physical five-class into this nonrobustness.

The declarations above are ordinary pre-Rigid Lean imports and have no
solver trust extension.  Later `OriginalUniqueFourResidual`, robust-surface,
joint-deletion, and SourceHeavy consumers add total packet hypotheses and
cannot be inferred from this named subset.  The only trusted finite
completion is `exists_faithfulCarrierPattern_with_classes_on`; it is a
`SelectedFourClass` pattern, not a total all-source critical system.

## S0-FAITHFUL-ESCAPE freeze

The smallest honest frozen artifact is therefore:

1. choose a compatible four-subset `Q ⊂ C` (source-natural `C \ {delta}`
   when the deletion role is authenticated);
2. normalize legal center aliases and preserve only compatible prescribed
   classes via `exists_faithfulCarrierPattern_with_classes_on`;
3. if `B ≠ D.A`, record the exact escape `a ∈ B`, `z ∉ B`; and
4. retain `Ka` and its exact four-point geometry, with the stronger
   “named support point” label only when `a ∈ Brow` is explicitly supplied.

The numerical seed bound is the parameterized envelope in §1: raw `|B| ≤20`,
and compatible `|B| ≤15-s` when `oppApex1=cv` or `oppApex1=cδ` forces the F1
row to duplicate the aliased row.  No guessed incidence, center equality,
or properness of `B` is part of the freeze.
