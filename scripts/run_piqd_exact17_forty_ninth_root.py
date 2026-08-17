"""Run the authenticated exact17 FortyNinth root through PIQD once.

This is a FortyNinth configuration adapter around the hardened weighted-
successor runner.  It is intentionally only an adapter: importing it and
running ``static-check`` perform offline authentication, while ``start`` is
the sole command that may contact PIQD.  SAT is independently replayed;
UNSAT is explicitly left uncertified without proof replay.
"""

from __future__ import annotations

import argparse
import json
import sys
from collections.abc import Mapping, Sequence
from pathlib import Path
from typing import Any

ROOT = Path(__file__).resolve().parents[1]
sys.path.insert(0, str(ROOT / "scripts"))

import run_piqd_exact17_weighted_successor_model_root as _base
import validate_exact17_forty_ninth_piqd_ingress as ingress

LANE_ID = "exact17-forty-ninth-piqd-20260816"
RUN_ID = "successor-v1"
RUN_OWNER = "exact17-forty-ninth-piqd"
RUN_BASE_HEAD = "87b6a4594791bffa3601fb431044624a2613595c"
RUN_ROOT = ROOT / f"scratch/runs/{LANE_ID}/{RUN_ID}"
CHECKPOINT_PATH = ROOT / f".codex/worktree-checkpoints/{LANE_ID}.json"
RUN_MANIFEST_SCHEMA = "worktree-run-manifest/v1"
RUN_OUTPUT_CLASSES = ("artifacts", "events", "tmp")
RUN_SCHEMA = "p97-exact17-forty-ninth-piqd-run/v1"
LAUNCH_SCHEMA = "p97-exact17-forty-ninth-piqd-launch/v1"
PROJECT = "erdos-97-96-exact17-forty-ninth-v1"
OWNED_PATHS = (
    "scripts/run_piqd_exact17_forty_ninth_root.py",
    "scripts/test_run_piqd_exact17_forty_ninth_root.py",
    "scripts/test_validate_exact17_forty_ninth_piqd_ingress.py",
    "scripts/validate_exact17_forty_ninth_piqd_ingress.py",
)
SOURCE_THEOREM = (
    "Problem97.ATailBlockerVExactSeventeenFortyNinthModelRefinements."
    "sourceAssign_extendedFortyNinthModelRefinementsCnf"
)
SOURCE_MANIFEST_SHA256 = (
    "57649c028d35ad8fd4b1d7befc1a266f14aa2123a60a6c05490459ad2a17a545"
)
SOURCE_MANIFEST_BYTES = 719
PRODUCER_MANIFEST_SHA256 = (
    "49a8706b9ee5c467782659c2d3d65cd2dbe9c11e2e0648af8859f9334b004a3d"
)
PRODUCER_MANIFEST_BYTES = 1352
MAX_POLLS = _base.MAX_POLLS
POLL_INTERVAL_S = _base.POLL_INTERVAL_S
MAX_CNF_BYTES = _base.MAX_CNF_BYTES
MAX_OFFLINE_CONTROL_BYTES = _base.MAX_OFFLINE_CONTROL_BYTES
SOURCE_SCHEMA = _base.SOURCE_SCHEMA
PRODUCER_SCHEMA = _base.PRODUCER_SCHEMA
RECEIPT_SCHEMA = _base.RECEIPT_SCHEMA
ATTESTED_SOLVER_RESULT = _base.ATTESTED_SOLVER_RESULT
CERTIFICATE_BLOCKER = _base.CERTIFICATE_BLOCKER
StaticPiqdRunnerError = _base.StaticPiqdRunnerError
StaticSolverResult = _base.StaticSolverResult
WaveContractError = _base.WaveContractError
canonical_json_bytes = _base.canonical_json_bytes
sha256_bytes = _base.sha256_bytes
sha256_json = _base.sha256_json

RunnerPaths = _base.RunnerPaths
RunnerSpec = _base.RunnerSpec
RunnerError = _base.WeightedSuccessorModelRunnerError
IngressValidationError = ingress.IngressValidationError
Transport = _base.Transport

PRODUCTION_RUNNER_PATHS = RunnerPaths(
    ingress=ingress.PRODUCTION_INGRESS_PATHS, run_root=RUN_ROOT
)
PRODUCTION_RUNNER_SPEC = RunnerSpec(
    ingress=ingress.PRODUCTION_INGRESS_SPEC,
    root_sha256=ingress.CHILD_SHA256,
    root_bytes=ingress.CHILD_BYTES,
    variables=ingress.VARIABLES,
    clauses=ingress.CHILD_CLAUSES,
    receipt_sha256=ingress.RECEIPT_SHA256,
    project=PROJECT,
    timeout_s=ingress.TIMEOUT_S,
    requested_core_limit=ingress.REQUESTED_CORE_LIMIT,
    maximum_requested_core_limit=ingress.MAX_REQUESTED_CORE_LIMIT,
)


def _configure_base() -> None:
    """Bind every inherited runner global to the FortyNinth configuration."""

    ingress._configure_base()
    for name, value in {
        "ROOT": ROOT,
        "LANE_ID": LANE_ID,
        "RUN_ID": RUN_ID,
        "RUN_OWNER": RUN_OWNER,
        "RUN_BASE_HEAD": RUN_BASE_HEAD,
        "RUN_ROOT": RUN_ROOT,
        "CHECKPOINT_PATH": CHECKPOINT_PATH,
        "RUN_MANIFEST_SCHEMA": RUN_MANIFEST_SCHEMA,
        "RUN_OUTPUT_CLASSES": RUN_OUTPUT_CLASSES,
        "OWNED_PATHS": OWNED_PATHS,
        "RUN_SCHEMA": RUN_SCHEMA,
        "LAUNCH_SCHEMA": LAUNCH_SCHEMA,
        "PROJECT": PROJECT,
        "SOURCE_THEOREM": SOURCE_THEOREM,
        "SOURCE_MANIFEST_SHA256": SOURCE_MANIFEST_SHA256,
        "PRODUCER_MANIFEST_SHA256": PRODUCER_MANIFEST_SHA256,
        "PRODUCTION_INGRESS_PATHS": ingress.PRODUCTION_INGRESS_PATHS,
        "PRODUCTION_INGRESS_SPEC": ingress.PRODUCTION_INGRESS_SPEC,
        "RECEIPT_SHA256": ingress.RECEIPT_SHA256,
        "REQUESTED_CORE_LIMIT": ingress.REQUESTED_CORE_LIMIT,
        "MAX_REQUESTED_CORE_LIMIT": ingress.MAX_REQUESTED_CORE_LIMIT,
        "TIMEOUT_S": ingress.TIMEOUT_S,
        "VARIABLE_MAP_SHA256": ingress.VARIABLE_MAP_SHA256,
        "validate_ingress": ingress.validate_ingress,
        "_open_ingress_regular_nofollow": ingress._open_regular_nofollow,
    }.items():
        setattr(_base, name, value)
    _base.PRODUCTION_RUNNER_PATHS = PRODUCTION_RUNNER_PATHS
    _base.PRODUCTION_RUNNER_SPEC = PRODUCTION_RUNNER_SPEC
    _base.build_static_manifests = build_static_manifests
    _base._run_manifest_object = _run_manifest_object


def build_static_manifests(
    validated_ingress: Mapping[str, Any],
    spec: RunnerSpec = PRODUCTION_RUNNER_SPEC,
) -> tuple[bytes, bytes]:
    """Build and authenticate manifests whose identities name FortyNinth."""

    _configure_base()
    _base._require(spec.provisioned, "FortyNinth runner is unprovisioned")
    _base._require(validated_ingress.get("status") == "PASS", "ingress is not PASS")
    _base._require(
        validated_ingress.get("dimacs")
        == {
            "path": str(PRODUCTION_RUNNER_PATHS.ingress.child.resolve()),
            "sha256": spec.root_sha256,
            "bytes": spec.root_bytes,
            "variables": spec.variables,
            "clauses": spec.clauses,
        },
        "FortyNinth DIMACS identity drifted",
    )
    source = {
        "schema": _base.SOURCE_SCHEMA,
        "source_id": "exact17-forty-ninth-model-refinements-cumulative-root-v2",
        "source_path": str(PRODUCTION_RUNNER_PATHS.ingress.lean_root.relative_to(ROOT)),
        "source_sha256": str(validated_ingress["lean"]["root"]["sha256"]),
        "finite_schema": str(validated_ingress["export_receipt"]["schema"]),
        "cardinality_scope": (
            "finite exact17 cumulative FortyNinth model-refinements CNF; "
            f"{spec.variables} variables and {spec.clauses} clauses"
        ),
        "source_theorem": SOURCE_THEOREM,
        "claims": _base._claims(
            ("source_entitlement", "theorem_coverage", "universal_lift", "lean_closure")
        ),
    }
    source_bytes = _base.canonical_json_bytes(source)
    producer = {
        "schema": _base.PRODUCER_SCHEMA,
        "producer_id": f"exact17-forty-ninth-model-refinements-receipt-v2-{spec.receipt_sha256}",
        "producer_kind": "static-dimacs",
        "source_manifest": source,
        "source_manifest_sha256": _base.sha256_bytes(source_bytes),
        "variable_map_sha256": ingress.VARIABLE_MAP_SHA256,
        "backend": spec.ingress.backend,
        "solver_profile": spec.ingress.solver_profile,
        "query_polarity": "SAT_MEANS_COUNTEREXAMPLE",
        "claims": _base._claims(
            (
                "source_entitlement",
                "theorem_coverage",
                "universal_lift",
                "lean_closure",
                "one_process",
                "one_core",
            )
        ),
    }
    producer_bytes = _base.canonical_json_bytes(producer)
    _base.authenticate_static_manifests(
        source_manifest=source_bytes, producer_manifest=producer_bytes
    )
    _base._require(
        _base.sha256_bytes(source_bytes) == SOURCE_MANIFEST_SHA256,
        "FortyNinth source manifest identity drifted",
    )
    _base._require(
        _base.sha256_bytes(producer_bytes) == PRODUCER_MANIFEST_SHA256,
        "FortyNinth producer manifest identity drifted",
    )
    return source_bytes, producer_bytes


def _run_manifest_object(
    paths: RunnerPaths,
    spec: RunnerSpec,
    *,
    created_utc: str,
    checkpoint_sha256: str | None = None,
) -> dict[str, Any]:
    """Produce a run manifest naming only this adapter's owned files."""

    runner_path = Path(__file__).resolve()
    ingress_path = ROOT / "scripts/validate_exact17_forty_ninth_piqd_ingress.py"
    source_digests = {
        str(runner_path.relative_to(ROOT)): _base._source_digest(runner_path),
        str(ingress_path.relative_to(ROOT)): _base._source_digest(ingress_path),
        str(CHECKPOINT_PATH.relative_to(ROOT)): (
            checkpoint_sha256 or _base._source_digest(CHECKPOINT_PATH)
        ),
    }
    manifest = {
        "schema": RUN_MANIFEST_SCHEMA,
        "lane_id": LANE_ID,
        "run_id": RUN_ID,
        "root": str(paths.run_root.relative_to(ROOT)),
        "owner": RUN_OWNER,
        "base_head": RUN_BASE_HEAD,
        "output_classes": list(RUN_OUTPUT_CLASSES),
        "source_digests": source_digests,
        "input_digests": {
            str(paths.ingress.child.relative_to(ROOT)): spec.root_sha256,
            str(paths.ingress.export_receipt.relative_to(ROOT)): spec.receipt_sha256,
        },
        "created_utc": created_utc,
    }
    return {**manifest, "manifest_sha256": _base.sha256_json(manifest)}


def static_check(
    paths: RunnerPaths = PRODUCTION_RUNNER_PATHS,
    spec: RunnerSpec = PRODUCTION_RUNNER_SPEC,
) -> dict[str, Any]:
    _configure_base()
    checked = ingress.validate_ingress(
        paths.ingress, spec=spec.ingress, expected_manifest_sha256=spec.receipt_sha256
    )
    source, producer = build_static_manifests(checked, spec)
    return {
        "status": "PASS",
        "ingress": checked,
        "source_manifest_sha256": _base.sha256_bytes(source),
        "producer_manifest_sha256": _base.sha256_bytes(producer),
        "timeout_s": spec.timeout_s,
        "requested_core_limit": spec.requested_core_limit,
        "maximum_requested_core_limit": spec.maximum_requested_core_limit,
    }


def expected_identity_hash(
    spec: RunnerSpec = PRODUCTION_RUNNER_SPEC,
    producer_manifest_sha256: str = PRODUCER_MANIFEST_SHA256,
) -> str:
    _configure_base()
    return _base.expected_identity_hash(spec, producer_manifest_sha256)


def start(**kwargs: Any) -> dict[str, Any]:
    _configure_base()
    return _base.start(
        paths=PRODUCTION_RUNNER_PATHS, spec=PRODUCTION_RUNNER_SPEC, **kwargs
    )


def finalize_existing(**kwargs: Any) -> dict[str, Any]:
    _configure_base()
    return _base.finalize_existing(
        paths=PRODUCTION_RUNNER_PATHS, spec=PRODUCTION_RUNNER_SPEC, **kwargs
    )


def main(argv: Sequence[str] | None = None) -> int:
    parser = argparse.ArgumentParser(description=__doc__)
    parser.add_argument(
        "command", choices=("static-check", "start", "finalize-existing")
    )
    parser.add_argument("--base-url", default="http://127.0.0.1:7272")
    args = parser.parse_args(argv)
    try:
        if args.command == "static-check":
            payload = static_check()
        elif args.command == "finalize-existing":
            payload = finalize_existing()
        else:
            payload = start(base_url=args.base_url)
    except (
        IngressValidationError,
        _base.StaticPiqdRunnerError,
        RunnerError,
        _base.WaveContractError,
        FileExistsError,
    ) as exc:
        print(f"FortyNinth PIQD runner rejected: {exc}")
        return 2
    print(json.dumps(payload, indent=2, sort_keys=True))
    return 0 if payload.get("verdict") != "UNSAT" else 3


_configure_base()


if __name__ == "__main__":
    raise SystemExit(main())
