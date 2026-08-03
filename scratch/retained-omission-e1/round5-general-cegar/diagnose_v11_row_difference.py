#!/usr/bin/env python3
"""Mine rank-three row-difference power-pattern certificates from v11 models."""

from __future__ import annotations

import concurrent.futures
import gzip
import hashlib
import itertools
import json
import re
import time
from pathlib import Path

import z3

import round5_cegar_v9 as v9


ROOT = Path("artifacts-v11/20260802T093313.097282Z-retry-pid99343")
CASE_ID = re.compile(
    r"^(fresh|paired|secondcap_collision|secondcap_distinct)_"
    r"([SD]{3})_k(\d+)_d(\d+)(?:_f(\d+))?$"
)
PERMUTATIONS_4 = tuple(itertools.permutations(range(4)))


def _case_from_id(case_id: str) -> v9.Case:
    match = CASE_ID.match(case_id)
    if match is None:
        raise ValueError(f"bad case id: {case_id}")
    arm, profiles, kept, deleted, fresh = match.groups()
    return v9.Case(
        arm,
        profiles,
        int(kept),
        int(deleted),
        None if fresh is None else int(fresh),
    )


def _certificate(
    reference: v9.FullShell,
    rows: tuple[v9.FullShell, ...],
    columns: tuple[int, ...],
    support: dict[str, tuple[bool, ...]],
) -> dict[str, object]:
    zero_cells: list[list[int]] = []
    nonzero_cells: list[list[int]] = []
    for row_index, row in enumerate(rows):
        for column_index, point in enumerate(columns):
            reference_on = support[reference.name][point]
            row_on = support[row.name][point]
            if reference_on and row_on:
                zero_cells.append([row_index, column_index])
            elif reference_on != row_on:
                nonzero_cells.append([row_index, column_index])
    diagonal = {(index, index) for index in range(4)}
    if not diagonal <= {tuple(cell) for cell in nonzero_cells}:
        raise AssertionError("matching cell is not certified nonzero")

    eliminated: list[dict[str, object]] = []
    for permutation in PERMUTATIONS_4:
        if permutation == (0, 1, 2, 3):
            continue
        blocker = next(
            (row for row in range(4) if permutation[row] < row),
            None,
        )
        if blocker is None or [blocker, permutation[blocker]] not in zero_cells:
            raise AssertionError("upper-triangular certificate missed a permutation")
        eliminated.append(
            {
                "permutation": list(permutation),
                "zero_blocker": [blocker, permutation[blocker]],
            }
        )
    return {
        "reference": {"name": reference.name, "kind": reference.kind},
        "rows": [{"name": row.name, "kind": row.kind} for row in rows],
        "columns": list(columns),
        "matching": [[index, index] for index in range(4)],
        "forced_zero_cells": zero_cells,
        "certified_nonzero_cells": nonzero_cells,
        "eliminated_permutations": eliminated,
    }


def find_certificate(
    encoding: v9.Encoding,
    model: z3.ModelRef,
) -> tuple[dict[str, object] | None, int]:
    shells = tuple(sorted(v9.active_full_shells(encoding, model), key=lambda x: x.name))
    support = {
        shell.name: tuple(encoding._bool(model, bit) for bit in shell.support)
        for shell in shells
    }
    chains_checked = 0
    for reference in shells:
        reference_points = tuple(
            point for point in v9.POINTS if support[reference.name][point]
        )
        others = tuple(shell for shell in shells if shell.name != reference.name)
        for c0, c1, c2 in itertools.permutations(reference_points, 3):
            previous = (c0, c1, c2)
            for c3 in v9.POINTS:
                if c3 in previous:
                    continue
                columns = (c0, c1, c2, c3)
                candidates0 = tuple(
                    row for row in others if not support[row.name][c0]
                )
                candidates1 = tuple(
                    row
                    for row in others
                    if support[row.name][c0] and not support[row.name][c1]
                )
                candidates2 = tuple(
                    row
                    for row in others
                    if support[row.name][c0]
                    and support[row.name][c1]
                    and not support[row.name][c2]
                )
                candidates3 = tuple(
                    row
                    for row in others
                    if support[row.name][c0]
                    and support[row.name][c1]
                    and support[row.name][c2]
                    and support[row.name][c3] != support[reference.name][c3]
                )
                for rows in itertools.product(
                    candidates0, candidates1, candidates2, candidates3
                ):
                    chains_checked += 1
                    if len({row.name for row in rows}) != 4:
                        continue
                    certificate = _certificate(reference, rows, columns, support)
                    certificate["chains_checked_before_hit"] = chains_checked
                    return certificate, chains_checked
    return None, chains_checked


def classify(path_text: str) -> dict[str, object]:
    path = Path(path_text)
    case = _case_from_id(path.parent.name)
    with gzip.open(path, "rt", encoding="utf-8") as handle:
        smt = handle.read().replace("\n(check-sat)\n", "\n")
    solver = z3.Solver()
    solver.set(timeout=30_000, random_seed=97)
    solver.add(z3.parse_smt2_string(smt))
    started = time.monotonic()
    outcome = solver.check()
    if outcome != z3.sat:
        return {"case": case.case_id, "status": str(outcome)}
    encoding = v9.Encoding(case, timeout_ms=30_000, seed=97)
    certificate, chains_checked = find_certificate(encoding, solver.model())
    result: dict[str, object] = {
        "case": case.case_id,
        "status": "hit" if certificate is not None else "no_hit",
        "chains_checked": chains_checked,
        "elapsed_s": round(time.monotonic() - started, 3),
    }
    if certificate is not None:
        result["certificate"] = certificate
    return result


def main() -> None:
    paths = sorted(str(path) for path in ROOT.glob("*/boolean_encoding.smt2.gz"))
    started = time.monotonic()
    with concurrent.futures.ProcessPoolExecutor(max_workers=8) as pool:
        rows = list(pool.map(classify, paths))
    hits = [row for row in rows if row["status"] == "hit"]
    print(
        json.dumps(
            {
                "cases": len(rows),
                "hits": len(hits),
                "no_hits": sum(row["status"] == "no_hit" for row in rows),
                "chains_checked_total": sum(
                    int(row.get("chains_checked", 0)) for row in rows
                ),
                "chains_checked_range": [
                    min(int(row.get("chains_checked", 0)) for row in rows),
                    max(int(row.get("chains_checked", 0)) for row in rows),
                ],
                "elapsed_s": round(time.monotonic() - started, 3),
                "script_sha256": hashlib.sha256(Path(__file__).read_bytes()).hexdigest(),
                "hit_case_ids": [row["case"] for row in hits],
                "no_hit_case_ids": [
                    row["case"] for row in rows if row["status"] == "no_hit"
                ],
            },
            separators=(",", ":"),
            sort_keys=True,
        )
    )
    if hits:
        first = hits[0]
        certificate = first["certificate"]
        assert isinstance(certificate, dict)
        eliminated = certificate["eliminated_permutations"]
        assert isinstance(eliminated, list)
        compact_certificate = {
            "reference": certificate["reference"],
            "rows": certificate["rows"],
            "columns": certificate["columns"],
            "matching": certificate["matching"],
            "forced_zero_cells": certificate["forced_zero_cells"],
            "certified_nonzero_cells": certificate["certified_nonzero_cells"],
            "eliminated": [
                ["".join(str(value) for value in item["permutation"]), *item["zero_blocker"]]
                for item in eliminated
            ],
        }
        print(
            json.dumps(
                {"case": first["case"], "certificate": compact_certificate},
                separators=(",", ":"),
                sort_keys=True,
            )
        )


if __name__ == "__main__":
    main()
