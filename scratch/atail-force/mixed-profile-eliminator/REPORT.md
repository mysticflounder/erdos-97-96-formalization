# Reverse-mixed equilateral profile eliminator audit

Date: 2026-07-14

Status: **BLOCKER-PAYLOAD NORMAL FORM KERNEL-CHECKED; THIRD-BISECTOR
TERMINAL KERNEL-CHECKED; REVERSE-MIXED PROFILE LOCALLY REALIZABLE; PARENT
GLOBAL-COUPLING PRODUCER STILL OPEN.**

## Rigor labels

| Claim | Status |
|---|---|
| Endpoint-outcome extraction, apex cross survival, the three-arm apex-blocker normal form, exact shell omission, q-deleted-row packaging, and the third-bisector terminal | **PROVEN** by Lean; axiom closure is the three core axioms listed below. |
| The displayed reverse-mixed five-point geometry and finite endpoint-outcome shadow are satisfiable | **EMPIRICALLY VERIFIED** by exhaustive exact arithmetic within the explicitly stated abstraction. |
| Full parent geometry forces a separated blocked endpoint or a third mixed-pair bisector center | **CONJECTURED / OPEN**; no producer was found. |
| The ordering of proposed next attacks | **HEURISTIC** and based on shortest checked consumer distance, not a proof of uniqueness. |

No independence claim from the full parent hypotheses is made.

## Verdict

The reverse mixed profile is not a local contradiction.  The exact
`Q(sqrt(3))` five-point realization remains strictly convex, and the four
endpoint blocker disjunctions retained in `JointTransitionPacket` admit a
consistent finite incidence shadow.

The blocker payload is nevertheless useful and must not be dropped.  The new
Lean theorem

```text
apex_blocker_cross_survival_of_reverseMixed
```

proves that, at the *actual retained critical blocker sourced at the common
apex* `a = S.oppApex2`, at least one of these holds:

```text
K4 survives deleting x
or
K4 survives deleting y.
```

Equivalently,

```text
apex_criticalShell_omits_continuationCenter_of_reverseMixed
```

proves that the exact chosen critical shell sourced at `a` omits `x` or omits
`y`.  This is not merely a local geometric observation: its proof explicitly
consumes both endpoint `TwoEndpointBlockerOutcome` packets stored in
`J.u_transition` and `J.v_transition`.  If both cross deletions failed, the
single blocker `H.centerAt a` would have to lie in both disjoint pairs
`{u,x}` and `{v,y}`.

The sharper theorem

```text
apex_blocker_normalForm_of_reverseMixed
```

retains the alignment information instead of stopping at existence. Its
three arms are:

```text
delete x survives and delete y survives
or
delete x survives and blocker(a) is u or x
or
delete y survives and blocker(a) is v or y.
```

The disjunction is not claimed exclusive; it is the branch-complete normal
form justified by the current endpoint packets.

The strongest bank-ready residual is packaged by

```text
nonempty_apexBlockerSurvivalPacket_of_reverseMixed
```

as one deletion chosen from `{x,y}`, together with:

- K4 survival at the actual apex blocker;
- omission of the deleted center from the exact critical shell;
- a concrete `U5QDeletedK4Class` using that unchanged four-point shell;
- equality of the surviving selected class with that shell support; and
- uniqueness of the positive K4 radius on the erased carrier.

No current bank consumer closes from this packet alone.

## Exact direct terminal

The weakest direct perpendicular-bisector terminal found in the current bank
is named

```text
HasThirdMixedPairBisectorCenter D x y a u v
```

and means that either:

1. a third carrier center, distinct from `x,u`, is equidistant from `y,a`; or
2. a third carrier center, distinct from `y,v`, is equidistant from `x,a`.

The theorem

```text
false_of_thirdMixedPairBisectorCenter
```

closes either arm with the planar three-carrier-bisector bound.  Its two
already-known center pairs are exactly `(x,u)` on the `{y,a}` bisector and
`(y,v)` on the `{x,a}` bisector.

This identifies a precise parent-facing producer.  An equivalent, more
critical-map-specific sufficient field is a **separated blocked endpoint**:
for one endpoint of either realized pair, prove both that deleting its partner
fails at the retained blocker and that this blocker differs from the two
known bisector centers.  The chosen critical shell then supplies the third
center and the displayed theorem closes.  Neither half may be omitted:
deletion failure alone only aligns the blocker with one of the two existing
centers, while center separation alone leaves the survival arm open.

## Exact regression

`verify_reverse_mixed_regression.py` rechecks the surviving profile over
`Q(sqrt(3))`.  With the adapter's conventions, its strict hull order is

```text
x, y, u, a, v.
```

It verifies exactly:

```text
old squared radius       = 1
generated squared radius = 2 - sqrt(3)
bisector centers of {y,a} among the five points = {x,u}
bisector centers of {x,a} among the five points = {y,v}
```

Thus the required third center is genuinely absent from the named local
configuration.  The checker also gives one exact finite shadow of the four
endpoint blocker disjunctions:

```text
blocker(y) = x
blocker(x) = y
blocker(a) = x
```

In that shadow deletion of `x` survives at the apex blocker, deletion of `y`
does not, and all four endpoint outcomes hold.  This is exact within the
metric-plus-incidence abstraction.  It is **not** a `CounterexampleData`
model: it does not construct fourth support members, global K4, a total
critical-shell system, MEC/cap data, or no-`IsM44`.

Evidence label: the arithmetic and exhaustive named-point checks are
**EMPIRICALLY VERIFIED by exact symbolic computation**.  They are not a Lean
kernel proof of satisfiability of the live parent theorem.

## Parent-data audit

The parent can prove its `equilateralJoint` function while closing over the
full `CriticalPairFrontier`, MEC, cap-cardinality, no-`IsM44`, fixed-row, and
LIVE data.  However, no current adapter maps any of those parent objects to:

- a third center on `{y,a}` or `{x,a}`;
- a prescribed partner-deletion failure at one of the four pair endpoints;
- cap separation of that actual blocker from both known bisector centers; or
- the additional row incidences required by a U5 incompatibility.

In particular, the frontier sources `F.pair.q,w` are distinct from the
continuation centers after dispatch, but they are not identified with
`x,y,u,v`, and their blocker rows do not acquire either mixed common pair.
The full parent hypotheses therefore remain available to a future producer,
but no current theorem turns them into a closing field on this profile.

## Theorem-bank preflight

The required registries and complete JSON inventories were checked before
deriving the new normal form:

- `docs/general-n-certificate-bank-mining-2026-07-09.md`;
- `certificates/p97_rvol_general_n_mining.{md,json}`;
- `certificates/erdos97_legacy_general_n_mining.{md,json}`; and
- `certificates/erdos_general_theorem_p97_mining.{md,json}`.

Indexed `nthdegree docs search --lean` queries covered reverse-mixed
equilateral rows, common-pair blocker alignment, deletion survival, cap-local
outside pairs, critical-shell rigidity, and three bisector centers.

The closest candidates and their first missing antecedents are:

| Candidate | First missing antecedent |
|---|---|
| `Dumitrescu.perpBisector_apex_bound` / the local three-center adapter | A third carrier center on `{y,a}` or `{x,a}`. |
| `u5_common_bisector_triple_incompatibility` | One q-deleted row containing the full required dangerous triple; the new apex packet supplies no such three incidences. |
| `outsidePair_unique_capCenter` | Two centers in one indexed cap and both common-pair points outside it; each mixed pair already contains one strict-`oppCap2` point. |
| `blocker_centers_eq_iff_mutual_cross_membership_*` | These production statements concern the retained frontier pair and its first-apex deletion hypotheses, not the mixed labels. |
| sibling `C5D3B.qAllowedSelected_*common_pair*` families | Their specialized `C5D3BSameSideTerminalPacket` and `U5QAllowedAuditSupport` producers; no adapter from the joint packet exists. |
| equilateral U5 collision kernels | Additional exact incidences absent in the strict reverse-mixed realization. |

The legacy and older-general inventories add fixed-`n` coordinate
contradictions but no source-reachable uniform producer matching this packet.

## Ranked next directions

1. **Prescribed deletion failure plus blocker separation.** Use the full
   parent geometry to force partner-deletion failure at one endpoint of
   `{y,a}` or `{x,a}`, and cap/order data to keep that blocker distinct from
   the two known centers. This is the shortest exact route to the checked
   third-bisector terminal.
2. **Direct parent-to-bisector incidence.** Show that one actual frontier or
   common-critical-map center is equidistant from either mixed pair and is
   distinct from its two existing centers. The checked terminal consumes this
   immediately and needs no new finite classifier.
3. **Consume the apex survival packet.** Build a U5 adapter from its exact
   erased support and unique radius to a banked incompatibility. This requires
   new positive incidences; current q-deleted-row banks do not infer them from
   exact support alone.
4. **Reintroduce specialized parent labels only if they supply the map.** A
   LIVE-Q/C branch is useful here only if it identifies a frontier/blocker row
   with `x,y,u,v` or produces one of the fields above. Merely renaming the
   packet does not reduce the residual.

More local metric profile mining is low priority: the exact strict realization
already shows that the reverse mixed geometry itself is viable.  The missing
ingredient is global parent-to-critical-row coupling.

## Validation

The scratch dependency chain and `MixedProfileEliminator.lean` were elaborated
against the current production source into an isolated directory under
`/tmp`; no olean was written into the repository.  All six printed endpoints
have axiom closure exactly:

```text
propext, Classical.choice, Quot.sound
```

There is no `sorryAx`, custom axiom, `admit`, or `native_decide` in the file.
The exact regression was replayed with:

```text
UV_CACHE_DIR=/tmp/uv-cache-atail uv run \
  scratch/atail-force/mixed-profile-eliminator/verify_reverse_mixed_regression.py
```

No full Lake build was run.  This lane made no production, closure-doc,
`SurplusM44`, or unique-row changes.
