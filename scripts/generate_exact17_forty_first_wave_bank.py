"""Generate the unprovisioned Child41 suffix from the authenticated Child40 wave mine.

This is deliberately input-driven: the active ``named_order=1`` occurrence
family is read from the wave JSON, and an optional prefix limit permits a
later theorem-bank reduction without changing the encoder.
"""

from __future__ import annotations

import argparse
import hashlib
import json
import os
import tempfile
from pathlib import Path
from typing import Any

Clause = tuple[int, ...]
ROOT = Path(__file__).resolve().parents[1]
ANALYSIS_PATH = (
    ROOT / "scratch/exact17-lean-to-sat/child40-wave-mine/child40-analysis.json"
)
PARENT_PATH = (
    ROOT
    / "scratch/exact17-lean-to-sat/exact17-thirty-fortieth-root-thirty-ninth-model-refinements.cnf"
)
MODEL_PATH = ROOT / "scratch/exact17-lean-to-sat/piqd-child40-core1-custody-model.json"
ANALYSIS_SHA256 = "110ecabb4ec949fe943a1e69e240ff7a2253beb4b37f018c55ea6cb759d95541"
PARENT_SHA256 = "555d1d2facedc1cc3ea7a5bae31649b55e65fc2d14e8ad6e0742a023f9969034"
MODEL_SHA256 = "4691c0e416186c830f41e549f79076e1738fd83952d11371b4dc23ad8f7d3df7"
PARENT_CLAUSES = 5_847_584
VARIABLES = 308
ACTIVE_ORDER_INDEX = 1
ACTIVE_ORDER = (0, 6, 8, 11, 10, 12, 9, 7, 2, 15, 16, 3, 4, 5, 1, 13, 14)
ORDERS = (
    (0, 6, 8, 11, 10, 9, 12, 7, 2, 15, 16, 3, 4, 5, 1, 13, 14),
    ACTIVE_ORDER,
)


def sha256_file(path: Path) -> str:
    digest = hashlib.sha256()
    with path.open("rb") as handle:
        for chunk in iter(lambda: handle.read(1 << 20), b""):
            digest.update(chunk)
    return digest.hexdigest()


def _strict_object(pairs: list[tuple[str, Any]]) -> dict[str, Any]:
    value: dict[str, Any] = {}
    for key, item in pairs:
        if key in value:
            raise ValueError(f"duplicate JSON key: {key}")
        value[key] = item
    return value


def load_analysis(path: Path = ANALYSIS_PATH) -> dict[str, Any]:
    if sha256_file(path) != ANALYSIS_SHA256:
        raise ValueError("Child40 analysis hash drifted")
    value = json.loads(
        path.read_text(encoding="utf-8"), object_pairs_hook=_strict_object
    )
    if (
        not isinstance(value, dict)
        or value.get("schema") != "p97-exact17-child40-independent-wave-analysis/v2"
    ):
        raise ValueError("unexpected Child40 wave-analysis schema")
    if value.get("status") != "PASS":
        raise ValueError("wave analysis is not authenticated")
    occurrences = value.get("two_kalmanson_occurrences")
    if not isinstance(occurrences, list):
        raise TypeError("missing two-Kalmanson occurrence array")
    active = [
        entry
        for entry in occurrences
        if isinstance(entry, dict) and entry.get("order_index") == ACTIVE_ORDER_INDEX
    ]
    if len(active) != 1 or len(occurrences) != 1:
        raise ValueError("inactive named_order occurrence leaked into Child41 input")
    entry = active[0]
    if tuple(entry.get("order", ())) != ACTIVE_ORDER:
        raise ValueError("active named_order permutation drifted")
    candidates = entry.get("candidates")
    if not isinstance(candidates, list) or len(candidates) != 84:
        raise ValueError("expected exactly 84 active subset-minimal candidates")
    for index, candidate in enumerate(candidates):
        support = candidate.get("support") if isinstance(candidate, dict) else None
        if not isinstance(support, list) or not support:
            raise ValueError(f"candidate {index} support is malformed")
        for hit in support:
            if (
                not isinstance(hit, list)
                or len(hit) != 2
                or any(type(x) is not int or not 0 <= x < 17 for x in hit)
            ):
                raise ValueError(f"candidate {index} contains an invalid hit")
    return value


def _hit_var(center: int, point: int) -> int:
    return 1 + center * 17 + point


def _oriented_label(order: tuple[int, ...], index: int, reverse: bool) -> int:
    return order[16 - index] if reverse else order[index]


def clauses_from_support(support: list[list[int]]) -> tuple[Clause, ...]:
    """Mirror Lean's ``occurrenceClauses`` order: order 0/1, forward/reverse."""
    clauses: list[Clause] = []
    for order_index, order in enumerate(ORDERS):
        for reverse in (False, True):
            hits = tuple(
                (
                    -_hit_var(
                        _oriented_label(order, hit[0], reverse),
                        _oriented_label(order, hit[1], reverse),
                    )
                )
                for hit in support
            )
            clauses.append((-(307 + order_index), *hits))
    return tuple(clauses)


def build_bank(
    path: Path = ANALYSIS_PATH, *, candidate_limit: int | None = None
) -> tuple[Clause, ...]:
    analysis = load_analysis(path)
    candidates = analysis["two_kalmanson_occurrences"][0]["candidates"]
    if candidate_limit is not None and (
        candidate_limit < 1 or candidate_limit > len(candidates)
    ):
        raise ValueError(
            "candidate_limit must be between 1 and the active candidate count"
        )
    selected = candidates if candidate_limit is None else candidates[:candidate_limit]
    return tuple(
        clause
        for candidate in selected
        for clause in clauses_from_support(candidate["support"])
    )


def write_bank(path: Path, *, candidate_limit: int | None = None) -> dict[str, Any]:
    if path.exists():
        raise FileExistsError(f"refusing to overwrite {path}")
    clauses = build_bank(candidate_limit=candidate_limit)
    payload = {
        "schema": "p97-exact17-child41-wave-bank/v1",
        "status": "PASS",
        "source_analysis": str(ANALYSIS_PATH.resolve()),
        "source_analysis_sha256": ANALYSIS_SHA256,
        "parent": {
            "path": str(PARENT_PATH.resolve()),
            "sha256": PARENT_SHA256,
            "clauses": PARENT_CLAUSES,
        },
        "variables": VARIABLES,
        "candidate_count": len(clauses) // 4,
        "clauses": [list(clause) for clause in clauses],
        "clause_count": len(clauses),
        "publication_state": "UNPROVISIONED",
    }
    path.parent.mkdir(parents=True, exist_ok=True)
    fd, name = tempfile.mkstemp(
        prefix=f".{path.name}.", suffix=".candidate", dir=path.parent
    )
    candidate = Path(name)
    try:
        with os.fdopen(fd, "w", encoding="utf-8") as handle:
            json.dump(payload, handle, indent=2, sort_keys=True)
            handle.write("\n")
            handle.flush()
            os.fsync(handle.fileno())
        os.link(candidate, path, follow_symlinks=False)
        return payload
    finally:
        candidate.unlink(missing_ok=True)


if __name__ == "__main__":
    parser = argparse.ArgumentParser()
    parser.add_argument("--output", type=Path, required=True)
    parser.add_argument("--candidate-limit", type=int)
    args = parser.parse_args()
    print(
        json.dumps(
            write_bank(args.output, candidate_limit=args.candidate_limit),
            indent=2,
            sort_keys=True,
        )
    )
