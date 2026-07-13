"""Immutable pre-run manifests for the authorized card-12--14 head census.

The manifest is deliberately stricter than the historical ``GATE_CUTS``
environment switch.  It pins the post-SUB2 PROVEN cut contract, the exact
labeled profile, source digests, resource limits, and all three mandatory
nonconvergence stops before a heavy run can start.

Validation is only an operational/reproducibility gate.  A valid run remains
finite-abstraction evidence and is not a geometric closure theorem.
"""

from __future__ import annotations

import argparse
import hashlib
import json
import os
import re
from datetime import datetime, timezone
from pathlib import Path, PurePosixPath
from typing import Any, Mapping, Sequence

from .profiles import labeled_cap_profiles


SCHEMA = "p97_ahead_head_run_manifest.v1"
STATUS = "PLANNED"
PROOF_TIER = "PROVEN"
ADMISSIBILITY_CONTRACT = "p97_ahead_head_admissibility.v1"
CUT_CONTRACT = "p97_ahead_proven_cuts_post_sub2.v1"
MAX_WORKERS = 4
EVIDENCE_SCOPE = (
    "EMPIRICALLY VERIFIED within one labeled finite card-head abstraction; "
    "not a geometric closure theorem"
)

PROVEN_CUTS: tuple[dict[str, Any], ...] = (
    {
        "id": "packet_moser_count_le_two",
        "rigor": "PROVEN",
        "statement": "At a non-Moser center, a selected class contains at most two Moser vertices.",
        "evidence": [
            "census/candidate_d_probe/formulation.md#21-m--2-is-geometric-not-just-a-model-choice"
        ],
    },
    {
        "id": "vertex_pair_same_cap_zero",
        "rigor": "PROVEN",
        "statement": (
            "If the class contains at least two Moser vertices, "
            "its same-cap count is zero."
        ),
        "evidence": ["census/candidate_d_probe/kill_notes.md#k-c"],
    },
    {
        "id": "same_cap_count_le_two_proxy",
        "rigor": "PROVEN",
        "statement": (
            "Drop order-free classes with same-cap count at least three; "
            "this does not encode or decide the position of an s=2 class."
        ),
        "evidence": [
            "census/candidate_d_probe/kill_notes.md#k-d-same-side-own-pair-sub-window",
            "Problem97.ATailSub2.sub2H_left_unsat",
            "Problem97.ATailSub2.sub2H_right_unsat",
        ],
    },
)

_RUN_ID = re.compile(r"^[A-Za-z0-9][A-Za-z0-9._-]{0,127}$")
_SHA256 = re.compile(r"^[0-9a-f]{64}$")


class ManifestError(ValueError):
    """Raised when a proposed AHEAD run manifest violates the frozen contract."""


def _canonical_bytes(value: Any) -> bytes:
    return json.dumps(value, sort_keys=True, separators=(",", ":")).encode("utf-8")


def json_sha256(value: Any) -> str:
    """Return the SHA-256 of the canonical compact JSON encoding of ``value``."""

    return hashlib.sha256(_canonical_bytes(value)).hexdigest()


def cut_contract_payload() -> dict[str, Any]:
    """Return the complete, digest-pinned post-SUB2 proof-tier cut contract."""

    return {
        "schema": CUT_CONTRACT,
        "rigor": PROOF_TIER,
        "cuts": [dict(cut) for cut in PROVEN_CUTS],
    }


def cut_contract_sha256() -> str:
    return json_sha256(cut_contract_payload())


def _require_exact_keys(
    value: Mapping[str, Any], required: set[str], description: str
) -> None:
    actual = set(value)
    missing = required - actual
    extra = actual - required
    if missing or extra:
        raise ManifestError(
            f"{description} keys differ: missing={sorted(missing)}, extra={sorted(extra)}"
        )


def _require_positive_int(value: Any, description: str) -> int:
    if isinstance(value, bool) or not isinstance(value, int) or value <= 0:
        raise ManifestError(f"{description} must be a positive integer")
    return value


def _validate_created_utc(value: Any) -> str:
    if not isinstance(value, str) or not value.endswith("Z"):
        raise ManifestError("created_utc must be an ISO-8601 UTC string ending in Z")
    try:
        parsed = datetime.fromisoformat(value[:-1] + "+00:00")
    except ValueError as exc:
        raise ManifestError("created_utc is not valid ISO-8601") from exc
    if parsed.utcoffset() != timezone.utc.utcoffset(parsed):
        raise ManifestError("created_utc must use UTC")
    return value


def _validate_relative_path(value: Any, description: str) -> str:
    if not isinstance(value, str) or not value:
        raise ManifestError(f"{description} must be a nonempty relative path")
    path = PurePosixPath(value)
    if path.is_absolute() or ".." in path.parts or "." in path.parts:
        raise ManifestError(f"{description} must not be absolute or escape its root")
    return value


def expected_run_command(run_id: str, nice: int) -> list[str]:
    """Return the sole heavy-run entrypoint admitted by manifest schema v1."""

    manifest_path = f"census/card_head/runs/{run_id}/run_manifest.json"
    return [
        "nice",
        "-n",
        str(nice),
        "uv",
        "run",
        "python",
        "-m",
        "census.card_head.runner",
        "execute",
        manifest_path,
    ]


def validate_manifest(value: Mapping[str, Any]) -> dict[str, Any]:
    """Validate and normalize a pre-run manifest against the frozen v1 schema."""

    if not isinstance(value, Mapping):
        raise ManifestError("manifest must be a JSON object")
    _require_exact_keys(
        value,
        {
            "schema",
            "status",
            "run_id",
            "created_utc",
            "cardinality",
            "profile",
            "proof_tier",
            "admissibility_contract",
            "cut_contract",
            "cut_contract_sha256",
            "resources",
            "stops",
            "command",
            "artifact_dir",
            "source_digests",
            "evidence_scope",
        },
        "manifest",
    )
    if value["schema"] != SCHEMA:
        raise ManifestError(f"schema must be {SCHEMA}")
    if value["status"] != STATUS:
        raise ManifestError(f"status must be {STATUS}")
    run_id = value["run_id"]
    if not isinstance(run_id, str) or _RUN_ID.fullmatch(run_id) is None:
        raise ManifestError("run_id has an invalid or unsafe form")
    _validate_created_utc(value["created_utc"])

    cardinality = value["cardinality"]
    if isinstance(cardinality, bool) or cardinality not in (12, 13, 14):
        raise ManifestError("cardinality must be one of 12, 13, or 14")
    profile_value = value["profile"]
    if (
        not isinstance(profile_value, list)
        or len(profile_value) != 3
        or any(isinstance(item, bool) or not isinstance(item, int) for item in profile_value)
    ):
        raise ManifestError("profile must be a JSON list of three integers")
    profile = tuple(profile_value)
    if profile not in labeled_cap_profiles(cardinality):
        raise ManifestError("profile is not an admissible labeled profile at this cardinality")

    if value["proof_tier"] != PROOF_TIER:
        raise ManifestError("proof-tier head runs may use only PROVEN cuts")
    if value["admissibility_contract"] != ADMISSIBILITY_CONTRACT:
        raise ManifestError("admissibility contract is not the frozen AHEAD contract")
    if value["cut_contract"] != CUT_CONTRACT:
        raise ManifestError("cut contract is not the post-SUB2 PROVEN contract")
    if value["cut_contract_sha256"] != cut_contract_sha256():
        raise ManifestError("cut contract digest does not match the compiled contract")

    resources = value["resources"]
    if not isinstance(resources, Mapping):
        raise ManifestError("resources must be a JSON object")
    _require_exact_keys(resources, {"max_workers", "nice"}, "resources")
    workers = _require_positive_int(resources["max_workers"], "max_workers")
    if workers > MAX_WORKERS:
        raise ManifestError(f"max_workers exceeds the authorized cap of {MAX_WORKERS}")
    nice = _require_positive_int(resources["nice"], "nice")
    if nice > 19:
        raise ManifestError("nice must be between 1 and 19")

    stops = value["stops"]
    if not isinstance(stops, Mapping):
        raise ManifestError("stops must be a JSON object")
    _require_exact_keys(
        stops,
        {"wall_seconds", "max_new_bank_rows", "max_consecutive_shape_stale"},
        "stops",
    )
    for key in ("wall_seconds", "max_new_bank_rows", "max_consecutive_shape_stale"):
        _require_positive_int(stops[key], key)

    command = value["command"]
    expected_command = expected_run_command(run_id, nice)
    if command != expected_command:
        raise ManifestError(
            "command must be the manifest-pinned niced card-head runner entrypoint"
        )
    artifact_dir = _validate_relative_path(value["artifact_dir"], "artifact_dir")
    expected_artifact_dir = f"census/card_head/runs/{run_id}"
    if artifact_dir != expected_artifact_dir:
        raise ManifestError(f"artifact_dir must be {expected_artifact_dir}")

    source_digests = value["source_digests"]
    if not isinstance(source_digests, Mapping) or not source_digests:
        raise ManifestError("source_digests must be a nonempty JSON object")
    for path, digest in source_digests.items():
        _validate_relative_path(path, "source digest path")
        if not isinstance(digest, str) or _SHA256.fullmatch(digest) is None:
            raise ManifestError(f"invalid SHA-256 for source {path}")
    if value["evidence_scope"] != EVIDENCE_SCOPE:
        raise ManifestError("evidence_scope must retain the finite-abstraction disclaimer")

    return json.loads(json.dumps(value, sort_keys=True))


def source_digests(repo_root: Path, sources: Sequence[Path]) -> dict[str, str]:
    """Hash source files and return repo-relative POSIX paths in stable order."""

    root = repo_root.resolve()
    result: dict[str, str] = {}
    for source in sources:
        resolved = (root / source).resolve() if not source.is_absolute() else source.resolve()
        try:
            relative = resolved.relative_to(root)
        except ValueError as exc:
            raise ManifestError(f"source escapes repository root: {source}") from exc
        if not resolved.is_file():
            raise ManifestError(f"source is not a file: {source}")
        result[relative.as_posix()] = hashlib.sha256(resolved.read_bytes()).hexdigest()
    if not result:
        raise ManifestError("at least one source file must be pinned")
    return dict(sorted(result.items()))


def verify_source_digests(
    repo_root: Path, manifest: Mapping[str, Any]
) -> dict[str, Any]:
    """Validate ``manifest`` and re-hash every pinned source before a run."""

    normalized = validate_manifest(manifest)
    expected = normalized["source_digests"]
    actual = source_digests(repo_root, [Path(path) for path in expected])
    if actual != expected:
        mismatches = sorted(
            path
            for path in set(actual) | set(expected)
            if actual.get(path) != expected.get(path)
        )
        raise ManifestError(f"source digest mismatch: {', '.join(mismatches)}")
    return normalized


def build_manifest(
    *,
    run_id: str,
    cardinality: int,
    profile: Sequence[int],
    wall_seconds: int,
    max_new_bank_rows: int,
    max_consecutive_shape_stale: int,
    source_hashes: Mapping[str, str],
    max_workers: int = MAX_WORKERS,
    nice: int = 10,
    created_utc: str | None = None,
) -> dict[str, Any]:
    """Construct a manifest and validate it before returning it."""

    if created_utc is None:
        created_utc = datetime.now(timezone.utc).replace(microsecond=0).isoformat().replace(
            "+00:00", "Z"
        )
    value = {
        "schema": SCHEMA,
        "status": STATUS,
        "run_id": run_id,
        "created_utc": created_utc,
        "cardinality": cardinality,
        "profile": list(profile),
        "proof_tier": PROOF_TIER,
        "admissibility_contract": ADMISSIBILITY_CONTRACT,
        "cut_contract": CUT_CONTRACT,
        "cut_contract_sha256": cut_contract_sha256(),
        "resources": {"max_workers": max_workers, "nice": nice},
        "stops": {
            "wall_seconds": wall_seconds,
            "max_new_bank_rows": max_new_bank_rows,
            "max_consecutive_shape_stale": max_consecutive_shape_stale,
        },
        "command": expected_run_command(run_id, nice),
        "artifact_dir": f"census/card_head/runs/{run_id}",
        "source_digests": dict(sorted(source_hashes.items())),
        "evidence_scope": EVIDENCE_SCOPE,
    }
    return validate_manifest(value)


def write_new_manifest(path: Path, manifest: Mapping[str, Any]) -> str:
    """Validate and durably create ``path`` without ever overwriting it."""

    normalized = validate_manifest(manifest)
    path.parent.mkdir(parents=True, exist_ok=True)
    with open(path, "x", encoding="utf-8", newline="") as handle:
        json.dump(normalized, handle, sort_keys=True, indent=2)
        handle.write("\n")
        handle.flush()
        os.fsync(handle.fileno())
    return json_sha256(normalized)


def _parse_profile(value: str) -> tuple[int, int, int]:
    try:
        parts = tuple(int(part) for part in value.split(","))
    except ValueError as exc:
        raise argparse.ArgumentTypeError("profile must have form a,b,c") from exc
    if len(parts) != 3:
        raise argparse.ArgumentTypeError("profile must have form a,b,c")
    return parts


def main() -> int:
    parser = argparse.ArgumentParser()
    subparsers = parser.add_subparsers(dest="action", required=True)

    subparsers.add_parser("contract")

    validate_parser = subparsers.add_parser("validate")
    validate_parser.add_argument("manifest", type=Path)
    validate_parser.add_argument("--repo-root", type=Path, default=Path.cwd())

    create_parser = subparsers.add_parser("create")
    create_parser.add_argument("manifest", type=Path)
    create_parser.add_argument("--run-id", required=True)
    create_parser.add_argument("--cardinality", required=True, type=int)
    create_parser.add_argument("--profile", required=True, type=_parse_profile)
    create_parser.add_argument("--wall-seconds", required=True, type=int)
    create_parser.add_argument("--max-new-bank-rows", required=True, type=int)
    create_parser.add_argument("--max-consecutive-shape-stale", required=True, type=int)
    create_parser.add_argument("--max-workers", type=int, default=MAX_WORKERS)
    create_parser.add_argument("--nice", type=int, default=10)
    create_parser.add_argument("--repo-root", type=Path, default=Path.cwd())
    create_parser.add_argument("--source", action="append", type=Path, required=True)

    args = parser.parse_args()
    try:
        if args.action == "contract":
            payload = cut_contract_payload()
            print(
                json.dumps(
                    {"contract": payload, "sha256": cut_contract_sha256()},
                    sort_keys=True,
                    indent=2,
                )
            )
            return 0
        if args.action == "validate":
            raw = json.loads(args.manifest.read_text(encoding="utf-8"))
            normalized = verify_source_digests(args.repo_root, raw)
            print(json.dumps({"valid": True, "sha256": json_sha256(normalized)}, sort_keys=True))
            return 0

        hashes = source_digests(args.repo_root, args.source)
        manifest = build_manifest(
            run_id=args.run_id,
            cardinality=args.cardinality,
            profile=args.profile,
            wall_seconds=args.wall_seconds,
            max_new_bank_rows=args.max_new_bank_rows,
            max_consecutive_shape_stale=args.max_consecutive_shape_stale,
            source_hashes=hashes,
            max_workers=args.max_workers,
            nice=args.nice,
        )
        digest = write_new_manifest(args.manifest, manifest)
        print(json.dumps({"created": str(args.manifest), "sha256": digest}, sort_keys=True))
        return 0
    except (ManifestError, FileExistsError, OSError, json.JSONDecodeError) as exc:
        parser.error(str(exc))
    raise AssertionError("unreachable")


if __name__ == "__main__":
    raise SystemExit(main())
