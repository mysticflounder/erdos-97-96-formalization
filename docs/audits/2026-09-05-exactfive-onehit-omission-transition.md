# Exact-five one-hit omission transition

The target remains
`Problem97.ATailFrontierLiveClosure.false_of_exactFiveDistinct_threeCenter_distinctFresh_physical`.
This lane tests omission-to-replacement before assuming a decreasing measure.
It introduces no production admission or caller edge.
Lane base: `567b1fc52f360ef8ef49641581c42634811fe868`.

## Source transition

Write `q,w` for the endpoints, `f` for the strict fresh source, and
`K = (H.selectedAt f hf).toCriticalFourShell`. Set `c = H.centerAt f hf`.
If `q` is omitted by `K`, deletion of `q` survives at `c`, by
`ATailCriticalPairFrontier.cross_deletion_survives_iff_not_mem_selected_support`.
The fresh three-row packet gives survival after deleting `f` at the second
apex `V`, so `c ≠ V` by `H.no_qfree_at f hf`. Membership of `c` in the
carrier comes from `K.center_mem`; survival after deleting `q` at `V` comes
from the original pair. `nonempty_commonDeletionTwoCenterPacket` therefore
produces a packet deleting `q`, centered at `c,V`. It does not delete `f` or
identify the old blocker with `c`. The endpoint-swapped case uses the same
argument. This bridge was separately checked by Lean LSP in the source audit.

For fixed `H`, the new packet lacks the old consumer's endpoint orientation.
In the **one-hit** case `w ∈ K.support`, changing the selected shell system
repairs that orientation. The retained
[Lean prototype](../references/exactfive-source-geometry-2026-09-05/OneHitShellReselection.lean)
proves:

- `exists_reselection_of_mem_support`: a system `H'` chooses `c` at `w`,
  preserves the chosen center at every other source, and selects exactly
  `K.support` at `w`;
- `exists_reselection_of_one_hit`: with `q` omitted, its chosen center
  remains unchanged and differs from the new chosen center at `w`.

The bounded indexed reuse preflight found
`CriticalSelectedFourClass.exists_of_exactSelectedClass` and
`CriticalShellSystem.overrideAt` in `U1CarrierInjection.lean` (corpus source
`e170e38ad`); the source signatures were inspected separately. Membership of
`w` makes deleting `w` fail at `c`, supplying the necessary override premise.
The full support identity prevents an unnoticed row change. Neither new
theorem calls an open physical consumer.

For **zero hits**, deleting either endpoint survives at `c`. No
critical-shell system can choose `c` as either endpoint's blocker: its
`no_qfree` field would contradict that survival. Switching `H` does not
repair this case.

The pair witness and joint second-apex deletion are independent of `H`.
Source inspection identifies `ofInteriorPair` as the reconstruction API for
the same `q,w` under `H'`; the minimum-chord inequality has the same inputs
and conclusion after this reconstruction. The source owner has drafted a
`MinimalAdmissibleInteriorPair.rebase` API and both oriented residual rebuilds.
Those production edits await validation and are not part of the checked
prototype. No existing residual is cast across a change of `H`.

## Progress test

Keeping the pair preserves its chord and first-apex radius. The carrier,
first-apex class, and row sizes also stay fixed. Another admissible pair in
the same family has chord at least the minimum; finding a shorter admissible
pair would already give a direct contradiction. These quantities do not
decrease under the checked transition.

The [finite incidence control](../references/exactfive-source-geometry-2026-09-05/onehit_incidence_cycle.py)
uses five anchors `E = {q,w,e1,e2,e3}` and these rows:

| Center | Four-point support |
| --- | --- |
| `O` | `{w,e1,e2,e3}` |
| `V` | `{e1,e2,a,d}` |
| `U` | `{w,x,a,b}` |
| `C` | `{w,f,d,g}` |
| `T` | `{q,e1,b,g}` |

Partial choices start as `q ↦ T`, `w ↦ U`, `f ↦ C`, `x ↦ U`.
Every named source occurs in its chosen row; centers avoid their own rows;
pairwise intersections have size at most two. The second-apex row omits
both endpoints and both fresh sources. First, `f` avoids `E` and the rows
at `O,U,V`; its row at `C` omits `q` and contains `w`, permitting `w ↦ C`.
Then `x` avoids `E` and the rows at `O,C,V`; its row at `U` permits `w ↦ U`.
All other choices are unchanged. The entire recorded state returns after
two steps. Parent and independent replays checked every listed incidence
condition and that final state identity.

**EMPIRICALLY VERIFIED, local incidence only:** this is not a Euclidean
realization, total critical-shell system, or minimal counterexample. The
control does not check distances, convexity, cap placement, full radius
classes, global K4, or global minimality. It rules out a strict decrease
justified solely by these local row conditions, not a geometric no-return
theorem under the full physical hypotheses.

The precise immediate-return obstruction is
`x ∈ B_U \ ((E.erase q) ∪ K.support ∪ L)` with chosen blocker `U`.
Such an `x` is eligible as the next strict fresh source and can restore the
old blocker at `w`. One sufficient exclusion would be a source-derived cover
`B_U ⊆ (E.erase q) ∪ K.support ∪ L`; the local control fails that cover at
`x,b`. No geometric cover is claimed. A sound fresh-selection rule or a
geometric path invariant could serve instead, but must prove its own
existence and progress. This is the next mathematical target.

## Validation

The parent and independent reviewer replayed the complete Lean prototype
using `lean_run_code`, importing only `ATail.CriticalPairFrontier`. Both
replays succeeded without warnings or timeouts. Literal `#print axioms` for
both declarations returned only `propext`, `Classical.choice`, `Quot.sound`.
No aggregate build, live integration, or publication-spine binding is claimed.

```bash
uv run --no-cache --no-sync python docs/references/exactfive-source-geometry-2026-09-05/onehit_incidence_cycle.py
```

The replay reports `center_cycle = [U,C,U]`,
`partial_choices_restored = true`, and `return_candidates = [b,x]`.

| Captured source | SHA-256 |
| --- | --- |
| Lean prototype | `01ddf50665622b77c9a7e0ab06c1e4c31f2284dbe2ea775633187a1fa0c31c1c` |
| Incidence replay | `3ba72382da2b9428ec59f9e957a634801ccaf3470c499b36ee25e1cc3736c46a` |
| `ATail/CriticalPairFrontier.lean` | `2b2b381d0833292df28a1fd9d0316999a221623a23ed0cdb5f97c7f98547b959` |
| `U1CarrierInjection.lean` | `0763edd41bef51f9b5ca0c7d98d3178efdbe45f7ad130c723e672f6671379fc2` |
