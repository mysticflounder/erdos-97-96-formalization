#!/usr/bin/env python3
"""Compile and admit an authenticated bounded-wave weighted theorem bank."""

from __future__ import annotations

import hashlib
import importlib.util
import json
import os
import sys
from collections.abc import Iterable
from pathlib import Path
from types import ModuleType
from typing import Any

HERE = Path(__file__).resolve().parent
REPO = HERE.parents[1]
SUPPORT = REPO / "scratch/rigid221-blockerv-exact17-20260806"
BASE_COMPILER = HERE / "compile_wave2_weighted_orbits.py"
FORMULA_CHAIN = SUPPORT / "piqd_formula_chain.py"
ORBIT_COMPILER = SUPPORT / "append_weighted_kalmanson_dihedral_orbits.py"
UPLOADER = SUPPORT / "upload_dimacs_to_piqd_session.py"
CERTIFICATE_DIR = HERE / "wave4-theorem-search"
ROOT_CNF = HERE / "postwave-wave3-base.cnf"
RECEIPTS = tuple(HERE / f"wave4-cut-{index}.json" for index in range(1, 9))
FRAGMENT = HERE / "wave4-weighted-orbits.dimacs"
AGGREGATE = HERE / "postwave-wave4-base.cnf"
MANIFEST = HERE / "wave4-weighted-orbits.manifest.json"
ADMISSION = HERE / "wave4-piqd-admission.json"
MANIFEST_SCHEMA = "p97-exact17-piqd-wave4-weighted-orbits/v1"
ADMISSION_SCHEMA = "p97-exact17-piqd-static-theorem-bank-admission/v1"
ROOT_SHA256 = "2014454229278675eed61af89c3a4c6cad1b02829c8070f2ab66b549cbf8c1a8"
VARIABLES = 74_813
ROOT_CLAUSES = 4_267_673
CHAIN_CLAUSES = 4_275_704
SESSION_ID = "4876f14c-554d-4cce-9f1a-fb9a15f5dc53"
BASE_URL = "http://127.0.0.1:7272"

WAVE = int(os.environ.get("PIQD_BANK_WAVE", "4"))
if WAVE == 5:
    CERTIFICATE_DIR = HERE / "wave5-theorem-search"
    ROOT_CNF = HERE / "postwave-wave4-base.cnf"
    RECEIPTS = tuple(HERE / f"wave5-cut-{index}.json" for index in range(1, 9))
    FRAGMENT = HERE / "wave5-weighted-orbits.dimacs"
    AGGREGATE = HERE / "postwave-wave5-base.cnf"
    MANIFEST = HERE / "wave5-weighted-orbits.manifest.json"
    ADMISSION = HERE / "wave5-piqd-admission.json"
    MANIFEST_SCHEMA = "p97-exact17-piqd-wave5-weighted-orbits/v1"
    ROOT_SHA256 = "9fe6583cebeee38fc4874781a08ca9c8cc35b86590ba4889302511171bdab417"
    ROOT_CLAUSES = 4_275_934
    CHAIN_CLAUSES = 4_280_013
elif WAVE == 6:
    CERTIFICATE_DIR = HERE / "wave6-theorem-search"
    ROOT_CNF = HERE / "postwave-wave5-base.cnf"
    RECEIPTS = tuple(HERE / f"wave6-cut-{index}.json" for index in range(1, 9))
    FRAGMENT = HERE / "wave6-weighted-orbits.dimacs"
    AGGREGATE = HERE / "postwave-wave6-base.cnf"
    MANIFEST = HERE / "wave6-weighted-orbits.manifest.json"
    ADMISSION = HERE / "wave6-piqd-admission.json"
    MANIFEST_SCHEMA = "p97-exact17-piqd-wave6-weighted-orbits/v1"
    ROOT_SHA256 = "3de22b62ce5cff1b406718d86ae2c059f81b9c21d601379774add89cf33978b6"
    ROOT_CLAUSES = 4_280_238
    CHAIN_CLAUSES = 4_286_098
elif WAVE != 4:
    raise ValueError(f"unsupported PIQD theorem-bank wave: {WAVE}")


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


def load_module(name: str, path: Path) -> ModuleType:
    spec = importlib.util.spec_from_file_location(name, path)
    if spec is None or spec.loader is None:
        raise RuntimeError(f"could not load {path}")
    module = importlib.util.module_from_spec(spec)
    sys.modules[name] = module
    spec.loader.exec_module(module)
    return module


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
                expected = ["p", "cnf", str(VARIABLES), str(ROOT_CLAUSES)]
                if header_seen or fields != expected:
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


def write_aggregate(
    path: Path,
    chain: Any,
    clauses: tuple[tuple[int, ...], ...],
) -> None:
    temporary = path.with_suffix(path.suffix + ".tmp")
    final_count = chain.clauses + len(clauses)
    with temporary.open("wb") as output, ROOT_CNF.open("rb") as root:
        expected = f"p cnf {VARIABLES} {ROOT_CLAUSES}\n".encode()
        if root.readline() != expected:
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
    os.replace(temporary, path)


def atomic_json(path: Path, payload: dict[str, Any]) -> None:
    temporary = path.with_suffix(path.suffix + ".tmp")
    temporary.write_bytes(canonical_json(payload) + b"\n")
    with temporary.open("rb") as stream:
        os.fsync(stream.fileno())
    os.replace(temporary, path)


def require_session(payload: dict[str, Any], clauses: int) -> None:
    expected = {
        "id": SESSION_ID,
        "state": "live",
        "clauses": clauses,
        "max_var": VARIABLES,
    }
    for key, value in expected.items():
        if payload.get(key) != value:
            raise ValueError(f"PIQD session {key} mismatch")


def main() -> int:
    for output in (FRAGMENT, AGGREGATE, MANIFEST, ADMISSION):
        if output.exists():
            raise FileExistsError(f"refusing to overwrite existing output: {output}")
    if sha256(ROOT_CNF) != ROOT_SHA256:
        raise ValueError(f"wave-{WAVE} root SHA-256 mismatch")

    helper = load_module(f"wave{WAVE}_bank_helper", BASE_COMPILER)
    formula_chain = load_module(f"wave{WAVE}_formula_chain", FORMULA_CHAIN)
    orbit = load_module(f"wave{WAVE}_weighted_orbit_compiler", ORBIT_COMPILER)
    uploader = load_module(f"wave{WAVE}_piqd_uploader", UPLOADER)
    source_paths = (
        Path(__file__).resolve(),
        BASE_COMPILER,
        FORMULA_CHAIN,
        ORBIT_COMPILER,
        UPLOADER,
    )
    frozen_sources = {
        str(path.relative_to(REPO)): sha256(path) for path in source_paths
    }

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

    certificates = sorted(CERTIFICATE_DIR.glob("postwave-weighted-certificate-*.json"))
    if len(certificates) != 8:
        raise ValueError(f"expected exactly eight wave-{WAVE} certificates")
    payloads = [json.loads(path.read_text()) for path in certificates]
    order = tuple(int(label) for label in payloads[0]["order"])
    if any(tuple(payload["order"]) != order for payload in payloads):
        raise ValueError("certificate cyclic orders disagree")

    variables = orbit.export.selected_variables()
    proposed: set[tuple[int, ...]] = set()
    groups = []
    raw_count = 0
    for path, payload in zip(certificates, payloads, strict=True):
        clauses = orbit.certificate_orbit_clauses(path, order, variables)
        if len(clauses) != 34:
            raise ValueError(f"unexpected dihedral orbit size for {path}")
        raw_count += len(clauses)
        proposed.update(clauses)
        groups.append(
            {
                "statement_id": (
                    f"weighted-kalmanson:{payload['canonical_support_sha256']}"
                ),
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
        raise ValueError(
            f"wave-{WAVE} certificate orbits are not eight disjoint sets"
        )

    proposed_ordered = tuple(sorted(proposed))
    candidate_sets = tuple(frozenset(clause) for clause in proposed_ordered)
    postings = helper.candidate_index(candidate_sets)
    subsumed: set[int] = set()
    root_checked = 0
    for existing in iter_root_clauses(ROOT_CNF):
        root_checked += 1
        match = helper.subsumed_candidate(existing, candidate_sets, postings)
        if match is not None:
            subsumed.add(match)
    prior_checked = 0
    for batch in chain.appended_batches:
        for clause in batch:
            prior_checked += 1
            match = helper.subsumed_candidate(
                frozenset(clause), candidate_sets, postings
            )
            if match is not None:
                subsumed.add(match)
    novel = tuple(
        clause for index, clause in enumerate(proposed_ordered) if index not in subsumed
    )
    if not novel:
        raise ValueError(
            f"wave-{WAVE} theorem bank contributes no novel exact-17 clauses"
        )

    helper.write_fragment(FRAGMENT, novel)
    write_aggregate(AGGREGATE, chain, novel)
    manifest = {
        "schema": MANIFEST_SCHEMA,
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
                {"path": str(path.relative_to(REPO)), "sha256": sha256(path)}
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
            "clause_stream_sha256": helper.clauses_digest(novel),
        },
        "normalized_formula": {
            "path": str(AGGREGATE.relative_to(REPO)),
            "sha256": sha256(AGGREGATE),
            "bytes": AGGREGATE.stat().st_size,
            "num_vars": VARIABLES,
            "num_clauses": chain.clauses + len(novel),
        },
        "generation": {
            "source_hashes": frozen_sources,
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
    atomic_json(MANIFEST, manifest)

    before = uploader.request_json(
        BASE_URL, "GET", f"/sessions/{SESSION_ID}", timeout_s=30.0
    )
    require_session(before, chain.clauses)
    body = uploader.encode_batch([uploader.encode_clause(clause) for clause in novel])
    response = uploader.request_json(
        BASE_URL,
        "POST",
        f"/sessions/{SESSION_ID}/clauses",
        body,
        timeout_s=30.0,
    )
    final_clauses = chain.clauses + len(novel)
    expected_response = {
        "added": len(novel),
        "clauses": final_clauses,
        "max_var": VARIABLES,
    }
    if response != expected_response or set(response) != set(expected_response):
        raise ValueError("PIQD add response disagrees with the theorem-bank fragment")
    after = uploader.request_json(
        BASE_URL, "GET", f"/sessions/{SESSION_ID}", timeout_s=30.0
    )
    require_session(after, final_clauses)
    if frozen_sources != {
        str(path.relative_to(REPO)): sha256(path) for path in source_paths
    }:
        raise RuntimeError("banking sources changed while PIQD was mutating")

    admission = {
        "schema": ADMISSION_SCHEMA,
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
            "clause_count": len(novel),
        },
        "normalized_formula": {
            "path": str(AGGREGATE.relative_to(REPO)),
            "sha256": sha256(AGGREGATE),
            "num_vars": VARIABLES,
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
    atomic_json(ADMISSION, admission)
    print(
        json.dumps(
            {
                "status": "PASS",
                "candidate_clauses": len(proposed_ordered),
                "existing_subsumptions": len(subsumed),
                "appended_clauses": len(novel),
                "after_clauses": final_clauses,
                "aggregate_sha256": sha256(AGGREGATE),
                "admission": str(ADMISSION.relative_to(REPO)),
            },
            sort_keys=True,
        )
    )
    return 0


if __name__ == "__main__":
    raise SystemExit(main())
