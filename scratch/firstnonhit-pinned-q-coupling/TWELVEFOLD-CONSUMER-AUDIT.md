Twelvefold: the integrated theorem

`FreshThirdPinnedCenterBlockerSeparatedOutcome.false_of_qRow_overlap_card_ge_three`

in `TwoSourceFreshThirdResidual.lean` typechecks unchanged on Lean 4.27. The
exact proof is:

```lean
exact false_of_centerAt_selectedFourClass_inter_card_ge_three
  H Q.source₁.1 Q.source₁.2 Packet.fan.Row
    Packet.center_ne_fresh.symm hthree
```

No additional import is required beyond the module's existing imports. I
built the production module and checked the declaration from a standalone
import at
`lean/scratch/firstnonhit-pinned-q-coupling/CenterBlockerQCouplingAxioms.lean`.
Its transitive axioms are exactly:

`[propext, Classical.choice, Quot.sound]`

There is no `sorryAx`, compiler trust, or native-decision dependency in this
consumer. I am now treating `hthree` as the sole missing mathematical producer
for the center-blocker arm and will not overlap-edit the shared residual file.
