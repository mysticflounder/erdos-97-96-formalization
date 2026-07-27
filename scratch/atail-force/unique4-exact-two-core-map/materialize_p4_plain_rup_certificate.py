#!/usr/bin/env python3
"""Authenticate the fixed P4 seed-0 externally verified plain-RUP package.

This materializer does not run a SAT solver, drat-trim, an LRAT normalizer, or
Lean.  It fail-closes against the already produced, byte-pinned artifacts and
emits a relocation-safe certificate manifest.  The resulting status is
deliberately narrower than source satisfaction or Lean replay.
"""

from __future__ import annotations

import argparse
import hashlib
import json
import os
from pathlib import Path
import tempfile
from typing import Any

import materialize_p4_compact_seed0 as compact


HERE = Path(__file__).resolve().parent
GENERATED_DIR = HERE / "generated"
CERTIFICATE_DIR = GENERATED_DIR / "p4-seed0-plain-rup-certificate"
COMPACT_DIR = GENERATED_DIR / "p4-seed0-compact"
MANIFEST_NAME = "p4-seed0-plain-rup-certificate-manifest.json"
MANIFEST_PATH = CERTIFICATE_DIR / MANIFEST_NAME

SCHEMA = "p97-unique4-exact-two-p4-seed0-plain-rup-certificate-v1"
EXPECTED_PROFILE = 4
EXPECTED_SEED = 0
EXPECTED_VARIABLE_COUNT = 2_557
EXPECTED_CLAUSE_COUNT = 19_048
EXPECTED_ADDITION_COUNT = 1_232_281
EXPECTED_DELETION_COUNT = 598_140
EXPECTED_FIRST_DENSE_ID = 19_049
EXPECTED_LAST_DENSE_ID = 1_251_329
EXPECTED_COMPACT_STABLE_DIGEST = (
    "8d5b8f5adf40cda367e7e7f72f6afc58e75201011e140ff198ace1c836521dd1"
)


class CertificateError(ValueError):
    """A fixed certificate artifact or manifest invariant failed."""


# Paths are interpreted relative to the certificate directory.  The two
# compact-input paths deliberately name one fixed sibling package.
EXPECTED_ARTIFACTS: dict[str, tuple[str, int, str]] = {
    "compact_manifest": (
        "../p4-seed0-compact/p4-seed0-compact-manifest.json",
        117_899,
        "61efb4c99512ef3cff6968f1513ebb8e3c9009ad3fcc7bb013da70a5d3f37305",
    ),
    "compact_cnf": (
        "../p4-seed0-compact/p4-seed0-compact.cnf",
        383_127,
        "449cea2217bf144caafdd2dadb2ae7083d7ca34816bd226c2ab776f52ea58dae",
    ),
    "solver_stdout": (
        "cadical-plain.stdout",
        35_207,
        "2bbc04c990aa9f83bd8cd877eab2122e187e84984ce215ce74f07c12175a1c34",
    ),
    "solver_time": (
        "cadical-plain.time",
        106,
        "0a2dcd7b578b2b588e3c138dceaacea198556dbd5f72e997720af8f53fc793b5",
    ),
    "binary_drat": (
        "p4-seed0-compact-plain.drat",
        185_423_304,
        "e6d8166c9bc1a5a45cbf5a10ec69304314fdb3a13fd7770fff7cac3f010b8357",
    ),
    "verification_log": (
        "drat-trim-verify.log",
        462,
        "bf19a7241a7cf5abe920ae9303d25d03ddabef8c9ec23a18d2b8dd04e4c62ffe",
    ),
    "verification_time": (
        "drat-trim-verify.time",
        106,
        "113d48937e65867ac72d157e649521cfdc41f2495cff46dfb9eb2a9914cdee0f",
    ),
    "raw_lrat": (
        "p4-seed0-compact-plain.raw.lrat",
        508_993_098,
        "7f91da73ea8e20db05fdcb87e5458ca53f7a41f04078f0d956e3295712680aba",
    ),
    "lrat_extraction_log": (
        "drat-trim-lrat.log",
        456,
        "390420b5b1be2cb4939274ca861c96e2778510c861829ea3e21d59e5ec46d41a",
    ),
    "lrat_extraction_time": (
        "drat-trim-lrat.time",
        106,
        "c4b301bb3339145f6553e5b53ea7e22f04069b3154b59ac1ca3edd2f3e7cb7da",
    ),
    "normalized_lrat": (
        "p4-seed0-compact-plain.lrat",
        493_108_597,
        "0974cec710f1920cb89d6204f63cc9cd93e719385c3d27d4e1c0e4988f733212",
    ),
    "normalization_log": (
        "normalize-lrat.log",
        124,
        "d21471f664b46a069886d20b8d2a2fea3815676b47399c3e72dca7c015a73f2d",
    ),
    "normalization_time": (
        "normalize-lrat.time",
        106,
        "1b72b7af74b70abe9539afbcc01c8c6408414a1b4cfd75f25a63234d6dc751fc",
    ),
}

SOLVER_VERDICT = "s UNSATISFIABLE"
SOLVER_EXIT = "c exit 20"
VERIFIED_VERDICT = "s VERIFIED"
VERIFY_PURE_RUP_LINE = (
    "c 0 RAT lemmas in core; 1181014 redundant literals in core lemmas"
)
EXTRACTION_PURE_RUP_LINE = (
    "c 0 RAT lemmas in core; 0 redundant literals in core lemmas"
)
CORE_ADDITION_LINE = (
    "c 1232281 of 2415940 lemmas in core using 65185265 resolution steps"
)
NORMALIZATION_SUMMARY = (
    "kept_additions=1232281 skipped_tautologies=0 skipped_out_of_range=0 "
    "retained_deletions=598140 dense_id_range=19049..1251329"
)


def sha256_file(path: Path) -> str:
    digest = hashlib.sha256()
    with path.open("rb") as stream:
        while block := stream.read(8 * 1024 * 1024):
            digest.update(block)
    return digest.hexdigest()


def canonical_json_bytes(value: Any) -> bytes:
    return json.dumps(
        value,
        ensure_ascii=True,
        separators=(",", ":"),
        sort_keys=True,
    ).encode("utf-8")


def pretty_json_bytes(value: Any) -> bytes:
    return (
        json.dumps(value, ensure_ascii=True, indent=2, sort_keys=True) + "\n"
    ).encode("utf-8")


def resolve_certificate_relative(
    certificate_dir: Path,
    raw_path: str,
    *,
    expected_relative: str,
    label: str,
) -> Path:
    """Resolve exactly one pinned certificate-relative dependency.

    A single fixed ``..`` is needed for the sibling compact package.  Arbitrary
    traversal remains impossible because the textual path must equal its pinned
    relative name and the resolved file must stay below the generated root.
    """

    if (
        not raw_path
        or "\x00" in raw_path
        or Path(raw_path).is_absolute()
        or raw_path != expected_relative
    ):
        raise CertificateError(f"{label} path differs from its pinned relative path")
    certificate_root = certificate_dir.resolve(strict=True)
    generated_root = certificate_root.parent.resolve(strict=True)
    lexical = certificate_root / Path(raw_path)
    try:
        resolved = lexical.resolve(strict=True)
        resolved.relative_to(generated_root)
    except (OSError, ValueError) as error:
        raise CertificateError(f"{label} path escapes or does not resolve") from error
    if lexical.is_symlink() or not resolved.is_file():
        raise CertificateError(f"{label} must be a regular non-symlink file")
    return resolved


def validate_artifact(
    path: Path,
    *,
    expected_bytes: int,
    expected_sha256: str,
    label: str,
) -> None:
    if path.is_symlink() or not path.is_file():
        raise CertificateError(f"{label} must be a regular non-symlink file")
    actual_bytes = path.stat().st_size
    if actual_bytes != expected_bytes:
        raise CertificateError(
            f"{label} byte-count drift: expected {expected_bytes}, got {actual_bytes}"
        )
    actual_sha256 = sha256_file(path)
    if actual_sha256 != expected_sha256:
        raise CertificateError(
            f"{label} SHA-256 drift: expected {expected_sha256}, got {actual_sha256}"
        )


def read_lf_ascii_lines(path: Path, *, label: str) -> list[str]:
    data = path.read_bytes()
    if not data.endswith(b"\n") or b"\r" in data:
        raise CertificateError(f"{label} is not LF-terminated ASCII")
    try:
        return data.decode("ascii").splitlines()
    except UnicodeDecodeError as error:
        raise CertificateError(f"{label} is not ASCII") from error


def require_unique_exact_line(
    lines: list[str], expected: str, *, label: str
) -> None:
    if lines.count(expected) != 1:
        raise CertificateError(
            f"{label} must contain exactly one complete line {expected!r}"
        )


def _artifact_records(certificate_dir: Path) -> dict[str, dict[str, Any]]:
    records: dict[str, dict[str, Any]] = {}
    for label, (relative, byte_count, digest) in EXPECTED_ARTIFACTS.items():
        path = resolve_certificate_relative(
            certificate_dir,
            relative,
            expected_relative=relative,
            label=label,
        )
        validate_artifact(
            path,
            expected_bytes=byte_count,
            expected_sha256=digest,
            label=label,
        )
        records[label] = {
            "path": relative,
            "byte_count": byte_count,
            "sha256": digest,
        }
    return records


def _authenticate_logs(
    certificate_dir: Path, records: dict[str, dict[str, Any]]
) -> None:
    def lines(label: str) -> list[str]:
        path = resolve_certificate_relative(
            certificate_dir,
            records[label]["path"],
            expected_relative=EXPECTED_ARTIFACTS[label][0],
            label=label,
        )
        return read_lf_ascii_lines(path, label=label)

    solver = lines("solver_stdout")
    require_unique_exact_line(solver, SOLVER_VERDICT, label="solver stdout")
    require_unique_exact_line(solver, SOLVER_EXIT, label="solver stdout")

    verification = lines("verification_log")
    require_unique_exact_line(
        verification, VERIFIED_VERDICT, label="DRAT verification log"
    )
    require_unique_exact_line(
        verification, CORE_ADDITION_LINE, label="DRAT verification log"
    )
    require_unique_exact_line(
        verification, VERIFY_PURE_RUP_LINE, label="DRAT verification log"
    )

    extraction = lines("lrat_extraction_log")
    require_unique_exact_line(
        extraction, VERIFIED_VERDICT, label="LRAT extraction log"
    )
    require_unique_exact_line(
        extraction, CORE_ADDITION_LINE, label="LRAT extraction log"
    )
    require_unique_exact_line(
        extraction, EXTRACTION_PURE_RUP_LINE, label="LRAT extraction log"
    )

    normalization = lines("normalization_log")
    if normalization != [NORMALIZATION_SUMMARY]:
        raise CertificateError("normalization log summary drifted")


def stable_digest_payload(manifest: dict[str, Any]) -> dict[str, Any]:
    return {
        key: value
        for key, value in manifest.items()
        if key != "certificate_manifest_digest"
    }


def compute_stable_digest(manifest: dict[str, Any]) -> str:
    return hashlib.sha256(
        canonical_json_bytes(stable_digest_payload(manifest))
    ).hexdigest()


def build_manifest(
    certificate_dir: Path = CERTIFICATE_DIR,
) -> dict[str, Any]:
    certificate_dir = certificate_dir.resolve(strict=True)
    compact_manifest = compact.verify_generated(certificate_dir.parent / COMPACT_DIR.name)
    if (
        compact_manifest["compact_cnf"]["variable_count"]
        != EXPECTED_VARIABLE_COUNT
        or compact_manifest["compact_cnf"]["clause_count"]
        != EXPECTED_CLAUSE_COUNT
        or compact_manifest["compact_cnf"]["sha256"]
        != EXPECTED_ARTIFACTS["compact_cnf"][2]
        or compact_manifest["stable_digest"]["sha256"]
        != EXPECTED_COMPACT_STABLE_DIGEST
    ):
        raise CertificateError("authenticated compact materialization identity drifted")

    artifacts = _artifact_records(certificate_dir)
    _authenticate_logs(certificate_dir, artifacts)

    manifest: dict[str, Any] = {
        "schema": SCHEMA,
        "profile": EXPECTED_PROFILE,
        "seed": EXPECTED_SEED,
        "path_base": "directory_containing_this_certificate_manifest",
        "compact_input_authentication": {
            "method": "materialize_p4_compact_seed0.verify_generated",
            "manifest": artifacts["compact_manifest"],
            "cnf": artifacts["compact_cnf"],
            "stable_formula_digest": EXPECTED_COMPACT_STABLE_DIGEST,
            "variable_count": EXPECTED_VARIABLE_COUNT,
            "clause_count": EXPECTED_CLAUSE_COUNT,
        },
        "solver_run": {
            "solver": "CaDiCaL",
            "verdict_line": SOLVER_VERDICT,
            "exit_line": SOLVER_EXIT,
            "stdout": artifacts["solver_stdout"],
            "time_log": artifacts["solver_time"],
            "binary_drat": artifacts["binary_drat"],
        },
        "external_drat_verification": {
            "checker": "drat-trim",
            "verdict_line": VERIFIED_VERDICT,
            "pure_rup_line": VERIFY_PURE_RUP_LINE,
            "core_addition_line": CORE_ADDITION_LINE,
            "log": artifacts["verification_log"],
            "time_log": artifacts["verification_time"],
        },
        "lrat_extraction": {
            "checker": "drat-trim -L",
            "verdict_line": VERIFIED_VERDICT,
            "pure_rup_line": EXTRACTION_PURE_RUP_LINE,
            "core_addition_line": CORE_ADDITION_LINE,
            "raw_lrat": artifacts["raw_lrat"],
            "log": artifacts["lrat_extraction_log"],
            "time_log": artifacts["lrat_extraction_time"],
        },
        "normalization": {
            "summary_line": NORMALIZATION_SUMMARY,
            "normalized_dense_lrat": artifacts["normalized_lrat"],
            "log": artifacts["normalization_log"],
            "time_log": artifacts["normalization_time"],
            "addition_count": EXPECTED_ADDITION_COUNT,
            "deletion_action_count": EXPECTED_DELETION_COUNT,
            "first_dense_addition_id": EXPECTED_FIRST_DENSE_ID,
            "last_dense_addition_id": EXPECTED_LAST_DENSE_ID,
            "skipped_tautologies": 0,
            "skipped_out_of_range": 0,
        },
        "epistemic_status": {
            "classification": (
                "EXTERNALLY VERIFIED PURE-RUP NORMALIZED CERTIFICATE"
            ),
            "establishes": [
                "the pinned compact P4 seed-0 CNF is externally UNSAT",
                "drat-trim verified the pinned binary DRAT proof",
                "the extracted core contains zero RAT lemmas",
                "the pinned normalized LRAT has the recorded dense append shape",
            ],
            "does_not_establish": [
                "Lean replay of the normalized certificate",
                "source satisfaction of the compact CNF clauses",
                "closure of a production Problem 97 theorem",
            ],
        },
    }
    manifest["certificate_manifest_digest"] = {
        "algorithm": "sha256(canonical-json(manifest-without-this-field))",
        "sha256": compute_stable_digest(manifest),
    }
    return manifest


def _atomic_write(path: Path, data: bytes) -> None:
    path.parent.mkdir(parents=True, exist_ok=True)
    descriptor, raw_stage = tempfile.mkstemp(
        prefix=f".{path.name}.", suffix=".tmp", dir=path.parent
    )
    stage = Path(raw_stage)
    try:
        with os.fdopen(descriptor, "wb") as stream:
            stream.write(data)
            stream.flush()
            os.fsync(stream.fileno())
        os.replace(stage, path)
    finally:
        if stage.exists():
            stage.unlink()


def materialize(
    output_path: Path = MANIFEST_PATH,
    *,
    certificate_dir: Path = CERTIFICATE_DIR,
) -> dict[str, Any]:
    manifest = build_manifest(certificate_dir)
    _atomic_write(output_path, pretty_json_bytes(manifest))
    verify_manifest(output_path, certificate_dir=certificate_dir)
    return manifest


def verify_manifest(
    manifest_path: Path = MANIFEST_PATH,
    *,
    certificate_dir: Path = CERTIFICATE_DIR,
) -> dict[str, Any]:
    try:
        manifest = json.loads(manifest_path.read_text(encoding="utf-8"))
    except (OSError, UnicodeDecodeError, json.JSONDecodeError) as error:
        raise CertificateError("certificate manifest is unreadable") from error
    if not isinstance(manifest, dict):
        raise CertificateError("certificate manifest must be a JSON object")
    expected = build_manifest(certificate_dir)
    if manifest != expected:
        raise CertificateError("certificate manifest content drifted")
    if manifest["certificate_manifest_digest"]["sha256"] != compute_stable_digest(
        manifest
    ):
        raise CertificateError("certificate manifest digest drifted")
    return manifest


def main() -> int:
    parser = argparse.ArgumentParser(description=__doc__)
    parser.add_argument(
        "--verify-only",
        action="store_true",
        help="verify the fixed package and emitted manifest without rewriting it",
    )
    args = parser.parse_args()
    manifest = (
        verify_manifest()
        if args.verify_only
        else materialize()
    )
    print(
        json.dumps(
            {
                "addition_count": manifest["normalization"]["addition_count"],
                "certificate_manifest_digest": manifest[
                    "certificate_manifest_digest"
                ]["sha256"],
                "manifest": str(MANIFEST_PATH),
                "normalized_lrat_sha256": manifest["normalization"][
                    "normalized_dense_lrat"
                ]["sha256"],
                "status": manifest["epistemic_status"]["classification"],
            },
            indent=2,
            sort_keys=True,
        )
    )
    return 0


if __name__ == "__main__":
    raise SystemExit(main())
