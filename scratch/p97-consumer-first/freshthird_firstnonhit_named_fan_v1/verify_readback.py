"""Independent artifact/readback checks for the prelaunch named-fan packet."""

from __future__ import annotations

import json
from pathlib import Path
from typing import Any


def validate(root: Path) -> list[str]:
    errors: list[str] = []
    artifacts = sorted(root.glob("*.smt2"))
    if not artifacts:
        return ["no SMT2 artifacts"]
    for artifact in artifacts:
        sidecar = artifact.with_suffix(".json")
        if not sidecar.is_file():
            errors.append(f"missing sidecar: {sidecar.name}")
            continue
        text = artifact.read_text(encoding="utf-8")
        if text.count("(check-sat)") != 1:
            errors.append(f"check-sat count: {artifact.name}")
        try:
            record: dict[str, Any] = json.loads(sidecar.read_text(encoding="utf-8"))
        except json.JSONDecodeError:
            errors.append(f"malformed sidecar: {sidecar.name}")
            continue
        clauses = record.get("clauses", [])
        keys = [tuple(clause.get("key", [])) for clause in clauses]
        if len(keys) != len(set(keys)):
            errors.append(f"duplicate-gate key: {sidecar.name}")
        status = record.get("status")
        summary = record.get("summary")
        if status == "sat":
            if not isinstance(summary, dict) or summary.get("q_support_count") != 4:
                errors.append(f"bad Q readback: {sidecar.name}")
            owners = summary.get("actual_blocker_rows", []) if isinstance(summary, dict) else []
            if len(owners) != 4 or any(len(row) != 1 for row in owners):
                errors.append(f"bad actual-blocker readback: {sidecar.name}")
        elif status != "unsat":
            errors.append(f"unsupported status {status!r}: {sidecar.name}")
    return errors


if __name__ == "__main__":
    import argparse

    parser = argparse.ArgumentParser()
    parser.add_argument("root", type=Path)
    args = parser.parse_args()
    failures = validate(args.root)
    if failures:
        print("status=FAIL")
        print("\n".join(failures[:20]))
        raise SystemExit(1)
    print(f"status=PASS artifacts={len(list(args.root.glob('*.smt2')))}")
