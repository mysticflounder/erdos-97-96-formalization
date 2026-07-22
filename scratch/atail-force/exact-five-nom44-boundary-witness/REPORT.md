# Exact-five alternative-`M44` boundary audit

Date: 2026-07-21

Status: **PACKET ASSEMBLY PROVEN; SOURCE-LEVEL OCCURRENCE OPEN.** No source
`sorry` is closed here.

`ExactFiveM44BoundaryWitness.lean` proves that three pairwise-distinct carrier
points on the MEC boundary, the three nonobtuse inner-product inequalities,
and two exact four-point `OnArcOpposite` filters construct a complete
`SurplusCapPacket T` with `T.IsM44`. It uses the full cap partition and the
existing production theorem
`isM44Packet_of_capTriple_two_exact_of_card_gt_nine`; it is not a partial
packet adapter.

The exact-five star and asymmetric normal form do not produce the occurrence
hypotheses:

- the named outside points need not lie on the MEC boundary;
- splitting the exact-five cap can create at most one four-point subcap;
- a one-vertex split of another cap gives two four-point subcaps only from an
  exact-seven cap split `4+4`; and
- the new triple must still be nonobtuse.

Thus the first missing source-level implication on this route is a
MEC-boundary nonobtuse triple with two exact four-point arcs, derived from the
full exact-five parent and global-cover star. Once that occurrence is proved,
the checked theorem below and `R.noM44` give `False` immediately.

Validate from `lean/` with:

```bash
lake env lean -M 16384 -DwarningAsError=true -R .. \
  ../scratch/atail-force/exact-five-nom44-boundary-witness/ExactFiveM44BoundaryWitness.lean
```

The theorem has only `propext`, `Classical.choice`, and `Quot.sound`; no
`sorryAx`. Keep it in scratch until the boundary occurrence is available,
because production already contains the substantive packet constructor.
