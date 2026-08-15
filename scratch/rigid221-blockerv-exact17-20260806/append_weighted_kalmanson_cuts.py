#!/usr/bin/env python3
"""Append exact weighted-Kalmanson nogoods to an authenticated DIMACS CNF.

This is the low-memory ingress for the lazy global-LRA oracle.  It never
rebuilds the multi-million-clause structural formula: each certificate is
replayed by the existing exact theorem-bank checker, translated to one row
nogood, and appended to a hash-pinned base CNF.
"""

from __future__ import annotations

import argparse
import hashlib
import importlib.util
import json
from pathlib import Path


HERE = Path(__file__).resolve().parent
REPO = HERE.parents[1]


def load_module(name: str, path: Path):
    spec = importlib.util.spec_from_file_location(name, path)
    if spec is None or spec.loader is None:
        raise RuntimeError(f"could not load {path}")
    module = importlib.util.module_from_spec(spec)
    spec.loader.exec_module(module)
    return module


export = load_module(
    "exact17_source_faithful_weighted_append_export",
    HERE / "export_source_faithful_boolean_cnf.py",
)


def sha256(path: Path) -> str:
    digest = hashlib.sha256()
    with path.open("rb") as handle:
        for block in iter(lambda: handle.read(1024 * 1024), b""):
            digest.update(block)
    return digest.hexdigest()


def resolve_repo_path(raw: str) -> Path:
    path = Path(raw)
    return path if path.is_absolute() else REPO / path


def dimacs_header(path: Path) -> tuple[int, int]:
    with path.open("rb") as handle:
        for line in handle:
            if line.startswith(b"p cnf "):
                _, _, variables, clauses = line.split()
                return int(variables), int(clauses)
    raise ValueError(f"missing DIMACS header: {path}")


def write_derived_cnf(
    base: Path,
    output: Path,
    variables: int,
    base_clauses: int,
    clauses: list[tuple[int, ...]],
) -> str:
    output.parent.mkdir(parents=True, exist_ok=True)
    digest = hashlib.sha256()
    header_seen = False
    with base.open("rb") as source, output.open("wb") as target:
        for line in source:
            if line.startswith(b"p cnf "):
                if header_seen:
                    raise ValueError(f"multiple DIMACS headers: {base}")
                header_seen = True
                line = f"p cnf {variables} {base_clauses + len(clauses)}\n".encode()
            target.write(line)
            digest.update(line)
        if not header_seen:
            raise ValueError(f"missing DIMACS header: {base}")
        for clause in clauses:
            line = (" ".join(str(literal) for literal in clause) + " 0\n").encode()
            target.write(line)
            digest.update(line)
    return digest.hexdigest()


def main() -> int:
    parser = argparse.ArgumentParser()
    parser.add_argument("--base-manifest", type=Path, required=True)
    parser.add_argument(
        "--weighted-certificate", type=Path, action="append", required=True
    )
    parser.add_argument("--output", type=Path, required=True)
    parser.add_argument("--manifest", type=Path, required=True)
    args = parser.parse_args()

    base_manifest_path = args.base_manifest.resolve()
    base_manifest = json.loads(base_manifest_path.read_text())
    if base_manifest.get("learned_replay") != "verified":
        raise ValueError("base CNF did not replay its learned certificates")
    order_index = int(base_manifest["order_index"])
    positions = tuple(int(value) for value in base_manifest["anonymous_positions"])
    if len(positions) != 2:
        raise ValueError("base manifest has malformed anonymous positions")
    order = export.source.normalized_order(order_index, positions)
    if tuple(base_manifest.get("order", ())) != order:
        raise ValueError("base manifest has inconsistent cyclic order")
    base_cnf = resolve_repo_path(base_manifest["cnf"])
    recorded_base_sha = base_manifest.get("cnf_sha256")
    actual_base_sha = sha256(base_cnf)
    if recorded_base_sha != actual_base_sha:
        raise ValueError("base CNF hash mismatch")
    variables, base_clause_count = dimacs_header(base_cnf)
    if variables != base_manifest.get("variables"):
        raise ValueError("base DIMACS variable count disagrees with manifest")
    if base_clause_count != base_manifest.get("clauses"):
        raise ValueError("base DIMACS clause count disagrees with manifest")

    payloads = [
        export.read_weighted_certificate(
            path.resolve(), order_index, positions  # type: ignore[arg-type]
        )
        for path in args.weighted_certificate
    ]
    clauses, equality_clauses, kinds = export.learned_clauses(
        payloads,
        export.selected_variables(),
        order,
        120_000,
        replay=True,
    )
    if equality_clauses:
        raise AssertionError("weighted certificates unexpectedly emitted equality cuts")
    clauses = sorted(set(clauses))
    if not clauses:
        raise ValueError("no weighted-Kalmanson nogoods were produced")

    output = args.output.resolve()
    digest = write_derived_cnf(
        base_cnf, output, variables, base_clause_count, clauses
    )
    manifest = dict(base_manifest)
    manifest.update(
        {
            "schema": "p97-rigid221-exact17-lazy-weighted-cnf-v1",
            "cnf": str(output.relative_to(REPO)),
            "cnf_sha256": digest,
            "clauses": base_clause_count + len(clauses),
            "lazy_weighted_base": {
                "manifest": str(base_manifest_path.relative_to(REPO)),
                "manifest_sha256": sha256(base_manifest_path),
                "cnf": str(base_cnf.relative_to(REPO)),
                "cnf_sha256": actual_base_sha,
                "clauses": base_clause_count,
            },
            "lazy_weighted_clauses": [list(clause) for clause in clauses],
            "lazy_weighted_certificates": [
                {
                    "path": str(path.resolve().relative_to(REPO)),
                    "sha256": sha256(path.resolve()),
                }
                for path in args.weighted_certificate
            ],
        }
    )
    clause_blocks = dict(base_manifest.get("clause_blocks", {}))
    clause_blocks["learned_nogoods"] = (
        int(clause_blocks.get("learned_nogoods", 0)) + len(clauses)
    )
    clause_blocks["lazy_weighted_kalmanson"] = len(clauses)
    manifest["clause_blocks"] = clause_blocks
    learned_kinds = dict(base_manifest.get("learned_record_kinds", {}))
    learned_kinds["weighted-kalmanson"] = (
        int(learned_kinds.get("weighted-kalmanson", 0))
        + int(kinds.get("weighted-kalmanson", 0))
    )
    manifest["learned_record_kinds"] = learned_kinds
    args.manifest.parent.mkdir(parents=True, exist_ok=True)
    args.manifest.write_text(json.dumps(manifest, indent=2, sort_keys=True) + "\n")
    print(
        json.dumps(
            {
                "appended_clauses": len(clauses),
                "base_clauses": base_clause_count,
                "clauses": manifest["clauses"],
                "cnf_sha256": digest,
                "manifest": str(args.manifest),
            },
            sort_keys=True,
        )
    )
    return 0


if __name__ == "__main__":
    raise SystemExit(main())
