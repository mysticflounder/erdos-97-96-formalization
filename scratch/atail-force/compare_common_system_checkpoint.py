#!/usr/bin/env python3
"""Report structural drift in the common-system CEGAR checkpoint.

This is read-only: it rebuilds the deterministic checkpoint at the saved
round budget, suppresses progress logging, and prints the first differences.
"""

from __future__ import annotations

import contextlib
import io
import json
from pathlib import Path
from typing import Any

import common_system_metric_probe as probe


def first_differences(
    saved: Any, current: Any, path: str = "$", limit: int = 20
) -> list[str]:
    if limit <= 0 or saved == current:
        return []
    if type(saved) is not type(current):
        return [f"{path}: type {type(saved).__name__} != {type(current).__name__}"]
    if isinstance(saved, dict):
        differences: list[str] = []
        for key in sorted(set(saved) | set(current)):
            if key not in saved:
                differences.append(f"{path}.{key}: missing from saved")
            elif key not in current:
                differences.append(f"{path}.{key}: missing from current")
            else:
                differences.extend(
                    first_differences(
                        saved[key], current[key], f"{path}.{key}",
                        limit - len(differences),
                    )
                )
            if len(differences) >= limit:
                break
        return differences
    if isinstance(saved, list):
        if len(saved) != len(current):
            return [f"{path}: length {len(saved)} != {len(current)}"]
        differences = []
        for index, (left, right) in enumerate(zip(saved, current, strict=True)):
            differences.extend(
                first_differences(
                    left, right, f"{path}[{index}]", limit - len(differences)
                )
            )
            if len(differences) >= limit:
                break
        return differences
    return [f"{path}: {saved!r} != {current!r}"]


def main() -> int:
    checkpoint_path = Path(probe.CHECKPOINT)
    saved = json.loads(checkpoint_path.read_text(encoding="utf-8"))
    budget = int(saved["budgets"]["max_rounds_per_case"])
    with contextlib.redirect_stdout(io.StringIO()):
        current = probe.build_checkpoint(max_rounds=budget)
    differences = first_differences(saved, current)
    if not differences:
        print("checkpoint: MATCH")
        return 0
    print("checkpoint: STALE")
    for difference in differences:
        print(difference)
    return 1


if __name__ == "__main__":
    raise SystemExit(main())
