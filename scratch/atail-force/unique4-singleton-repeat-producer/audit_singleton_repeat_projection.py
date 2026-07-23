#!/usr/bin/env python3
"""Audit the singleton same-cap repeat in the exact-four finite projection.

This script extends the source-faithful n=11 projection in
``unique-arm-whole-carrier-source-audit`` with two facts needed by
``SingletonCoreOutsidePairIngress``:

* the global-deletion witness is an exact singleton; and
* every complete radius class centered in an indexed cap meets that cap in
  at most two carrier points.

The resulting model is still a finite incidence/distance-equality projection,
not a Euclidean realization or a model of every ``CounterexampleData`` field.
Its purpose is to test whether the requested same-cap actual-row repeat follows
from the currently encoded complete-radius, critical-map, cap-order,
minimality-connectivity, and theorem-bank constraints.
"""

from __future__ import annotations

import argparse
import hashlib
import importlib.util
import itertools
import json
from pathlib import Path
from typing import Any


HERE = Path(__file__).resolve().parent
BASE_DIR = HERE.parent / "unique-arm-whole-carrier-source-audit"
BASE_ENCODER = BASE_DIR / "exact_four_outer.py"
PLANAR_BANK = HERE.parent / "whole-carrier-planar-rank-cegar" / "planar_schema_bank.json"
KALMANSON_BANK = BASE_DIR / "kalmanson_schema_bank.json"
U5_BANK = BASE_DIR / "u5_signed_schema_bank.json"


def sha256(path: Path) -> str:
    return hashlib.sha256(path.read_bytes()).hexdigest()


def require(condition: bool, message: str) -> None:
    if not condition:
        raise RuntimeError(message)


def load_base() -> Any:
    spec = importlib.util.spec_from_file_location("exact_four_outer", BASE_ENCODER)
    require(spec is not None and spec.loader is not None, "cannot load base encoder")
    module = importlib.util.module_from_spec(spec)
    spec.loader.exec_module(module)
    return module


def cap_partition(n: int, opp1_card: int) -> tuple[frozenset[int], ...]:
    first_apex = 0
    second_apex = 4
    surplus_vertex = 4 + (opp1_card - 2) + 1
    surplus = frozenset({0, 1, 2, 3, 4})
    first_opposite = frozenset(range(second_apex, surplus_vertex + 1))
    second_opposite = frozenset({surplus_vertex, *range(surplus_vertex + 1, n), first_apex})
    return surplus, first_opposite, second_opposite


def eq_var(cnf: Any, center: int, left: int, right: int) -> int:
    require(left != right and center not in {left, right}, "invalid equality atom")
    return cnf.ids[f"eq_{center}_{min(left, right)}_{max(left, right)}"]


def extend_projection(base: Any, opp1_card: int) -> tuple[Any, dict[str, object]]:
    n = 11
    cnf, metadata = base.encode(
        n,
        opp1_card,
        PLANAR_BANK,
        KALMANSON_BANK,
        U5_BANK,
        strict_cap_minimality_overlay=True,
        pair_minimality_overlay=False,
        exact_two_strict_hit_overlay=True,
    )

    deleted = tuple(cnf.ids[f"minimality_deleted_{point}"] for point in range(n))
    base.add_exactly_k(cnf, deleted, 1, "singleton_minimality_deleted")

    caps = cap_partition(n, opp1_card)
    for center in range(n):
        for cap_index, cap in enumerate(caps):
            if center not in cap:
                continue
            targets = tuple(sorted(cap - {center}))
            for triple in itertools.combinations(targets, 3):
                cnf.add(
                    f"complete_radius_own_cap_at_most_two_{cap_index}",
                    [
                        -eq_var(cnf, center, triple[0], triple[1]),
                        -eq_var(cnf, center, triple[0], triple[2]),
                    ],
                )

    metadata.update(
        {
            "extension_schema": "p97-unique4-singleton-repeat-projection-v1",
            "base_encoder": str(BASE_ENCODER),
            "base_encoder_sha256": sha256(BASE_ENCODER),
            "singleton_deleted_card_eq_one": True,
            "complete_radius_own_cap_card_le_two": True,
            "claim_scope": (
                "exact finite incidence/distance-equality projection; not a Euclidean "
                "realization and not a model of every CounterexampleData/noM44 field"
            ),
        }
    )
    return cnf, metadata


def class_containing(result: dict[str, object], center: int, source: int) -> set[int]:
    classes = result["radius_classes"][str(center)]
    matches = [set(map(int, support)) for support in classes if source in support]
    require(len(matches) == 1, "source does not lie in exactly one radius class")
    return matches[0]


def cap_index_of_strict_point(caps: tuple[frozenset[int], ...], point: int) -> int:
    endpoints = ({0, 4}, {4, max(caps[1])}, {max(caps[1]), 0})
    matches = [index for index, cap in enumerate(caps) if point in cap - endpoints[index]]
    require(len(matches) == 1, "minimality center is not in one strict cap")
    return matches[0]


def decode_singleton_repeat_boundary(
    result: dict[str, object], opp1_card: int
) -> dict[str, object]:
    n = int(result["n"])
    caps = cap_partition(n, opp1_card)
    witness = result["strict_cap_minimality_witness"]
    center = int(witness["center"])
    deleted = list(map(int, witness["deleted_set"]))
    require(len(deleted) == 1, "minimality witness is not singleton")
    source = deleted[0]
    cap_index = cap_index_of_strict_point(caps, center)
    cap = caps[cap_index]
    shell = class_containing(result, center, source)
    require(len(shell) == 4, "singleton restoration class is not exact four")
    require(source in shell, "singleton source is absent from its shell")
    require(len(shell & cap) <= 2, "singleton shell violates the own-cap bound")
    outside = sorted(shell - cap)
    require(len(outside) >= 2, "singleton shell has no outside pair")

    blockers = {int(key): int(value) for key, value in result["blockers"].items()}
    supports = {
        int(key): set(map(int, value))
        for key, value in result["critical_supports"].items()
    }
    installed_blockers = dict(blockers)
    installed_supports = {key: set(value) for key, value in supports.items()}
    installed_blockers[source] = center
    installed_supports[source] = set(shell)

    candidates = []
    for left, right in itertools.combinations(outside, 2):
        repeats = []
        for actual_source in range(n):
            actual_center = installed_blockers[actual_source]
            if (
                actual_center in cap
                and actual_center != center
                and {left, right} <= installed_supports[actual_source]
            ):
                repeats.append(
                    {
                        "source": actual_source,
                        "center": actual_center,
                        "support": sorted(installed_supports[actual_source]),
                    }
                )
        candidates.append(
            {
                "outside_pair": [left, right],
                "same_cap_distinct_actual_row_repeats": repeats,
            }
        )

    no_repeat = [
        record
        for record in candidates
        if not record["same_cap_distinct_actual_row_repeats"]
    ]
    require(no_repeat, "every available singleton outside pair has a same-cap repeat")
    return {
        "singleton_center": center,
        "singleton_source": source,
        "singleton_cap_index": cap_index,
        "singleton_cap": sorted(cap),
        "singleton_shell": sorted(shell),
        "outside_points": outside,
        "pair_audit": candidates,
        "chosen_no_repeat_pair": no_repeat[0]["outside_pair"],
        "installed_blockers": {str(key): value for key, value in installed_blockers.items()},
        "installed_critical_supports": {
            str(key): sorted(value) for key, value in installed_supports.items()
        },
    }


def run(opp1_card: int, timeout_seconds: int, output: Path) -> dict[str, object]:
    base = load_base()
    cnf, metadata = extend_projection(base, opp1_card)
    cnf_path = output.with_suffix(".cnf")
    solver_log = output.with_suffix(".cadical.log")
    cnf.write_dimacs(cnf_path, metadata)
    solver_result, log = base.solve(cnf, cnf_path, metadata, timeout_seconds, "cadical")
    solver_log.write_text(log, encoding="utf-8")
    result = {**metadata, **solver_result}
    if result["solver_status"] == "SAT":
        result["singleton_repeat_boundary"] = decode_singleton_repeat_boundary(
            result, opp1_card
        )
        result["terminal_status"] = "SAT_SINGLETON_INGRESS_WITHOUT_SAME_CAP_REPEAT"
    else:
        result["terminal_status"] = result["solver_status"]
    result.update(
        {
            "cnf_path": str(cnf_path),
            "cnf_sha256": sha256(cnf_path),
            "solver_log": str(solver_log),
            "solver_log_sha256": sha256(solver_log),
            "variable_count": len(cnf.names) - 1,
            "clause_count": len(cnf.clauses),
            "clause_block_counts": dict(sorted(cnf.block_counts.items())),
        }
    )
    output.write_text(json.dumps(result, indent=2, sort_keys=True) + "\n", encoding="utf-8")
    return result


def check(output: Path) -> dict[str, object]:
    result = json.loads(output.read_text(encoding="utf-8"))
    require(
        result.get("extension_schema") == "p97-unique4-singleton-repeat-projection-v1",
        "unexpected checkpoint schema",
    )
    require(result.get("base_encoder_sha256") == sha256(BASE_ENCODER), "base encoder drift")
    require(result.get("solver_status") == "SAT", "checkpoint is not SAT")
    require(bool(result.get("cnf_model_checked")), "solver assignment was not clause-checked")
    require(
        result.get("terminal_status") == "SAT_SINGLETON_INGRESS_WITHOUT_SAME_CAP_REPEAT",
        "checkpoint does not establish the intended finite boundary",
    )
    profile = int(result["opp1_card"])
    caps = cap_partition(int(result["n"]), profile)
    for center, classes in result["radius_classes"].items():
        center_index = int(center)
        for cap in caps:
            if center_index not in cap:
                continue
            for support in classes:
                require(
                    len(set(map(int, support)) & cap) <= 2,
                    f"center {center_index} has a complete class with three own-cap points",
                )
    boundary = decode_singleton_repeat_boundary(result, profile)
    require(
        boundary == result["singleton_repeat_boundary"],
        "stored singleton boundary does not match semantic replay",
    )
    chosen = boundary["chosen_no_repeat_pair"]
    matching = [
        item for item in boundary["pair_audit"] if item["outside_pair"] == chosen
    ]
    require(len(matching) == 1, "chosen pair is not represented exactly once")
    require(
        not matching[0]["same_cap_distinct_actual_row_repeats"],
        "chosen pair unexpectedly has a same-cap repeat",
    )
    return {
        "status": "PASS",
        "checkpoint": str(output),
        "checkpoint_sha256": sha256(output),
        "profile": profile,
        "chosen_no_repeat_pair": chosen,
        "claim_scope": result["claim_scope"],
    }


def main() -> int:
    parser = argparse.ArgumentParser(description=__doc__)
    parser.add_argument("--opp1-card", type=int, choices=(4, 5))
    parser.add_argument("--timeout-seconds", type=int, default=600)
    parser.add_argument("--output", type=Path)
    parser.add_argument("--check", type=Path)
    args = parser.parse_args()
    if args.check is not None:
        print(json.dumps(check(args.check), indent=2, sort_keys=True))
        return 0
    if args.opp1_card is None or args.output is None:
        parser.error("--opp1-card and --output are required unless --check is used")
    result = run(args.opp1_card, args.timeout_seconds, args.output)
    print(
        json.dumps(
            {
                "solver_status": result["solver_status"],
                "terminal_status": result["terminal_status"],
                "output": str(args.output),
            },
            indent=2,
            sort_keys=True,
        )
    )
    return 0


if __name__ == "__main__":
    raise SystemExit(main())
