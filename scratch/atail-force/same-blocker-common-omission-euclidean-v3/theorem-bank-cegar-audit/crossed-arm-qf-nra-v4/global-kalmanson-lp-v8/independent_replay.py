#!/usr/bin/env python3
"""Solver-free replay of the minimized raw core and its Farkas certificate."""

from __future__ import annotations

import hashlib
import json
from collections import Counter
from pathlib import Path


ROOT = Path(__file__).resolve().parents[6]
HERE = Path(__file__).resolve().parent


def sha256(path: Path) -> str:
    return hashlib.sha256(path.read_bytes()).hexdigest()


def edge(order_position: dict[str, int], a: str, b: str) -> str:
    return f"{a}--{b}" if order_position[a] < order_position[b] else f"{b}--{a}"


def main() -> None:
    result = json.loads((HERE / "result.json").read_text())
    core = json.loads((HERE / "minimal-core.json").read_text())
    witness_path = ROOT / result["input"]["witness_path"]
    witness = json.loads(witness_path.read_text())
    order = witness["existential_cyclic_order"]
    position = {point: index for index, point in enumerate(order)}
    assert sha256(witness_path) == result["input"]["witness_sha256"]

    by_name = {item["name"]: item for item in core["constraints"]}
    for item in core["constraints"]:
        provenance = item["provenance"]
        if item["kind"] == "within_radius_class_equality":
            center = provenance["center"]
            class_index = provenance["radius_class_index"]
            assert witness["radius_classes"][center][class_index] == provenance["radius_class"]
            asserted_edges = provenance["equality"]
            assert all(center in asserted_edge for asserted_edge in asserted_edges)
        else:
            ia, ib, ic, id_ = provenance["indices"]
            assert ia < ib < ic < id_
            a, b, c, d = provenance["points"]
            assert [order[index] for index in (ia, ib, ic, id_)] == [a, b, c, d]
            expected: Counter[str] = Counter()
            expected[edge(position, a, c)] += 1
            expected[edge(position, b, d)] += 1
            if item["kind"] == "strict_kalmanson_main_unit_margin":
                expected[edge(position, b, c)] -= 1
                expected[edge(position, a, d)] -= 1
                assert provenance["lean_source_line"] == 240
            else:
                assert item["kind"] == "strict_kalmanson_complementary_unit_margin"
                expected[edge(position, a, b)] -= 1
                expected[edge(position, c, d)] -= 1
                assert provenance["lean_source_line"] == 273
            expected = Counter({name: value for name, value in expected.items() if value})
            assert expected == Counter(item["coefficients"])

    multipliers = core["farkas_certificate"]["integer_multipliers"]
    assert set(multipliers) == set(by_name)
    combined: Counter[str] = Counter()
    combined_rhs = 0
    for name, multiplier in multipliers.items():
        item = by_name[name]
        if item["rhs"] == 1:
            assert multiplier >= 0
        for variable, coefficient in item["coefficients"].items():
            combined[variable] += multiplier * coefficient
        combined_rhs += multiplier * item["rhs"]
    nonzero = {name: value for name, value in combined.items() if value}
    assert not nonzero
    assert combined_rhs == core["farkas_certificate"]["combined_rhs"] == 15

    replay = {
        "status": "PASS",
        "witness_hash_replayed": True,
        "radius_core_atoms_replayed_against_exact_classes": True,
        "kalmanson_indices_and_orientations_replayed": True,
        "farkas_integer_combination_replayed": True,
        "combined_nonzero_variable_coefficients": nonzero,
        "combined_rhs": combined_rhs,
        "contradiction": "0 >= 15",
    }
    (HERE / "independent-replay.json").write_text(
        json.dumps(replay, indent=2, sort_keys=True) + "\n"
    )
    print(json.dumps(replay, sort_keys=True))


if __name__ == "__main__":
    main()
