#!/usr/bin/env python3
"""Emit the exact three-selector CNF for the non-s2_o0 v7 shell cases."""

from __future__ import annotations

import hashlib
import itertools
import json
from pathlib import Path


HERE = Path(__file__).resolve().parent
REPO = HERE.parents[1]
RUNS = REPO / "scratch/card11-exact5-common-fullradius-v7/runs"
OUT = (
    REPO
    / "scratch/card11-exact5-common-fullradius-v7-g3"
)
ALL_CASES = ("s2_o0", "s2_o9", "s3_o0", "s3_o9")
SELECTED_CASES = ("s2_o9", "s3_o0", "s3_o9")
BASE_VARIABLES = 49_357
SELECTORS = {
    case: BASE_VARIABLES + offset
    for offset, case in enumerate(SELECTED_CASES, start=1)
}
EXPECTED_INPUT_CLAUSES = 1_370_778
EXPECTED_COMMON_CLAUSES = 1_370_732
EXPECTED_DELTA_POSITIONS = 46
EXPECTED_OUTPUT_CLAUSES = 1_370_871


def sha256(path: Path) -> str:
    digest = hashlib.sha256()
    with path.open("rb") as handle:
        for chunk in iter(lambda: handle.read(1 << 20), b""):
            digest.update(chunk)
    return digest.hexdigest()


def main() -> None:
    OUT.mkdir(parents=True, exist_ok=True)
    output_path = OUT / "input.cnf"
    handles = {
        case: (RUNS / case / "input.cnf").open("rb")
        for case in ALL_CASES
    }
    try:
        headers = {case: handle.readline() for case, handle in handles.items()}
        if len(set(headers.values())) != 1:
            raise RuntimeError(f"input headers differ: {headers!r}")

        common_count = 0
        delta_count = 0
        input_count = 0
        with output_path.open("wb") as output:
            output.write(
                f"p cnf {BASE_VARIABLES + len(SELECTED_CASES)} "
                f"{EXPECTED_OUTPUT_CLAUSES}\n".encode()
            )
            output.write(
                (" ".join(str(SELECTORS[case]) for case in SELECTED_CASES)
                 + " 0\n").encode()
            )
            rows_by_case = [handles[case] for case in ALL_CASES]
            for rows in itertools.zip_longest(*rows_by_case):
                if any(row is None for row in rows):
                    raise RuntimeError("input CNFs have unequal clause counts")
                input_count += 1
                row_map = dict(zip(ALL_CASES, rows))
                if len(set(rows)) == 1:
                    output.write(rows[0])
                    common_count += 1
                    continue

                delta_count += 1
                for case in SELECTED_CASES:
                    row = row_map[case]
                    if not row.endswith(b" 0\n"):
                        raise RuntimeError(
                            f"noncanonical DIMACS row at clause {input_count}"
                        )
                    output.write(f"-{SELECTORS[case]} ".encode() + row)
    finally:
        for handle in handles.values():
            handle.close()

    if input_count != EXPECTED_INPUT_CLAUSES:
        raise RuntimeError(
            f"read {input_count} input clauses, expected "
            f"{EXPECTED_INPUT_CLAUSES}"
        )
    if common_count != EXPECTED_COMMON_CLAUSES:
        raise RuntimeError(
            f"wrote {common_count} common clauses, expected "
            f"{EXPECTED_COMMON_CLAUSES}"
        )
    if delta_count != EXPECTED_DELTA_POSITIONS:
        raise RuntimeError(
            f"saw {delta_count} delta positions, expected "
            f"{EXPECTED_DELTA_POSITIONS}"
        )

    line_count = sum(1 for _ in output_path.open("rb"))
    if line_count != EXPECTED_OUTPUT_CLAUSES + 1:
        raise RuntimeError(
            f"output has {line_count - 1} clauses, expected "
            f"{EXPECTED_OUTPUT_CLAUSES}"
        )

    manifest = {
        "schema": "card11_exact5_common_fullradius.v7.g3.v1",
        "status": "CNF_MATERIALIZED",
        "construction": (
            "all-four common position clauses, one selector-totality clause, "
            "and selector-guarded case deltas for s2_o9/s3_o0/s3_o9"
        ),
        "selected_cases": list(SELECTED_CASES),
        "selector_variables": SELECTORS,
        "variables": BASE_VARIABLES + len(SELECTED_CASES),
        "clauses": EXPECTED_OUTPUT_CLAUSES,
        "common_clauses": common_count,
        "delta_positions": delta_count,
        "guarded_delta_clauses": delta_count * len(SELECTED_CASES),
        "input_sha256": {
            case: sha256(RUNS / case / "input.cnf")
            for case in ALL_CASES
        },
        "output_sha256": sha256(output_path),
    }
    (OUT / "manifest.json").write_text(
        json.dumps(manifest, indent=2, sort_keys=True) + "\n"
    )
    print(json.dumps(manifest, sort_keys=True))


if __name__ == "__main__":
    main()
