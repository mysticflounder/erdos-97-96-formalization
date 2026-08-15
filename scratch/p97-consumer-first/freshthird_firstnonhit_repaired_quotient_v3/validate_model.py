#!/usr/bin/env python3
# Copyright (c) 2026 Adam McKenna. All rights reserved.
# Released under Apache 2.0 license as described in the file LICENSE.
# Author: Adam McKenna <adam@mysticflounder.ai>
"""Independent pure-Python readback validator; imports no encoder code."""

from __future__ import annotations

import itertools
import json
from pathlib import Path


HERE = Path(__file__).resolve().parent
Q = ("q0", "q1", "q2", "q3")
ACTIVE = {
    "retained": Q + ("c_first", "c_second", "ret_z", "ret_w"),
    "common": Q + ("c_first", "c_second"),
    "common_sameblocker": Q + ("c_first", "c_second", "w0", "w1", "w2", "w3"),
}
PATTERN = {
    1: {0, 3, 6, 8}, 2: {3, 0, 7, 10}, 3: {6, 1, 5, 8},
    4: {10, 2, 6, 7}, 5: {9, 3, 10, 8},
    7: {11, 1, 3, 9}, 8: {12, 2, 3, 7},
}


def val(data: dict, name: str) -> int:
    value = data[name]
    if isinstance(value, bool):
        raise AssertionError(f"expected integer {name}")
    return int(value)


def support(data: dict, role: str) -> set[int]:
    return {val(data, f"s_{role}_{i}") for i in range(4)}


def source(data: dict, role: str) -> int:
    return val(data, f"v_{role}")


def blocker(data: dict, role: str) -> int:
    return val(data, f"b_{role}")


def mem(data: dict, role: str, point: int) -> bool:
    return point in support(data, role)


def has_pattern(case: str, data: dict) -> bool:
    roles = ACTIVE[case]
    point_values = sorted({
        val(data, term)
        for role in roles
        for term in (f"v_{role}", f"b_{role}", *[f"s_{role}_{i}" for i in range(4)])
    })
    center_row: dict[int, str] = {}
    for role in roles:
        center_row.setdefault(blocker(data, role), role)
    centers = sorted(center_row)
    rows = {center: support(data, role) for center, role in center_row.items()}
    assignment: dict[int, int] = {}

    def candidates(label: int) -> list[int]:
        domain = centers if label in PATTERN else point_values
        used = set(assignment.values())
        result = []
        for candidate in domain:
            if candidate in used:
                continue
            trial = {**assignment, label: candidate}
            good = True
            for center, targets in PATTERN.items():
                if center not in trial:
                    continue
                actual = rows[trial[center]]
                for target in targets:
                    if target in trial and trial[target] not in actual:
                        good = False
                for other, other_value in trial.items():
                    if other != center and other not in targets and other_value in actual:
                        good = False
            if good:
                result.append(candidate)
        return result

    def search() -> bool:
        if len(assignment) == 13:
            return all(rows[assignment[c]] == {assignment[t] for t in targets}
                       for c, targets in PATTERN.items())
        open_labels = [label for label in range(13) if label not in assignment]
        ranked = [(len(candidates(label)), label, candidates(label)) for label in open_labels]
        size, label, options = min(ranked)
        if size == 0:
            return False
        for candidate in options:
            assignment[label] = candidate
            if search():
                return True
            del assignment[label]
        return False

    return search()


def validate_case(case: str, data: dict) -> list[str]:
    errors: list[str] = []
    roles = ACTIVE[case]
    for role in roles:
        row = support(data, role)
        if len(row) != 4:
            errors.append(f"{role}:support cardinality !=4")
        if source(data, role) not in row:
            errors.append(f"{role}:source not in actual row")
        if blocker(data, role) in row:
            errors.append(f"{role}:blocker center in support")
    for left, right in itertools.combinations(roles, 2):
        if source(data, left) == source(data, right) and blocker(data, left) != blocker(data, right):
            errors.append(f"alias blocker mismatch:{left}:{right}")
        if blocker(data, left) == blocker(data, right) and support(data, left) != support(data, right):
            errors.append(f"same blocker support mismatch:{left}:{right}")
        if blocker(data, left) != blocker(data, right) and len(support(data, left) & support(data, right)) > 2:
            errors.append(f"distinct center overlap >2:{left}:{right}")

    for center in {blocker(data, role) for role in roles}:
        named_sources = {source(data, role) for role in roles if blocker(data, role) == center}
        if len(named_sources) > 4:
            errors.append(f"named actual blocker fiber >4:{center}")

    qvalues = [source(data, role) for role in Q]
    if len(set(qvalues)) != 4:
        errors.append("Q exact support values not distinct")
    if support(data, "q0") != set(qvalues):
        errors.append("Q support not exact named four")
    if blocker(data, "q0") != blocker(data, "q1"):
        errors.append("Q named blockers differ")
    if source(data, "c_first") == source(data, "c_second"):
        errors.append("C sources alias despite sources_ne")

    first_tag = val(data, "first_tag")
    deleted = source(data, "q0" if val(data, "first_deleted") == 0 else "q1")
    if first_tag == 0 and blocker(data, "c_first") != blocker(data, "q0"):
        errors.append("first sameBlocker tag invalid")
    if first_tag == 1 and (blocker(data, "c_first") == blocker(data, "q0") or mem(data, "c_first", deleted)):
        errors.append("first omission tag invalid")
    if first_tag not in (0, 1):
        errors.append("first tag out of range")

    second_tag = val(data, "second_tag")
    deleted2 = source(data, "q0" if val(data, "second_deleted") == 0 else "q1")
    if second_tag == 0 and blocker(data, "c_second") != blocker(data, "q0"):
        errors.append("second sameBlocker tag invalid")
    if second_tag == 1 and (blocker(data, "c_second") == blocker(data, "q0") or mem(data, "c_second", deleted2)):
        errors.append("second omission tag invalid")
    if second_tag in (2, 3):
        intersection = support(data, "c_second") & support(data, "q0")
        if blocker(data, "c_second") == blocker(data, "q0") or intersection != {qvalues[0], qvalues[1]}:
            errors.append("second two-source interaction invalid")
        if second_tag == 2 and val(data, "second_source_cap") == val(data, "q_cap"):
            errors.append("second distinct-cap tag invalid")
        if second_tag == 3 and val(data, "second_source_cap") != val(data, "q_cap"):
            errors.append("second same-cap tag invalid")
        if second_tag == 3 and not (bool(data["second_internal_q0"]) or bool(data["second_internal_q1"])):
            errors.append("second same-cap internal source disjunction invalid")
    if second_tag not in (0, 1, 2, 3):
        errors.append("second tag out of range")

    rz, rw = val(data, "repeat_z"), val(data, "repeat_w")
    if not (0 <= rz < 4 and 0 <= rw < 4 and rz != rw):
        errors.append("repeated pair index invalid")
    else:
        left, right = Q[rz], Q[rw]
        outcome = (
            blocker(data, left) == blocker(data, right)
            or bool(data[f"q{rz}_source_in_its_blocker_cap"])
            or bool(data[f"q{rw}_source_in_its_blocker_cap"])
            or not mem(data, left, source(data, right))
            or not mem(data, right, source(data, left))
        )
        if val(data, f"blocker_cap_{rz}") != val(data, f"blocker_cap_{rw}") or not outcome:
            errors.append("repeated pair outcome invalid")

    if case == "retained":
        if source(data, "ret_z") == source(data, "ret_w"):
            errors.append("retained pair aliases")
        if blocker(data, "ret_z") == blocker(data, "ret_w"):
            errors.append("retained centers equal")
        if mem(data, "ret_z", source(data, "ret_w")) or mem(data, "ret_w", source(data, "ret_z")):
            errors.append("retained mutual omission invalid")
    if case == "common_sameblocker":
        if first_tag != 0 or second_tag != 0:
            errors.append("sameblocker case constructor mismatch")
        wvalues = [source(data, f"w{i}") for i in range(4)]
        if len(set(wvalues)) != 4:
            errors.append("common W not cardinality four")
        for i, point in enumerate(wvalues):
            if mem(data, "q0", point) or blocker(data, f"w{i}") == blocker(data, "q0"):
                errors.append(f"common w{i} off-Q packet invalid")

    if has_pattern(case, data):
        errors.append("production thirteen-point seven-row motif remains")
    return errors


def main() -> int:
    terminal = json.loads((HERE / "TERMINAL.json").read_text())
    records = []
    all_errors: list[str] = []
    detected_invalid = 0
    for case_record in terminal.get("cases", []):
        case = case_record["case"]
        if case_record["status"] == "SOLVER_DISAGREEMENT":
            iteration = json.loads((HERE / case_record["terminal_readback"]).read_text())
            errors = validate_case(case, iteration["readback"])
            if not errors:
                all_errors.append(f"{case}:disputed readback unexpectedly validates")
            if case_record.get("cvc5_pinned_replay") != "unsat":
                all_errors.append(f"{case}:expected cvc5 rejection missing")
            detected_invalid += 1 if errors else 0
            records.append({
                "case": case,
                "status": "PASS_DETECTED_INVALID_READBACK" if errors else "FAIL",
                "violations": errors,
                "cvc5_exact_pin": case_record.get("cvc5_pinned_replay"),
            })
            continue
        if case_record["status"] != "SAT":
            records.append({"case": case, "status": "not-applicable", "errors": []})
            continue
        iteration = json.loads((HERE / case_record["terminal_readback"]).read_text())
        errors = validate_case(case, iteration["readback"])
        if case_record.get("cvc5_pinned_replay") != "sat":
            errors.append("cvc5 did not accept exact pinned readback")
        records.append({"case": case, "status": "PASS" if not errors else "FAIL", "errors": errors})
        all_errors.extend(f"{case}:{error}" for error in errors)
    result = {
        "status": "PASS" if not all_errors else "FAIL",
        "validator": "independent pure-Python model validator; imports no schema/wave module",
        "detected_invalid_readbacks": detected_invalid,
        "records": records,
        "errors": all_errors,
    }
    (HERE / "MODEL-VALIDATION.json").write_text(json.dumps(result, indent=2, sort_keys=True) + "\n")
    print(result["status"])
    return 0 if not all_errors else 2


if __name__ == "__main__":
    raise SystemExit(main())
