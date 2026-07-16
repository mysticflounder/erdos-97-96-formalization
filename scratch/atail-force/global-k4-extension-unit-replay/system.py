#!/usr/bin/env python3
"""Pinned O,D,E,I,F equality subsystem from global-k4-extension.

The source checkpoint fixes point 0 to ``(0,0)`` and point 1 to ``(1,0)``.
This module refuses to expose a polynomial stream if either the source files,
the retained rows, or the checkpoint's canonical polynomial hash drift.
"""

from __future__ import annotations

import hashlib
import json
import sys
from pathlib import Path


HERE = Path(__file__).resolve().parent
ROOT = HERE.parents[2]
SOURCE_CHECKPOINT = HERE.parent / "global-k4-extension" / "checkpoint.json"
ORACLE_DIR = HERE.parent / "second_center_metric_oracle"
ORACLE_SOURCE = ORACLE_DIR / "oracle.py"

EXPECTED_SOURCE_CHECKPOINT_SHA256 = (
    "d367dac91f6517e3576e730ca2702500a34ef163385af1f44fc34b2ff6c80e13"
)
EXPECTED_ORACLE_SHA256 = (
    "b708722ce49f9d0f165facf20a911161815ce8018c5fc3760bf872dad6977a09"
)
EXPECTED_POLYNOMIAL_SHA256 = (
    "2a2968b306d27ed9f8b6f8be3b4ee19d7b438713456fa7949dcaa15131a1b5b0"
)
EXPECTED_CENTER_NAMES = ("O", "D", "E", "I", "F")
ROWS = (
    (0, (1, 2, 6, 7, 8)),
    (6, (1, 8, 12, 13)),
    (8, (0, 4, 7, 13)),
    (12, (0, 3, 7, 8)),
    (13, (1, 3, 9, 12)),
)

for path in (ROOT, ORACLE_DIR):
    if str(path) not in sys.path:
        sys.path.insert(0, str(path))

import oracle  # noqa: E402


def file_sha256(path: Path) -> str:
    return hashlib.sha256(path.read_bytes()).hexdigest()


def canonical_sha256(value: object) -> str:
    payload = json.dumps(value, sort_keys=True, separators=(",", ":")).encode()
    return hashlib.sha256(payload).hexdigest()


def source_record() -> dict[str, object]:
    source_hash = file_sha256(SOURCE_CHECKPOINT)
    oracle_hash = file_sha256(ORACLE_SOURCE)
    if source_hash != EXPECTED_SOURCE_CHECKPOINT_SHA256:
        raise RuntimeError(
            "global-k4-extension checkpoint drift: "
            f"expected {EXPECTED_SOURCE_CHECKPOINT_SHA256}, found {source_hash}"
        )
    if oracle_hash != EXPECTED_ORACLE_SHA256:
        raise RuntimeError(
            "metric oracle drift: "
            f"expected {EXPECTED_ORACLE_SHA256}, found {oracle_hash}"
        )

    checkpoint = json.loads(SOURCE_CHECKPOINT.read_text(encoding="utf-8"))
    retained = checkpoint["metric_realizability_of_one_completion"][
        "retained_unit_subsystem"
    ]
    rows = tuple(
        (int(record["center"]), tuple(int(x) for x in record["support"]))
        for record in retained["rows"]
    )
    names = tuple(str(name) for name in retained["center_names"])
    if rows != ROWS:
        raise RuntimeError(f"retained row drift: expected {ROWS}, found {rows}")
    if names != EXPECTED_CENTER_NAMES:
        raise RuntimeError(
            f"retained center-name drift: expected {EXPECTED_CENTER_NAMES}, found {names}"
        )
    if int(retained["equality_count"]) != 16:
        raise RuntimeError("retained equality-count drift")
    if retained["expanded_polynomial_sha256"] != EXPECTED_POLYNOMIAL_SHA256:
        raise RuntimeError("checkpoint polynomial hash drift")
    return {
        "source_checkpoint": str(SOURCE_CHECKPOINT.relative_to(ROOT)),
        "source_checkpoint_sha256": source_hash,
        "oracle_source": str(ORACLE_SOURCE.relative_to(ROOT)),
        "oracle_source_sha256": oracle_hash,
        "center_names": list(names),
        "rows": [
            {"center": center, "support": list(support)}
            for center, support in rows
        ],
    }


def named_generators() -> tuple[tuple[str, str], ...]:
    source_record()
    metric_rows = tuple(
        oracle.MetricRow(center, support, exact=False)
        for center, support in ROWS
    )
    polynomials = oracle.serialized_system(14, metric_rows)
    names = tuple(
        f"ROW_{center}_{support[0]}_{member}"
        for center, support in ROWS
        for member in support[1:]
    )
    if len(polynomials) != 16 or len(names) != len(polynomials):
        raise RuntimeError("expected exactly sixteen retained equalities")
    if canonical_sha256(list(polynomials)) != EXPECTED_POLYNOMIAL_SHA256:
        raise RuntimeError("reconstructed polynomial stream drift")
    return tuple(zip(names, polynomials, strict=True))


def variable_names() -> tuple[str, ...]:
    return tuple(str(symbol) for symbol in oracle.variable_symbols(14))


if __name__ == "__main__":
    named = named_generators()
    print(json.dumps({
        **source_record(),
        "expanded_polynomial_count": len(named),
        "expanded_polynomial_sha256": canonical_sha256(
            [polynomial for _, polynomial in named]
        ),
        "generators": [
            {"name": name, "polynomial": polynomial}
            for name, polynomial in named
        ],
    }, indent=2, sort_keys=True))
