#!/usr/bin/env python3
# Copyright (c) 2026 Adam McKenna. All rights reserved.
# Released under Apache 2.0 license as described in the file LICENSE.
# Author: Adam McKenna <adam@mysticflounder.ai>

"""Match pure cyclic-order/equality lemmas from the /opt/nfs geometry ledger.

The ledger contains many results whose applications need cap colors, inferred
fronts, endpoint groups, or a finite six-center classifier.  This pass is
deliberately narrower: it records only lemmas whose displayed conclusion is a
contradiction from distinct strict-convex vertices, their cyclic order, and
equal-distance relations.  Those are exactly the facts present in a banked
555/654 row core after taking transitive equality closure.

The output is theorem-discovery evidence.  These prose lemmas are not Lean
declarations, and a hit still needs a kernel-checked theorem plus a carrier
adapter before it can be used in production.
"""
from __future__ import annotations

import argparse
import hashlib
import importlib.util
import json
import sys
from collections import Counter
from dataclasses import dataclass
from itertools import combinations
from pathlib import Path


REPO = Path(__file__).resolve().parents[2]
HELPER_PATH = REPO / "scratch/555-654-general-theorem-mining/mine_existing_equality_cores.py"
BANK_PATH = (
    REPO
    / "scratch/atail-force/unique-row-producer"
    / "card_five_interior_shadow_search.py"
)


def load_module(name: str, path: Path):
    spec = importlib.util.spec_from_file_location(name, path)
    if spec is None or spec.loader is None:
        raise RuntimeError(f"cannot load {path}")
    module = importlib.util.module_from_spec(spec)
    sys.modules[name] = module
    spec.loader.exec_module(module)
    return module


helper = load_module("existing_555_654_miner", HELPER_PATH)

RoleEdge = tuple[str, str]


@dataclass(frozen=True)
class GeometryTemplate:
    name: str
    ledger_result: str
    cyclic_roles: tuple[str, ...]
    equality_groups: tuple[tuple[RoleEdge, ...], ...]


def group(*edges: str) -> tuple[RoleEdge, ...]:
    return tuple((item[0], item[1]) for item in edges)


TEMPLATES = (
    GeometryTemplate(
        "lemma68_equilateral_corner_distinct_fronts", "Lemma 68",
        tuple("WFPADQG"),
        (group("WF", "WP", "WQ", "WG", "PA", "PQ", "QD"),),
    ),
    GeometryTemplate(
        "lemma68_equilateral_corner_coincident_fronts", "Lemma 68",
        tuple("WFPAQG"),
        (group("WF", "WP", "WQ", "WG", "PA", "PQ", "QA"),),
    ),
    GeometryTemplate(
        "lemma78_mutual_shared_equilateral_front", "Lemma 78",
        tuple("PAZGSWF"),
        (group("PA", "PZ", "PS", "PW", "WF", "WZ", "WG"),),
    ),
    GeometryTemplate(
        "lemma79_outer_ordered_shared_leak_kite", "Lemma 79",
        tuple("PAZGSWX"),
        (
            group("PA", "PZ", "PS", "PW", "ZX"),
            group("WZ", "WG", "WX"),
        ),
    ),
    GeometryTemplate(
        "lemma81_front_before_isosceles", "Lemma 81",
        tuple("WFPXZ"),
        (group("WF", "WX", "WZ"), group("PZ", "XZ")),
    ),
    GeometryTemplate(
        "lemma113_internal_diagonal_case1", "Lemma 113(1)",
        tuple("PZQSW"),
        (group("PZ", "PS", "PW"), group("WQ", "WS")),
    ),
    GeometryTemplate(
        "lemma113_internal_diagonal_case2", "Lemma 113(2)",
        tuple("PZSQW"),
        (group("PZ", "PS", "PW"), group("ZS", "ZQ")),
    ),
    GeometryTemplate(
        "lemma118_four_isosceles_hexagon", "Lemma 118",
        tuple("ABCDEF"),
        (group("AE", "AF", "EC"), group("BD", "BF", "DC")),
    ),
    GeometryTemplate(
        "lemma120_ordered_shell_interloper_w_centered", "Lemma 120(a)",
        tuple("PUQVW"),
        (group("PU", "PV", "PW"), group("WQ", "WV")),
    ),
    GeometryTemplate(
        "lemma120_ordered_shell_interloper_q_centered", "Lemma 120(b)",
        tuple("PUQVW"),
        (group("PU", "PV", "PW"), group("QV", "QW")),
    ),
    GeometryTemplate(
        "lemma132_bracket_d_centered", "Lemma 132(a)",
        tuple("PUDVQW"),
        (group("PU", "PV", "PW"), group("DV", "DQ")),
    ),
    GeometryTemplate(
        "lemma132_bracket_q_centered", "Lemma 132(b)",
        tuple("PUDVQW"),
        (group("PU", "PV", "PW"), group("QD", "QV")),
    ),
    GeometryTemplate(
        "lemma132_bracket_d_eq_u_d_centered", "Lemma 132(a), D=U",
        tuple("PUVQW"),
        (group("PU", "PV", "PW"), group("UV", "UQ")),
    ),
    GeometryTemplate(
        "lemma132_bracket_d_eq_u_q_centered", "Lemma 132(b), D=U",
        tuple("PUVQW"),
        (group("PU", "PV", "PW"), group("QU", "QV")),
    ),
    GeometryTemplate(
        "lemma132_bracket_q_eq_w_d_centered", "Lemma 132(a), Q=W",
        tuple("PUDVW"),
        (group("PU", "PV", "PW"), group("DV", "DW")),
    ),
    GeometryTemplate(
        "lemma132_bracket_q_eq_w_q_centered", "Lemma 132(b), Q=W",
        tuple("PUDVW"),
        (group("PU", "PV", "PW"), group("WD", "WV")),
    ),
    GeometryTemplate(
        "lemma132_bracket_both_endpoints_d_centered", "Lemma 132(a), D=U and Q=W",
        tuple("PUVW"),
        (group("PU", "PV", "PW"), group("UV", "UW")),
    ),
    GeometryTemplate(
        "lemma132_bracket_both_endpoints_q_centered", "Lemma 132(b), D=U and Q=W",
        tuple("PUVW"),
        (group("PU", "PV", "PW"), group("WU", "WV")),
    ),
    GeometryTemplate(
        "lemma149_seven_point_equal_distance_chain", "Lemma 149",
        tuple("ABCFDEG"),
        (
            group("GA", "GB", "GD", "BD", "DC"),
            group("AD", "AE"),
            group("CE", "CF"),
        ),
    ),
    GeometryTemplate(
        "lemma154_five_point_equilateral_front", "Lemma 154",
        tuple("ABCDG"),
        (group("AB", "BC", "BD", "AC"), group("AD", "AG")),
    ),
    GeometryTemplate(
        "lemma167_outer_front_equal_endpoint", "Lemma 167(a)",
        tuple("ABGPCQD"),
        (group("AP", "AC", "PG"), group("CQ", "CD", "QB", "QD")),
    ),
    GeometryTemplate(
        "lemma167_outer_front_after_endpoint", "Lemma 167(b)",
        tuple("ABGPCQDH"),
        (group("AP", "AC", "PG"), group("CQ", "CD", "QB", "QH")),
    ),
    GeometryTemplate(
        "lemma171_seven_point_front_gap", "Lemma 171",
        tuple("APCKQHD"),
        (
            group("AP", "AC", "PQ"),
            group("CQ", "CD", "QH", "QK"),
            group("DA", "DC"),
        ),
    ),
)


def cyclic_assignments(order: tuple[int, ...], roles: tuple[str, ...]):
    """Yield every injective assignment realizing the displayed cyclic order."""
    count = len(order)
    width = len(roles)
    seen: set[tuple[int, ...]] = set()
    for oriented in (order, tuple(reversed(order))):
        for start in range(count):
            for offsets in combinations(range(1, count), width - 1):
                values = (oriented[start],) + tuple(
                    oriented[(start + offset) % count] for offset in offsets
                )
                if values in seen:
                    continue
                seen.add(values)
                yield dict(zip(roles, values, strict=True))


def mapped_edge_root(closure, assignment: dict[str, int], item: RoleEdge):
    return closure.find(helper.edge(assignment[item[0]], assignment[item[1]]))


def matches(template: GeometryTemplate, closure, assignment: dict[str, int]) -> bool:
    for equality_group in template.equality_groups:
        roots = {
            mapped_edge_root(closure, assignment, item)
            for item in equality_group
        }
        if len(roots) != 1:
            return False
    return True


def is_cyclic_sequence(order: tuple[int, ...], values: tuple[int, ...]) -> bool:
    """Check one orientation-free strict cyclic subsequence independently."""
    if len(set(values)) != len(values):
        return False
    positions = {value: index for index, value in enumerate(order)}
    for oriented in (values, tuple(reversed(values))):
        start = positions[oriented[0]]
        offsets = tuple((positions[value] - start) % len(order) for value in oriented)
        if offsets == tuple(sorted(offsets)):
            return True
    return False


def direct_lemma81_witness(core: dict, order: tuple[int, ...]) -> dict[str, int] | None:
    """Independent two-row scan for the ledger's Lemma 81 motif.

    This does not use equality closure or the generic template assignment
    generator.  It requires one literal row at W containing F,X,Z and one
    literal row at Z containing P,X.
    """
    rows = core["rows"]
    for w, w_support in rows.items():
        for z in sorted(w_support & rows.keys()):
            z_support = rows[z]
            for x in sorted((w_support & z_support) - {w, z}):
                for f in sorted(w_support - {w, x, z}):
                    for p in sorted(z_support - {w, f, x, z}):
                        values = (w, f, p, x, z)
                        if is_cyclic_sequence(order, values):
                            return dict(zip(tuple("WFPXZ"), values, strict=True))
    return None


def parse_args() -> argparse.Namespace:
    parser = argparse.ArgumentParser()
    parser.add_argument(
        "--output",
        type=Path,
        help="write the JSON audit to this path instead of stdout",
    )
    parser.add_argument(
        "--lemma81-only",
        action="store_true",
        help="emit only the direct two-row Lemma 81 coverage certificate",
    )
    return parser.parse_args()


def main() -> None:
    args = parse_args()
    bank_source = BANK_PATH.read_bytes()
    bank = helper.load_module_snapshot("opt_nfs_geometry_live_bank", BANK_PATH, bank_source)
    cores = bank.REAL_INFEASIBLE_ROW_CORES
    orders = {
        "555": tuple(bank.shadow.hull_order(bank.mc.build_frame((5, 5, 5)))),
        "654": tuple(bank.shadow.hull_order(bank.mc.build_frame((6, 5, 4)))),
    }
    assignments = {
        (profile, template.name): tuple(cyclic_assignments(order, template.cyclic_roles))
        for profile, order in orders.items()
        for template in TEMPLATES
    }

    hits = []
    direct_lemma81_hits = []
    for core in cores:
        profile = "555" if "-555-" in core["id"] else "654"
        closure = helper.equality_closure(core["rows"])
        direct_witness = direct_lemma81_witness(core, orders[profile])
        if direct_witness is not None:
            direct_lemma81_hits.append({
                "core_id": core["id"],
                "family": helper.family_of(core["id"]),
                "witness": direct_witness,
            })
        for template in TEMPLATES:
            witness = next(
                (
                    assignment
                    for assignment in assignments[(profile, template.name)]
                    if matches(template, closure, assignment)
                ),
                None,
            )
            if witness is not None:
                hits.append({
                    "core_id": core["id"],
                    "family": helper.family_of(core["id"]),
                    "profile": profile,
                    "template": template.name,
                    "ledger_result": template.ledger_result,
                    "witness": witness,
                })

    by_template = []
    for template in TEMPLATES:
        selected = [hit for hit in hits if hit["template"] == template.name]
        by_template.append({
            "template": template.name,
            "ledger_result": template.ledger_result,
            "role_count": len(template.cyclic_roles),
            "equality_group_count": len(template.equality_groups),
            "match_count": len(selected),
            "family_counts": dict(sorted(Counter(
                hit["family"] for hit in selected
            ).items())),
            "core_ids": [hit["core_id"] for hit in selected],
        })

    covered = {hit["core_id"] for hit in hits}
    if len(direct_lemma81_hits) != len(cores):
        missing = sorted(
            {core["id"] for core in cores}
            - {hit["core_id"] for hit in direct_lemma81_hits}
        )
        raise RuntimeError(f"Lemma 81 direct audit missed cores: {missing}")
    payload = {
        "schema": "p97-555-654-opt-nfs-geometry-mining-v1",
        "evidence_scope": (
            "Exact equality-closure and convex cyclic-subsequence matching of "
            "the pure order/equality contradictions in /opt/nfs/verified-results.md. "
            "This is theorem-discovery evidence, not Lean verification or a live "
            "FaithfulCarrierPattern producer/coverage theorem."
        ),
        "ledger": "/opt/nfs/verified-results.md",
        "lean_consumer": {
            "module": (
                "Erdos9796Proof.P97.Census554."
                "FivePointCircleIsoscelesOrderCore"
            ),
            "theorem": (
                "Problem97.Census554.FivePointCircleIsoscelesOrderCore."
                "false_of_core_of_neg"
            ),
            "cyclic_order_theorem": (
                "Problem97.Census554.FivePointCircleIsoscelesOrderBridge."
                "false_of_core_of_ccw"
            ),
            "public_alternative": (
                "Problem97.Census554.GeneralCarrierBridge."
                "MetricCoreAlternative"
            ),
        },
        "bank": {
            "path": str(BANK_PATH.relative_to(REPO)),
            "sha256": hashlib.sha256(bank_source).hexdigest(),
            "core_count": len(cores),
            "family_counts": dict(sorted(Counter(
                helper.family_of(core["id"]) for core in cores
            ).items())),
        },
        "cyclic_orders": {key: list(value) for key, value in orders.items()},
        "template_count": len(TEMPLATES),
        "match_count": len(hits),
        "covered_core_count": len(covered),
        "covered_family_counts": dict(sorted(Counter(
            helper.family_of(core_id) for core_id in covered
        ).items())),
        "lemma81_direct_two_row_audit": {
            "covered_core_count": len(direct_lemma81_hits),
            "family_counts": dict(sorted(Counter(
                hit["family"] for hit in direct_lemma81_hits
            ).items())),
            "hits": direct_lemma81_hits,
        },
        "templates": by_template,
        "hits": hits,
    }
    if args.lemma81_only:
        payload = {
            "schema": "p97-555-654-lemma81-direct-coverage-v1",
            "evidence_scope": (
                "Exact literal two-row and convex cyclic-subsequence coverage. "
                "The Lean consumer is kernel checked; this finite audit is not "
                "a live FaithfulCarrierPattern producer/coverage theorem."
            ),
            "ledger": "/opt/nfs/verified-results.md",
            "lean_consumer": payload["lean_consumer"],
            "bank": payload["bank"],
            "cyclic_orders": payload["cyclic_orders"],
            "source_map_gate": (
                "OPEN: no current theorem proves that an arbitrary live "
                "FaithfulCarrierPattern branch produces one of these fixed "
                "555/654 row cores."
            ),
            "lemma81_direct_two_row_audit": payload[
                "lemma81_direct_two_row_audit"
            ],
        }
    output = json.dumps(payload, indent=2, sort_keys=True) + "\n"
    if args.output is None:
        print(output, end="")
    else:
        args.output.write_text(output)


if __name__ == "__main__":
    main()
