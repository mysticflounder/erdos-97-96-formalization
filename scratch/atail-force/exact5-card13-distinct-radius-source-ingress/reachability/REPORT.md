# Fin-13 static reachability ingress

## Status

**PROVEN in isolated scratch Lean.**

[`Fin13StaticReachability.lean`](Fin13StaticReachability.lean) proves the
generic source-faithful bridge from semantic strong connectivity to the exact
13-stage forward/backward Boolean recurrence used by
`exact5-card13-distinct-radius-aggregate/surface.py`.

The generic checkpoint itself does not instantiate the theorem for `m`, `g0`,
or `g1`.  The follow-on canonical transport below supplies those three
instantiations, and the generated packing layer now proves all 1,092 exact
source assertions.  This lane does not edit production Lean.

The follow-on canonical transport is now checked in
[`CanonicalCard13Reachability.lean`](CanonicalCard13Reachability.lean).  It
instantiates the generic packet once for each actual `m`, `g0`, and `g1`
semantic family without identifying the independent row choices.

## Preflight

The required theorem-bank and indexed-corpus searches were run before the
proof.  They found the semantic inputs:

- `selectedWitnessEdge_reflTransGen` in
  `row-triangle-connectivity-audit/RowTriangleConnectivityAudit.lean`;
- `exists_selectedRow_escape_of_minimal` in
  `selected-row-strong-connectivity/SelectedRowStrongConnectivity.lean`; and
- the generic finite closure-to-`ReflTransGen` argument already recorded in
  the row-triangle audit.

No indexed theorem matched the finite source recurrence itself.  The general-n,
`p97-rvol`, legacy P97, and older general-theorem registries contain no competing
Fin-13 bounded-reachability adapter.

## Exact source contract

For one Boolean edge family `edge : Fin 13 → Fin 13 → Bool`, the source defines
two tables at stages `0,...,12`:

```text
forward[0,p]  = (p = 0)
backward[0,p] = (p = 0)

forward[s+1,p] = forward[s,p]
                 or exists x, forward[s,x] and edge[x,p]

backward[s+1,p] = backward[s,p]
                  or exists y, edge[p,y] and backward[s,y]

forward[12,p]  = true
backward[12,p] = true
```

The Lean definitions use `(List.finRange 13).any`, so each existential ranges
over exactly the 13 source labels.  `Fin13StaticReachabilityPacket` exposes the
same schemas as fields:

| schema | assertions per family |
| --- | ---: |
| forward initial values | 13 |
| backward initial values | 13 |
| forward transitions (`12 × 13`) | 156 |
| backward transitions (`12 × 13`) | 156 |
| forward terminal truths | 13 |
| backward terminal truths | 13 |
| **total** | **364** |

Three row families therefore give the audited 1,092 assertions.  The bounded
generated layer described below realizes every one of them at the original
global source indices `h40224` through `h41315`.

## Checked bridge

The main constructor is:

```lean
fin13StaticReachabilityPacketOfSelectedRows
    (edge : Label → Label → Bool)
    (hreach : ∀ source target : Label,
      Relation.ReflTransGen
        (fun left right => edge left right = true) source target) :
    Fin13StaticReachabilityPacket edge
```

The proposition-level theorem
`fin13_staticReachability_of_selectedRows` returns the corresponding nonempty
packet.  The source-support adapter
`fin13_staticReachability_of_selectedRowSupports` accepts precisely

```lean
∀ source target,
  Relation.ReflTransGen (fun center point => point ∈ row center) source target
```

and converts support membership to the Boolean edge layout with `decide`.
Thus the future `m`/`g0`/`g1` ingress only needs to transport the already-proved
minimality reachability theorem through the canonical 13-point frame.  It does
not need a new graph theorem or any stronger row incidence.

## Canonical source transport

That remaining transport is now **PROVEN**.  The checked construction uses:

- `CanonicalAsymmetricRolePrepacket.point_injective`;
- `CanonicalAsymmetricRolePrepacket.point_image`;
- the actual `CanonicalAsymmetricSemanticRowTable.main` family;
- the actual `CanonicalCoverFamilies.left` and `.right` families; and
- `GlobalMinimalityConnectivityAudit.selectedWitnessEdge_reflTransGen`.

For an arbitrary canonical family of selected classes,
`faithfulPatternOfCanonicalRows` constructs the physical
`FaithfulCarrierPattern` consumed by the existing minimality theorem.  A total
canonical inverse maps the physical `ReflTransGen` path back to `Fin 13`.
Injectivity proves the source and target labels are preserved, while the
selected-class support equality proves every pulled-back edge is precisely a
row-membership edge.

The actual Boolean family theorem is:

```lean
directSourceRowMember_reflTransGen
    (hmin : D.Minimal) (C : CanonicalCoverFamilies T)
    (family : Fin 3) (source target : Fin 13) :
    Relation.ReflTransGen
      (fun center point =>
        directSourceRowMember C family center point = true)
      source target
```

No family is missing the semantic strong-connectivity input.  `main`, `left`,
and `right` are independently selected; the proof does not identify or
synchronize them.

`CanonicalThreeFamilyReachabilityPacket C` contains:

- `main`, for source family `m` / index `0`;
- `coverLeft`, for `g0` / index `1`; and
- `coverRight`, for `g1` / index `2`.

`canonicalThreeFamilyReachabilityPacket hmin C` constructs all three exact
recurrence packets directly from the live semantic table.

## Aggregate bit packing and exact instances

[`AggregateConnectivityPacking.lean`](AggregateConnectivityPacking.lean)
defines the source's 1,014-bit connectivity layout:

```text
offset = 338 * family + 169 * direction + 13 * stage + point
```

The indices are exactly:

- family `0/1/2 = m/g0/g1`;
- direction `0/1 = forward/backward`;
- stage and point `0,...,12`.

`packCanonicalConnectivity` consumes the three-field
`CanonicalThreeFamilyReachabilityPacket`; it does not accept auxiliary bits or
flatten the semantic packet.  `sourceForwardRhs` and `sourceBackwardRhs` retain
the exact source order of all thirteen edge terms through
`List.finRange 13`.  The source assertion schemas are proved by:

```lean
packedConnectivity_zero_sourceAssertion
packedConnectivity_succ_sourceAssertion
packedConnectivity_terminal_sourceAssertion
```

[`generate_connectivity_instances.py`](generate_connectivity_instances.py)
rebuilds both live `surface.py` orbits and fails closed unless all of the
following remain exact:

- source range `[40224, 41316)`;
- 1,092 assertions and 1,014 auxiliary bits;
- identical direct/mirror connectivity streams;
- connectivity-block SHA-256
  `7ac928dc2d4ba680b0caab32d3ee38ac57c171bac70e882cf56c9b7f93214755`;
- an independently reconstructed Z3 expression at every source index.

The generator emits eighteen chunks of at most 64 fields.  The final chunk has
four fields.  [`CanonicalConnectivityAssertions.lean`](CanonicalConnectivityAssertions.lean)
is a thin coordinator whose `canonicalConnectivityAssertions_of_minimal`
theorem constructs the semantic packets from minimality and proves the entire
block.  The machine-readable index/expression audit is
[`connectivity-assertion-map.json`](connectivity-assertion-map.json).

## Proof mechanism

For the forward recurrence, let `U_s` be the labels whose stage-`s` bits are
true.

1. `0 ∈ U_s` for every stage and `U_s ⊆ U_{s+1}`.
2. If `U_{s+1} ⊆ U_s`, then `U_s` is closed under every true edge.
3. Strong `ReflTransGen` reachability from zero makes every such stable set
   universal.
4. Hence every non-universal stage strictly grows.
5. Starting from one label, `U_s` contains at least `s+1` labels for `s ≤ 12`.
   Since `Fin 13` has 13 labels, `U_12 = univ`.

The backward recurrence is definitionally the forward recurrence for the
transposed edge relation.  Full strong connectivity supplies reachability in
that transpose as well.

This proves that the proposed source statement is not overstrong.  No
counterexample or weakened replacement was needed.

## Validation

The generic file passes:

```bash
cd lean
lake env lean -DwarningAsError=true \
  ../scratch/atail-force/exact5-card13-distinct-radius-source-ingress/reachability/Fin13StaticReachability.lean
```

The printed axiom closure for all four public constructor/theorem declarations
is exactly:

```text
[propext, Classical.choice, Quot.sound]
```

There is no `sorryAx`, and the warning-as-error check emits no Lean warning.

The canonical transport also passes a warning-as-error build with the current
scratch-module search path.  Its four printed declarations

```text
canonicalSelectedRows_reflTransGen
directSourceRowMember_reflTransGen
canonicalThreeFamilyReachabilityPacket
nonempty_canonicalThreeFamilyReachabilityPacket
```

all have the same axiom closure:

```text
[propext, Classical.choice, Quot.sound]
```

The aggregate packer, all eighteen generated chunks, and the combined
coordinator pass `-DwarningAsError=true`.  The generator's `--check` mode
accepts all 1,092 current instances.  The coordinator declarations

```text
canonicalConnectivityAssertions
canonicalConnectivityAssertions_of_minimal
```

have axiom closure exactly:

```text
[propext, Classical.choice, Quot.sound]
```

No lane Lean file contains `sorry` or `admit`.

## Next scoped step

The complete connectivity block is now source-clean.  Its next use is as one
component of the full distinct-radius source assignment or of a fail-closed
selected-core coordinator.  No further connectivity theorem or auxiliary-bit
hypothesis is needed.
