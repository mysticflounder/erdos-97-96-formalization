# Rigid221 S0 true-cap witnesses, wave 2

**Lane:** `rigid221-s0-coupled-two-row-residue-lantern-20260831`
**Arithmetic:** exact rational replay with no numerical tolerance

## L1 result

**EMPIRICALLY VERIFIED (finite exact replay).** There are exact rational
bare-L1 cap/two-row-core witnesses in both S0 branches. Their retained status
is `SAT_EXACT_L1_CAP_TWO_ROW_CORE`; this does not claim `CounterexampleData`, a
full S0 theorem witness, L2, L3, or a Lean proof.

The common physical data are

```text
O = (0,0), rho = 1,
delta = (105/137,-88/137),
v = (741/941,-580/941),
u = (325/397,-228/397),
MEC center = (137/210,0),
MEC radius^2 = 18769/44100.
```

For S0-I, the carrier has 13 roles, Moser labels
`(v1,v2,v3)=(delta,xv,O)`, and surplus index zero. Its exact cap-card profile
is `(5,4,7)` and

```text
J = {cu,cv,u,v,xu}.
```

Thus `xu in J`.

For S0-N, the carrier has 12 roles, Moser labels
`(v1,v2,v3)=(xu,delta,O)`, and surplus index zero. Its exact cap-card profile
is `(5,3,7)` and

```text
J = {cu,cv,u,v,xv}.
```

Here `xu` is an erased Moser endpoint, so `xu not in J`.

In both branches the exact verifier reconstructs:

- the complete carrier and cyclic strict-convexity inventory;
- the MEC enclosure, exact three-role boundary, and a positive barycentric
  minimality certificate;
- the three ordered non-obtuse dot products;
- every `OnArcOpposite` truth value and every `CapTriple` membership/count
  field;
- the surplus index, `oppIndex2`, rotated triangle, endpoints, physical
  `O = oppApex2`, and `J`;
- the exact physical five-fiber, complete finite-carrier `Ku` and `Kv`,
  mutual omissions, disjoint `2+2+1` traces, and modeled post-deletion
  multiplicity bounds.

The supplied non-obtuse values were correct as a multiset but not in ordered
vertex order. For both witnesses the exact order `(v1,v2,v3)` is

```text
(15488/18769, 15488/18769, 3281/18769).
```

The standalone verifier reports
`VERIFIED_SAT_EXACT_L1_CAP_TWO_ROW_CORE` and explicitly leaves all later
interfaces false.

## Layer boundary

The finite L1 witnesses do not create carrier subtypes inside a
`CounterexampleData`, a total `CriticalShellSystem`, or an
`OriginalUniqueFourResidual`. In particular, they do not by themselves supply
the actual `q,w`, `selectedAt`, or `outsideFirstApexFiber` provenance.

For a contextual lift with `other := v`, the finite geometry already checks
`v != source`, `v in C`, `v in J`, `v notin Ku`, and `cu != cv` in both
branches. The first source interface outside the L1 coordinate certificate is
the proof that `source` belongs to `outsideFirstApexFiber R`; that requires the
actual residual `R` and its total critical-shell data.

## L2 source-context extension

**EMPIRICALLY VERIFIED (finite exact replay).** Both L1 witnesses extend by a
four-point first-apex fiber with retained pair `(q,w)=(fq,fw)`. Their retained
status is `SAT_EXACT_L2_SOURCE_CONTEXT_GEOMETRIC_CORE`.

For S0-I the extended carrier has 16 roles, cap-card profile `(5,7,7)`, and

```text
J1 = {fp,fq,fw,r1,r2},
J2 = {cu,cv,u,v,xu}.
```

For S0-N it has 15 roles, cap-card profile `(5,6,7)`, and

```text
J1 = {fp,fq,fw,qv1},
J2 = {cu,cv,u,v,xv}.
```

In each branch the first-apex unit fiber is exactly `{O,fp,fq,fw}`. Deleting
any first-fiber member lowers its maximum positive-radius multiplicity to
three. The retained `fq,fw` are distinct strict-first-cap roles outside the
surplus cap, omit `Ku`, and preserve the complete source row and physical
five-class under either modeled deletion. The retained-pair localization
predicate is replayed for every modeled carrier role. With `source:=u`,
`other:=v`, and blockers `cu,cv`, all thirteen finite SourceContext geometry
checks pass; the source cross-card is two in S0-I and one in S0-N.

The standalone L2 verifier reports
`VERIFIED_SAT_EXACT_L2_SOURCE_CONTEXT_GEOMETRIC_CORE` and independently
reconstructs the enlarged coordinates and every retained field. No supplied
value discrepancy was found.

This finite result does not instantiate a full field-level Lean SourceContext.
The first unmodeled interface is a source-indexed total
`CriticalShellSystem` over a `CounterexampleData`, followed by
`CriticalPairFrontier` and `OriginalUniqueFourResidual` provenance making the
modeled first-apex blocker fiber and `outsideFirstApexFiber` definitionally
available. It also does not establish `D.Minimal`, JointDeletion or
CommonDeletion packets, the robust surface, or global all-source K4 semantics.

Indeed, the modeled finite carriers do not satisfy the global K4 property:
many carrier centers have no modeled four-point distance class. Thus their
local exact fibers are positive controls, not a substitute for the total
all-source structure.

## First source-faithful boundary after L2 geometry

The proposed extension does not yet reach L3. The absolute obstruction is
earlier: `CounterexampleData.K4` is required to form the ambient source object,
but the exact finite census reports `global_K4_holds_on_modeled_carrier=false`
in both branches. Hence neither a genuine `CounterexampleData` nor its
`D.Minimal` field can be instantiated from these finite carriers.

Conditionally assuming that missing ambient infrastructure, the next packet
fields are the two independent components of
`ExactFourMutualOmissionJointDeletion`:

```text
uPacket : CommonDeletionTwoCenterPacket D H fq cu O,
vPacket : CommonDeletionTwoCenterPacket D H fq cv O.
```

The local coordinate facts at `(fq,cu,O)` control only the first of these
geometrically. They do not provide either source packet, the separate packet at
`cv`, total `CriticalShellSystem.shellAt` data, `H.no_qfree_at`, universal
`FullyDeletionRobustAt`, the robust surface, global blocking/restoration, or a
`MinimalDeletionCore`.

Thus the smallest source-faithful next target is a genuine `D.K4` ambient
extension. Conditional on that extension, construct `uPacket` first and then
the independent `vPacket`; cap growth or deletion robustness at `O` alone is
insufficient.
