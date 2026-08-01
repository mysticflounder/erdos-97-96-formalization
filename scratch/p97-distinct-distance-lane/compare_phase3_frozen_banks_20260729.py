#!/usr/bin/env python3
"""Replay and compare the three frozen Phase-3 learned-certificate banks."""

from __future__ import annotations

import json
import time
from itertools import combinations
from pathlib import Path

from census.p97_search import phase3_structural_cegar as cegar


ROOT = Path("scratch/p97-distinct-distance-lane")
BANKS = {
    "cube22_frozen": (
        ROOT
        / "phase3_projected_cube22_frozen_learned_20260729"
        / "learned-certificates.jsonl"
    ),
    "projected_sequential_frozen": (
        ROOT
        / "phase3_projected_sequential_frozen_learned_20260729"
        / "learned-certificates.jsonl"
    ),
    "kalmanson_sequential_frozen": (
        ROOT
        / "phase3_kalmanson_sequential_frozen_learned_20260729"
        / "learned-certificates.jsonl"
    ),
}
OUTPUT = ROOT / "phase3_frozen_bank_loader_comparison_20260729.json"


def clause_key(record: dict[str, object]) -> tuple[int, ...]:
    return tuple(int(literal) for literal in record["clause"])


def category(record: dict[str, object]) -> str:
    certificate = record["certificate"]
    assert isinstance(certificate, dict)
    return str(certificate.get("schema", "structural-row-certificate"))


encoding = cegar.sat.SatEncoding(cegar.CELL, blocker=True, cap=True)
result: dict[str, object] = {
    "loader": "census.p97_search.phase3_structural_cegar._bootstrap_certificates",
    "encoding": {
        "cell": {
            "k": cegar.CELL.k,
            "n": cegar.CELL.n,
            "profile": list(cegar.CELL.profile),
            "exact": cegar.CELL.exact,
        },
        "variable_count": encoding.num_vars,
        "base_clause_count": len(encoding.clauses),
    },
    "banks": {},
    "pairwise": {},
}
clause_sets: dict[str, set[tuple[int, ...]]] = {}
category_sets: dict[str, dict[str, set[tuple[int, ...]]]] = {}

for name, path in BANKS.items():
    started = time.perf_counter()
    learned, summary = cegar._bootstrap_certificates(encoding, path)
    elapsed = time.perf_counter() - started
    clauses = {clause_key(record) for record in learned}
    by_category: dict[str, set[tuple[int, ...]]] = {}
    for record in learned:
        by_category.setdefault(category(record), set()).add(clause_key(record))
    clause_sets[name] = clauses
    category_sets[name] = by_category
    result["banks"][name] = {
        "path": str(path),
        "elapsed_seconds": round(elapsed, 6),
        "returned_learned_cut_count": len(learned),
        "returned_unique_clause_count": len(clauses),
        "returned_category_counts": {
            key: len(value) for key, value in sorted(by_category.items())
        },
        "loader_summary": summary,
    }

for left, right in combinations(BANKS, 2):
    shared = clause_sets[left] & clause_sets[right]
    left_only = clause_sets[left] - clause_sets[right]
    right_only = clause_sets[right] - clause_sets[left]
    categories = sorted(category_sets[left] | category_sets[right])
    result["pairwise"][f"{left}__vs__{right}"] = {
        "exact_clause_intersection_count": len(shared),
        f"{left}_only_count": len(left_only),
        f"{right}_only_count": len(right_only),
        "jaccard": len(shared) / len(clause_sets[left] | clause_sets[right]),
        "category_intersection_counts": {
            key: len(
                category_sets[left].get(key, set())
                & category_sets[right].get(key, set())
            )
            for key in categories
        },
    }

sequence = list(BANKS)
seen: set[tuple[int, ...]] = set()
result["ordered_incremental"] = {}
for name in sequence:
    incremental = clause_sets[name] - seen
    result["ordered_incremental"][name] = {
        "new_exact_clause_count": len(incremental),
        "already_seen_exact_clause_count": len(clause_sets[name] & seen),
    }
    seen |= clause_sets[name]
result["union_exact_clause_count"] = len(seen)

OUTPUT.write_text(json.dumps(result, indent=2, sort_keys=True) + "\n")
print(OUTPUT)
for name in BANKS:
    bank = result["banks"][name]
    summary = bank["loader_summary"]
    print(
        name,
        "records=", summary["source_record_count"],
        "unique=", summary["source_unique_certificate_count"],
        "projected=", summary["structural_projected_unique_clause_count"],
        "kept=", summary["kept_antichain_count"],
        "seconds=", bank["elapsed_seconds"],
    )
for pair, comparison in result["pairwise"].items():
    print(pair, comparison)
print("ordered_incremental", result["ordered_incremental"])
print("union_exact_clause_count", result["union_exact_clause_count"])
