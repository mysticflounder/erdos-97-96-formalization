#!/usr/bin/env python3
"""Compile the banked weighted certificates into exact-17 dihedral clauses."""

from __future__ import annotations

import hashlib
import importlib.util
import json
import sys
from pathlib import Path
from types import ModuleType
from typing import Any

HERE = Path(__file__).resolve().parent
REPO = HERE.parents[1]
ORBIT_COMPILER = (
    REPO / "scratch/rigid221-blockerv-exact17-20260806/"
    "append_weighted_kalmanson_dihedral_orbits.py"
)
BASE_CNF = HERE / "final.cnf"
FRAGMENT = HERE / "postwave-weighted-orbits.dimacs"
MANIFEST = HERE / "postwave-weighted-orbits.manifest.json"
SCHEMA = "p97-exact17-piqd-postwave-weighted-orbits/v1"


def sha256(path: Path) -> str:
    digest = hashlib.sha256()
    with path.open("rb") as stream:
        for block in iter(lambda: stream.read(1024 * 1024), b""):
            digest.update(block)
    return digest.hexdigest()


def load_module(name: str, path: Path) -> ModuleType:
    spec = importlib.util.spec_from_file_location(name, path)
    if spec is None or spec.loader is None:
        raise RuntimeError(f"could not load {path}")
    module = importlib.util.module_from_spec(spec)
    sys.modules[name] = module
    spec.loader.exec_module(module)
    return module


def dimacs_header(path: Path) -> tuple[int, int]:
    with path.open("rb") as stream:
        fields = stream.readline().split()
    if len(fields) != 4 or fields[:2] != [b"p", b"cnf"]:
        raise ValueError("invalid base DIMACS header")
    return int(fields[2]), int(fields[3])


def canonical_json(value: Any) -> bytes:
    return json.dumps(
        value, allow_nan=False, separators=(",", ":"), sort_keys=True
    ).encode()


def main() -> int:
    orbit = load_module("postwave_weighted_orbit_compiler", ORBIT_COMPILER)
    certificates = sorted(HERE.glob("postwave-weighted-certificate-*.json"))
    if len(certificates) != 3:
        raise ValueError("expected exactly three post-wave certificates")

    payloads = [json.loads(path.read_text()) for path in certificates]
    order = tuple(int(label) for label in payloads[0]["order"])
    if any(tuple(payload["order"]) != order for payload in payloads):
        raise ValueError("certificate cyclic orders disagree")

    variables = orbit.export.selected_variables()
    groups = []
    all_clauses: set[tuple[int, ...]] = set()
    for path, payload in zip(certificates, payloads, strict=True):
        clauses = orbit.certificate_orbit_clauses(path, order, variables)
        overlap = all_clauses.intersection(clauses)
        if overlap:
            raise ValueError(f"certificate orbit overlap: {path}")
        all_clauses.update(clauses)
        ordered = sorted(clauses)
        groups.append(
            {
                "statement_id": f"weighted-kalmanson:{payload['canonical_support_sha256']}",
                "certificate": {
                    "path": str(path.relative_to(REPO)),
                    "sha256": sha256(path),
                },
                "canonical_support_sha256": payload["canonical_support_sha256"],
                "lean_consumer": payload["lean_consumer"],
                "clause_count": len(ordered),
                "clauses_sha256": hashlib.sha256(canonical_json(ordered)).hexdigest(),
            }
        )

    ordered_clauses = sorted(all_clauses)
    if len(ordered_clauses) != 102:
        raise ValueError("expected three disjoint 34-clause dihedral orbits")
    raw = b"".join(
        (" ".join(str(literal) for literal in clause) + " 0\n").encode()
        for clause in ordered_clauses
    )
    FRAGMENT.write_bytes(raw)

    num_vars, num_clauses = dimacs_header(BASE_CNF)
    if num_vars != 74_813 or num_clauses != 4_255_358:
        raise ValueError("unexpected round-3 base dimensions")
    if sha256(BASE_CNF) != (
        "8bf247e1cf12283aca6e4e5f520cd90eccecd146ba295781da743308322e04ab"
    ):
        raise ValueError("round-3 base SHA-256 mismatch")
    if max(abs(literal) for clause in ordered_clauses for literal in clause) > num_vars:
        raise ValueError("orbit clause exceeds the exact-17 variable domain")

    manifest = {
        "schema": SCHEMA,
        "status": "complete",
        "base": {
            "path": str(BASE_CNF.relative_to(REPO)),
            "sha256": sha256(BASE_CNF),
            "bytes": BASE_CNF.stat().st_size,
            "num_vars": num_vars,
            "num_clauses": num_clauses,
        },
        "cyclic_order": list(order),
        "statement_groups": groups,
        "fragment": {
            "path": str(FRAGMENT.relative_to(REPO)),
            "sha256": sha256(FRAGMENT),
            "bytes": len(raw),
            "clause_count": len(ordered_clauses),
            "clause_lengths": sorted({len(clause) for clause in ordered_clauses}),
        },
        "generation": {
            "script": {
                "path": str(Path(__file__).resolve().relative_to(REPO)),
                "sha256": sha256(Path(__file__).resolve()),
            },
            "orbit_compiler": {
                "path": str(ORBIT_COMPILER.relative_to(REPO)),
                "sha256": sha256(ORBIT_COMPILER),
            },
            "orbit_compiler_source_hashes": orbit.source_hashes(),
        },
        "claims": {
            "cardinality_generic_lean_consumer": True,
            "exact17_dihedral_images_checked": 102,
            "exact17_coverage": False,
            "exact17_closure": False,
            "production_sorry_closure": False,
        },
    }
    MANIFEST.write_bytes(canonical_json(manifest) + b"\n")
    print(
        json.dumps(
            {
                "clauses": len(ordered_clauses),
                "fragment_sha256": manifest["fragment"]["sha256"],
                "groups": len(groups),
                "manifest": str(MANIFEST.relative_to(REPO)),
            },
            sort_keys=True,
        )
    )
    return 0


if __name__ == "__main__":
    raise SystemExit(main())
