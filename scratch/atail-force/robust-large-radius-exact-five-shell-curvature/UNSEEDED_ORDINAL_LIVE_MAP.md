# Unseeded ordinal result: live exact-five role map

Date: 2026-07-16

Status: **FINITE ROLE CORE IDENTIFIED; MAXIMAL LIVE RAW-ROW EXTRACTION
KERNEL-CHECKED; FIXED `PROFILE=(8,4,5)` PARENT EXTRACTION BLOCKED.**

This audit owns only
`scratch/atail-force/robust-large-radius-exact-five-shell-curvature/`.
It does not edit the ordinal-search lane, production Lean, closure documents,
or protected files.

## What the unseeded checkpoint actually proves

The read-only checkpoint

```text
scratch/atail-force/kalmanson-linear-closure/
  direct_avoider_checkpoint.json
```

reports

```text
UNSAT_EXHAUSTIVE_FINITE_DFS
nodes = 0
seed = null
```

The zero-node result is caused during candidate-domain filtering, before the
DFS proper. The fixed finite rows are

```text
selected O row: center O,  support {A,C,D,E}
A row:          center A,  support {O,C,G,K}
D row:          center D,  support {A,E,I,F}
t1 row:         center t1, support {D,X,Y,Z}
```

and the ambient exact class is

```text
center O, support {A,C,D,E,J}.
```

The ordinal predicate deliberately removes the selected `O` row and replaces
it by the ambient five-class. Thus `{A,C,D,E}` is not an equality source in
the strict-cycle proof.

The fixed rows plus ambient class are ordinal-SAT. A separate variable `C`
row has 36 structurally admissible candidates: 12 are immediately ordinal
rejected and 24 survive. This layer is not load-bearing for the terminal
unseeded result.

Every one of the 70 structurally admissible `X` candidates is rejected when
added directly to the fixed prefix. No `C` row is needed. The authoritative
shortest-cycle compression in the read-only
`x_domain_schema_results.json` gives five schemas:

| Minimal named rows | Shortest cycle | X candidates |
| --- | ---: | ---: |
| ambient `O`, fixed `A`, `X` | 2 | 44 |
| ambient `O`, fixed `A`, fixed `D`, `X` | 2 | 4 |
| ambient `O`, fixed `A`, fixed `D`, `X` | 3 | 12 |
| ambient `O`, fixed `D`, `X` | 2 | 4 |
| ambient `O`, fixed `t1`, `X` | 2 | 6 |

Consequently the ambient exact `O` class and the arbitrary `X` row occur in
all 70 shortest certificates. Fixed `A` occurs in 60, fixed `D` in 20, and
fixed `t1` in 6. The selected four-point `O` row occurs in none because the
ordinal predicate explicitly discards it.

The owned `analyze_unseeded_roles.py` independently replays all 70
rejections. Its generic greedy deletion pass can choose different minimal
row alternatives for candidates having more than one certificate; it is not
the authoritative shortest-cycle schema quotient.

Here “arbitrary `X` row” means arbitrary among the 70 remaining candidates
of this fixed finite surface. Those candidates already satisfy the
`PROFILE=(8,4,5)` hull/cap constraints, the permanent row filter, ambient-row
compatibility, pair-center bounds, and the robust repeated-pair avoidance.
It does not mean an arbitrary `SelectedFourClass` on an arbitrary live
carrier.

## Kernel-checked maximal live extraction

`UnseededOrdinalLiveRoleMap.lean` proves

```lean
nonempty_liveUnseededOrdinalRawRows
```

from

```lean
LargeCapUniqueFiveUnusedCriticalRow D S H profile.
```

After provisionally renaming the physical second apex `S.oppApex2` as finite
role `O`, the checked packet supplies:

1. the ambient-exact five-class
   `SelectedClass D.A O profile.radius`;
2. a selected `O` row whose support is a four-subset of that class;
3. distinct provisional points `A,D` in the ambient class;
4. arbitrary global-K4 selected rows centered at `A` and `D`;
5. physical-`O` survival after deleting `D`;
6. the actual critical-map blocker `t1 = H.centerAt D` with `t1 != O`;
7. the exact critical `t1` row through source `D`;
8. another support point `X != D` of that row; and
9. an arbitrary global-K4 selected row centered at `X`.

The `t1 != O` fact is source-valid. Deleting a member of the five-class leaves
four points on the same physical-`O` circle, while the retained critical map
chooses a center where that deletion blocks K4.

The same file also proves

```lean
six_le_oppCap2_card_of_unusedCriticalRow
```

so the live residual retains `6 <= S.oppCap2.card`.

## Field-by-field role comparison

- Ambient full-five `O` class: **RAW-SOURCEABLE** after renaming the physical
  second apex to `O`. The five named labels and their cap/order placements are
  absent.
- Selected fixed `O={A,C,D,E}` row: **SOURCEABLE ONLY AS SOME FOUR-SUBSET**
  of the ambient class. The omitted point cannot be fixed as `J`. This row is
  not used by the ordinal cycles.
- Fixed `A={O,C,G,K}` row: **ROW EXISTENCE ONLY.** Global K4 gives a selected
  row at a chosen ambient-class point `A`, but does not put `O,C,G,K` in it.
- Fixed `D={A,E,I,F}` row: **ROW EXISTENCE ONLY.** Global K4 gives a row at
  `D`, but none of its four named memberships follows.
- Fixed `t1={D,X,Y,Z}` row: **STRONGEST MATCH.** The common critical map gives
  an exact row at `t1=centerAt D` containing `D`. Its other three points can
  be named abstractly, but their fixed cap/order identities are absent.
- Arbitrary `X` selected row: **ROW EXISTENCE ONLY.** A support point `X` of
  the `t1` row is in `D.A`, so global K4 supplies a row at `X`. Coverage by
  the finite list of 70 supports is not available.
- Specific unused-source critical row: **DOES NOT MATCH THE FIXED `t1`
  PROVENANCE.** Its source lies outside the ambient physical-apex five-class,
  whereas finite role `D` lies inside the ambient `O` class.
- Ordered-shell endpoint escape packet: **ORTHOGONAL.** It supplies real CCW
  order and two endpoint rows with three escapes each, but no endpoint is
  placed in the ambient five-class and no fixed named support is produced.

## Match against the five promoted schema footprints

The exact-five ordered-shell/K4-escape packet instantiates **none** of the
five footprints.

- `ambientO,A,X`: the first absent field is a selected row at an ambient-class
  point with `physicalO ∈ ARow.support`; the live `ARow` is arbitrary.
- `ambientO,A,D,X`, length 2: the same fixed `A` incidence is already absent.
  The named `D`-row incidences are absent independently.
- `ambientO,A,D,X`, length 3: the same fixed `A` incidence is already absent.
  The named `D`-row incidences are absent independently.
- `ambientO,D,X`: the first absent field is a `D` row containing the named
  ambient points `A,E`; the live `DRow` is arbitrary.
- `ambientO,t1,X`: for the actual ordered unused critical shell, the first
  absent field is a shared role `D` in both the physical ambient five-class
  and the critical support.

The last missing field has the exact source-facing form

```lean
∃ Dpoint,
  Dpoint ∈ SelectedClass D.A S.oppApex2 profile.radius ∧
  Dpoint ∈ unusedRow.criticalRow.toCriticalFourShell.support
```

The only critical-support point named by `unusedRow` is the unused source,
and that point is proved **not** to lie in the ambient five-class. The ordered
shell names the other three support points but proves no ambient-class
membership for any of them. The endpoint K4-escape rows add only cardinal
escape facts, not this intersection.

One can instead choose a fresh `Dpoint` in the ambient class and use
`H.selectedAt Dpoint` to force the shared `D` incidence; this is exactly what
`nonempty_liveUnseededOrdinalRawRows` does. But that is a different critical
row. The ordered-shell order and endpoint-escape facts do not transport to
it, and its blocker has no fixed-profile cap/order placement.

All five footprints also share a later universal gap: the arbitrary live
`XRow` has no proof that its support belongs to the 70-element fixed-profile
`X` candidate domain. Thus closing the first named incidence above would not
by itself provide finite coverage.

## Why the fixed-profile extraction is blocked

The direct finite role assignment has caps

```text
surplus = {O,t1,I,F,A}          card 5
opp1    = {A,X,Y,Z,D,J,E,C}    card 8
opp2    = {C,G,K,O}            card 4.
```

Under the search's documented robust-role mapping, the live residual instead
has `6 <= S.oppCap2.card`. Therefore the direct `PROFILE=(8,4,5)` labeling is
not a live labeling of this branch. Swapping the two opposite caps is not a
free renaming: the hull order, fixed rows, first/second-apex designation, and
candidate domains are asymmetric. A mirrored or higher-card search would
need its own checked coverage result.

Even ignoring that cardinality mismatch, the live raw packet lacks the
load-bearing fixed incidences:

```text
O,C,G,K in ARow.support
D,X,Y,Z in t1Row.support with their fixed cap/order roles
XRow.support belongs to one of the 70 enumerated supports.
```

The live theorem supplies only `D in t1Row.support`. The ordered-shell escape
theorem supplies no relation between its critical support and the physical
five-class. Thus it cannot fill these fields.

## Precise blocked theorem boundary

A source-facing use of the unseeded ordinal result would need a theorem of
the following shape before translating the 70 finite cycles to Lean:

```lean
theorem exists_profile845_unseededOrdinalRoles_of_liveExactFive
    (unusedRow : LargeCapUniqueFiveUnusedCriticalRow D S H profile) :
    Nonempty (Profile845UnseededOrdinalRoles D S H profile unusedRow)
```

where `Profile845UnseededOrdinalRoles` must contain:

- a bijective fourteen-point CCW boundary labeling in the exact displayed
  order;
- the three exact cap-support identities above;
- the ambient exact `O` class `{A,C,D,E,J}`;
- fixed `A` and `t1` support identities;
- one `X` row with a proof that its support lies in the exhaustively checked
  70-candidate domain; and
- the profile's permanent row and robust pair-avoidance hypotheses.

`nonempty_liveUnseededOrdinalRawRows` is the maximal current extraction below
that boundary. The missing content is not row existence; it is fixed
cap/order placement plus named cross-incidence and finite-domain coverage.

## Bank and corpus preflight

The required theorem-bank registries were already checked for the parent
exact-five/shell-curvature lane. Additional targeted
`nthdegree docs search --lean` queries covered:

- exact five-class members and their critical blocker rows;
- ambient five-class plus `A/t1/X` Kalmanson cycles;
- fixed `PROFILE=(8,4,5)` live-parent extraction; and
- selected-row support outside an exact critical shell.

The searches found the existing production five-point Kalmanson terminal and
critical-pair blocker lemmas, but no producer of the fixed profile roles or
the missing `A/t1/X` named incidences.

## Validation

The owned analysis replay reports exactly 70 `X` rejections. The authoritative
shortest-cycle checkpoint partitions them as `44/4/12/4/6` across the five
schemas above.

Focused Lean 4.27 validation with warnings as errors succeeds for
`UnseededOrdinalLiveRoleMap.lean`. Both public declarations report only:

```text
propext, Classical.choice, Quot.sound
```

The Lean file contains no `sorry`, `admit`, custom axiom, `native_decide`, or
unsafe declaration.

## Route consequence

The unseeded ordinal result is a real exhaustive theorem-discovery result for
its fixed fourteen-role surface. It is not currently a closure result for the
live exact-five large-radius residual. The useful live progress is the checked
raw extraction of the ambient class, an exact `t1` row through `D`, and an
arbitrary `X` row. The next required producer is the fixed cap/order and named
support-incidence bridge, or a new ordinal coverage run over the actual
card-at-least-six live surface.
