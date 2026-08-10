#!/usr/bin/env python3
"""Append the banked wave-2 orbit fragment to its authenticated PIQD session."""

from __future__ import annotations

import hashlib
import importlib.util
import json
import os
import sys
from pathlib import Path
from types import ModuleType
from typing import Any

HERE = Path(__file__).resolve().parent
REPO = HERE.parents[1]
SUPPORT = REPO / "scratch/rigid221-blockerv-exact17-20260806"
UPLOADER = SUPPORT / "upload_dimacs_to_piqd_session.py"
MANIFEST = HERE / "postwave-wave2-weighted-orbits.manifest.json"
FRAGMENT = HERE / "postwave-wave2-weighted-orbits.dimacs"
AGGREGATE = HERE / "postwave-wave2-base.cnf"
RECEIPT = HERE / "postwave-wave2-piqd-admission.json"
SESSION_ID = "4876f14c-554d-4cce-9f1a-fb9a15f5dc53"
BASE_URL = "http://127.0.0.1:7272"
SCHEMA = "p97-exact17-piqd-static-theorem-bank-admission/v1"


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


def atomic_json(path: Path, value: dict[str, Any]) -> None:
    temporary = path.with_suffix(path.suffix + ".tmp")
    with temporary.open("wb") as stream:
        stream.write(canonical_json(value) + b"\n")
        stream.flush()
        os.fsync(stream.fileno())
    temporary.replace(path)


def load_module(name: str, path: Path) -> ModuleType:
    spec = importlib.util.spec_from_file_location(name, path)
    if spec is None or spec.loader is None:
        raise RuntimeError(f"could not load {path}")
    module = importlib.util.module_from_spec(spec)
    sys.modules[name] = module
    spec.loader.exec_module(module)
    return module


def read_fragment(path: Path, variables: int) -> tuple[tuple[int, ...], ...]:
    result = []
    with path.open("r", encoding="ascii") as stream:
        for line_number, line in enumerate(stream, start=1):
            fields = [int(token) for token in line.split()]
            if not fields or fields[-1] != 0 or 0 in fields[:-1]:
                raise ValueError(f"malformed fragment line {line_number}")
            clause = tuple(fields[:-1])
            if not clause or any(abs(literal) > variables for literal in clause):
                raise ValueError(f"invalid fragment clause {line_number}")
            result.append(clause)
    if len(set(result)) != len(result):
        raise ValueError("fragment contains duplicate clauses")
    return tuple(result)


def require_session(value: dict[str, Any], clauses: int, variables: int) -> None:
    expected = {
        "id": SESSION_ID,
        "lane": "sat",
        "state": "live",
        "clauses": clauses,
        "max_var": variables,
    }
    for key, wanted in expected.items():
        if value.get(key) != wanted:
            raise ValueError(f"PIQD session field {key!r} disagrees with custody")


def main() -> int:
    if RECEIPT.exists():
        raise FileExistsError(f"refusing to overwrite existing receipt: {RECEIPT}")
    manifest = json.loads(MANIFEST.read_text())
    if manifest.get("schema") != "p97-exact17-piqd-postwave-wave2-weighted-orbits/v1":
        raise ValueError("unexpected orbit manifest schema")
    if manifest.get("status") != "complete" or manifest.get("session_id") != SESSION_ID:
        raise ValueError("orbit manifest is not complete for the live session")
    generation = manifest.get("generation", {})
    for key in ("script", "formula_chain", "orbit_compiler"):
        record = generation.get(key)
        if not isinstance(record, dict):
            raise ValueError(f"manifest lacks generation record {key}")
        path = REPO / record["path"]
        if sha256(path) != record.get("sha256"):
            raise ValueError(f"generation source drift: {path}")

    normalized = manifest.get("normalized_formula", {})
    fragment = manifest.get("fragment", {})
    variables = normalized.get("num_vars")
    final_clauses = normalized.get("num_clauses")
    if type(variables) is not int or type(final_clauses) is not int:
        raise TypeError("manifest formula dimensions are invalid")
    if sha256(AGGREGATE) != normalized.get("sha256"):
        raise ValueError("normalized formula SHA-256 mismatch")
    if sha256(FRAGMENT) != fragment.get("sha256"):
        raise ValueError("orbit fragment SHA-256 mismatch")
    clauses = read_fragment(FRAGMENT, variables)
    if len(clauses) != fragment.get("clause_count"):
        raise ValueError("orbit fragment clause count mismatch")
    before_clauses = final_clauses - len(clauses)

    uploader = load_module("wave2_piqd_uploader", UPLOADER)
    frozen_sources = {
        str(Path(__file__).resolve().relative_to(REPO)): sha256(Path(__file__)),
        str(UPLOADER.relative_to(REPO)): sha256(UPLOADER),
        str(MANIFEST.relative_to(REPO)): sha256(MANIFEST),
        str(FRAGMENT.relative_to(REPO)): sha256(FRAGMENT),
        str(AGGREGATE.relative_to(REPO)): sha256(AGGREGATE),
    }
    session_path = f"/sessions/{SESSION_ID}"
    before = uploader.request_json(BASE_URL, "GET", session_path, timeout_s=30.0)
    require_session(before, before_clauses, variables)
    body = uploader.encode_batch([uploader.encode_clause(clause) for clause in clauses])
    response = uploader.request_json(
        BASE_URL,
        "POST",
        f"{session_path}/clauses",
        body,
        timeout_s=30.0,
    )
    expected_response = {
        "added": len(clauses),
        "clauses": final_clauses,
        "max_var": variables,
    }
    if response != expected_response or set(response) != set(expected_response):
        raise ValueError("PIQD add response disagrees with the theorem-bank fragment")
    after = uploader.request_json(BASE_URL, "GET", session_path, timeout_s=30.0)
    require_session(after, final_clauses, variables)
    if frozen_sources != {
        str(Path(__file__).resolve().relative_to(REPO)): sha256(Path(__file__)),
        str(UPLOADER.relative_to(REPO)): sha256(UPLOADER),
        str(MANIFEST.relative_to(REPO)): sha256(MANIFEST),
        str(FRAGMENT.relative_to(REPO)): sha256(FRAGMENT),
        str(AGGREGATE.relative_to(REPO)): sha256(AGGREGATE),
    }:
        raise RuntimeError("admission sources changed while PIQD was mutating")

    receipt = {
        "schema": SCHEMA,
        "status": "complete",
        "session_id": SESSION_ID,
        "session_before": before,
        "session_after": after,
        "add_response": response,
        "manifest": {
            "path": str(MANIFEST.relative_to(REPO)),
            "sha256": sha256(MANIFEST),
        },
        "fragment": {
            "path": str(FRAGMENT.relative_to(REPO)),
            "sha256": sha256(FRAGMENT),
            "clause_count": len(clauses),
        },
        "normalized_formula": {
            "path": str(AGGREGATE.relative_to(REPO)),
            "sha256": sha256(AGGREGATE),
            "num_vars": variables,
            "num_clauses": final_clauses,
        },
        "generation_source_hashes": frozen_sources,
        "claims": {
            "piqd_formula_matches_normalized_formula": True,
            "cardinality_generic_lean_consumers_recorded": True,
            "exact17_coverage": False,
            "exact17_closure": False,
            "production_sorry_closure": False,
        },
    }
    atomic_json(RECEIPT, receipt)
    print(
        json.dumps(
            {
                "status": "PASS",
                "before_clauses": before_clauses,
                "appended_clauses": len(clauses),
                "after_clauses": final_clauses,
                "receipt": str(RECEIPT.relative_to(REPO)),
            },
            sort_keys=True,
        )
    )
    return 0


if __name__ == "__main__":
    raise SystemExit(main())
