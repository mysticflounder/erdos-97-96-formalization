# Card-four parent common-system boundary

Date: 2026-07-14

## Verdict

The parent caller retains the common critical system only before entering the
current live leaf. In `u1_largeCap_routeB_tail_false`, `Hcritical` constructs
both

```text
Hdepth5Rows := CriticalSourceRows.ofCriticalShellSystem Hcritical ...
Hf2CriticalRow := CriticalRowPacket.ofCriticalShellSystem Hcritical ...
```

The call to `u1_largeCap_routeB_tail_liveData_false` then passes
`Nonempty Hcritical`, `Hdepth5Rows`, and `Hf2CriticalRow` as separate values.
The signatures of `false_of_center_p_t2_t20` and the weakened
`DoubleApexOffSurplusSharedRadiusPair` no longer state that the rows were
constructed from that same system. A producer using common provenance must
therefore be called before this information is erased, or the leaf interface
must retain `Hcritical` and the constructor equalities explicitly.

Common provenance by itself still does not close the card-four branch. The
card-four polarity proves that deleting either selected source blocks K4 at
`oppApex1`; `CriticalShellSystem.overrideAt` can consequently choose that apex
as the blocker for either source. Thus it is false that the chosen blocker is
automatically a second center.

This selector dependence is now checked rather than heuristic.
`not_forall_centerAt_ne_of_certified_blocker` proves that whenever one
certified blocker shell exists, pointwise override constructs a valid system
which chooses that center. Therefore unchanged ambient geometry cannot imply
that every arbitrary `H.centerAt` avoids a valid apex blocker.

## Checked terminal interface

`card_four_parent_boundary.lean` now distinguishes two interfaces.
`SurplusBlockerPairFields` asks for one source in a supplied system whose
chosen center

1. lies in the surplus cap;
2. differs from the prescribed apex; and
3. has an exact critical support containing both chosen off-surplus points.

The corrected choice-invariant interface
`ExistsSurplusPairCriticalBlocker` asks instead for existence of any center,
exact critical shell, and deletion-blocker certificate with those fields. It
does not refer to a preselected system. The checked theorem
`existsSurplusPairCriticalBlocker_of_systemFields` maps every favorable chosen
row to the invariant packet; no converse for an arbitrary selector is
asserted.

The theorems `false_of_surplusBlockerPairFields`, the exact first-apex
specialization `false_of_oppApex1_surplusBlockerPairFields`, and the direct
choice-invariant consumer `false_of_existsSurplusPairCriticalBlocker` are
checked. The critical shell
makes its center equidistant from the pair; the prescribed apex already has
the same property. Both centers lie in the ordered surplus cap while both
pair points lie outside it, so
`CapSelectedRowCounting.outsidePair_unique_capCenter` gives `False`.

The direct single-file validation exited successfully. Its printed axiom
closure is exactly

```text
propext, Classical.choice, Quot.sound
```

with no `sorryAx` or custom axiom. Source SHA-256:
`edac98e6bc346b6725b62d1fd4b91bc3848a1d623f178b47951a7624e8fe8121`.

## Minimal exact finite falsifier

`card_four_parent_boundary_falsifier.py` gives a seven-vertex exact incidence
model. Seven is minimal for this interface: a strict surplus cap needs at
least five points and the pair consists of two distinct points outside it.
The model has:

- a five-point surplus cap containing the apex;
- one exact four-point support at every center;
- source incidence in every chosen blocker shell;
- a four-point apex support containing the selected outside pair; and
- no non-apex surplus-cap center whose support contains both pair points.

The exact checker passes. This is not a Euclidean, convex, cap-order, or MEC
model, so it does not refute a genuinely geometric producer. It proves that
incidence, exact-four cardinality, and same-system provenance alone cannot
produce the terminal field packet. Source SHA-256:
`6507b638a12578e75009fca97642e86fc96ce7eaf3a48ec23340715031dc58c6`.

## First genuinely geometric input

The first new theorem must couple the critical-blocker relation to the ordered
MEC cap. Its correct conclusion is `ExistsSurplusPairCriticalBlocker`, not a
claim about an arbitrary `H.centerAt`. A source-specialized variant may return
either the `q` shell or the `w` shell, but it must still prove all three
independent facts: non-apex separation, surplus-cap localization, and the
cross-membership of the other source.

Generic cap bounds start only after localization: a shell centered in a cap
has at least two support points outside it, but they need not be the selected
pair. Generic blocker-image counts force several centers but do not place one
in the surplus cap. Neither result supplies the required coupling.

There is currently no caller which simultaneously has the extracted Stage-I
pair and the still-unbundled constructor provenance. The outer wrapper has
`Hcritical` before it constructs `Hdepth5Rows`, but the pair is produced only
inside the later Stage-I reduction. The earliest sound construction point for
a favorable selector is therefore immediately after a new choice-invariant
producer returns its critical-shell witness: override the retained base system
there, then construct or rebuild dependent rows. Choosing a favorable system
earlier is impossible because the pair and its geometric witness do not yet
exist.
