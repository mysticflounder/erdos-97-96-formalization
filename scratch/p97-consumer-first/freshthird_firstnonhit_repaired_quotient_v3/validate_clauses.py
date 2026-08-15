#!/usr/bin/env python3
# Copyright (c) 2026 Adam McKenna. All rights reserved.
# Released under Apache 2.0 license as described in the file LICENSE.
# Author: Adam McKenna <adam@mysticflounder.ai>
"""Independent authentication of every lazy production-theorem no-good."""

from __future__ import annotations

import hashlib
import json
from pathlib import Path


HERE = Path(__file__).resolve().parent
PATTERN = {
    1: {0, 3, 6, 8}, 2: {3, 0, 7, 10}, 3: {6, 1, 5, 8},
    4: {10, 2, 6, 7}, 5: {9, 3, 10, 8},
    7: {11, 1, 3, 9}, 8: {12, 2, 3, 7},
}


def digest(text: str) -> str:
    return hashlib.sha256((text + "\n").encode()).hexdigest()


def support(readback: dict, role: str) -> set[int]:
    return {int(readback[f"s_{role}_{i}"]) for i in range(4)}


def authentic(record: dict, readback: dict) -> list[str]:
    errors: list[str] = []
    embedding = record["embedding"]
    values = {int(label): int(value) for label, value in embedding["values"].items()}
    rows = {int(label): role for label, role in embedding["center_rows"].items()}
    terms = {int(label): term for label, term in embedding["terms"].items()}
    if set(values) != set(range(13)) or len(set(values.values())) != 13:
        errors.append("embedding is not an injective Fin 13 assignment")
    for label, term in terms.items():
        if int(readback[term]) != values[label]:
            errors.append(f"term/value mismatch at label {label}")
    for center, targets in PATTERN.items():
        role = rows.get(center)
        if role is None:
            errors.append(f"missing center row {center}")
            continue
        if int(readback[f"b_{role}"]) != values[center]:
            errors.append(f"center value mismatch {center}")
        if support(readback, role) != {values[target] for target in targets}:
            errors.append(f"row pattern mismatch {center}")
    if record.get("sha256") != digest(record["clause"]):
        errors.append("clause SHA-256 mismatch")
    return errors


def smoke() -> dict:
    values = {label: label for label in range(13)}
    rows = {center: f"r{center}" for center in PATTERN}
    readback = {}
    for center, targets in PATTERN.items():
        readback[f"b_r{center}"] = center
        for index, target in enumerate(sorted(targets)):
            readback[f"s_r{center}_{index}"] = target
    terms = {str(label): f"p{label}" for label in range(13)}
    for label in range(13):
        readback[f"p{label}"] = label
    fake = {
        "embedding": {"values": {str(k): v for k, v in values.items()}, "terms": terms,
                      "center_rows": {str(k): v for k, v in rows.items()}},
        "clause": "synthetic", "sha256": digest("synthetic"),
    }
    positive = not authentic(fake, readback)
    readback["s_r1_0"] = 99
    negative = bool(authentic(fake, readback))
    return {"positive_exact_pattern": positive, "negative_corrupted_row": negative,
            "pass": positive and negative}


def main() -> int:
    terminal = json.loads((HERE / "TERMINAL.json").read_text())
    errors: list[str] = []
    records = []
    total = 0
    for case in ("retained", "common", "common_sameblocker"):
        cuts_path = HERE / f"cuts_{case}.json"
        cuts = json.loads(cuts_path.read_text())
        terminal_smt = (HERE / f"terminal_{case}.smt2").read_text() if (HERE / f"terminal_{case}.smt2").exists() else ""
        for cut in cuts:
            total += 1
            iteration = json.loads((HERE / "iterations" / f"{case}-{cut['iteration']:02d}.json").read_text())
            item_errors = authentic(cut, iteration["readback"])
            if cut["clause"] not in terminal_smt:
                item_errors.append("authenticated clause absent from terminal formula")
            records.append({"case": case, "iteration": cut["iteration"],
                            "status": "PASS" if not item_errors else "FAIL",
                            "errors": item_errors})
            errors.extend(f"{case}:{cut['iteration']}:{error}" for error in item_errors)
    if total != terminal.get("total_authenticated_nogoods"):
        errors.append("terminal no-good total mismatch")
    if total > 12:
        errors.append("global no-good cap exceeded")
    smoke_result = smoke()
    if not smoke_result["pass"]:
        errors.append("independent clause-validator smoke failed")
    result = {
        "status": "PASS" if not errors else "FAIL",
        "validator": "independent clause validator; imports no schema/wave module",
        "authenticated_nogoods": total,
        "records": records,
        "smoke": smoke_result,
        "errors": errors,
    }
    (HERE / "CLAUSE-VALIDATION.json").write_text(json.dumps(result, indent=2, sort_keys=True) + "\n")
    print(result["status"])
    return 0 if not errors else 2


if __name__ == "__main__":
    raise SystemExit(main())
