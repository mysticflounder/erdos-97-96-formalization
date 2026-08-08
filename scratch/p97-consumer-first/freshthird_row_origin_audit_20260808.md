# FreshThird SelectedFourClass row-origin audit (2026-08-08)

Scope: `TwoSourceFreshThirdResidual.lean:3365-3474`,
`freshthird_cross_deletion_cegar_20260807.py`, and
`freshthird_cross_row_kalmanson_universal_20260808.py`.

The Lean anchor `false_of_freshThird_pinnedEndpoint_outsideSeedResidual` is
still unproved (`sorry` at line 3474).  It normalizes `hterminal` to one
escaping row `Row : SelectedFourClass D.A center` with a
`SourceFaithfulSelectedFourDeletionFan`; the off-endpoint branch gives this
fan on an existential `K`, while the endpoint branch gives it on `DRow`.
The separately supplied existential `hrow` and explicit `hrowAt ... DRow
rowCap` have no equality/provenance link.

## Row origins and required guards

| origin | center / support representation | source-level guard |
|---|---|---|
| source | `H.selectedAt C.surface.firstSource` converted with `toCriticalFourShell.toSelectedFourClass`; center `sourceCenter`; script shell `SOURCE_SHELL = (qOutside,qBetween,canonicalSource,c2)` | exact four-shell and `overlap_eq`; source center in strict `S.oppIndex1` cap (plus source/fresh centers distinct). |
| fresh | `H.selectedAt Q.source₁` converted likewise; center `freshCenter`; `FRESH_SHELL = (qOutside,qBetween,f1,f2)` | exact four-shell/overlap; fresh center in strict non-first `freshCap`, `freshCap ≠ S.oppIndex1`; source/fresh centers distinct. |
| pinned (escaping) | the row `Row` returned by `exists_escaping_sourceFaithfulRow_of_endpoint_split`; script support `ROW=(w0,w1,w2,w3)`, center `pinnedCenter` | `hterminal` (outside-seed support point and `SourceFaithfulSelectedFourDeletionFan`), center localization/seed and center inequalities; no repeated-cap or mutual-pair guard is intrinsic to this row. |
| DRow (endpoint row) | explicit `DRow : SelectedFourClass D.A (B.boundary id)`; script support `DROW=(e0,e1,e2,e3)` | `hrowAt` (the four ordered endpoint arms), endpoint `id=qBetween` or `qOutside`, `rowCap` membership, `rowCap ≠ first`, `|DRow∩cap|≤2`, `|DRow\cap|≥2`; it is not hfan-provided in the off-endpoint `hterminal` arm. |
| canonical blocker | for each `w∈Row.support`, `H.selectedAt w` converted to `toCriticalFourShell.toSelectedFourClass`; center `b_z=H.centerAt w`; support `(w,a_z0,a_z1,a_z2)` | hfan supplies a strict blocker-cap witness, deletion obstruction, and equal-center/exact-support or distinct-center/overlap≤2 dichotomy. This is an individually source-entitled row once hfan is assumed. No mutual witness is needed. |
| hfan one-way materialized survivor | existential `Kz/Kw : SelectedFourClass` at `b_z/b_w` from a surviving cross deletion; script support `cross_slots[a,b,0..3]`, excluding opposite deleted source and center | `cross_survive[a,b]`; this is valid only under the active repeated-cap pair (`cross_active[z,w]`, same blocker cap, and the source disjunction allowing one direction). In the script, inactive pairs force survival false, so the directional guard implies the active-cap guard. |
| hmutual two-way materialized survivor | existential rows at `b_z,b_w` from the mutual producer; support `mutual_slots[a,b,0..3]`, each excluding the opposite deleted source and its center | `mutual_survive[z,w]` and `mutual_survive[w,z]`, with independent `mutual_active[z,w]` and distinct blocker centers. No same-cap identification is licensed. |

## Guard audit of `triangle_union`

The script attaches guards to materialized rows (`cross_survive` or
`mutual_survive`) but leaves canonical blocker descriptors unguarded
(`freshthird_cross_row_kalmanson_universal_20260808.py:73-86`).  That is
source-faithful if the enclosing hfan is already fixed: each canonical
`H.selectedAt w` row exists for every support point and has its own
one-hot `blocker_cap[z,k]` in the base model.  It should not be replaced by a
mutual guard, nor by the active repeated-cap pair, merely to make the row
exist.

The pair guard at lines 96-108 is a *consumer-selection* guard for a
same-cap/mutual blocker pair, not a row-origin guard.  As written it drops
every triple containing exactly one blocker (`blocker_ids` nonempty but no
pair, so `continue`).  Such triples are valid row triples whenever the other
two rows are source/fresh/pinned/DRow: one canonical blocker is a legitimate
selected four-row and needs only its individual hfan blocker-cap/deletion
packet.  The same code also overrestricts triples of three canonical blockers
by requiring a guard for every pair although the producers provide only one
repeated-cap pair and one independent mutual pair.

Therefore: canonical rows need no active mutual guard; an active cap witness
is intrinsic per blocker (and is present in the hfan packet).  Active
same-cap/mutual guards are required only when claiming the corresponding
*pair-produced* cross rows or a consumer lemma whose hypotheses explicitly
use that pair.  The current `blocker_guard` should not be used to decide
whether a one-blocker triple is source-entitled.
