# Equal-blocker full-parent gate — initial checkpoint

Date: 2026-07-19

## Decision

`NOT_RUN`.  The first active target is the exact full-parent implication

```lean
M : FullParentExactFiveMutualData L profile
Q : FullParentMutualEqualBlockerShell M
⊢ False
```

The gate manifest and checker are now in place, but no complete parent model
has been encoded.  This is intentional: the existing equal-blocker reports
are all retained-subsystem regressions and do not contain enough information
to decide the implication.

## Required ledger

The manifest requires the complete `D`/`S`/`H`/`F0`/`R`/`B`/`L` packet,
source-faithful equal-blocker provenance, strict convex order, MEC/cap
geometry, complete exact-radius filters, all-center K4, every
`H.no_qfree_at`, minimality, global `noM44`, both cap-six bounds, and the
deletion/restoration fields.  A decisive status is rejected unless all of
these fields are present.

## Current evidence

The four cited reports remain `RELAXATION_ONLY`:

* `global-mutual-equal-blocker-terminal` identifies the missing
  source-faithful same-cap or ordered-row producer.
* `critical-fiber-closing-core-samecap` identifies `ParentSameCapRoute` as
  the exact same-cap antecedent and supplies a projection-level regression.
* `critical-fiber-closing-core-ordered` records the missing support-membership
  and cyclic-order fields for the ordered terminal.
* `global-mutual-third-source-producer` shows that a third row is not forced
  by the current finite projection.

The first reusable numerical artifact has now been replayed through the gate:
`full-parent-t0t1-exact-model/exact-source-faithful-full-cell.json` passes its
exact rational verifier (26 points, coordinate digest
`ed4d4520d0b0a00e775ba05fe71cfacc1f2ccf2c4fc1dab65ec42d7294e59d8a`).  It is
still only a local cell: total K4, total critical-map provenance, global
minimality, and `noM44` are absent.  The result is therefore recorded as
`RELAXATION_ONLY` in `preflight.result.json` and does not weaken or refute the
parent target.

No source `sorry` is closed by this checkpoint.  The next allowed result is a
substitution-checked full-parent witness, a checked UNSAT certificate for
this exact branch, or an explicit `UNKNOWN`/timeout outcome.

## 2026-07-20 field audit against the disjoint 26-point witness

The exact replay was repeated from the checked rational certificate.  It
passes as the advertised *local all-reverse cell*.  It is not an instance of
`FullParentExactFiveMutualData`: its displayed physical rows are the
all-reverse orientation, whereas the `pair` field of that structure requires
two physical vertices whose selected rows omit one another.

The following table records every full-parent ingredient that matters to the
comparison.  `Present` means represented by the exact replay, not merely
suggested by its numerical discovery run.

| Full-parent field | In 26-point replay? | Result of the audit |
| --- | --- | --- |
| strict convex order, support-triangle MEC/caps | Present | Satisfied locally. |
| exact-five profile and both cap-six bounds | Present | Satisfied locally (cap sizes `(11,10,8)`). |
| retained frontier split and source-faithful continuation | Present locally | Satisfied for the named T0/T1 and unused-row data. |
| mutual-omission `pair` | No | The displayed three physical rows are all-reverse; no total row map is supplied. |
| `D.K4` at every source | No | The exact report has K4 only at the six named centers `o`, `right`, `left`, `c0`, `c1`, `c2`; the other 20 vertices have maximum radius multiplicity one. |
| total `CriticalShellSystem` and every `no_qfree_at` | No | In particular, there are no deletion-critical selected rows at the frontier sources. |
| `R.minimal` | No | It cannot even be posed for this witness as `CounterexampleData`, because global K4 fails. |
| `R.noM44` | Undecided | The displayed support triangle is non-M44, but alternate support triangles were not audited. |
| full filters / deletion restoration outside named rows | No | Only the named local filters and deletion checks were replayed. |

Thus `D.K4` is already a decisive **rejection of this relaxation witness**,
and the missing total critical system is a second independent rejection.  It
does **not** prove the universal implication

```lean
FullParentExactFiveMutualData L profile → False
```

because a failure of a field in one object outside the antecedent supplies no
contradiction for objects satisfying the antecedent.  Formalizing
``the 26-point replay is not K4`` would be a correct model-audit theorem but
would not feed the parent consumer and must not be wired as a purported
closure proof.

The audit therefore leaves the mutual arm `OPEN`, with one precise next
producer requirement: use the *total* `CriticalShellSystem` together with
global K4/minimality to derive a positive shared-member, same-cap, or ordered
third-row incidence from `M.pair`.  Those are the antecedents of the existing
`MutualShellPairSharedMember` terminals.  No existing banked theorem produces
that incidence from the full-parent packet, and the local all-reverse witness
cannot test it.

Validation:

```text
UV_CACHE_DIR=/tmp/p97-uv-cache uv run python \
  scratch/atail-force/equal-blocker-full-parent-gate/check_manifest.py \
  --manifest scratch/atail-force/equal-blocker-full-parent-gate/manifest.json
=> status NOT_RUN; all parent ledger fields missing (fail-closed)
```
