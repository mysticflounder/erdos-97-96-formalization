# Endpoint-blocker geometry boundary

## Verdict

The endpoint branch is now decided exactly on the production
`CriticalPairFrontier` surface.

- **Card five:** both blockers are provably different from both endpoints of
  the surplus cap.
- **Card four:** the second endpoint is still excluded, but the first endpoint
  is a genuine exact deletion blocker.  It cannot be excluded uniformly from
  an arbitrary chosen `CriticalShellSystem`.

Endpoint landing in card four is not a new terminal.  Landing at `q`'s blocker
is exactly the directed cross hit `w ∈ selectedAt(q).support`; the symmetric
landing gives the reverse hit.  If both land, this is the existing
common-blocker/mutual-hit arm with common center `oppApex1`.

The next bridge must therefore be choice-invariant.  It must either:

1. eliminate the card-four first-apex arm before choosing a shell system; or
2. produce a **non-apex** surplus-cap critical center whose exact shell
   contains both sources, i.e. the existing
   `ExistsSurplusPairCriticalBlocker` consumer packet.

Trying to prove `H.centerAt source != oppApex1` for every arbitrary `H` is the
wrong target.

## Required bank preflight

The registries required by `AGENTS.md` were searched before deriving:

- `docs/general-n-certificate-bank-mining-2026-07-09.md`;
- `certificates/p97_rvol_general_n_mining.{md,json}`;
- `certificates/erdos97_legacy_general_n_mining.{md,json}`; and
- `certificates/erdos_general_theorem_p97_mining.{md,json}`.

Indexed `nthdegree docs search --lean` queries covered endpoint blockers,
minor caps, source pushout, `StrictLapPacket`, rank drop, and global boundary
lifts.

The closest hits were:

- `short_endpoint_shell_meets_adjacent_cap_card_le_one` and its strict-cap
  variant;
- `oppApex1_{surplusCap,otherCap}_one_hit`;
- `oppApex1_exactRadiusClass_cover` and `fourClass_of_cover`;
- `source_pushout_left/right`, `rank_drop`, and
  `strictLapPacket_nonreturn`; and
- the current production mutual-membership/common-blocker equivalences.

The pushout/rank/lap theorems consume already-produced incompatible edges or
strict-lap packets and do not classify an endpoint blocker.  The endpoint
one-hit bank does apply, but it does not contradict card four: its exact
conclusion is that a four-class may consist of one point in each adjacent cap
and two points in the strict interior of the opposite cap.  The exact model
below realizes precisely that split.

No bank theorem turns first-endpoint landing into `False` under the live
card-four fields.

## Kernel-checked boundary

`endpoint_blocker_boundary.lean` proves:

### Card five

`card_five_blockers_ne_both_surplus_endpoints` simultaneously gives

```text
centerAt(q) != oppApex1
centerAt(q) != oppApex2
centerAt(w) != oppApex1
centerAt(w) != oppApex2.
```

The first-endpoint inequalities follow because deleting one member from a
card-five first-apex class leaves four points.  The existing packet already
supplies both second-endpoint inequalities from deletion survival there.

### Card four

`card_four_first_endpoint_critical_shells` constructs exact critical shells
at `oppApex1` for both sources.  Under the unique-radius clause already stored
in `FirstApexSplit`, deleting either source destroys every K4 witness at that
endpoint.

The two endpoint-landing normalization theorems prove that if the supplied
system chooses this endpoint, then its exact support is the entire first-apex
card-four class and therefore contains the other source.

Most decisively,
`exists_card_four_system_with_both_blockers_at_first_endpoint` uses
`CriticalShellSystem.overrideAt` twice to construct a valid system choosing
`oppApex1` for both sources.  The theorem accepts the full

```text
not exists T : SurplusCapPacket D.A, T.IsM44
```

hypothesis.  That global geometric condition does not constrain the choice of
one certified critical shell over another.  The final theorem checks that the
new choices still differ from `oppApex2`.

All printed declarations have axiom closure exactly

```text
propext, Classical.choice, Quot.sound
```

with no `sorryAx` or custom axiom.

## Exact real-algebraic local model

`analyze.py --check` deletes one vertex from the existing exact 13-point
blocker-cap model and replays the resulting 12-point configuration over exact
real-algebraic arithmetic.

It certifies:

- strict convex supporting lines for every hull edge;
- the same non-obtuse equilateral circumscribed MEC triangle `(C,O,A)`;
- the chosen cap profile `(6,4,5)`, so this chosen packet is not `IsM44`;
- the off-surplus pair `(q,w)=(E,C)`;
- the exact first-endpoint class at `O`
  `{A,C,E,J}` of cardinality four;
- deletion of either source kills K4 at `O`;
- deletion of either source preserves K4 at the second endpoint `A`; and
- `O != A`.

The banked cover is realized sharply:

```text
surplus-cap hit:                 A
other adjacent-cap hit:         C
strict opposite-cap interior:   E, J
```

Thus the endpoint one-hit theorems normalize the branch but do not close it.

Epistemic boundary: this is an exact local survivor packet, not
`CounterexampleData`.  Only `O` and `A` have K4; global all-center K4 and hence
a total critical-shell system are absent.  The checker also does not prove
the global nonexistence of every alternative `IsM44` packet on the carrier.
It is therefore not a counterexample to K-A-PAIR.  The Lean override theorem,
rather than this finite model, is what establishes selector-dependence under
the conditional full live hypotheses.

## First missing bridge

The first missing statement is not another endpoint inequality.  It is one of
the following choice-invariant producers:

```text
card-four branch
  -> first-apex double deletion survives / another named terminal
```

or

```text
card-four branch
  -> exists source, center, exact critical shell,
       center in surplusCap,
       center != oppApex1,
       q and w both in the shell.
```

The second is exactly `ExistsSurplusPairCriticalBlocker`; the already-checked
`false_of_existsSurplusPairCriticalBlocker` then closes by ordered-cap
outside-pair center uniqueness.  Global K4/MEC/no-M44 geometry must produce
that additional non-apex center.  It cannot do so merely by changing the
arbitrary selector stored in `hcritical`.

## Replay

```bash
cd lean
lake env lean -M 16384 \
  ../scratch/atail-force/endpoint-blocker-geometry/endpoint_blocker_boundary.lean

cd ..
UV_CACHE_DIR=/tmp/uv-cache-erdos9796 uv run python \
  scratch/atail-force/endpoint-blocker-geometry/analyze.py --check
```
