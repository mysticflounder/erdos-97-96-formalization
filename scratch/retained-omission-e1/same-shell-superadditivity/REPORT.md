# Same-shell squared-distance superadditivity audit

## Result

The sound reusable statement is now proved in
`lean/Erdos9796Proof/P97/SameShellSuperadditivity.lean`.

The minimal theorem is

```lean
Problem97.dist_sq_gt_add_of_same_shell_opposite_sides
```

It assumes three points `x,y,z` are on one shell centered at `p` and that
`p` and `y` lie on strict opposite sides of the chord `xz`.  It concludes

```lean
dist x z ^ 2 > dist x y ^ 2 + dist y z ^ 2
```

The ordered-cap specialization is

```lean
Problem97.CGN.sameShell_sqDist_superadditive_of_strictCapOrder
```

Here `i < j < k`, all three indexed cap points lie on one shell centered at a
carrier point `p`, and `p` is outside the indexed cap image.  `StrictCapOrder`
puts the middle point on the positive side of the outer chord; convex
independence makes the off-cap center strictly negative rather than merely
nonpositive.

Both declarations pass Lean LSP diagnostics and `lean_verify --scan-source`.
Their transitive axiom set is only `propext`, `Classical.choice`, and
`Quot.sound`; neither depends on `sorryAx` or compiler trust.

## Scope guard

Same radius and an arbitrary cyclic listing alone do **not** justify this
inequality.  The load-bearing condition is that the shell center and the
middle point are on opposite open sides of the outer chord.  In this project,
the ordered-cap/off-cap hypotheses are a checked way to obtain that condition.

## Existing-bank audit

No theorem with this exact conclusion was found in the current theorem-bank
registries, the indexed Lean corpora, the sibling `p97-rvol` bank, or the two
legacy P97 theorem inventories.  The proof reuses two existing low-level
ingredients instead of reproving geometry:

- `center_same_side_as_apex_of_nonobtuse` from `P97/CircumcenterSide.lean`;
- `StrictCapOrder.subchord_open_side_iff_A` from `P97/CGN/CGN.lean`.

## Applicability to the anchored E1 core

`SurplusCapPacket.capByIndex_cgn4g_capData_oriented` supplies ordered-cap data
for every `S.capByIndex i`, so the ordering interface is already available from
the core inputs; it is not a new geometric obligation.

The six-point branch of
`G.apex_rich i` has at least four same-radius points in
`S.capInteriorByIndex i`, via
`oppositeCapRichClassInteriorPattern_of_apexRichClassStructure`.  Therefore
that branch certainly contains an ordered triple to which the new theorem
applies.  The `4+4` branch guarantees only two interior points at each radius,
so it does not itself supply a same-shell triple.

This does **not** close
`false_of_retainedOmission_triApexAllLarge_core` by itself.  In the six-point
arm it banks one strict metric inequality, but the current normal form has no
second relation that contradicts it.  A closing consumer still needs one of:

1. a forced equality or reverse inequality involving the same three chord
   distances;
2. a cycle of same-shell inequalities across several apex or blocker shells;
3. a producer placing three ordered points of a blocker shell in one cap,
   together with an equality pattern that makes its inequality impossible.

The immediate computational use is sound: emit this inequality whenever a
CEGAR model assigns three points of one full shell in known strict cap order
with the shell center off that cap.  It is stronger than mere pairwise
distinct-distance constraints, but should be treated as an inequality cut,
not as a standalone contradiction rule.

## Import frontier

The new module imports only lower-level geometry/order modules:

- `P97.CircumcenterSide`
- `P97.ConvexIndepHelpers`
- `P97.Moser.NonDeg`
- `P97.CGN.CGN`

It does not import `ATail.FrontierLiveClosure`, `CapSelectedRowCounting`, or
any retained-omission module, so importing it later into an ATail consumer does
not create the apparent cycle.
