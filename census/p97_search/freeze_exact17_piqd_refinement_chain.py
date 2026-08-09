"""Freeze the exact-17 root-plus-refinements lane for PIQD ingestion."""

from __future__ import annotations

import argparse
import hashlib
import importlib.util
import json
import platform
import subprocess
import sys
from itertools import combinations
from pathlib import Path
from types import ModuleType
from typing import Any

from census.p97_search import phase3_piqd_exact17_refinement_chain as contract

REPO = Path(__file__).resolve().parents[2]
LANE = REPO / "scratch/rigid221-blockerv-exact17-20260806"
ROOT_STEM = LANE / (
    "lazy-two-kalmanson-label-loop-production1-source-frozen-20260809/"
    "iteration-0007-seed-12/derived/o0-p0-1"
)
ROOT_CNF = ROOT_STEM.with_suffix(".cnf")
ROOT_MANIFEST = ROOT_STEM.with_suffix(".manifest.json")
ROOT_VALIDATION = ROOT_STEM.with_suffix(".validation.json")
PAIR_RECEIPT = LANE / "piqd-two-k-label-pair-closure-v3/receipt.json"
PAIR_VALIDATOR = LANE / "validate_piqd_two_kalmanson_pair_closure_v3.py"
CUT_RECEIPTS = (
    LANE / "piqd-two-k-label-canary-round1/cuts-receipt.json",
    LANE / "piqd-two-k-label-canary-round2/cuts-receipt.json",
    LANE / "piqd-two-k-label-canary-round3/cuts-receipt-v2.json",
    LANE / "piqd-two-k-label-canary-round4/cuts-receipt-v2.json",
    LANE / "piqd-two-k-label-canary-round5/cuts-receipt-v2.json",
    LANE / "piqd-two-k-label-canary-round6/cuts-receipt-v2.json",
    LANE / "piqd-two-k-label-canary-round7/cuts-receipt-v2.json",
)
DEFAULT_OUTPUT = LANE / "piqd-exact17-cap9-root-refinement-lane-v1"


def _load_module(name: str, path: Path) -> ModuleType:
    spec = importlib.util.spec_from_file_location(name, path)
    if spec is None or spec.loader is None:
        raise RuntimeError(f"cannot load {path}")
    module = importlib.util.module_from_spec(spec)
    spec.loader.exec_module(module)
    return module


def _relative(path: Path) -> str:
    return str(path.resolve().relative_to(REPO))


def _file_ref(path: Path) -> dict[str, object]:
    return {
        "path": _relative(path),
        "byte_count": path.stat().st_size,
        "sha256": contract.sha256_file(path),
    }


def _read_json(path: Path) -> dict[str, Any]:
    value = contract.load_strict_json(path.read_bytes(), label=_relative(path))
    if type(value) is not dict:
        raise RuntimeError(f"expected JSON object: {path}")
    return value


def _write(path: Path, raw: bytes) -> None:
    path.parent.mkdir(parents=True, exist_ok=True)
    temporary = path.with_name(f".{path.name}.tmp")
    temporary.write_bytes(raw)
    temporary.replace(path)


def _clause_bytes(clauses: Any) -> bytes:
    return b"".join((" ".join(map(str, clause)) + " 0\n").encode() for clause in clauses)


def _variable_map(order: list[int]) -> dict[str, object]:
    entries: list[list[object]] = []
    points = tuple(range(17))
    for center in points:
        for point in points:
            if center != point:
                entries.append(["selected", center, point])
    for center in points:
        if center not in {8, 9, 10, 11}:
            entries.append(["fifth_choice", center])
    edges = tuple(combinations(points, 2))
    for left, right in edges:
        for bit in range(8):
            entries.append(["distance_label", left, right, bit])
    for first, second in combinations(edges, 2):
        for bit in range(8):
            entries.append(
                [
                    "distance_label_xor",
                    first[0],
                    first[1],
                    second[0],
                    second[1],
                    bit,
                ]
            )
    if len(entries) != 74_813:
        raise AssertionError(f"variable map has {len(entries)} entries")
    return {"schema": contract.VARIABLE_MAP_SCHEMA, "order": order, "entries": entries}


def _pair_fragment(pair_receipt: dict[str, Any]) -> bytes:
    sys.path.insert(0, str(LANE))
    try:
        pair = _load_module("p97_exact17_pair_freeze_replay", PAIR_VALIDATOR)
    finally:
        sys.path.pop(0)

    for label, expected in pair_receipt["generation_source_hashes"].items():
        if contract.sha256_file(REPO / label) != expected:
            raise RuntimeError(f"pair-generation source drift: {label}")
    ordered_pairs = tuple(tuple(item) for item in pair_receipt["selected_pairs"])
    if pair.pair_digest(ordered_pairs) != pair_receipt["selected_pair_sha256"]:
        raise RuntimeError("selected-pair digest mismatch")
    inequalities = pair.generator.static.inequalities(tuple(pair_receipt["order"]))
    comparisons = pair.generator.static.comparison_variables(pair_receipt["variables"])

    parent_batches = []
    for path in CUT_RECEIPTS:
        receipt = _read_json(path)
        parent_batches.append(
            tuple(tuple(clause) for clause in receipt["appended_clauses"])
        )
    prior = {clause for batch in parent_batches for clause in batch}
    generated = {
        clause
        for first, second in ordered_pairs
        for clause in pair.generator.static.clauses_for_pair(
            inequalities[first], inequalities[second], comparisons
        )
    }
    clauses = tuple(sorted(generated - prior))
    if len(generated) != pair_receipt["generated_clause_count_before_prior_dedup"]:
        raise RuntimeError("pair raw generalized-clause count mismatch")
    if len(prior) != pair_receipt["prior_clause_count"]:
        raise RuntimeError("pair prior-clause count mismatch")
    if len(clauses) != pair_receipt["appended_clause_count"]:
        raise RuntimeError("pair appended-clause count mismatch")
    if pair.clauses_digest(clauses) != pair_receipt["appended_clause_sha256"]:
        raise RuntimeError("pair appended-clause digest mismatch")
    return _clause_bytes(clauses)


def _formula_identity(
    root: Path, fragments: list[Path], *, num_vars: int, num_clauses: int
) -> tuple[str, int]:
    header = f"p cnf {num_vars} {num_clauses}\n".encode()
    digest = hashlib.sha256(header)
    byte_count = len(header)
    with root.open("rb") as stream:
        stream.readline()
        for block in iter(lambda: stream.read(1024 * 1024), b""):
            digest.update(block)
            byte_count += len(block)
    for fragment in fragments:
        with fragment.open("rb") as stream:
            for block in iter(lambda: stream.read(1024 * 1024), b""):
                digest.update(block)
                byte_count += len(block)
    return digest.hexdigest(), byte_count


def _source_files(receipts: list[dict[str, Any]], pair: dict[str, Any]) -> list[dict[str, object]]:
    paths = {
        Path(__file__).resolve(),
        Path(contract.__file__).resolve(),
        PAIR_VALIDATOR,
        LANE / "piqd_formula_chain.py",
        LANE / "analyze_source_faithful_boolean_model.py",
    }
    for receipt in [*receipts, pair]:
        paths.update(REPO / label for label in receipt["generation_source_hashes"])
    return [_file_ref(path) for path in sorted(paths, key=_relative)]


def freeze(output_dir: Path) -> Path:
    root_manifest = _read_json(ROOT_MANIFEST)
    root_validation = _read_json(ROOT_VALIDATION)
    if root_validation.get("status") != "PASS":
        raise RuntimeError("root validation is not PASS")
    order = root_manifest["order"]
    if root_manifest.get("variables") != 74_813 or root_manifest.get("clauses") != 4_118_501:
        raise RuntimeError("unexpected frozen root dimensions")
    if root_manifest.get("order_index") != 0 or root_manifest.get("anonymous_positions") != [0, 1]:
        raise RuntimeError("unexpected frozen root normalization")

    cut_receipts = [_read_json(path) for path in CUT_RECEIPTS]
    pair_receipt = _read_json(PAIR_RECEIPT)
    if pair_receipt.get("status") != "complete":
        raise RuntimeError("pair closure is not complete")

    output_dir = output_dir.resolve()
    output_dir.mkdir(parents=True, exist_ok=True)
    fragments: list[Path] = []
    for ordinal, receipt in enumerate(cut_receipts):
        raw = _clause_bytes(receipt["appended_clauses"])
        if hashlib.sha256(raw).hexdigest() != receipt["appended_clause_sha256"]:
            raise RuntimeError(f"cut receipt {ordinal} clause digest mismatch")
        path = output_dir / f"refinement-{ordinal:02d}.dimacs"
        _write(path, raw)
        fragments.append(path)
    pair_path = output_dir / "refinement-07.dimacs"
    _write(pair_path, _pair_fragment(pair_receipt))
    fragments.append(pair_path)

    variable_map_path = output_dir / "variable-map.json"
    _write(variable_map_path, contract.canonical_json_bytes(_variable_map(order)))

    all_receipts = [*cut_receipts, pair_receipt]
    receipt_paths = [*CUT_RECEIPTS, PAIR_RECEIPT]
    clause_counts = [item["appended_clause_count"] for item in all_receipts]
    running_count = root_manifest["clauses"]
    running_hash = contract.sha256_file(ROOT_CNF)
    refinements = []
    for ordinal, (receipt, receipt_path, fragment, clause_count) in enumerate(
        zip(all_receipts, receipt_paths, fragments, clause_counts, strict=True)
    ):
        result_count = running_count + clause_count
        result_hash, _ = _formula_identity(
            ROOT_CNF,
            fragments[: ordinal + 1],
            num_vars=root_manifest["variables"],
            num_clauses=result_count,
        )
        if ordinal < 7:
            provenance = {
                "session_id": receipt["session_id"],
                "model_log": receipt["model_log"],
                "model_log_sha256": receipt["model_log_sha256"],
                "analysis": receipt["analysis"],
                "analysis_sha256": receipt["analysis_sha256"],
            }
            kind = "cut_round"
        else:
            provenance = {
                "session_id": receipt["session_id"],
                "selected_pair_count": receipt["selected_pair_count"],
                "selected_pair_sha256": receipt["selected_pair_sha256"],
                "batch_count": len(receipt["batches"]),
            }
            kind = "pair_closure"
        refinements.append(
            {
                "ordinal": ordinal,
                "kind": kind,
                "receipt": _file_ref(receipt_path),
                "receipt_schema": receipt["schema"],
                "clause_fragment": _file_ref(fragment),
                "clause_count": clause_count,
                "parent_formula_sha256": running_hash,
                "parent_clause_count": running_count,
                "result_formula_sha256": result_hash,
                "result_clause_count": result_count,
                "provenance": provenance,
            }
        )
        running_hash = result_hash
        running_count = result_count

    aggregate_hash, aggregate_bytes = _formula_identity(
        ROOT_CNF,
        fragments,
        num_vars=root_manifest["variables"],
        num_clauses=running_count,
    )
    commit = subprocess.run(
        ["git", "rev-parse", "HEAD"],
        cwd=REPO,
        check=True,
        capture_output=True,
        text=True,
    ).stdout.strip()
    manifest = {
        "schema": contract.SCHEMA,
        "lane": {
            "label": "P97 exact-17 cap-nine root plus ordered two-Kalmanson refinements",
            "scope": root_manifest["scope"],
            "order_index": 0,
            "anonymous_positions": [0, 1],
            "order": order,
            "terminal_semantics": (
                "finite normalized-case custody and replay only; no source entitlement, "
                "aggregate coverage, universal lift, or theorem closure"
            ),
        },
        "producer": {
            "git_commit": commit,
            "argv": [
                "uv",
                "run",
                "python",
                _relative(Path(__file__)),
                "--output-dir",
                _relative(output_dir),
            ],
            "executable": sys.executable,
            "version": platform.python_version(),
            "source_files": _source_files(cut_receipts, pair_receipt),
        },
        "root": {
            "cnf": _file_ref(ROOT_CNF),
            "manifest": _file_ref(ROOT_MANIFEST),
            "validation": _file_ref(ROOT_VALIDATION),
            "num_vars": root_manifest["variables"],
            "num_clauses": root_manifest["clauses"],
        },
        "variable_map": {
            "artifact": _file_ref(variable_map_path),
            "schema": contract.VARIABLE_MAP_SCHEMA,
            "entry_count": root_manifest["variables"],
            "order_sha256": hashlib.sha256(contract.canonical_json_bytes(order)).hexdigest(),
            "reconstructor": {
                "source": _relative(Path(__file__)),
                "function": "_variable_map",
            },
        },
        "refinements": refinements,
        "aggregate": {
            "algorithm": contract.AGGREGATE_ALGORITHM,
            "version": 1,
            "sha256": aggregate_hash,
            "byte_count": aggregate_bytes,
            "num_vars": root_manifest["variables"],
            "num_clauses": running_count,
            "upload_cap_bytes": contract.MAX_AGGREGATE_BYTES,
            "within_upload_cap": aggregate_bytes <= contract.MAX_AGGREGATE_BYTES,
        },
        "replay": {
            "source_model_validator": {
                "path": _relative(LANE / "analyze_source_faithful_boolean_model.py"),
                "argv_template": [
                    "uv",
                    "run",
                    "python",
                    _relative(LANE / "analyze_source_faithful_boolean_model.py"),
                    "--order",
                    "0",
                    "--positions",
                    "0,1",
                    "--cnf",
                    "{stage_cnf}",
                    "--cadical-log",
                    "{model_log}",
                    "--output",
                    "{analysis_json}",
                ],
                "source_files": [
                    _file_ref(LANE / "analyze_source_faithful_boolean_model.py")
                ],
            },
            "expected_structural_result": "PASS for every seven cut-round model receipts",
            "expected_exact_global_lra_result": "not requested; cuts use replayed Lean theorem-bank consumers",
        },
        "resource": {
            "max_cores": 1,
            "max_solver_processes": 1,
            "parallel": False,
            "wall_time_envelope_seconds": [1, 900],
        },
        "claims": {
            "normalized_case_only": True,
            "source_entitlement": False,
            "aggregate_case_coverage": False,
            "universal_lift": False,
            "theorem_closure": False,
            "lean_checked": False,
            "daemon_signed_attestation": False,
        },
    }
    if aggregate_bytes > contract.MAX_AGGREGATE_BYTES:
        raise RuntimeError("aggregate exceeds PIQD upload cap")
    manifest_path = output_dir / "manifest.json"
    _write(manifest_path, contract.canonical_json_bytes(manifest))
    frozen = contract.validate_manifest(manifest_path, repo=REPO)
    validation = {
        "schema": "p97-exact17-cap9-root-refinement-lane-validation/v1",
        "status": "PASS",
        "manifest": _file_ref(manifest_path),
        "aggregate_sha256": frozen.aggregate_sha256,
        "aggregate_byte_count": frozen.aggregate_byte_count,
        "aggregate_num_vars": frozen.root_num_vars,
        "aggregate_num_clauses": frozen.aggregate_num_clauses,
    }
    _write(output_dir / "offline-validation.json", contract.canonical_json_bytes(validation))
    return manifest_path


def main() -> int:
    parser = argparse.ArgumentParser()
    parser.add_argument("--output-dir", type=Path, default=DEFAULT_OUTPUT)
    args = parser.parse_args()
    manifest = freeze(args.output_dir)
    print(
        json.dumps(
            {
                "status": "PASS",
                "manifest": _relative(manifest),
                "manifest_sha256": contract.sha256_file(manifest),
            },
            sort_keys=True,
        )
    )
    return 0


if __name__ == "__main__":
    raise SystemExit(main())
