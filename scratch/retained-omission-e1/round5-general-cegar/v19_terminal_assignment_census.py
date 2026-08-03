#!/usr/bin/env python3
"""Authenticate and census a completed v19 assignment journal.

This is a read-only, solver-free analysis.  It deliberately distinguishes
relations observed in the journal from consequences of the Boolean master.
"""

from __future__ import annotations

import argparse
import hashlib
import json
from collections import Counter, defaultdict
from pathlib import Path


def canonical_json(value: object) -> str:
    return json.dumps(value, sort_keys=True, separators=(",", ":"), ensure_ascii=True)


def sha(value: object) -> str:
    return hashlib.sha256(canonical_json(value).encode()).hexdigest()


def assignment_values(payload: dict[str, object]) -> dict[str, bool]:
    return {str(item["bool"]): bool(item["value"]) for item in payload["assignment"]}


def load_journal(path: Path, expected_records: int, expected_head: str) -> tuple[list[dict[str, bool]], list[dict[str, object]]]:
    files = sorted(path.glob("*.json"))
    if len(files) != expected_records:
        raise RuntimeError(f"record count mismatch: {len(files)} != {expected_records}")
    assignments: list[dict[str, bool]] = []
    outcomes: list[dict[str, object]] = []
    previous: str | None = None
    for sequence, file in enumerate(files):
        record = json.loads(file.read_text())
        if record["sequence"] != sequence or record["previous_record_sha256"] != previous:
            raise RuntimeError(f"journal ordering/chain mismatch at {sequence}")
        payload = record["payload"]
        if record["payload_sha256"] != sha(payload):
            raise RuntimeError(f"payload hash mismatch at {sequence}")
        body = {key: record[key] for key in (
            "sequence", "previous_record_sha256", "payload", "payload_sha256"
        )}
        if record["record_sha256"] != sha(body):
            raise RuntimeError(f"record hash mismatch at {sequence}")
        previous = record["record_sha256"]

        expected_phase = "proposed" if sequence % 2 == 0 else "outcome"
        if payload.get("phase") != expected_phase or payload.get("iteration") != sequence // 2:
            raise RuntimeError(f"phase/iteration mismatch at {sequence}")
        if expected_phase == "proposed":
            if payload["assignment_sha256"] != sha(payload["assignment"]):
                raise RuntimeError(f"assignment hash mismatch at {sequence}")
            assignments.append(assignment_values(payload))
        else:
            if payload.get("status") != "unsat":
                raise RuntimeError(f"non-UNSAT outcome at {sequence}")
            if payload["assignment_sha256"] != sha([
                {"bool": name, "value": assignments[-1][name]}
                for name in sorted(assignments[-1])
            ]):
                raise RuntimeError(f"outcome assignment mismatch at {sequence}")
            blocker = payload["blocker"]
            core = blocker["projected_core"]
            if blocker["projected_core_sha256"] != sha(core):
                raise RuntimeError(f"projected-core hash mismatch at {sequence}")
            if len(core) != len(assignments[-1]):
                raise RuntimeError(f"non-point blocker at {sequence}: {len(core)}")
            outcomes.append(payload)
    if previous != expected_head:
        raise RuntimeError(f"journal head mismatch: {previous} != {expected_head}")
    return assignments, outcomes


def main() -> None:
    parser = argparse.ArgumentParser()
    parser.add_argument("--summary", type=Path, required=True)
    args = parser.parse_args()
    summary = json.loads(args.summary.read_text())
    result = summary["results"][0]
    journal_meta = result["assignment_journal"]
    case_root = args.summary.parent / result["case_id"]
    journal = case_root / journal_meta["directory"]
    assignments, outcomes = load_journal(
        journal,
        int(journal_meta["record_count"]),
        str(journal_meta["head_sha256"]),
    )
    if len(assignments) != len(outcomes) or len(assignments) != result["assignment_checks"]:
        raise RuntimeError("completed assignment count mismatch")
    universe = sorted(assignments[0])
    if any(sorted(item) != universe for item in assignments):
        raise RuntimeError("semantic Boolean universe changed")
    varying = sorted(name for name in universe if len({item[name] for item in assignments}) > 1)
    invariant = sorted(set(universe) - set(varying))
    first_flip = {
        name: next(index for index, item in enumerate(assignments) if item[name] != assignments[0][name])
        for name in varying
    }
    truth_count = {name: sum(item[name] for item in assignments) for name in varying}

    same_pairs: list[list[str]] = []
    complement_pairs: list[list[str]] = []
    for left_index, left in enumerate(varying):
        for right in varying[left_index + 1:]:
            pairs = {(item[left], item[right]) for item in assignments}
            if pairs <= {(False, False), (True, True)}:
                same_pairs.append([left, right])
            elif pairs <= {(False, True), (True, False)}:
                complement_pairs.append([left, right])

    block1 = ["block_1_11", "block_1_3", "block_1_6"]
    block1_weight = Counter(sum(item[name] for name in block1) for item in assignments)
    k4_a = ["k4_14_10", "k4_14_2", "k4_14_6", "k4_14_8"]
    k4_b = ["k4_14_11", "k4_14_12", "k4_14_4", "k4_14_9"]
    k4_partition_ok = all(
        len({item[name] for name in k4_a}) == 1
        and len({item[name] for name in k4_b}) == 1
        and item[k4_a[0]] != item[k4_b[0]]
        for item in assignments
    )

    factor_names = [
        "block_12_3", "block_13_11", "block_14_10",
        "block_5_11", "block_6_10", "block_9_1",
        *block1, k4_a[0],
    ]
    factor_keys = {
        tuple(item[name] for name in factor_names)
        for item in assignments
    }
    adjacent_hamming = Counter(
        sum(left[name] != right[name] for name in universe)
        for left, right in zip(assignments, assignments[1:])
    )
    from_initial_hamming = Counter(
        sum(assignments[0][name] != item[name] for name in universe)
        for item in assignments
    )

    output = {
        "scheme": "v19-terminal-assignment-census/v1",
        "scope": "observed completed proposals only; no master-entailment claim",
        "terminal": {
            "status": result["status"],
            "complete": result["complete"],
            "reason_incomplete": result["reason_incomplete"],
            "elapsed_seconds": result["elapsed_seconds"],
            "assignment_checks": result["assignment_checks"],
            "blocker_count": result["blocker_count"],
            "journal_record_count": journal_meta["record_count"],
            "journal_head_sha256": journal_meta["head_sha256"],
        },
        "census": {
            "semantic_bool_count": len(universe),
            "invariant_count": len(invariant),
            "varying_count": len(varying),
            "varying_names": varying,
            "first_flip": first_flip,
            "truth_count": truth_count,
            "same_pairs": same_pairs,
            "complement_pairs": complement_pairs,
            "block_1_choice_weight_histogram": dict(sorted(block1_weight.items())),
            "k4_14_two_class_partition_observed": k4_partition_ok,
            "factor_key_count": len(factor_keys),
            "factor_key_upper_bound": 384,
            "factor_names": factor_names,
            "adjacent_hamming_histogram": dict(sorted(adjacent_hamming.items())),
            "from_initial_hamming_histogram": dict(sorted(from_initial_hamming.items())),
        },
        "trust": "hash-authenticated artifact census; observed relations are empirical and are not Lean/kernel theorems",
    }
    print(json.dumps(output, indent=2, sort_keys=True))


if __name__ == "__main__":
    main()
