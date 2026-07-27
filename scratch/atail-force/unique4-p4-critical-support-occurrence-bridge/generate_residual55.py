#!/usr/bin/env python3
"""Materialize the generic-source 55-clause P4 compact residual.

This deliberately excludes the two projected strict-hit unit clauses, six
ten-role Kalmanson CEGAR clauses, and 18 five-point P4 right-cap occurrences.
It also excludes three cap-1 endpoint clauses centered at P4 endpoint `7`.
These 21 P4-only cap occurrences are not covered by the generic
`DenseFamilySatisfaction` cap fields and require a dedicated P4 terminal.
"""

from __future__ import annotations

import hashlib
import json
from collections import Counter
from pathlib import Path


HERE = Path(__file__).resolve().parent
BASE = HERE.parent
MAP = BASE / "unique4-exact-two-core-map" / "p4.input-core-map.json"
COMPACT = BASE / "unique4-exact-two-core-map" / "generated" / "p4-seed0-compact"
MANIFEST = COMPACT / "p4-seed0-compact-manifest.json"
OCCURRENCES = COMPACT / "p4-seed0-compact-occurrences.jsonl"
OUTPUT = HERE / "Residual55Data.lean"

FAMILIES = {
    "first_apex_not_in_own_class",
    "first_apex_row_eq_class",
    "exact_two_left_adjacent_hit_at_least_1",
    "exact_two_right_adjacent_hit_at_least_1",
    "selected_row_endpoint_own_cap_at_most_one_0",
    "selected_row_endpoint_own_cap_at_most_one_1",
    "selected_row_endpoint_own_cap_at_most_one_2",
    "selected_row_own_cap_at_most_two_0",
    "selected_row_own_cap_at_most_two_1",
    "selected_row_own_cap_at_most_two_2",
}
EXPECTED_COUNT = 55


def digest(path: Path) -> str:
    return hashlib.sha256(path.read_bytes()).hexdigest()


def p4_row(center: int, point: int) -> int:
    if center == point:
        raise ValueError("diagonal row atom")
    return 1 + 10 * center + (point if point < center else point - 1)


def params(item: dict, *keys: str) -> tuple[int, ...]:
    return tuple(int(item["parameters"][key]) for key in keys)


def signed_variable(item: dict, dense_map: dict[int, int]) -> int:
    sign = 1 if int(item["literal"]) > 0 else -1
    return sign * dense_map[int(item["variable"])]


def only(items: list[dict], family: str, polarity: str | None = None) -> dict:
    answer = [item for item in items if item["variable_family"] == family and
              (polarity is None or item["polarity"] == polarity)]
    if len(answer) != 1:
        raise ValueError(f"expected one {family}/{polarity}, got {len(answer)}")
    return answer[0]


def rows(items: list[dict]) -> list[dict]:
    return [item for item in items if item["variable_family"] == "selected_row_membership"]


def classes(items: list[dict]) -> list[dict]:
    return [item for item in items if item["variable_family"] == "first_apex_class"]


def classify(family: str, named: list[dict]) -> str:
    if family == "first_apex_not_in_own_class":
        item = only(named, "first_apex_class", "negative")
        if params(item, "point") != (0,) or len(named) != 1:
            raise ValueError("apex-not-own-class shape drifted")
        return ".apexNotOwnClass"
    if family == "first_apex_row_eq_class":
        row = only(named, "selected_row_membership")
        cls = only(named, "first_apex_class")
        center, point = params(row, "center", "point")
        if center != 0 or params(cls, "point") != (point,) or point == 0 or len(named) != 2:
            raise ValueError("apex-row-equality payload drifted")
        if row["polarity"] == "positive" and cls["polarity"] == "negative":
            return f".apexRowEqClass {point} true"
        if row["polarity"] == "negative" and cls["polarity"] == "positive":
            return f".apexRowEqClass {point} false"
        raise ValueError("apex-row-equality polarity drifted")
    if family == "exact_two_left_adjacent_hit_at_least_1":
        ps = {params(item, "point")[0] for item in classes(named)}
        if ps != {0, 1, 2, 3, 4} or len(named) != 5 or any(item["polarity"] != "positive" for item in named):
            raise ValueError("left-adjacent shape drifted")
        return ".leftAdjacent"
    if family == "exact_two_right_adjacent_hit_at_least_1":
        ps = {params(item, "point")[0] for item in classes(named)}
        # The compact P4 occurrence has the source cap plus harmless class_7.
        # `Residual78Core.rightAdjacentClausePoints` records the full clause;
        # the semantic source witness still ranges over {0, 8, 9, 10}.
        if ps != {0, 7, 8, 9, 10} or len(named) != 5 or any(item["polarity"] != "positive" for item in named):
            raise ValueError("right-adjacent shape drifted")
        return ".rightAdjacent"
    if family.startswith("selected_row_endpoint_own_cap_at_most_one_"):
        k = int(family.rsplit("_", 1)[1])
        rs = rows(named)
        if len(rs) != 2 or len(named) != 2 or any(item["polarity"] != "negative" for item in rs):
            raise ValueError("endpoint-own-cap shape drifted")
        center, left = params(rs[0], "center", "point")
        center2, right = params(rs[1], "center", "point")
        if center != center2:
            raise ValueError("endpoint-own-cap centers differ")
        return f".endpointOwnCap {k} {center} {left} {right}"
    if family.startswith("selected_row_own_cap_at_most_two_"):
        k = int(family.rsplit("_", 1)[1])
        rs = rows(named)
        if len(rs) != 3 or len(named) != 3 or any(item["polarity"] != "negative" for item in rs):
            raise ValueError("own-cap shape drifted")
        center, p1 = params(rs[0], "center", "point")
        center2, p2 = params(rs[1], "center", "point")
        center3, p3 = params(rs[2], "center", "point")
        if len({center, center2, center3}) != 1:
            raise ValueError("own-cap centers differ")
        return f".ownCapAtMostTwo {k} {center} {p1} {p2} {p3}"
    raise ValueError(f"unsupported residual family {family}")


def render(entries: list[dict], hashes: dict[str, str]) -> str:
    rows = "\n".join(
        f"  {{ clause := {entry['dense']}, shape := {entry['shape']} }}, -- output {entry['output']}, core {entry['core']}"
        for entry in entries
    )
    return f'''/- This file is generated by generate_residual55.py. -/
import Residual78Core

/-! Authenticated generic-source residual occurrences for the P4 compact CNF. -/

namespace Problem97
namespace P4CriticalSupportOccurrenceBridgeScratch

def residual55MapSha256 : String := "{hashes['map']}"
def residual55ManifestSha256 : String := "{hashes['manifest']}"
def residual55OccurrencesSha256 : String := "{hashes['occurrences']}"

def residual55Entries : List NonKalmansonEntry := [
{rows}
]

theorem residual55Entries_wf : residual55Entries.all residualEntryWF = true := by native_decide
theorem residual55Entries_length : residual55Entries.length = {len(entries)} := by native_decide

end P4CriticalSupportOccurrenceBridgeScratch
end Problem97
'''


def main() -> None:
    core_map = json.loads(MAP.read_text())
    by_core = {int(entry["core_clause_index"]): entry for entry in core_map["core_clauses"]}
    manifest = json.loads(MANIFEST.read_text())
    dense_map = {int(old): int(new) for old, new in manifest["dense_variable_renaming"]["old_to_new"]}
    occurrences = [json.loads(line) for line in OCCURRENCES.read_text().splitlines() if line]
    def generic_source_compatible(occurrence: dict) -> bool:
        family = str(occurrence["family"])
        if family not in FAMILIES:
            return False
        core = by_core.get(int(occurrence["source_core_clause_index"]))
        if core is None or core["allocated_family"] != family:
            raise ValueError(f"core family mismatch at output {occurrence['output_clause_index']}")
        if family == "selected_row_endpoint_own_cap_at_most_one_1":
            centers = {params(item, "center", "point")[0] for item in rows(core["named_literals"])}
            # P4 additionally emits endpoint-7 instances; the generic family
            # only has the P5 endpoint set {4, 8}.
            return centers <= {4, 8}
        if family == "selected_row_own_cap_at_most_two_2":
            roles = {coordinate for item in rows(core["named_literals"])
                     for coordinate in params(item, "center", "point")}
            return roles <= {0, 8, 9, 10}
        if family == "selected_row_endpoint_own_cap_at_most_one_2":
            row_atoms = rows(core["named_literals"])
            centers = {params(item, "center", "point")[0] for item in row_atoms}
            points = {params(item, "center", "point")[1] for item in row_atoms}
            return centers <= {0, 8} and points <= {0, 8, 9, 10}
        return True

    selected = sorted((entry for entry in occurrences if generic_source_compatible(entry)),
                      key=lambda entry: int(entry["output_clause_index"]))
    if len(selected) != EXPECTED_COUNT:
        raise ValueError(f"expected {EXPECTED_COUNT} occurrences, got {len(selected)}")
    entries: list[dict] = []
    for occurrence in selected:
        family = str(occurrence["family"])
        core = by_core.get(int(occurrence["source_core_clause_index"]))
        if core is None or core["allocated_family"] != family:
            raise ValueError(f"core family mismatch at output {occurrence['output_clause_index']}")
        named = core["named_literals"]
        dense = [int(value) for value in occurrence["dense_literals"]]
        if Counter(signed_variable(item, dense_map) for item in named) != Counter(dense):
            raise ValueError(f"dense literal map mismatch at output {occurrence['output_clause_index']}")
        for item in named:
            variable = dense_map[int(item["variable"])]
            if item["variable_family"] == "selected_row_membership":
                center, point = params(item, "center", "point")
                if p4_row(center, point) != variable:
                    raise ValueError("P4 row compact-prefix drifted")
            elif item["variable_family"] == "first_apex_class":
                (point,) = params(item, "point")
                if 627 + point != variable:
                    raise ValueError("P4 class compact-prefix drifted")
            else:
                raise ValueError(f"unexpected residual atom family {item['variable_family']}")
        entries.append({"output": int(occurrence["output_clause_index"]),
                        "core": int(core["core_clause_index"]),
                        "dense": dense, "shape": classify(family, named)})
    hashes = {"map": digest(MAP), "manifest": digest(MANIFEST), "occurrences": digest(OCCURRENCES)}
    OUTPUT.write_text(render(entries, hashes))
    print(f"wrote {OUTPUT.name}: {len(entries)} entries")


if __name__ == "__main__":
    main()
