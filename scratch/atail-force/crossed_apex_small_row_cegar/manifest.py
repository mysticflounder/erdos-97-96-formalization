#!/usr/bin/env python3
"""Deterministic outer-case manifest for crossed small apex rows.

This enumerates only the finite cardinality/cap-piece/intersection boundary.
It does not build coordinate equations and does not invoke a solver.
"""

from __future__ import annotations

import argparse
import hashlib
import json
import os
import tempfile
from pathlib import Path
from typing import Any


SCHEMA = "p97_atail_crossed_small_apex_rows_manifest.v1"
HERE = Path(__file__).resolve().parent
DEFAULT_OUTPUT = HERE / "manifest.json"
ROW_CARDS = (4, 5)
INTERSECTION_CARDS = (0, 1, 2)


class ManifestError(RuntimeError):
    """Raised when the immutable case contract drifts."""


def _require(condition: bool, message: str) -> None:
    if not condition:
        raise ManifestError(message)


def _sha256(path: Path) -> str:
    digest = hashlib.sha256()
    with path.open("rb") as handle:
        for block in iter(lambda: handle.read(1024 * 1024), b""):
            digest.update(block)
    return digest.hexdigest()


def _json_digest(value: Any) -> str:
    payload = json.dumps(value, sort_keys=True, separators=(",", ":"))
    return hashlib.sha256(payload.encode("utf-8")).hexdigest()


def row_distributions(card: int) -> tuple[tuple[int, int, int], ...]:
    """Return `(surplus, other_cap, own_strict_cap)` row counts.

    The two adjacent-cap one-hit bounds give the first two counts at most one.
    The selected-class interior theorem gives at least two own-strict points.
    """

    _require(card in ROW_CARDS, f"unsupported row cardinality {card}")
    rows = []
    for surplus in range(2):
        for other in range(2):
            own = card - surplus - other
            if own >= 2:
                rows.append((surplus, other, own))
    result = tuple(rows)
    _require(len(result) == 4, f"distribution-count drift at card {card}")
    return result


def _distribution_json(values: tuple[int, int, int]) -> dict[str, int]:
    surplus, other, own = values
    return {
        "surplus_cap": surplus,
        "other_opposite_cap": other,
        "own_strict_cap": own,
    }


def build_cases() -> list[dict[str, Any]]:
    cases: list[dict[str, Any]] = []
    for ra_card in ROW_CARDS:
        for rb_card in ROW_CARDS:
            for ra_index, ra_dist in enumerate(row_distributions(ra_card)):
                for rb_index, rb_dist in enumerate(row_distributions(rb_card)):
                    for intersection_card in INTERSECTION_CARDS:
                        case_id = (
                            f"ra{ra_card}d{ra_index}_rb{rb_card}d{rb_index}"
                            f"_i{intersection_card}"
                        )
                        cases.append(
                            {
                                "case_id": case_id,
                                "ra_card": ra_card,
                                "rb_card": rb_card,
                                "ra_distribution": _distribution_json(ra_dist),
                                "rb_distribution": _distribution_json(rb_dist),
                                "row_intersection_card": intersection_card,
                            }
                        )
    _require(len(cases) == 192, "outer-case count drift")
    _require(
        len({case["case_id"] for case in cases}) == len(cases),
        "duplicate outer case id",
    )
    return cases


def build_manifest() -> dict[str, Any]:
    cases = build_cases()
    body = {
        "schema": SCHEMA,
        "status": "SPECIFIED_NOT_RUN",
        "owner": "ATAIL-FORCE crossed small apex-row SAT-first pilot",
        "generator_sha256": _sha256(Path(__file__).resolve()),
        "case_count": len(cases),
        "outer_axes": {
            "ra_card": list(ROW_CARDS),
            "rb_card": list(ROW_CARDS),
            "row_intersection_card": list(INTERSECTION_CARDS),
            "cap_piece_distribution_count_per_row_card": 4,
        },
        "encoded_here": {
            "selected_row_cardinality_four_or_five": True,
            "adjacent_cap_one_hit_counts": True,
            "own_strict_cap_count_at_least_two": True,
            "distinct_center_circle_intersection_card_at_most_two": True,
        },
        "not_encoded_here": {
            "coordinates": True,
            "convex_order": True,
            "mec_or_nonobtuse_geometry": True,
            "critical_shell_system": True,
            "all_center_k4": True,
            "solver_query": True,
        },
        "claim_scope": (
            "finite outer-case enumeration only; no realizability, "
            "unsatisfiability, Lean, or closure claim"
        ),
        "cases": cases,
    }
    return {**body, "manifest_sha256": _json_digest(body)}


def _canonical(value: Any) -> str:
    return json.dumps(value, sort_keys=True, indent=2) + "\n"


def _write_atomic(path: Path, content: str) -> None:
    path.parent.mkdir(parents=True, exist_ok=True)
    fd, temporary = tempfile.mkstemp(prefix=f".{path.name}.", dir=path.parent)
    try:
        with os.fdopen(fd, "w", encoding="utf-8") as handle:
            handle.write(content)
            handle.flush()
            os.fsync(handle.fileno())
        os.replace(temporary, path)
    finally:
        if os.path.exists(temporary):
            os.unlink(temporary)


def write_manifest(path: Path) -> None:
    _write_atomic(path, _canonical(build_manifest()))


def check_manifest(path: Path) -> None:
    try:
        stored = json.loads(path.read_text(encoding="utf-8"))
    except (OSError, json.JSONDecodeError) as exc:
        raise ManifestError(f"cannot read manifest {path}: {exc}") from exc
    expected = build_manifest()
    _require(stored == expected, f"manifest drift: regenerate {path}")


def main() -> None:
    parser = argparse.ArgumentParser()
    mode = parser.add_mutually_exclusive_group(required=True)
    mode.add_argument("--write", action="store_true")
    mode.add_argument("--check", action="store_true")
    parser.add_argument("--output", type=Path, default=DEFAULT_OUTPUT)
    args = parser.parse_args()
    if args.write:
        write_manifest(args.output)
        print(f"wrote {args.output} ({len(build_cases())} cases)")
    else:
        check_manifest(args.output)
        print(f"PASS {args.output} ({len(build_cases())} cases)")


if __name__ == "__main__":
    main()
