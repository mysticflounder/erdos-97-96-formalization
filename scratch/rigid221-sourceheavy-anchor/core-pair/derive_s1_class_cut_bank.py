"""Derive the S1 physically-bridged class-cut list for the exact-12 cell-6 surface.

Mirrors the Lean decidable check
``Problem97.ATailFrontierLiveClosure.ExactTwelveRigid221Ingress.witnessSameSideAll48``
(lean/Erdos9796Proof/P97/ATail/FrontierLiveClosure/
ExactTwelveRigid221PhysicalClassWitnessBridge.lean:89): a witness cut
``(z, p, q)`` is admissible when in EVERY canonical boundary order the
triples ``(1, p, z)`` and ``(1, q, z)`` carry one common cyclic
orientation (``WitnessSameSideAt``, ibid.:76, built on ``CyclicTripleAt``,
ExactTwelveRigid221OrderedCoreConsumer.lean:31).

The cut expansion enumerates, for each admissible ``(z, {p, q})``, every
candidate four-row at center ``z`` on the frozen cell-6 candidate surface
whose support hosts the pair.  Each such row is one full-row unit cut:
its Lean certificate is ``PhysicalClassPositiveNogood.ofCut`` with
``PhysicalClassCutData.witness z p q`` and the single ``RowChoice``
``(z, support)``; its CNF form is the single literal
``-(choice_variables[(z, candidate_index(z, support))])``.

Anchors re-checked against the recorded measurement of 2026-08-20
(docs/audits/2026-08-20-biapex-schema-formalization-notes.md):

- 60 ordered class triples, 28 admissible / 32 rejected;
- landmark ``(3, 0, 9)`` admissible, ``(8, 6, 9)`` rejected;
- 14 unordered admissible combos;
- 290 full-row cut instances in total, with the recorded per-combo
  distribution (the three combos ``(0, {6, 8})``, ``(0, {6, 9})``,
  ``(0, {8, 9})`` host zero candidate rows; ``(3, {0, 9})`` hosts 35;
  ``(6, {8, 9})`` and ``(9, {6, 8})`` host 28 each);
- the 290 instances collapse to 229 distinct hosted rows (28 rows host
  three admissible pairs, one hosts six); the emitted cut list carries
  one entry per distinct row, with the first admissible witness in combo
  order, so the CNF suffix has no duplicate unit clauses and stays
  byte-aligned with the Lean bank list.

Diagnostic derivation + manifest emission only; nothing here is a bank,
a certificate, or a wave.  The manifest feeds the v27 bank builder.
"""

from __future__ import annotations

import hashlib
import itertools
import json
import sys
from pathlib import Path

REPO_ROOT = Path(__file__).resolve().parents[3]
sys.path.insert(0, str(REPO_ROOT))

from census.card_head.exact12_v14_ordered_coverage import source_boundary_orders

APEX = 1
DELETED_LABEL = 0
V_LABEL = 3
CLASS_LABELS = (0, 3, 6, 8, 9)
PLACEMENT_INDEX = 1
ARM_CELL_INDEX = 6

EXPECTED_ORDERS = 48
EXPECTED_ADMISSIBLE_ORDERED = 28
EXPECTED_ADMISSIBLE_COMBOS = 14
EXPECTED_TOTAL_CUT_INSTANCES = 290
EXPECTED_DISTINCT_CUTS = 229
EXPECTED_DISTINCT_PER_CENTER = {0: 21, 3: 152, 6: 28, 9: 28}
EXPECTED_COMBO_ROWS = {
    (0, 3, 6): 7, (0, 3, 8): 7, (0, 3, 9): 7,
    (0, 6, 8): 0, (0, 6, 9): 0, (0, 8, 9): 0,
    (3, 0, 6): 35, (3, 0, 8): 35, (3, 0, 9): 35,
    (3, 6, 8): 36, (3, 6, 9): 36, (3, 8, 9): 36,
    (6, 8, 9): 28, (9, 6, 8): 28,
}


def cyclic_triple(position: dict[int, int], a: int, b: int, c: int) -> bool:
    """CyclicTripleAt (ExactTwelveRigid221OrderedCoreConsumer.lean:31)."""

    pa, pb, pc = position[a], position[b], position[c]
    return (pa < pb and pb < pc) or (pb < pc and pc < pa) or (pc < pa and pa < pb)


def witness_same_side(position: dict[int, int], z: int, p: int, q: int) -> bool:
    """WitnessSameSideAt (ExactTwelveRigid221PhysicalClassWitnessBridge.lean:76)."""

    return (
        cyclic_triple(position, APEX, p, z) and cyclic_triple(position, APEX, q, z)
    ) or (
        cyclic_triple(position, APEX, z, p) and cyclic_triple(position, APEX, z, q)
    )


def deck_orders() -> list[tuple[int, ...]]:
    orders = [tuple(order) for _orientation, order in source_boundary_orders()]
    if len(orders) != EXPECTED_ORDERS:
        raise SystemExit(f"deck order count {len(orders)} != {EXPECTED_ORDERS}")
    for order in orders:
        if sorted(order) != list(range(12)):
            raise SystemExit("deck order is not a permutation of the 12 labels")
    return orders


def witness_same_side_all(orders: list[tuple[int, ...]], z: int, p: int, q: int) -> bool:
    """witnessSameSideAll48 (ExactTwelveRigid221PhysicalClassWitnessBridge.lean:89)."""

    for order in orders:
        position = {label: index for index, label in enumerate(order)}
        if not witness_same_side(position, z, p, q):
            return False
    return True


def main() -> None:
    orders = deck_orders()

    admissible_ordered = []
    for z, p, q in itertools.permutations(CLASS_LABELS, 3):
        if witness_same_side_all(orders, z, p, q):
            admissible_ordered.append((z, p, q))
    if len(admissible_ordered) != EXPECTED_ADMISSIBLE_ORDERED:
        raise SystemExit(
            f"admissible ordered triples {len(admissible_ordered)} != "
            f"{EXPECTED_ADMISSIBLE_ORDERED}"
        )
    if (3, 0, 9) not in admissible_ordered:
        raise SystemExit("landmark (3, 0, 9) not admissible")
    if (8, 6, 9) in admissible_ordered:
        raise SystemExit("landmark rejection (8, 6, 9) admissible")

    combos = sorted(
        {(z, min(p, q), max(p, q)) for z, p, q in admissible_ordered}
    )
    if len(combos) != EXPECTED_ADMISSIBLE_COMBOS:
        raise SystemExit(
            f"admissible combos {len(combos)} != {EXPECTED_ADMISSIBLE_COMBOS}"
        )
    for z, p, q in combos:
        if (z, p, q) not in admissible_ordered or (z, q, p) not in admissible_ordered:
            raise SystemExit("combo lost p<->q symmetry against the ordered set")

    from census.card_head.candidate_surface import build_model
    from census.card_head.exact12_center_exchange_all_order_common_five_membership_family_bank import (
        candidate_rows,
    )
    from census.card_head.source_faithful_candidate_surface import (
        SOURCE_FAITHFUL_PYTHON_PROFILE,
        SourceFaithfulCoverInstance,
    )

    instance = SourceFaithfulCoverInstance(
        build_model(12, SOURCE_FAITHFUL_PYTHON_PROFILE)
    )
    for z in CLASS_LABELS:
        if tuple(instance.candidates[z]) != tuple(candidate_rows(z)):
            raise SystemExit(
                f"instance candidates at center {z} differ from the frozen "
                "bank surface candidate_rows"
            )

    combo_rows: dict[tuple[int, int, int], int] = {}
    instances = 0
    chosen: dict[tuple[int, int], dict] = {}
    for z, p, q in combos:
        hosting = [
            (index, candidate)
            for index, candidate in enumerate(instance.candidates[z])
            if p in candidate and q in candidate
        ]
        combo_rows[(z, p, q)] = len(hosting)
        instances += len(hosting)
        for index, candidate in hosting:
            key = (z, index)
            if key in chosen:
                chosen[key]["hosted_witnesses"].append(
                    {"z": z, "p": p, "q": q}
                )
                continue
            variable = instance.choice_variables[(z, index)]
            chosen[key] = {
                "witness": {"z": z, "p": p, "q": q},
                "hosted_witnesses": [{"z": z, "p": p, "q": q}],
                "center": z,
                "support": list(candidate),
                "candidate_index": index,
                "choice_variable": variable,
                "learned_clause": [-variable],
            }
    cuts = [chosen[key] for key in sorted(chosen)]

    if combo_rows != EXPECTED_COMBO_ROWS:
        raise SystemExit(
            f"combo row distribution {combo_rows} != recorded "
            f"{EXPECTED_COMBO_ROWS}"
        )
    if instances != EXPECTED_TOTAL_CUT_INSTANCES:
        raise SystemExit(
            f"cut instances {instances} != {EXPECTED_TOTAL_CUT_INSTANCES}"
        )
    if len(cuts) != EXPECTED_DISTINCT_CUTS:
        raise SystemExit(
            f"distinct cuts {len(cuts)} != {EXPECTED_DISTINCT_CUTS}"
        )
    per_center: dict[int, int] = {}
    for cut in cuts:
        per_center[cut["center"]] = per_center.get(cut["center"], 0) + 1
    if per_center != EXPECTED_DISTINCT_PER_CENTER:
        raise SystemExit(
            f"distinct-per-center {per_center} != "
            f"{EXPECTED_DISTINCT_PER_CENTER}"
        )
    if len({tuple(c["learned_clause"]) for c in cuts}) != len(cuts):
        raise SystemExit("distinct cuts still carry duplicate clauses")

    deck_sha = hashlib.sha256(
        json.dumps([list(order) for order in orders]).encode()
    ).hexdigest()
    manifest = {
        "schema": "p97_rigid221_exact12_s1_class_cut_manifest.v1",
        "placement_index": PLACEMENT_INDEX,
        "arm_cell_index": ARM_CELL_INDEX,
        "apex_label": APEX,
        "deleted_label": DELETED_LABEL,
        "v_label": V_LABEL,
        "class_labels": list(CLASS_LABELS),
        "deck_orders_sha256": deck_sha,
        "instance_base": {
            "n_variables": instance.base_n_variables,
            "n_clauses": instance.base_n_clauses,
        },
        "admissible_ordered_triples": [list(t) for t in admissible_ordered],
        "admissible_combos": [list(t) for t in combos],
        "combo_row_counts": {
            f"{z},{p},{q}": count for (z, p, q), count in sorted(combo_rows.items())
        },
        "cut_instances": instances,
        "cuts": cuts,
    }
    out_path = Path(__file__).resolve().parent / "s1_class_cut_manifest_v1.json"
    out_path.write_text(json.dumps(manifest, indent=1) + "\n")
    print(f"admissible ordered: {len(admissible_ordered)}")
    print(f"admissible combos: {len(combos)}")
    print("combo rows:", {k: v for k, v in sorted(combo_rows.items())})
    print(f"cut instances: {instances}; distinct cuts: {len(cuts)}")
    print(f"deck sha256: {deck_sha}")
    print(f"wrote {out_path}")


if __name__ == "__main__":
    main()
