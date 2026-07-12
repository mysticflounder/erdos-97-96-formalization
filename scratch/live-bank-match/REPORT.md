# LIVE-BANK-MATCH — leaf → sibling-bank ordinal map (2026-07-12)

Action #1 of `docs/audits/2026-07-12-ka-route-scoping.md`. Machine-readable
map from every open K-A-LIVE leaf of
`lean/Erdos9796Proof/P97/U1LargeCapRouteBTail.lean` (committed snapshot
`routeBTail_HEAD.lean` @ a317dc80, 5475 lines) to the 18 unimported sibling
`p97-rvol` U1 consumers (commit 3380775e, ordinals {2,12,40,47,88,136,169,206};
8 `cert_*_false_of_row_slot_packet` + 10
`cert_*_branch_*_false_of_all8_slot_metric_core`, per the census
`certificates/p97_rvol_general_n_mining.md` "Unimported Contradiction
Consumers"). Pure text/analysis run: no Lean edits, no builds.

## Headline verdict: NEGATIVE — terminal

**No open K-A-LIVE leaf closes from any of the 18 bank consumers.**
1,422 (leaf, consumer) pairs: 0 MATCH, 18 PARTIAL, 1,404 NO-MATCH.
Every PARTIAL sits at the single leaf `LIVE-C-t2-named` (:5187); no pair
gets past 3 of 15 required metric rows, and the packet precondition is
unconstructible at every leaf. The registry note ("consumers only; no
placement/equality producer exists") is confirmed field-by-field.

## Encoding validation gate: PASS (mandatory precondition — met)

Pipeline re-derives ground truth on the 24 closed LIVE-T1 polarity branches
(closed in-file by `hfalse_of_*` lemmas at :3970–4002) and stays consistent
on the 79 open leaves (`gate_result.json`):

| Gate | Result |
|---|---|
| G1 closed branches re-derive a contradiction | 24/24 |
| G2 contradiction pair equals the closing lemma's pair (q~t1 / t1~t1row[0] / t1~t2 / t1~t3) | 24/24 |
| G3 open leaves consistent (no spurious contradiction) | 79/79 |
| G4 f2-row support {q,t1,t2,t3} re-derived from case atoms at all Q/T1/T3 leaves | 72/72 |

Bank-side cross-check also passed: all 18 census statements match the sibling
source text at the recorded path:line (binder-by-binder), and every binder
parsed (0 unparsed).

## What the comparison actually measured

Consumer surface (all 18, from `bank_surfaces.json`): `hfixed :
U3FixedTriplePacket D baseQ baseP baseT1 baseT2 baseT3` + `packet :
RowSlotLabelPacket` + metric rows **centered at the packet labels
{f1,q,t1,t2,t3}** — 15 `hrow_*` for the row_slot_packet kind; 8
`AllEightSlotMetricCore` slot facts (centers f1,q,t1) + 7 residual `hrow_*` +
11 record001-branch-0 slot placements for the all8 kind. **No consumer uses a
p-centered row.**

Leaf surface (all 79, from `leaf_packets.json`): the only unconditional
centered metric rows are **p-centered** at every LIVE-Q/T1/T3 leaf (hfixed's
{q,t1,t2,t3} @ p; the pinned f2 row @ p; the case-pinned q/t1/t3 blocker row
@ p), and exactly **one** non-p center at each LIVE-C leaf (= the branch's
center label, members unpinned except at `LIVE-C-t2-named`). Instantiation
freedom granted: baseP:=p, baseQ:=q, selectedU:=u (forced), all 6
permutations of (t1,t2,t3), free packet slot choices f2..f5 over the 20
row-slot terms (excluding provable packet-distinctness violations).

## Per-family result

| Family | leaves | pairs | MATCH | PARTIAL | NO-MATCH | blocking axis |
|---|---:|---:|---:|---:|---:|---|
| LIVE-Q (:3657–3943) | 24 | 432 | 0 | 0 | 432 | only p-centered rows available; all consumer atoms center on {f1,q,t1,t2,t3} |
| LIVE-T1 (:4103–4717) | 24 | 432 | 0 | 0 | 432 | same; the leaf's placements (q/tB = t1row[0], t1 = t2row[0]) hit none of the consumers' slot pins |
| LIVE-T3 (:4791–5163) | 24 | 432 | 0 | 0 | 432 | mirror of T1 |
| LIVE-C (:5180–5191) | 7 | 126 | 0 | 18 | 108 | one non-p center exists but members are unpinned except at t2-named |

Zero atoms are derivable at 78 of 79 leaves.

## Closest-miss analysis (the only leaf with any overlap)

`LIVE-C-t2-named` (:5187; hypotheses `hcenter_t2 : f2CriticalRow.center = t2`
plus `hf5_named/hp_named/hq_named` from
`f2CriticalRow_all_named_or_t2ResidualHRowFailure`) supplies one t2-centered
shell containing {t2row[0], t2row[1], p, q}. With slot choices
f2:={t2,0}, f5:={t2,1} this derives the consumers' entire t2-centered
residual block and nothing else:

- ord 002 / 088: 3/15 hrows — `t2(f5=f2)`, `t2(p=f2)`, `t2(q=f2)` ✔;
  **missing:** all 12 hrows centered f1/q/t1/t3 (no such centered row at the
  leaf), packet distinctness (28 unprovable pairs at best σ).
- ord 012: 3/15 (`t2(f3=f2)`, `t2(p=f2)`, `t2(q=f2)`); ord 040/136/169/206:
  2/15; ord 047: 1/15 — same missing axis.
- all8 consumers: 1/23 atoms (one `hslot_t1_*` field re-instantiated via the
  permutation baseT1:=t2); **missing:** the other 7 AllEightSlotMetricCore
  fields, all residual hrows, and all 11 placements
  (`f1=q-row[0]`, `q=t1-row[2]`, `p=f1-row[3]`, ... — no leaf pins any of
  these; T1/T3 leaves pin only `X = t1/t3-row[0]` with X ∈ {q,t2,t3} and
  `t1/t3 = t2-row[0]`, always the wrong label or wrong slot).

## Why the block is structural, not a near-thing

1. **Center mismatch (the COMP-1 axis).** Every consumer requires rows
   centered at the packet source labels themselves. The live
   `CriticalSourceRows` rows are deletion-critical **blocker** shells:
   `CriticalSourceRows.rowAt_center_ne_sourcePoint`
   (U1Depth5Prefix.lean:1528) and `RowSlotLabelPacket.sourceCenter_ne`
   (:2552) prove the natural producer identification false. The sibling repo
   records the identical obstruction on its own
   `allEightSlotMetricCore_of_sourceCenterEq` (p97-rvol
   U1Depth5Prefix.lean:2769 block): "only a consumer for a different future
   surface with packet-label-centered K4 rows".
2. **Packet unconstructibility.** `RowSlotLabelPacket.labels_pairwise` needs
   provable 10-label distinctness. At every leaf the provable disequalities
   are the base-six pairs, within-row slot pairs, and (T1-neg) one polarity
   pair; the 24 base-vs-chosen-slot cross pairs are never provable, and any
   slot resolving to a base point (e.g. t2row[0] = q/t1/t3 at Q/T1/T3) is
   provably violating.
3. Even granting the packet, at most one of the five required centers exists
   per leaf (LIVE-C only), so ≥ 12 of 15 (resp. ≥ 22 of 23) atoms stay
   unproducible at every leaf under every allowed instantiation.

A Lean wiring of any bank consumer therefore needs, at minimum, a new
producer theorem yielding packet-label-centered K4 rows at q, t1, t2, t3 and
u simultaneously plus a distinctness producer for four fresh manifest labels
— i.e. exactly the OPEN-RESEARCH incidence/confinement content the audit
names for the card ≥ 12 residual, not an existing bank statement.

## Files

- `routeBTail_HEAD.lean` — frozen input snapshot (git show HEAD, a317dc80)
- `extract_bank.py` → `bank_surfaces.json` (18 consumers, parsed field-by-field,
  source-text cross-checked)
- `extract_leaves.py` → `leaf_packets.json` (79 open + 24 closed-gate leaves,
  every fact with provenance; structural assertions against the snapshot)
- `leafmodel.py` — shared equality-closure model
- `gate.py` → `gate_result.json` (PASS)
- `compare.py` → `match_matrix.json` (1,422 pair verdicts with exact missing
  fields and best instantiation each)

Scope notes: `certificates/erdos97_legacy_general_n_mining.json` and
`certificates/erdos_general_theorem_p97_mining.json` contain no row-slot /
slot-metric consumers (searched by name and by statement text), so the 18
sibling consumers are the complete candidate set. Ordinal 001's analogues
already live in this repo (`U1Depth5SourceUnitQT3Ordinal001.lean`) and share
the identical consumer shape, so a port of the other 8 ordinals would change
nothing about the negative map. The 19th unimported entry
(`u1TwoLargeCapObstruction`) is a different family (K-A-PAIR side) and is
out of scope per the dispatch.
