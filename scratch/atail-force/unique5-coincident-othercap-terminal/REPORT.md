# Exact-five coincident-blocker other-cap terminal audit

Date: 2026-07-22

Status: **NO DIRECT `False`; BOTH OTHER-CAP ARMS FORCE OMIT-TWO, NOT A
TERMINAL OCCURRENCE.**

This lane starts from

```lean
R : OriginalUniqueFiveCoincidentBlockerResidual F
L : CoincidentBlockerFreshCommonDeletion R
```

in `../unique5-coincident-direct-false/CoincidentBlockerContinuation.lean`.
It studies only the last two arms of

```lean
freshBlocker_mem_firstCap_or_otherCapInterior L
```

where the actual blocker of `L.fresh` lies in the strict surplus-cap
interior or the strict second-opposite-cap interior.  No production file or
closure document is changed.

## Theorem-bank preflight

The required registries were searched before attempting a new local
consumer:

- `docs/general-n-certificate-bank-mining-2026-07-09.md`, including the
  sibling `p97-rvol` section;
- `certificates/p97_rvol_general_n_mining.{md,json}`;
- `certificates/erdos97_legacy_general_n_mining.{md,json}`; and
- `certificates/erdos_general_theorem_p97_mining.{md,json}`.

Indexed Lean searches covered coincident blockers, strict-cap blocker
locations, common outside pairs, Kalmanson cross hits,
`CriticalFiberClosingCore`, and alternative-`M44` packets.  The closest
current consumers are:

```text
CapSelectedRowCounting.outsidePair_unique_capCenter
ATailCriticalFiberClosingCore.OrderedCrossRowCore.false
ATailCriticalFiberClosingCore.SameCapCollisionPairCore.false
ATailRetainedCollisionDifferentPairConsumer.OrderedDifferentPairCrossHit.false
ATailRetainedCollisionDifferentPairConsumer.AlternateOrderedDifferentPairCrossHit.false
```

None accepts the two other-cap locations plus deletion survival alone.  The
older `collision-offcap-localization` audit reaches the same U5 boundary from
the robust-parent collision interface: its fresh row has at most two named
dangerous-circle hits, but no theorem selects the positive hit required by a
banked terminal.

## Strongest source-faithful consequence

Write

```text
O = S.oppApex1
c = the common actual blocker of q,w
f = L.fresh
x = the actual blocker of f
T = SelectedClass D.A O radius
Kx = the exact critical support selected at f
```

The source gives

```text
q,w,f in T,
q != w,
f != q,w,
q,w in the common shell centered at c,
f in Kx,
x != O,c.
```

Suppose first that `x` lies in the strict surplus-cap interior.  Both `O`
and `x` then lie in the closed surplus cap: `O` is one endpoint and `x` is a
strict interior point.  Every point of the strict first opposite cap lies
outside that closed cap.  Therefore, for either `z = q` or `z = w`, the
conjunction

```text
z in Kx
```

would make the distinct cap centers `O,x` equidistant from the distinct
outside pair `f,z`:

- `O` is equidistant from `f,z` because both lie in `T`;
- `x` is equidistant from `f,z` because both would lie in `Kx`.

This is exactly forbidden by
`CapSelectedRowCounting.outsidePair_unique_capCenter`.  Hence

```text
q notin Kx  and  w notin Kx.
```

The proof for `x` in the strict second-opposite-cap interior is identical:
`O` is an endpoint of that cap, while `f,q,w` are outside it.  Consequently
both non-first-cap arms force the sharper exact-class intersection bound

```text
Kx intersect {q,w,f} = {f}.
```

The other two members of the complete class `T` are not known to lie in the
strict first cap, so no stronger equality with `Kx intersect T` follows.  The
checked general bound remains `card (Kx intersect T) <= 2`.  The omit-two
fact is useful as a regression condition, but it is negative incidence data.
It is not the antecedent of a current direct-`False` consumer, so this lane
intentionally does not add a Lean wrapper for it.

## Exact consumer mismatches

### Outside-pair uniqueness and same-cap core

The obvious collision pair is `q,w`.

- The common blocker `c` is in the strict first cap.
- The fresh blocker `x` is in a different strict cap.
- The first apex `O` is opposite the first cap.

Strict interiors belong to no other indexed cap, so no indexed cap contains
`c` together with either `x` or `O`.  Thus neither available source-faithful
second center can fill the same-cap fields of `SameCapCollisionPairCore`.

Using `O,x` as the two same-cap centers does not help.  Their common outside
pair would have to be two members of `T`, and the preceding uniqueness
argument proves that `Kx` contains only one such member, namely `f`.

### Ordered Kalmanson core

The natural assignment to an ordered cross-row terminal is

```text
J = f,
C = one of q,w,
K = the other one,
X = x.
```

The first-apex equality `dist O J = dist O C` and the common-blocker equality
`dist c C = dist c K` are present.  The indispensable cross-row field is

```text
K in Kx.
```

Both other-cap arms prove its negation.  The failure precedes any boundary
orientation case split, so neither `OrderedCrossRowCore.false` nor either
different-pair Kalmanson terminal can be assembled.

### `CriticalFiberClosingCore`

The original unique-radius residual does not carry the production
`FrontierCommonDeletionParentResidual` parameter expected by
`CriticalFiberClosingCore`.  Even ignoring that interface mismatch, neither
constructor is available:

- the same-cap constructor fails by cap disjointness and the omit-two fact;
- the ordered constructor fails at `K in Kx`.

Repackaging the deletion witnesses therefore cannot produce the closing
core.

### No-`M44` retriangulation

The other-cap blocker is a strict cap-interior carrier point, not a point
known to lie on the minimum-enclosing circle.  None of the residual fields
places any member of `Kx` on that circle.  Consequently there is no source
for the three MEC boundary vertices required to build a new
`SurplusCapPacket`, before cap cardinalities or `IsM44` can even be checked.
The exact missing antecedent is MEC-boundary occurrence, not cap
partition bookkeeping.

## Finite-incidence regression

`check_incidence_boundary.py` realizes both other-cap modes in the exact
finite cap/incidence abstraction used above.  In each mode it checks:

- the five-member first-apex class;
- the coincident common support with exact first-cap intersection `{q,w}`;
- a fresh exact four-support containing `f` and neither `q` nor `w`;
- a joint-deletion class member outside both supports;
- strict-cap separation of `c` and `x`;
- failure of the same-cap and ordered-cross-hit terminal antecedents; and
- a non-`M44` displayed cap-card profile.

Run:

```bash
UV_CACHE_DIR=/tmp/p97-unique5-othercap-uv \
uv run --no-project python \
  scratch/atail-force/unique5-coincident-othercap-terminal/\
  check_incidence_boundary.py --check
```

This is **EXACT WITHIN A FINITE INCIDENCE/CAP-PARTITION ABSTRACTION**.  It is
not a Euclidean realization, does not construct global all-center K4 or a
total `CriticalShellSystem`, and is not a counterexample to the original
Lean residual.  Its only role is to prevent deletion/cap-location marginals
from being mistaken for a positive row occurrence.

## First missing producer

The two other-cap branches are not waiting for another localization theorem.
They require genuinely global information that defeats the forced omit-two
normal form.  The first viable target is one of:

1. a different source `J` whose actual row supplies a named Kalmanson cross
   hit while retaining the full boundary order; or
2. a theorem using global K4/minimality to turn an exact-five source omitted
   by both the common and fresh supports into an alternative
   MEC support triangle or another existing terminal packet.

Neither target is currently in the theorem banks.  Another generic deletion
adapter, or another cap-location split, would not advance this branch.
