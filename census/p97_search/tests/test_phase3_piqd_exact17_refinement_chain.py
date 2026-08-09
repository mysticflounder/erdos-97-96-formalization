from __future__ import annotations

import hashlib
import json
from pathlib import Path

import pytest

from census.p97_search import phase3_piqd_exact17_refinement_chain as chain


def _canonical(value: object) -> bytes:
    return chain.canonical_json_bytes(value)


def _write(path: Path, raw: bytes) -> dict[str, object]:
    path.parent.mkdir(parents=True, exist_ok=True)
    path.write_bytes(raw)
    return {
        "path": str(path.relative_to(path.parents[1])),
        "byte_count": len(raw),
        "sha256": hashlib.sha256(raw).hexdigest(),
    }


def _formula(root: bytes, fragments: list[bytes], clauses: int) -> bytes:
    body = root.split(b"\n", 1)[1]
    return f"p cnf 3 {clauses}\n".encode() + body + b"".join(fragments)


def _fixture(repo: Path) -> Path:
    work = repo / "artifacts"
    order = list(range(17))
    root = b"p cnf 3 2\n1 -2 0\n2 3 0\n"
    root_ref = _write(work / "root.cnf", root)
    root_manifest_ref = _write(
        work / "root-manifest.json",
        _canonical({"variables": 3, "clauses": 2, "order": order}),
    )
    root_validation_ref = _write(
        work / "root-validation.json",
        _canonical({"status": "PASS", "variables": 3, "clauses": 2}),
    )
    variable_map_ref = _write(
        work / "variable-map.json",
        _canonical(
            {
                "schema": chain.VARIABLE_MAP_SCHEMA,
                "order": order,
                "entries": [["selected", 0, 1], ["selected", 0, 2], ["selected", 1, 0]],
            }
        ),
    )
    fragments = [b"-1 2 0\n", b"1 -3 0\n"]
    refinements = []
    parent = root
    parent_count = 2
    for ordinal, fragment in enumerate(fragments):
        result_count = parent_count + 1
        result = _formula(root, fragments[: ordinal + 1], result_count)
        receipt_schema = "synthetic-cut/v1" if ordinal == 0 else "synthetic-pair/v1"
        receipt_ref = _write(
            work / f"receipt-{ordinal}.json",
            _canonical({"schema": receipt_schema, "ordinal": ordinal}),
        )
        fragment_ref = _write(work / f"fragment-{ordinal}.dimacs", fragment)
        refinements.append(
            {
                "ordinal": ordinal,
                "kind": "cut_round" if ordinal == 0 else "pair_closure",
                "receipt": receipt_ref,
                "receipt_schema": receipt_schema,
                "clause_fragment": fragment_ref,
                "clause_count": 1,
                "parent_formula_sha256": hashlib.sha256(parent).hexdigest(),
                "parent_clause_count": parent_count,
                "result_formula_sha256": hashlib.sha256(result).hexdigest(),
                "result_clause_count": result_count,
                "provenance": {"session_id": "synthetic", "source_id": ordinal},
            }
        )
        parent = result
        parent_count = result_count

    aggregate = _formula(root, fragments, 4)
    manifest = {
        "schema": chain.SCHEMA,
        "lane": {
            "label": "synthetic",
            "scope": "one normalized case",
            "order_index": 0,
            "anonymous_positions": [0, 1],
            "order": order,
            "terminal_semantics": "finite custody only",
        },
        "producer": {
            "git_commit": "0" * 40,
            "argv": ["synthetic"],
            "executable": "python",
            "version": "test",
            "source_files": [],
        },
        "root": {
            "cnf": root_ref,
            "manifest": root_manifest_ref,
            "validation": root_validation_ref,
            "num_vars": 3,
            "num_clauses": 2,
        },
        "variable_map": {
            "artifact": variable_map_ref,
            "schema": chain.VARIABLE_MAP_SCHEMA,
            "entry_count": 3,
            "order_sha256": hashlib.sha256(_canonical(order)).hexdigest(),
            "reconstructor": None,
        },
        "refinements": refinements,
        "aggregate": {
            "algorithm": chain.AGGREGATE_ALGORITHM,
            "version": 1,
            "sha256": hashlib.sha256(aggregate).hexdigest(),
            "byte_count": len(aggregate),
            "num_vars": 3,
            "num_clauses": 4,
            "upload_cap_bytes": chain.MAX_AGGREGATE_BYTES,
            "within_upload_cap": True,
        },
        "replay": {
            "source_model_validator": None,
            "expected_structural_result": "PASS",
            "expected_exact_global_lra_result": "not_run_in_synthetic_test",
        },
        "resource": {
            "max_cores": 1,
            "max_solver_processes": 1,
            "parallel": False,
            "wall_time_envelope_seconds": [1, 300],
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
    manifest_path = work / "manifest.json"
    manifest_path.write_bytes(_canonical(manifest))
    return manifest_path


def _load(path: Path) -> dict[str, object]:
    return json.loads(path.read_text())


def _rewrite(path: Path, value: object) -> None:
    path.write_bytes(_canonical(value))


def test_valid_chain_reconstructs_byte_exact_aggregate(tmp_path: Path) -> None:
    repo = tmp_path / "repo"
    manifest = _fixture(repo)
    frozen = chain.validate_manifest(manifest, repo=repo)
    output = repo / "aggregate.cnf"
    chain.reconstruct_aggregate(frozen, output)
    assert output.read_bytes() == b"p cnf 3 4\n1 -2 0\n2 3 0\n-1 2 0\n1 -3 0\n"


@pytest.mark.parametrize(
    ("mutation", "match"),
    [
        ("ordinal", "ordinals"),
        ("fragment_hash", "SHA-256"),
        ("fragment_count", "result count"),
        ("out_of_range", "exceeds root domain"),
        ("fragment_header", "header/comment"),
        ("unterminated", "unterminated"),
        ("extra_top_level", "top-level"),
    ],
)
def test_chain_tampering_fails_closed(tmp_path: Path, mutation: str, match: str) -> None:
    repo = tmp_path / "repo"
    manifest_path = _fixture(repo)
    manifest = _load(manifest_path)
    refinements = manifest["refinements"]
    assert isinstance(refinements, list)
    first = refinements[0]
    assert isinstance(first, dict)

    if mutation == "ordinal":
        first["ordinal"] = 2
    elif mutation == "fragment_hash":
        fragment = first["clause_fragment"]
        assert isinstance(fragment, dict)
        fragment["sha256"] = "f" * 64
    elif mutation == "fragment_count":
        first["clause_count"] = 2
    elif mutation in {"out_of_range", "fragment_header", "unterminated"}:
        fragment = first["clause_fragment"]
        assert isinstance(fragment, dict)
        fragment_path = repo / str(fragment["path"])
        raw = {
            "out_of_range": b"4 0\n",
            "fragment_header": b"p cnf 3 1\n",
            "unterminated": b"1 -2\n",
        }[mutation]
        fragment_path.write_bytes(raw)
        fragment["byte_count"] = len(raw)
        fragment["sha256"] = hashlib.sha256(raw).hexdigest()
    else:
        manifest["unexpected"] = True

    _rewrite(manifest_path, manifest)
    with pytest.raises(chain.Exact17RefinementChainError, match=match):
        chain.validate_manifest(manifest_path, repo=repo)
