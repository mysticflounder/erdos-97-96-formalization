#!/usr/bin/env python3
"""Bank wave-2 weighted certificates and normalize the live PIQD formula."""

from __future__ import annotations

import hashlib
import importlib.util
import json
import os
import sys
from collections import defaultdict
from pathlib import Path
from types import ModuleType
from typing import Any, Iterable

HERE = Path(__file__).resolve().parent
REPO = HERE.parents[1]
SUPPORT = REPO / "scratch/rigid221-blockerv-exact17-20260806"
ORBIT_COMPILER = SUPPORT / "append_weighted_kalmanson_dihedral_orbits.py"
FORMULA_CHAIN = SUPPORT / "piqd_formula_chain.py"
CERTIFICATE_DIR = HERE / "postwave-theorem-search-wave2"
ROOT_CNF = HERE / "postwave-base.cnf"
RECEIPTS = tuple(HERE / f"postwave-cut-{index}.json" for index in range(1, 9))
FRAGMENT = HERE / "postwave-wave2-weighted-orbits.dimacs"
AGGREGATE = HERE / "postwave-wave2-base.cnf"
MANIFEST = HERE / "postwave-wave2-weighted-orbits.manifest.json"
SCHEMA = "p97-exact17-piqd-postwave-wave2-weighted-orbits/v1"
ROOT_SHA256 = "ef3d0063b9447b49fc467cfaeb9947070c5df956d195c1628c96bb4df6d8f5e1"
VARIABLES = 74_813
ROOT_CLAUSES = 4_255_460
CHAIN_CLAUSES = 4_258_749
SESSION_ID = "4876f14c-554d-4cce-9f1a-fb9a15f5dc53"


def sha256(path: Path) -> str:
    digest = hashlib.sha256()
    with path.open("rb") as stream:
        for block in iter(lambda: stream.read(1024 * 1024), b""):
            digest.update(block)
    return digest.hexdigest()


def canonical_json(value: Any) -> bytes:
    return json.dumps(
        value, allow_nan=False, separators=(",", ":"), sort_keys=True
    ).encode()


def clauses_digest(clauses: Iterable[tuple[int, ...]]) -> str:
    digest = hashlib.sha256()
    for clause in clauses:
        digest.update((" ".join(map(str, clause)) + " 0\n").encode())
    return digest.hexdigest()


def load_module(name: str, path: Path) -> ModuleType:
    spec = importlib.util.spec_from_file_location(name, path)
    if spec is None or spec.loader is None:
        raise RuntimeError(f"could not load {path}")
    module = importlib.util.module_from_spec(spec)
    sys.modules[name] = module
    spec.loader.exec_module(module)
    return module


def candidate_index(
    candidates: tuple[frozenset[int], ...],
) -> dict[int, frozenset[int]]:
    postings: dict[int, set[int]] = defaultdict(set)
    for index, clause in enumerate(candidates):
        for literal in clause:
            postings[literal].add(index)
    return {literal: frozenset(indices) for literal, indices in postings.items()}


def subsumed_candidate(
    existing: frozenset[int],
    candidates: tuple[frozenset[int], ...],
    postings: dict[int, frozenset[int]],
) -> int | None:
    buckets = [postings.get(literal, frozenset()) for literal in existing]
    if not buckets or any(not bucket for bucket in buckets):
        return None
    for index in min(buckets, key=len):
        if existing <= candidates[index]:
            return index
    return None


def iter_root_clauses(path: Path) -> Iterable[frozenset[int]]:
    header_seen = False
    count = 0
    with path.open("r", encoding="ascii") as stream:
        for line in stream:
            stripped = line.strip()
            if not stripped or stripped.startswith("c"):
                continue
            if stripped.startswith("p"):
                fields = stripped.split()
                if header_seen or fields != ["p", "cnf", str(VARIABLES), str(ROOT_CLAUSES)]:
                    raise ValueError("unexpected root DIMACS header")
                header_seen = True
                continue
            fields = [int(token) for token in stripped.split()]
            if not header_seen or not fields or fields[-1] != 0 or 0 in fields[:-1]:
                raise ValueError("malformed root DIMACS clause")
            count += 1
            yield frozenset(fields[:-1])
    if count != ROOT_CLAUSES:
        raise ValueError("root DIMACS clause count mismatch")


def write_fragment(path: Path, clauses: tuple[tuple[int, ...], ...]) -> None:
    raw = b"".join(
        (" ".join(map(str, clause)) + " 0\n").encode() for clause in clauses
    )
    path.write_bytes(raw)


def write_aggregate(
    path: Path,
    chain: Any,
    clauses: tuple[tuple[int, ...], ...],
) -> None:
    final_count = chain.clauses + len(clauses)
    temporary = path.with_suffix(path.suffix + ".tmp")
    with temporary.open("wb") as output, ROOT_CNF.open("rb") as root:
        header = root.readline()
        expected = f"p cnf {VARIABLES} {ROOT_CLAUSES}\n".encode()
        if header != expected:
            raise ValueError("root header bytes disagree with custody dimensions")
        output.write(f"p cnf {VARIABLES} {final_count}\n".encode())
        for block in iter(lambda: root.read(1024 * 1024), b""):
            output.write(block)
        for batch in chain.appended_batches:
            for clause in batch:
                output.write((" ".join(map(str, clause)) + " 0\n").encode())
        for clause in clauses:
            output.write((" ".join(map(str, clause)) + " 0\n").encode())
        output.flush()
        os.fsync(output.fileno())
    temporary.replace(path)


def main() -> int:
    if sha256(ROOT_CNF) != ROOT_SHA256:
        raise ValueError("post-wave root SHA-256 mismatch")
    formula_chain = load_module("wave2_formula_chain", FORMULA_CHAIN)
    chain = formula_chain.validate_formula_chain(
        root_cnf=ROOT_CNF,
        root_cnf_sha256=ROOT_SHA256,
        variables=VARIABLES,
        root_clauses=ROOT_CLAUSES,
        receipt_paths=RECEIPTS,
        expected_session_id=SESSION_ID,
    )
    if chain.clauses != CHAIN_CLAUSES:
        raise ValueError("unexpected pre-bank formula size")

    orbit = load_module("wave2_weighted_orbit_compiler", ORBIT_COMPILER)
    certificates = sorted(CERTIFICATE_DIR.glob("postwave-weighted-certificate-*.json"))
    if len(certificates) != 8:
        raise ValueError("expected exactly eight wave-2 certificates")
    payloads = [json.loads(path.read_text()) for path in certificates]
    order = tuple(int(label) for label in payloads[0]["order"])
    if any(tuple(payload["order"]) != order for payload in payloads):
        raise ValueError("certificate cyclic orders disagree")

    variables = orbit.export.selected_variables()
    groups = []
    proposed: set[tuple[int, ...]] = set()
    raw_count = 0
    for path, payload in zip(certificates, payloads, strict=True):
        clauses = orbit.certificate_orbit_clauses(path, order, variables)
        if len(clauses) != 34:
            raise ValueError(f"unexpected dihedral orbit size for {path}")
        raw_count += len(clauses)
        proposed.update(clauses)
        groups.append(
            {
                "statement_id": f"weighted-kalmanson:{payload['canonical_support_sha256']}",
                "certificate": {
                    "path": str(path.relative_to(REPO)),
                    "sha256": sha256(path),
                },
                "canonical_support_sha256": payload["canonical_support_sha256"],
                "lean_consumer": payload["lean_consumer"],
                "orbit_clause_count": len(clauses),
                "orbit_clauses_sha256": hashlib.sha256(
                    canonical_json(sorted(clauses))
                ).hexdigest(),
            }
        )
    if raw_count != 272 or len(proposed) != 272:
        raise ValueError("wave-2 certificate orbits are not eight disjoint 34-clause sets")

    proposed_ordered = tuple(sorted(proposed))
    candidate_sets = tuple(frozenset(clause) for clause in proposed_ordered)
    if len(set(candidate_sets)) != len(candidate_sets):
        raise ValueError("candidate clauses collapse after literal normalization")
    for left, first in enumerate(candidate_sets):
        for right, second in enumerate(candidate_sets):
            if left != right and first < second:
                raise ValueError("one wave-2 candidate subsumes another")
    postings = candidate_index(candidate_sets)
    subsumed: set[int] = set()
    root_checked = 0
    for existing in iter_root_clauses(ROOT_CNF):
        root_checked += 1
        matched = subsumed_candidate(existing, candidate_sets, postings)
        if matched is not None:
            subsumed.add(matched)
    prior_checked = 0
    for batch in chain.appended_batches:
        for clause in batch:
            prior_checked += 1
            matched = subsumed_candidate(frozenset(clause), candidate_sets, postings)
            if matched is not None:
                subsumed.add(matched)
    novel = tuple(
        clause for index, clause in enumerate(proposed_ordered) if index not in subsumed
    )
    if not novel:
        raise ValueError("wave-2 theorem bank contributes no novel exact-17 clauses")

    write_fragment(FRAGMENT, novel)
    write_aggregate(AGGREGATE, chain, novel)
    manifest = {
        "schema": SCHEMA,
        "status": "complete",
        "session_id": SESSION_ID,
        "parent_formula": {
            "root": {
                "path": str(ROOT_CNF.relative_to(REPO)),
                "sha256": ROOT_SHA256,
                "num_vars": VARIABLES,
                "num_clauses": ROOT_CLAUSES,
            },
            "receipts": [
                {
                    "path": str(path.relative_to(REPO)),
                    "sha256": sha256(path),
                }
                for path in RECEIPTS
            ],
            "num_clauses": chain.clauses,
        },
        "cyclic_order": list(order),
        "statement_groups": groups,
        "admission": {
            "candidate_clauses": len(proposed_ordered),
            "novel_clauses": len(novel),
            "existing_subsumptions": len(subsumed),
            "root_clauses_checked": root_checked,
            "prior_clauses_checked": prior_checked,
        },
        "fragment": {
            "path": str(FRAGMENT.relative_to(REPO)),
            "sha256": sha256(FRAGMENT),
            "bytes": FRAGMENT.stat().st_size,
            "clause_count": len(novel),
            "clause_lengths": sorted({len(clause) for clause in novel}),
            "clause_stream_sha256": clauses_digest(novel),
        },
        "normalized_formula": {
            "path": str(AGGREGATE.relative_to(REPO)),
            "sha256": sha256(AGGREGATE),
            "bytes": AGGREGATE.stat().st_size,
            "num_vars": VARIABLES,
            "num_clauses": chain.clauses + len(novel),
        },
        "generation": {
            "script": {
                "path": str(Path(__file__).resolve().relative_to(REPO)),
                "sha256": sha256(Path(__file__).resolve()),
            },
            "formula_chain": {
                "path": str(FORMULA_CHAIN.relative_to(REPO)),
                "sha256": sha256(FORMULA_CHAIN),
            },
            "orbit_compiler": {
                "path": str(ORBIT_COMPILER.relative_to(REPO)),
                "sha256": sha256(ORBIT_COMPILER),
            },
            "orbit_compiler_source_hashes": orbit.source_hashes(),
        },
        "claims": {
            "cardinality_generic_lean_consumer": True,
            "exact17_dihedral_images_checked": raw_count,
            "exact17_coverage": False,
            "exact17_closure": False,
            "production_sorry_closure": False,
        },
    }
    MANIFEST.write_bytes(canonical_json(manifest) + b"\n")
    print(
        json.dumps(
            {
                "aggregate": str(AGGREGATE.relative_to(REPO)),
                "aggregate_sha256": manifest["normalized_formula"]["sha256"],
                "existing_subsumptions": len(subsumed),
                "groups": len(groups),
                "novel_clauses": len(novel),
                "proposed_clauses": len(proposed_ordered),
            },
            sort_keys=True,
        )
    )
    return 0


if __name__ == "__main__":
    raise SystemExit(main())
