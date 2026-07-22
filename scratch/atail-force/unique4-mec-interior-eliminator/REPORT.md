# Unique-four MEC-interior eliminator audit

Date: 2026-07-22

Scope: only the strict-MEC-interior arm returned by
`exists_fresh_strictCap_collision_or_singletonCore_or_packedCore` from
`R : OriginalUniqueFourResidual F`.

## Status

**CONJECTURED / NOT CLOSED.**  No source-valid proof of

```lean
R : OriginalUniqueFourResidual F
fresh transition packet
hinside : dist center (MEC.mec D.A S.hA).center <
  (MEC.mec D.A S.hA).radius
------------------------------------------------------------
False
```

was found.  In particular, there is no Lean theorem in this directory and no
claim that a production `sorry` has closed.

The audit isolates carrier-wide `D.K4` as the only candidate field absent
from both exact regressions.  Protected-set provenance is compatible with an exact
unique-four strict-interior singleton transition.  A total
`CriticalShellSystem` is also compatible with a protected strict-interior
singleton in an exact Euclidean model.  The ordinary same-carrier consequence
of `D.Minimal`--that no proper subset of the displayed carrier has K4 at all of
its centers--also holds vacuously/nontrivially in the unique-four regression.

This does **not** prove that `D.K4` alone closes the arm.  Nor does regression B
exclude a special interaction between total criticality and the exact-four
class, because B is exact five.  The justified conclusion is narrower: a
future proof must use carrier-wide K4, full minimality, or an exact-four-specific
interaction with the total critical map in a way that reaches an existing
terminal.  Merely unfolding the transition packet or its protected provenance
cannot suffice.

## Required preflight

Before constructing the regressions, the existing theorem banks were checked:

- `docs/general-n-certificate-bank-mining-2026-07-09.md`;
- `certificates/p97_rvol_general_n_mining.{md,json}`;
- `certificates/erdos97_legacy_general_n_mining.{md,json}`; and
- `certificates/erdos_general_theorem_p97_mining.{md,json}`.

The indexed Lean corpus was also searched with `nthdegree docs search --lean`
for protected deletions, strict-MEC-interior centers, total critical shells,
outside pairs, and M44 packets.  The closest reusable terminals are:

- `CapSelectedRowCounting.outsidePair_unique_capCenter`;
- the local wrappers named
  `false_of_two_cap_centers_equidistant_outside_pair`;
- `actualRow_center_eq_commonBlocker_of_sameCap_outside_sources`; and
- `isM44Packet_of_capTriple_two_exact_of_card_gt_nine`.

None consumes a bare strict-interior fresh center, a collision, or a
`MinimalDeletionCore`.  Every useful match first needs a cross-row occurrence
or a complete alternative cap packet.

## Exact regression A: unique four plus protected singleton

Files:

- `verify_protected_singleton_interior.py`;
- `checkpoint.json`.

The checker extends the exact twelve-point endpoint model by three rational
rotations of `J` around the fresh carrier center `t1`.  All predicates below
are checked by exact SymPy arithmetic, not floating-point tolerances.

The resulting fifteen-point carrier has:

- strict convexity, certified by every hull supporting-line inequality;
- unique MEC boundary `{A,C,O}`;
- the nonobtuse circumscribed support triangle `(O,A,C)`;
- closed-cap cardinalities `(6,7,5)`, hence no M44 permutation;
- a unique exact first-apex class `{A,C,E,J}` at `O`;
- deletion of every member of that class destroying K4 at `O`;
- the retained off-surplus pair `{C,E}`;
- a second-apex exact-four witness `{G,H,K,O}` after deleting that pair;
- the strict first-cap pair `{E,J}` and the checked bisector localization;
- the exact protected set `{A,C,E,J,O}`;
- a fresh center `t1` outside that set and strictly inside the MEC;
- the protected minimal deletion set `{J}`; and
- the exact deletion-critical shell
  `{J,J_core_1,J_core_2,J_core_3}` centered at `t1`.

Thus the singleton constructor of the fresh transition theorem is realized
with the actual protected-set provenance.  It is not merely an arbitrary
local collision fixture.

What deliberately fails is carrier-wide K4.  Exactly the centers `O`, `A`,
and `t1` have a four-point radius class; twelve centers do not.  A complete
scan of all `2^15 - 1` nonempty subcarriers finds no subcarrier having K4 at
all of its own centers.  Therefore the displayed carrier also satisfies the
same-carrier consequence that minimality normally supplies, even though it is
not a `CounterexampleData` because the full carrier itself lacks K4.

Pinned result:

```text
PASS_EXACT_PROTECTED_SINGLETON_STRICT_INTERIOR
coordinate_sha256 = 59bb3d81ac298f9f80eca9b0c289ace910724e03e5286ded57694d1cf134978e
```

Replay:

```bash
UV_CACHE_DIR=/tmp/uv-cache-p97 uv run --offline --with sympy \
  python scratch/atail-force/unique4-mec-interior-eliminator/verify_protected_singleton_interior.py --check
```

## Exact regression B: total critical system plus protected singleton

Files:

- `verify_total_css_interior_independence.py`;
- `total_css_checkpoint.json`.

This checker pins and fully replays
`../global-critical-continuation/verify_total_css_completion.py` at SHA-256
`adbc3583b5bfefc0d2cf80af45b3a09a2a0d47ede836168d9bb61683083e1ff7`.
That exact thirty-five-point model has a total deletion-critical shell
assignment.

For the protected first-apex source `J`, the total assignment chooses the
carrier center `F_k4_1`, which is:

- outside the protected set `{A,C,D,E,J,O}`;
- strictly inside the MEC;
- centered on the exact shell `{J,J_css_1,J_css_2,J_css_3}`; and
- deletion-critical for `J`.

Therefore the implication

```text
total CriticalShellSystem
+ protected singleton provenance
+ strict MEC interior
=> contradiction or MEC boundary
```

is false in exact Euclidean geometry.

This second model is on an exact-five first-apex class, not the unique-four
leaf.  It does not rule out a special interaction between total criticality
and exact four.  It does rule out treating total criticality, by itself, as a
boundary-localization principle.  Carrier-wide K4 again fails.

Pinned result:

```text
PASS_TOTAL_CSS_PROTECTED_SINGLETON_STRICT_INTERIOR
```

Replay:

```bash
UV_CACHE_DIR=/tmp/uv-cache-p97 uv run --offline --with sympy \
  python scratch/atail-force/unique4-mec-interior-eliminator/verify_total_css_interior_independence.py --check
```

## Field-by-field adjudication

| Candidate input | Exact status | Consequence for the proof target |
| --- | --- | --- |
| `hinside` plus local collision/singleton/packed data | Compatible with prior exact local models | Not a contradiction |
| `V ⊆ protectedDeletionSet R` | Compatible with regression A on the exact unique-four leaf | Not load-bearing alone |
| Total `CriticalShellSystem` | Compatible with regression B and a protected strict-interior singleton | Not a general MEC-boundary producer |
| No proper same-carrier K4 subcarrier | Exhaustively true in regression A | This consequence of minimality is not enough |
| Full `D.Minimal` | Not independently modeled because regression A lacks full-carrier K4 | Potentially useful only by producing a new, advancing deletion occurrence |
| Carrier-wide `D.K4` | Absent from both regressions | First common missing layer; neither necessity nor sufficiency is proved |

`D.Minimal` should not be credited as an independent eliminated input.  Its
quantification ranges over all finite planar carriers, so a finite coordinate
fixture cannot model it directly.  What the exhaustive scan shows is narrower:
the obvious attempt to contradict minimality using a proper K4 subcarrier of
the displayed carrier cannot distinguish the regression.

## Exact next theorem shape

The next theorem should not be another anonymous fresh center or another
conditional consumer.  The best isolated route is to use `D.K4` at additional
centers in the same physical cap as the fresh center and produce the exact
antecedent of an existing terminal.  A suitable mathematical target is:

```lean
freshTransition_strictInterior_sameCapOutsidePair_or_M44
    (R : OriginalUniqueFourResidual F)
    (T : FreshProtectedTransitionPacket R)
    (hinside : dist T.center (MEC.mec D.A S.hA).center <
      (MEC.mec D.A S.hA).radius) :
    (exists a second distinct center in T's ordered cap and two distinct
      points outside that cap which are co-radial from both centers) ∨
    (∃ U : SurplusCapPacket D.A, U.IsM44)
```

The first disjunct is consumed by
`CapSelectedRowCounting.outsidePair_unique_capCenter`; the second contradicts
`R.noM44` (or can be constructed via
`isM44Packet_of_capTriple_two_exact_of_card_gt_nine`).

At a finer source level, the first missing occurrence is:

1. choose a second carrier point `z` in the same strict cap as the fresh
   center using the cap cardinality already retained by the residual;
2. use `D.K4 z` to obtain a complete or selected four-row at `z`;
3. prove that this row contains two points of a fresh-center shell lying
   outside the common cap; and
4. feed the two centers and the repeated outside pair directly to
   `outsidePair_unique_capCenter`.

Step 3 is the new mathematics.  `D.K4 z` only supplies an anonymous row, so
the transition packet and total critical map do not currently force this
cross-membership.  Any future proposed proof must visibly establish that
membership (or build the full M44 packet); otherwise it has not advanced the
closure spine.

## Formalization decision

No Lean file was added.  The exact regressions invalidate the obvious
strict-interior eliminators, and no source-valid terminal antecedent was
proved.  Formalizing a theorem with the cross-membership as an assumption
would add another nonterminal adapter and was intentionally avoided.

The scripts are exact symbolic regression evidence.  They are not
kernel-checked Lean proofs and are labeled accordingly in both checkpoint
files.
