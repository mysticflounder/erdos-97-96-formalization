"""Certify the exact-17 PIQD model serialization custody repair.

Two historical ingress manifests recorded raw-model SHA-256 values that do not
match the model JSON files committed in the same checkpoint.  This validator
does not bless arbitrary replacement bytes.  It pins both the historical
expectations and the current artifacts, replays each complete 308-variable
assignment against its exact CNF, and requires the regenerated decoded analysis
to be byte-for-byte equal to the banked analysis.
"""

from __future__ import annotations

import argparse
import hashlib
import importlib.util
import json
import stat
from pathlib import Path
from types import ModuleType
from typing import Any

VARIABLES = 308
ANALYZER = "scripts/analyze_exact17_lean_cdefg_model.py"
ANALYZER_SHA256 = "7edde11ca10ffc944f89d48f50fe677b0d503296a025b00c8d45126077b5ed7a"

HISTORICAL_INTERLEAVED_MANIFEST = (
    "scratch/exact17-lean-to-sat/"
    "piqd-ingress-manifest-equal-k4-two-circle-three-row-hijk-interleaved.json"
)
HISTORICAL_INTERLEAVED_MANIFEST_SHA256 = (
    "3d2384567e053f92e2269038fa800b79fa1322cc5a602ec1f46e3ec81fbc4540"
)
HISTORICAL_EQUALITY_MANIFEST = (
    "scratch/exact17-lean-to-sat/"
    "piqd-ingress-manifest-equal-k4-two-circle-three-row-hijk-interleaved-"
    "equality-chain.json"
)
HISTORICAL_EQUALITY_MANIFEST_SHA256 = (
    "0e1eb1a26801f6e66b55394eaf1a1f2b581873604c38fa9883b54eea053e70f4"
)

MODELS = (
    {
        "name": "hijk",
        "path": "scratch/exact17-lean-to-sat/piqd-hijk-model.json",
        "current_sha256": "d8e05b36499f884f4e7fccfb59bf8c44eb83077159633aecec706ae2c3501956",
        "historical_sha256": "2380069bd5a33cd5830f83097550570fe5399bf86e8b57f5aff77b5079a14184",
        "job_id": "ea164868-e0aa-42b9-9313-4dab74061c54",
        "cnf": (
            "scratch/exact17-lean-to-sat/"
            "extended-cdefg-equal-k4-two-circle-three-row-hijk.cnf"
        ),
        "cnf_sha256": "a489fdf5ddbd1f0abd765592e4b016841b170aed7a20833318704e30171bb570",
        "clauses": 3_618_396,
        "analysis": "scratch/exact17-lean-to-sat/piqd-hijk-model-analysis.json",
        "analysis_sha256": "f46e73d960e5018ca744f05d963295e8ff2e15093dbe8bdb8ce4d803420d5029",
    },
    {
        "name": "hijk_interleaved",
        "path": "scratch/exact17-lean-to-sat/piqd-hijk-interleaved-model.json",
        "current_sha256": "771228aa103326671762161bf6160d4aa36c5206598032148dc20924909e7626",
        "historical_sha256": "25cddee53e8a29dc6badce72dee236f4388e0898fc4b57dc86ad619ada4fc49b",
        "job_id": "3e1cc468-a960-4393-b2ff-3b76eb54292e",
        "cnf": (
            "scratch/exact17-lean-to-sat/"
            "extended-cdefg-equal-k4-two-circle-three-row-hijk-interleaved.cnf"
        ),
        "cnf_sha256": "db8f493b4a8312efcf99d0e3e198537233b83dbb6cc5f4dad6f1423e22d90bd9",
        "clauses": 3_915_420,
        "analysis": (
            "scratch/exact17-lean-to-sat/"
            "piqd-hijk-interleaved-model-analysis.json"
        ),
        "analysis_sha256": "d57f9777b1f923c1e337ccd2256a707dc3f7b5b1a62326a19721026e2fb3b350",
    },
)


def strict_object(pairs: list[tuple[str, Any]]) -> dict[str, Any]:
    result: dict[str, Any] = {}
    for key, value in pairs:
        if key in result:
            raise ValueError(f"duplicate JSON key: {key}")
        result[key] = value
    return result


def load_json(path: Path) -> dict[str, Any]:
    value = json.loads(
        path.read_text(encoding="utf-8"), object_pairs_hook=strict_object
    )
    if not isinstance(value, dict):
        raise TypeError(f"expected JSON object: {path}")
    return value


def require(condition: bool, message: str) -> None:
    if not condition:
        raise ValueError(message)


def checked_path(repo: Path, relative: str) -> Path:
    path = repo / relative
    resolved = path.resolve(strict=True)
    resolved.relative_to(repo.resolve(strict=True))
    require(stat.S_ISREG(resolved.stat().st_mode), f"not a regular file: {relative}")
    require(not path.is_symlink(), f"symlink refused: {relative}")
    return resolved


def sha256(path: Path) -> str:
    digest = hashlib.sha256()
    with path.open("rb") as stream:
        for chunk in iter(lambda: stream.read(1024 * 1024), b""):
            digest.update(chunk)
    return digest.hexdigest()


def pinned_path(repo: Path, relative: str, expected_sha256: str) -> Path:
    path = checked_path(repo, relative)
    require(sha256(path) == expected_sha256, f"SHA-256 drift: {relative}")
    return path


def load_module(path: Path) -> ModuleType:
    spec = importlib.util.spec_from_file_location("exact17_model_replay", path)
    if spec is None or spec.loader is None:
        raise ValueError(f"cannot import analyzer: {path}")
    module = importlib.util.module_from_spec(spec)
    spec.loader.exec_module(module)
    return module


def validate(repo: Path) -> dict[str, Any]:
    analyzer_path = pinned_path(repo, ANALYZER, ANALYZER_SHA256)
    analyzer = load_module(analyzer_path)

    interleaved_manifest = load_json(
        pinned_path(
            repo,
            HISTORICAL_INTERLEAVED_MANIFEST,
            HISTORICAL_INTERLEAVED_MANIFEST_SHA256,
        )
    )
    equality_manifest = load_json(
        pinned_path(
            repo,
            HISTORICAL_EQUALITY_MANIFEST,
            HISTORICAL_EQUALITY_MANIFEST_SHA256,
        )
    )
    require(
        interleaved_manifest["validation"]["model_sha256"]
        == MODELS[0]["historical_sha256"],
        "historical H--K model expectation drift",
    )
    require(
        equality_manifest["validation"]["parent_model_sha256"]
        == MODELS[0]["historical_sha256"],
        "historical equality parent-model expectation drift",
    )
    require(
        equality_manifest["validation"]["model_sha256"]
        == MODELS[1]["historical_sha256"],
        "historical interleaved model expectation drift",
    )

    results: list[dict[str, Any]] = []
    for record in MODELS:
        model_path = pinned_path(repo, record["path"], record["current_sha256"])
        model = load_json(model_path)
        require(
            set(model) == {"assignment", "job_id", "num_assigned", "result"},
            f"unexpected model fields: {record['name']}",
        )
        require(model["job_id"] == record["job_id"], f"job drift: {record['name']}")
        require(model["result"] == "SAT", f"non-SAT model: {record['name']}")
        require(
            model["num_assigned"] == VARIABLES,
            f"assignment count drift: {record['name']}",
        )
        assignment = analyzer.load_assignment(model_path)
        cnf_path = pinned_path(repo, record["cnf"], record["cnf_sha256"])
        cnf_sha256, variables, clauses = analyzer.replay_cnf(
            cnf_path,
            assignment,
            authorized_sha256=record["cnf_sha256"],
            clause_count=record["clauses"],
        )
        regenerated = {
            "status": "PASS",
            "cnf_sha256": cnf_sha256,
            "variables": variables,
            "clauses": clauses,
            **analyzer.decode(assignment),
        }
        banked_analysis_path = pinned_path(
            repo, record["analysis"], record["analysis_sha256"]
        )
        require(
            regenerated == load_json(banked_analysis_path),
            f"decoded assignment differs from banked analysis: {record['name']}",
        )
        require(
            record["current_sha256"] != record["historical_sha256"],
            f"migration unexpectedly absent: {record['name']}",
        )
        results.append(
            {
                "name": record["name"],
                "job_id": record["job_id"],
                "current_model_sha256": record["current_sha256"],
                "historical_manifest_model_sha256": record["historical_sha256"],
                "cnf_sha256": cnf_sha256,
                "clauses_replayed": clauses,
                "variables_assigned": variables,
                "banked_analysis_sha256": record["analysis_sha256"],
                "decoded_analysis_byte_identical": True,
            }
        )

    return {
        "schema": "p97-exact17-piqd-model-serialization-custody-repair/v1",
        "historical_manifest_hashes_pinned": True,
        "complete_assignments_replayed": True,
        "models": results,
        "status": "PASS",
    }


def main() -> int:
    parser = argparse.ArgumentParser()
    parser.add_argument("--repo", type=Path, default=Path.cwd())
    parser.add_argument("--report", type=Path)
    args = parser.parse_args()
    result = validate(args.repo.resolve())
    rendered = json.dumps(result, indent=2, sort_keys=True) + "\n"
    if args.report is not None:
        args.report.write_text(rendered, encoding="utf-8")
    print(rendered, end="")
    return 0


if __name__ == "__main__":
    raise SystemExit(main())
