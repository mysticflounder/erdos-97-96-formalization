# Copyright (c) 2026 Adam McKenna. All rights reserved.
# Released under Apache 2.0 license as described in the file LICENSE.
# Author: Adam McKenna <adam@mysticflounder.ai>

"""Generate and check the central publication-bank manifest pilot.

The pilot records the publication-reachable
``CardElevenUniqueFourCertificate`` bank.  Its large source and replay rosters
remain in the checked promotion manifest; this file records canonical digests
of those rosters, the narrow coordinator spine, and live theorem axiom
closures.
"""

from __future__ import annotations

import argparse
import hashlib
import json
import os
import re
import sqlite3
import subprocess
import tempfile
import tomllib
from dataclasses import dataclass
from pathlib import Path
from typing import Any

if __package__:
    from scripts import promote_card_eleven_unique_four_certificate as promotion
else:  # pragma: no cover - exercised by the command-line entrypoint
    import promote_card_eleven_unique_four_certificate as promotion


REPO_ROOT = Path(__file__).resolve().parents[1]
TOP_SCHEMA = "publication-bank-manifests/v1"
TARGET_SYMBOL = "Problem97.erdos97_rhs"
BANK_ID = "card-eleven-unique-four-certificate"
GENERATOR_PATH = Path("scripts/promote_card_eleven_unique_four_certificate.py")
PROMOTION_MANIFEST_PATH = Path(
    "lean/Erdos9796Proof/P97/ATail/CardElevenUniqueFourCertificate/"
    "promotion-manifest.json"
)
PACKAGE_ROOT = PROMOTION_MANIFEST_PATH.parent

COORDINATOR_THEOREM = (
    "Problem97.ATailUniqueFourCardElevenCertificateScratch."
    "false_of_cardElevenOriginalUniqueFourResidual"
)
INGRESS_THEOREM = (
    "Problem97.ATailCardElevenUniqueFourCertificate."
    "false_of_firstApexUniqueRadiusExactFourResidual"
)
COORDINATOR_PATH = PACKAGE_ROOT / "Coordinator.lean"
INGRESS_PATH = Path(
    "lean/Erdos9796Proof/P97/ATail/CardElevenUniqueFourCertificateIngress.lean"
)
AGGREGATE_CERTIFICATE_THEOREMS = (
    "Problem97.P4CompactAtomBindingScratch.exact_binding_data",
    (
        "Problem97.P4DirectOuterArcAdapterScratch."
        "directRowArcFiniteData_batch_valid"
    ),
    "CompactWindowedRupReplay.startUnsatisfiable",
    "WindowedRupReplay.startUnsatisfiable",
)
PUBLIC_PROJECTION_THEOREMS = (COORDINATOR_THEOREM, INGRESS_THEOREM)
AXIOM_SYMBOLS = (
    *AGGREGATE_CERTIFICATE_THEOREMS,
    COORDINATOR_THEOREM,
    INGRESS_THEOREM,
)
ALLOWED_AXIOMS = frozenset(
    {
        "propext",
        "Classical.choice",
        "Lean.ofReduceBool",
        "Lean.trustCompiler",
        "Quot.sound",
    }
)

EXPECTED_PROMOTED_FILES = 2_061
EXPECTED_REPLAY_ASSETS = 1_656
EXPECTED_COORDINATOR_ACTIVE_FILES = 2_057
EXPECTED_COORDINATOR_INACTIVE_FILES = 4
EXPECTED_EXCLUDED_FILES = 756
EXPECTED_EXCLUDED_DIRECTORIES = 12
EXPECTED_EXCLUDED_SCOPES = (
    (PACKAGE_ROOT / "Generated/ExactFiveCommonShellV7G3Replay", "directory"),
    (PACKAGE_ROOT / "Support/ExactFiveCommonShellV7", "directory"),
    (PACKAGE_ROOT / "Support/ExactFiveCommonShellAdapter.lean", "file"),
)

_SHA256_RE = re.compile(r"^[0-9a-f]{64}$")
_GIT_SHA_RE = re.compile(r"^[0-9a-f]{40}$")
_REFS_CURRENT_BUILD_RE = re.compile(
    r"^current build: (?P<fingerprint>[0-9a-f]{12,64})$"
)
_AXIOM_HEADER_RE = re.compile(
    r"^axioms reported by `#print axioms (?P<symbol>[^`]+)` \((?P<count>\d+)\):$"
)
_AXIOM_ROW_RE = re.compile(r"^\s+(?P<class>core\*?)\s+(?P<axiom>\S+)\s*$")
_NATIVE_FOOTNOTE_RE = re.compile(
    r"^\* native-reduction trust \((?P<count>\d+)\): the Lean compiler, "
    r"interpreter, and all @\[implemented_by\]/@\[extern\] annotations are in "
    r"the trusted base \(native_decide, Lean\.reduceBool\)\. Core-allowed; no "
    r"\[axioms\]\.approved entry needed\.$"
)


class ManifestAuditError(RuntimeError):
    """A publication-bank manifest invariant failed."""


@dataclass(frozen=True)
class PromotionEvidence:
    """Normalized evidence extracted from the checked promotion manifest."""

    generator_version: dict[str, object]
    input_sha256: str
    generated_source_sha256: str
    lean_records: tuple[dict[str, str], ...]
    replay_asset_count: int
    excluded_scopes: tuple[dict[str, object], ...]
    excluded_file_count: int
    excluded_directory_count: int
    support_amendments: tuple[dict[str, object], ...]


def canonical_json_bytes(value: object) -> bytes:
    """Return the one accepted JSON encoding for manifests and sub-digests."""

    return (
        json.dumps(value, indent=2, sort_keys=True, ensure_ascii=False) + "\n"
    ).encode("utf-8")


def canonical_sha256(value: object) -> str:
    return hashlib.sha256(canonical_json_bytes(value)).hexdigest()


def manifest_self_hash(manifest: dict[str, object]) -> str:
    payload = dict(manifest)
    payload.pop("manifest_sha256", None)
    return canonical_sha256(payload)


def _require_sha256(value: object, label: str) -> str:
    if not isinstance(value, str) or not _SHA256_RE.fullmatch(value):
        raise ManifestAuditError(f"{label} is not a lowercase SHA-256 digest")
    return value


def _require_git_sha(value: object, label: str) -> str:
    if not isinstance(value, str) or not _GIT_SHA_RE.fullmatch(value):
        raise ManifestAuditError(f"{label} is not a full lowercase Git SHA")
    return value


def _require_commitish(value: object, label: str) -> str:
    return _require_git_sha(value, label)


def _require_relative_path(value: object, label: str) -> str:
    if not isinstance(value, str):
        raise ManifestAuditError(f"{label} must be a string")
    path = Path(value)
    if path.is_absolute() or not path.parts or ".." in path.parts:
        raise ManifestAuditError(f"{label} is not a repository-relative path")
    return path.as_posix()


def _strict_object_pairs(pairs: list[tuple[str, Any]]) -> dict[str, Any]:
    result: dict[str, Any] = {}
    for key, value in pairs:
        if key in result:
            raise ManifestAuditError(f"duplicate JSON key: {key}")
        result[key] = value
    return result


def _strict_json_bytes(data: bytes, label: str) -> dict[str, Any]:
    try:
        value = json.loads(
            data.decode("utf-8"), object_pairs_hook=_strict_object_pairs
        )
    except (UnicodeDecodeError, json.JSONDecodeError) as exc:
        raise ManifestAuditError(f"invalid {label} JSON: {exc}") from exc
    if not isinstance(value, dict):
        raise ManifestAuditError(f"{label} root must be an object")
    return value


def _repo_file(repo_root: Path, relative: Path, label: str) -> Path:
    root = repo_root.resolve(strict=True)
    candidate = (root / relative).resolve(strict=True)
    try:
        candidate.relative_to(root)
    except ValueError as exc:
        raise ManifestAuditError(f"{label} escapes the repository") from exc
    if not candidate.is_file():
        raise ManifestAuditError(f"{label} is not a regular file")
    return candidate


def _file_record(repo_root: Path, relative: Path) -> dict[str, object]:
    path = _repo_file(repo_root, relative, relative.as_posix())
    data = path.read_bytes()
    return {
        "path": relative.as_posix(),
        "bytes": len(data),
        "sha256": hashlib.sha256(data).hexdigest(),
    }


def _subprocess(
    args: list[str], repo_root: Path, *, label: str
) -> subprocess.CompletedProcess[str]:
    completed = subprocess.run(
        args,
        cwd=repo_root,
        capture_output=True,
        text=True,
        check=False,
    )
    if completed.returncode != 0:
        detail = completed.stderr.strip() or completed.stdout.strip()
        raise ManifestAuditError(f"{label} failed ({completed.returncode}): {detail}")
    return completed


def _git_head(repo_root: Path) -> str:
    completed = _subprocess(
        ["git", "rev-parse", "--verify", "HEAD"], repo_root, label="git rev-parse"
    )
    return _require_git_sha(completed.stdout.strip(), "current HEAD")


def _git_is_ancestor(repo_root: Path, ancestor: str, descendant: str) -> bool:
    completed = subprocess.run(
        ["git", "merge-base", "--is-ancestor", ancestor, descendant],
        cwd=repo_root,
        capture_output=True,
        text=True,
        check=False,
    )
    if completed.returncode == 0:
        return True
    if completed.returncode == 1:
        return False
    detail = completed.stderr.strip() or completed.stdout.strip()
    raise ManifestAuditError(
        f"git merge-base --is-ancestor failed ({completed.returncode}): {detail}"
    )


def _resolve_verified_head(repo_root: Path, verified_head: str | None) -> str:
    """Resolve a full verified head before any expensive manifest work."""

    if verified_head is None:
        return _git_head(repo_root)
    head = _require_git_sha(verified_head, "verified head")
    current_head = _git_head(repo_root)
    if not _git_is_ancestor(repo_root, head, current_head):
        raise ManifestAuditError(
            f"requested verified head {head} is not an ancestor of {current_head}"
        )
    return head


def _normalize_excluded_scopes(
    repo_root: Path, roots: object
) -> tuple[tuple[Path, str], ...]:
    if not isinstance(roots, (tuple, list, set, frozenset)) or not roots:
        raise ManifestAuditError("promotion has no manifest-scope excluded roots")
    normalized: list[tuple[Path, str]] = []
    for index, raw_root in enumerate(roots):
        raw_text = raw_root.as_posix() if isinstance(raw_root, Path) else raw_root
        relative = Path(_require_relative_path(raw_text, f"excluded roots[{index}]"))
        full = (repo_root.resolve(strict=True) / relative).resolve(strict=True)
        try:
            full.relative_to(repo_root.resolve(strict=True))
        except ValueError as exc:
            raise ManifestAuditError(f"excluded roots[{index}] escapes the repository") from exc
        if full.is_dir():
            kind = "directory"
        elif full.is_file():
            kind = "file"
        else:
            raise ManifestAuditError(f"excluded roots[{index}] is not a file or directory")
        normalized.append((relative, kind))
    if len(set(normalized)) != len(normalized):
        raise ManifestAuditError("duplicate manifest-scope excluded root")
    return tuple(sorted(normalized, key=lambda item: item[0].as_posix()))


def _normalize_promotion_manifest(
    manifest: dict[str, Any],
    support_amendments: tuple[dict[str, object], ...] = (),
) -> tuple[str, str, tuple[dict[str, str], ...], int]:
    """Return input digest, generated digest, Lean records, and asset count."""

    schema = manifest.get("schema")
    if schema != "card-eleven-unique-four-source-promotion-v2":
        raise ManifestAuditError("unsupported CardEleven promotion schema")

    source_log = manifest.get("source_log")
    if not isinstance(source_log, dict):
        raise ManifestAuditError("promotion source_log must be an object")
    normalized_source_log = {
        "path": _require_relative_path(source_log.get("path"), "source_log.path"),
        "sha256": _require_sha256(source_log.get("sha256"), "source_log.sha256"),
    }

    raw_files = manifest.get("files")
    if not isinstance(raw_files, list) or len(raw_files) != EXPECTED_PROMOTED_FILES:
        raise ManifestAuditError(
            f"promotion manifest must record {EXPECTED_PROMOTED_FILES} Lean files"
        )
    lean_sources: list[dict[str, str]] = []
    promoted: list[dict[str, str]] = []
    source_paths: set[str] = set()
    destinations: set[str] = set()
    modules: set[str] = set()
    for index, record in enumerate(raw_files):
        label = f"files[{index}]"
        if not isinstance(record, dict):
            raise ManifestAuditError(f"{label} must be an object")
        source = _require_relative_path(record.get("source"), f"{label}.source")
        destination = _require_relative_path(
            record.get("destination"), f"{label}.destination"
        )
        module = record.get("module")
        if not isinstance(module, str) or not module:
            raise ManifestAuditError(f"{label}.module must be a nonempty string")
        source_sha = _require_sha256(
            record.get("source_sha256"), f"{label}.source_sha256"
        )
        promoted_sha = _require_sha256(
            record.get("promoted_sha256"), f"{label}.promoted_sha256"
        )
        if source in source_paths or destination in destinations or module in modules:
            raise ManifestAuditError(f"duplicate source, destination, or module at {label}")
        source_paths.add(source)
        destinations.add(destination)
        modules.add(module)
        lean_sources.append({"source": source, "sha256": source_sha})
        promoted.append(
            {
                "destination": destination,
                "promoted_sha256": promoted_sha,
                "module": module,
            }
        )

    replay = manifest.get("replay_asset_promotion")
    if not isinstance(replay, dict):
        raise ManifestAuditError("promotion replay_asset_promotion must be an object")
    raw_assets = replay.get("files")
    if not isinstance(raw_assets, list) or len(raw_assets) != EXPECTED_REPLAY_ASSETS:
        raise ManifestAuditError(
            f"promotion manifest must record {EXPECTED_REPLAY_ASSETS} replay assets"
        )
    assets: list[dict[str, object]] = []
    asset_sources: set[str] = set()
    asset_destinations: set[str] = set()
    for index, record in enumerate(raw_assets):
        label = f"replay_asset_promotion.files[{index}]"
        if not isinstance(record, dict):
            raise ManifestAuditError(f"{label} must be an object")
        source = _require_relative_path(record.get("source"), f"{label}.source")
        destination = _require_relative_path(
            record.get("destination"), f"{label}.destination"
        )
        digest = _require_sha256(record.get("sha256"), f"{label}.sha256")
        byte_count = record.get("byte_count")
        if type(byte_count) is not int or byte_count < 0:
            raise ManifestAuditError(f"{label}.byte_count must be nonnegative")
        if source in asset_sources or destination in asset_destinations:
            raise ManifestAuditError(f"duplicate replay asset at {label}")
        asset_sources.add(source)
        asset_destinations.add(destination)
        assets.append({"source": source, "sha256": digest, "bytes": byte_count})

    lean_sources.sort(key=lambda record: record["source"])
    promoted.sort(key=lambda record: record["destination"])
    assets.sort(key=lambda record: str(record["source"]))
    source_provenance = {
        "source_log": normalized_source_log,
        "lean_sources": lean_sources,
        "replay_assets": assets,
        "support_amendments": list(support_amendments),
    }
    return (
        canonical_sha256(source_provenance),
        canonical_sha256(promoted),
        tuple(promoted),
        len(assets),
    )


def _live_promoted_records(
    repo_root: Path,
    historical_records: tuple[dict[str, str], ...],
    support_amendments: tuple[dict[str, object], ...],
) -> tuple[dict[str, str], ...]:
    amendments = {
        str(record["destination"]): record for record in support_amendments
    }
    records: list[dict[str, str]] = []
    for historical in historical_records:
        destination = historical["destination"]
        live = _file_record(repo_root, Path(destination))
        live_sha = str(live["sha256"])
        amendment = amendments.pop(destination, None)
        if amendment is None:
            if live_sha != historical["promoted_sha256"]:
                raise ManifestAuditError(
                    f"unrecorded live promoted-source drift: {destination}"
                )
        elif (
            amendment["manifest_sha256"] != historical["promoted_sha256"]
            or amendment["current_sha256"] != live_sha
        ):
            raise ManifestAuditError(f"support amendment digest drift: {destination}")
        records.append(
            {
                "destination": destination,
                "promoted_sha256": live_sha,
                "module": historical["module"],
            }
        )
    if amendments:
        raise ManifestAuditError(
            f"support amendments name unknown destinations: {sorted(amendments)}"
        )
    return tuple(records)


def _normalize_support_amendments(
    raw_amendments: object,
) -> tuple[dict[str, object], ...]:
    if not isinstance(raw_amendments, list) or len(raw_amendments) != 4:
        raise ManifestAuditError("promotion verifier must report four support amendments")
    expected_keys = {
        "destination",
        "manifest_sha256",
        "current_sha256",
        "source_commit",
        "current_import_count",
        "current_internal_import_count",
        "external_import_deltas",
        "reason",
    }
    normalized: list[dict[str, object]] = []
    destinations: set[str] = set()
    for index, raw in enumerate(raw_amendments):
        label = f"support_amendments[{index}]"
        if not isinstance(raw, dict) or set(raw) != expected_keys:
            raise ManifestAuditError(f"{label} has the wrong fields")
        destination = _require_relative_path(
            raw.get("destination"), f"{label}.destination"
        )
        if destination in destinations:
            raise ManifestAuditError(f"duplicate support amendment: {destination}")
        destinations.add(destination)
        current_import_count = raw.get("current_import_count")
        current_internal_count = raw.get("current_internal_import_count")
        if (
            type(current_import_count) is not int
            or current_import_count < 0
            or type(current_internal_count) is not int
            or current_internal_count < 0
            or current_internal_count > current_import_count
        ):
            raise ManifestAuditError(f"{label} has invalid import counts")
        raw_deltas = raw.get("external_import_deltas")
        if not isinstance(raw_deltas, dict) or any(
            not isinstance(module, str) or type(delta) is not int
            for module, delta in raw_deltas.items()
        ):
            raise ManifestAuditError(f"{label}.external_import_deltas is invalid")
        reason = raw.get("reason")
        if not isinstance(reason, str) or not reason.strip():
            raise ManifestAuditError(f"{label}.reason is empty")
        normalized.append(
            {
                "destination": destination,
                "manifest_sha256": _require_sha256(
                    raw.get("manifest_sha256"), f"{label}.manifest_sha256"
                ),
                "current_sha256": _require_sha256(
                    raw.get("current_sha256"), f"{label}.current_sha256"
                ),
                "source_commit": _require_commitish(
                    raw.get("source_commit"), f"{label}.source_commit"
                ),
                "current_import_count": current_import_count,
                "current_internal_import_count": current_internal_count,
                "external_import_deltas": dict(sorted(raw_deltas.items())),
                "reason": reason,
            }
        )
    return tuple(sorted(normalized, key=lambda record: str(record["destination"])))


def _promotion_evidence(repo_root: Path, verified_head: str) -> PromotionEvidence:
    roots = getattr(promotion, "MANIFEST_SCOPE_EXCLUDED_ROOTS", None)
    if roots is None:
        raise ManifestAuditError("promotion module lacks MANIFEST_SCOPE_EXCLUDED_ROOTS")
    support_amendments = getattr(
        promotion, "MANIFEST_SCOPE_SUPPORT_AMENDMENTS", None
    )
    if support_amendments is None:
        raise ManifestAuditError("promotion module lacks support-amendment bindings")
    summary = promotion.check_installed_promotion(
        allowed_extra_roots=roots,
        support_amendments=support_amendments,
    )
    if not isinstance(summary, dict):
        raise ManifestAuditError("promotion verifier returned no summary object")
    if summary.get("promoted") != EXPECTED_PROMOTED_FILES:
        raise ManifestAuditError("promotion verifier promoted count drifted")
    if summary.get("assets") != EXPECTED_REPLAY_ASSETS:
        raise ManifestAuditError("promotion verifier replay asset count drifted")

    normalized_scopes = _normalize_excluded_scopes(repo_root, roots)
    expected_scopes = tuple(
        sorted(
            EXPECTED_EXCLUDED_SCOPES,
            key=lambda item: item[0].as_posix(),
        )
    )
    if normalized_scopes != expected_scopes:
        raise ManifestAuditError("promotion manifest-scope exclusions drifted")
    raw_summary_roots = summary.get("allowed_extra_roots")
    if not isinstance(raw_summary_roots, list):
        raise ManifestAuditError("promotion verifier excluded-root summary is absent")
    summary_roots = tuple(
        sorted(
            [
                Path(_require_relative_path(value, "summary excluded root"))
                for value in raw_summary_roots
            ],
            key=lambda path: path.as_posix(),
        )
    )
    if summary_roots != tuple(path for path, _kind in normalized_scopes):
        raise ManifestAuditError("promotion verifier excluded-root summary drifted")
    excluded_count = summary.get("excluded_extra_files")
    if type(excluded_count) is not int or excluded_count != EXPECTED_EXCLUDED_FILES:
        raise ManifestAuditError("promotion verifier excluded-file count drifted")
    excluded_directory_count = summary.get("excluded_extra_directories")
    if (
        type(excluded_directory_count) is not int
        or excluded_directory_count != EXPECTED_EXCLUDED_DIRECTORIES
    ):
        raise ManifestAuditError("promotion verifier excluded-directory count drifted")
    normalized_amendments = _normalize_support_amendments(
        summary.get("support_amendments")
    )
    current_head = _git_head(repo_root)
    for amendment in normalized_amendments:
        source_commit = str(amendment["source_commit"])
        if not _git_is_ancestor(repo_root, source_commit, verified_head):
            raise ManifestAuditError(
                f"support amendment {source_commit} is newer than verified head"
            )
        if not _git_is_ancestor(repo_root, source_commit, current_head):
            raise ManifestAuditError(
                f"support amendment {source_commit} is absent from current HEAD"
            )

    manifest_path = _repo_file(
        repo_root, PROMOTION_MANIFEST_PATH, "promotion manifest"
    )
    manifest_data = manifest_path.read_bytes()
    manifest = _strict_json_bytes(manifest_data, "promotion manifest")
    input_sha, _historical_generated_sha, historical_records, asset_count = (
        _normalize_promotion_manifest(manifest, normalized_amendments)
    )
    lean_records = _live_promoted_records(
        repo_root, historical_records, normalized_amendments
    )
    generated_sha = canonical_sha256(list(lean_records))
    manifest_record = _file_record(repo_root, PROMOTION_MANIFEST_PATH)
    script_record = _file_record(repo_root, GENERATOR_PATH)
    excluded_records = tuple(
        {
            "path": path.as_posix(),
            "kind": kind,
            "absent_from_publish_spine": True,
        }
        for path, kind in normalized_scopes
    )
    return PromotionEvidence(
        generator_version={
            "script": script_record,
            "promotion_schema": manifest["schema"],
            "promotion_manifest": manifest_record,
            "support_amendments": list(normalized_amendments),
        },
        input_sha256=input_sha,
        generated_source_sha256=generated_sha,
        lean_records=lean_records,
        replay_asset_count=asset_count,
        excluded_scopes=excluded_records,
        excluded_file_count=excluded_count,
        excluded_directory_count=excluded_directory_count,
        support_amendments=normalized_amendments,
    )


def _spine_paths(repo_root: Path, symbol: str | None = None) -> frozenset[str]:
    args = ["proof-blueprint", "spine", "--files"]
    if symbol is not None:
        args.append(symbol)
    completed = _subprocess(args, repo_root, label="proof-blueprint spine --files")
    root = repo_root.resolve(strict=True)
    paths: set[str] = set()
    for index, line in enumerate(completed.stdout.splitlines()):
        if not line.strip():
            raise ManifestAuditError(f"blank proof-blueprint spine line {index + 1}")
        raw_path = Path(line)
        if not raw_path.is_absolute():
            raise ManifestAuditError("proof-blueprint spine emitted a relative path")
        resolved = raw_path.resolve(strict=True)
        try:
            relative = resolved.relative_to(root)
        except ValueError as exc:
            raise ManifestAuditError(
                "proof-blueprint spine emitted a path outside the repository"
            ) from exc
        if relative.suffix != ".lean" or not resolved.is_file():
            raise ManifestAuditError("proof-blueprint spine emitted a non-Lean file")
        relative_text = relative.as_posix()
        if relative_text in paths:
            raise ManifestAuditError("proof-blueprint spine emitted a duplicate path")
        paths.add(relative_text)
    if not paths:
        raise ManifestAuditError("proof-blueprint spine emitted no source files")
    return frozenset(paths)


def _parse_refs_current_build(output: str) -> str:
    lines = output.splitlines()
    if not lines:
        raise ManifestAuditError("proof-blueprint refs --check emitted no output")
    match = _REFS_CURRENT_BUILD_RE.fullmatch(lines[0])
    if match is None or any(
        line.startswith("current build:") for line in lines[1:]
    ):
        raise ManifestAuditError(
            "unrecognized proof-blueprint refs --check current-build grammar"
        )
    return match.group("fingerprint")


def _refs_current_build(repo_root: Path) -> str:
    completed = subprocess.run(
        ["proof-blueprint", "refs", "--check"],
        cwd=repo_root,
        capture_output=True,
        text=True,
        check=False,
    )
    if completed.returncode not in {0, 1}:
        detail = completed.stderr.strip() or completed.stdout.strip()
        raise ManifestAuditError(
            "proof-blueprint refs --check failed "
            f"({completed.returncode}): {detail}"
        )
    if completed.stderr:
        raise ManifestAuditError(
            "proof-blueprint refs --check emitted unexpected stderr"
        )
    return _parse_refs_current_build(completed.stdout)


def _blueprint_paths(repo_root: Path) -> tuple[Path, Path]:
    try:
        root = repo_root.resolve(strict=True)
        config_path = _repo_file(root, Path(".blueprint.toml"), ".blueprint.toml")
        with config_path.open("rb") as stream:
            config = tomllib.load(stream)
    except (OSError, RuntimeError, tomllib.TOMLDecodeError) as exc:
        raise ManifestAuditError(f"invalid .blueprint.toml: {exc}") from exc
    paths = config.get("paths")
    if not isinstance(paths, dict):
        raise ManifestAuditError(".blueprint.toml lacks a [paths] table")
    db_relative = Path(
        _require_relative_path(paths.get("db"), ".blueprint.toml paths.db")
    )
    lean_lib_relative = Path(
        _require_relative_path(
            paths.get("lean_lib"), ".blueprint.toml paths.lean_lib"
        )
    )

    try:
        db_path = (root / db_relative).resolve(strict=True)
        lean_lib_path = (root / lean_lib_relative).resolve(strict=True)
        db_path.relative_to(root)
        lean_lib_path.relative_to(root)
    except (OSError, RuntimeError, ValueError) as exc:
        raise ManifestAuditError(f"invalid proof-blueprint path: {exc}") from exc
    if not db_path.is_file():
        raise ManifestAuditError("proof-blueprint paths.db is not a regular file")
    if not lean_lib_path.is_dir():
        raise ManifestAuditError("proof-blueprint paths.lean_lib is not a directory")
    return db_path, lean_lib_relative


def _coordinator_modules(
    coordinator_spine: frozenset[str], lean_lib: Path
) -> tuple[str, ...]:
    modules: set[str] = set()
    for path_text in sorted(coordinator_spine):
        path = Path(path_text)
        try:
            module_path = path.relative_to(lean_lib)
        except ValueError as exc:
            raise ManifestAuditError(
                f"coordinator source is outside paths.lean_lib: {path_text}"
            ) from exc
        if module_path.suffix != ".lean":
            raise ManifestAuditError(
                f"coordinator source is not a Lean module: {path_text}"
            )
        module = module_path.with_suffix("").as_posix().replace("/", ".")
        if not module or module in modules:
            raise ManifestAuditError(
                f"coordinator source has an invalid module mapping: {path_text}"
            )
        modules.add(module)
    if not modules:
        raise ManifestAuditError("coordinator spine has no Lean modules")
    return tuple(sorted(modules))


def _reference_freshness(
    repo_root: Path, coordinator_spine: frozenset[str]
) -> dict[str, object]:
    build_prefix = _refs_current_build(repo_root)
    db_path, lean_lib = _blueprint_paths(repo_root)
    modules = _coordinator_modules(coordinator_spine, lean_lib)
    connection: sqlite3.Connection | None = None
    fingerprints: set[str] = set()
    missing: list[str] = []
    try:
        connection = sqlite3.connect(f"{db_path.as_uri()}?mode=ro", uri=True)
        for module in modules:
            rows = connection.execute(
                "SELECT module_name, global_fp FROM module_mined "
                "WHERE module_name = ?",
                (module,),
            ).fetchall()
            if not rows:
                missing.append(module)
                continue
            if len(rows) != 1:
                raise ManifestAuditError(
                    f"proof-blueprint has duplicate mined rows for {module}"
                )
            stored_module, raw_fingerprint = rows[0]
            if stored_module != module:
                raise ManifestAuditError(
                    f"proof-blueprint returned the wrong mined row for {module}"
                )
            fingerprints.add(
                _require_sha256(
                    raw_fingerprint,
                    f"proof-blueprint global_fp for {module}",
                )
            )
    except sqlite3.Error as exc:
        raise ManifestAuditError(f"invalid proof-blueprint database: {exc}") from exc
    finally:
        if connection is not None:
            connection.close()

    if missing:
        raise ManifestAuditError(
            f"proof-blueprint is missing {len(missing)} coordinator module row(s)"
        )
    if len(fingerprints) != 1:
        raise ManifestAuditError(
            "coordinator modules have mixed proof-blueprint build fingerprints"
        )
    fingerprint = next(iter(fingerprints))
    if not fingerprint.startswith(build_prefix):
        raise ManifestAuditError(
            "coordinator modules were mined against an older proof-blueprint build"
        )
    return {
        "proof_blueprint_build_fingerprint": fingerprint,
        "coordinator_reference_module_count": len(modules),
        "coordinator_reference_stale_count": 0,
        "coordinator_reference_missing_count": 0,
    }


def _source_records(repo_root: Path, paths: frozenset[str]) -> list[dict[str, object]]:
    return [
        _file_record(repo_root, Path(path))
        for path in sorted(paths)
    ]


def _parse_axioms(symbol: str, output: str) -> tuple[str, ...]:
    lowered = output.lower()
    if "sorryax" in lowered or "unknown" in lowered:
        raise ManifestAuditError(f"rejected axiom output for {symbol}")
    lines = output.splitlines()
    if not lines:
        raise ManifestAuditError(f"empty axiom output for {symbol}")
    header = _AXIOM_HEADER_RE.fullmatch(lines[0])
    if header is None or header.group("symbol") != symbol:
        raise ManifestAuditError(f"unrecognized axiom header for {symbol}")
    expected_count = int(header.group("count"))
    index = 1
    axioms: list[str] = []
    native_count = 0
    while index < len(lines) and lines[index].strip():
        row = _AXIOM_ROW_RE.fullmatch(lines[index])
        if row is None:
            raise ManifestAuditError(f"unrecognized axiom row for {symbol}")
        axiom = row.group("axiom")
        if axiom not in ALLOWED_AXIOMS:
            raise ManifestAuditError(f"unapproved axiom {axiom} for {symbol}")
        if axiom in axioms:
            raise ManifestAuditError(f"duplicate axiom {axiom} for {symbol}")
        if row.group("class") == "core*":
            native_count += 1
        axioms.append(axiom)
        index += 1
    if len(axioms) != expected_count:
        raise ManifestAuditError(f"axiom count mismatch for {symbol}")
    while index < len(lines) and not lines[index].strip():
        index += 1
    remainder = " ".join(line.strip() for line in lines[index:])
    if native_count:
        footnote = _NATIVE_FOOTNOTE_RE.fullmatch(remainder)
        if footnote is None or int(footnote.group("count")) != native_count:
            raise ManifestAuditError(f"unrecognized native-trust footer for {symbol}")
    elif remainder:
        raise ManifestAuditError(f"unexpected axiom footer for {symbol}")
    return tuple(sorted(axioms))


def _axiom_audit(repo_root: Path) -> tuple[list[dict[str, object]], list[str]]:
    closures: list[dict[str, object]] = []
    union: set[str] = set()
    for symbol in AXIOM_SYMBOLS:
        completed = _subprocess(
            ["proof-blueprint", "axioms", symbol],
            repo_root,
            label=f"proof-blueprint axioms {symbol}",
        )
        axioms = list(_parse_axioms(symbol, completed.stdout))
        closures.append({"symbol": symbol, "axioms": axioms})
        union.update(axioms)
    return closures, sorted(union)


def _bank_record(
    repo_root: Path, evidence: PromotionEvidence, verified_head: str
) -> dict[str, object]:
    manifest_records = {record["destination"]: record for record in evidence.lean_records}
    manifest_paths = frozenset(manifest_records)
    if len(manifest_paths) != EXPECTED_PROMOTED_FILES:
        raise ManifestAuditError("normalized promoted roster cardinality drifted")

    publish_spine = _spine_paths(repo_root)
    coordinator_spine = _spine_paths(repo_root, COORDINATOR_THEOREM)
    active_manifest_paths = manifest_paths & coordinator_spine
    inactive_manifest_paths = manifest_paths - coordinator_spine
    if len(active_manifest_paths) != EXPECTED_COORDINATOR_ACTIVE_FILES:
        raise ManifestAuditError("coordinator-active promotion roster drifted")
    if len(inactive_manifest_paths) != EXPECTED_COORDINATOR_INACTIVE_FILES:
        raise ManifestAuditError("coordinator-inactive promotion roster drifted")
    amendment_paths = {
        str(record["destination"]) for record in evidence.support_amendments
    }
    if not amendment_paths <= active_manifest_paths:
        raise ManifestAuditError("support amendment is outside coordinator closure")
    if manifest_paths & publish_spine != active_manifest_paths:
        raise ManifestAuditError("publish-spine promotion roster differs from coordinator")
    if COORDINATOR_PATH.as_posix() not in publish_spine:
        raise ManifestAuditError("coordinator is absent from the publish spine")
    if INGRESS_PATH.as_posix() not in publish_spine:
        raise ManifestAuditError("ingress is absent from the publish spine")
    if INGRESS_PATH.as_posix() in manifest_paths or INGRESS_PATH.is_relative_to(PACKAGE_ROOT):
        raise ManifestAuditError("ingress is not active outside the promoted package")

    for exclusion in evidence.excluded_scopes:
        excluded_path = str(exclusion["path"]).rstrip("/")
        if exclusion["kind"] == "file":
            reachable = excluded_path in publish_spine
        else:
            reachable = any(
                path == excluded_path or path.startswith(f"{excluded_path}/")
                for path in publish_spine
            )
        if reachable:
            raise ManifestAuditError(
                f"excluded scope is publish-reachable: {excluded_path}"
            )

    reference_freshness = _reference_freshness(repo_root, coordinator_spine)
    dependency_records = _source_records(repo_root, coordinator_spine)
    axiom_closures, axiom_union = _axiom_audit(repo_root)
    inactive_records = [
        manifest_records[path] for path in sorted(inactive_manifest_paths)
    ]
    return {
        "bank_id": BANK_ID,
        "generator_entrypoint": GENERATOR_PATH.as_posix(),
        "generator_version": evidence.generator_version,
        "input_sha256": evidence.input_sha256,
        "generated_source_sha256": evidence.generated_source_sha256,
        "lean_dependency_manifest_sha256": canonical_sha256(dependency_records),
        "checker_theorem": COORDINATOR_THEOREM,
        "aggregate_certificate_theorems": list(AGGREGATE_CERTIFICATE_THEOREMS),
        "public_projection_theorems": list(PUBLIC_PROJECTION_THEOREMS),
        "trust_mode": "replay",
        "publication_reachable": True,
        "last_verified_head": verified_head,
        "promotion_lean_file_count": len(manifest_paths),
        "replay_asset_count": evidence.replay_asset_count,
        "coordinator_active_manifest_file_count": len(active_manifest_paths),
        "coordinator_inactive_manifest_files": inactive_records,
        "coordinator_dependency_source_count": len(dependency_records),
        **reference_freshness,
        "ingress_active_outside_package": {
            "symbol": INGRESS_THEOREM,
            "path": INGRESS_PATH.as_posix(),
        },
        "manifest_scope_exclusions": list(evidence.excluded_scopes),
        "manifest_scope_excluded_file_count": evidence.excluded_file_count,
        "manifest_scope_excluded_directory_count": evidence.excluded_directory_count,
        "axiom_closures": axiom_closures,
        "axiom_union": axiom_union,
    }


def build_manifest(
    *, repo_root: Path = REPO_ROOT, verified_head: str | None = None
) -> dict[str, object]:
    head = _resolve_verified_head(repo_root, verified_head)
    evidence = _promotion_evidence(repo_root, head)
    bank = _bank_record(repo_root, evidence, head)
    manifest: dict[str, object] = {
        "schema": TOP_SCHEMA,
        "bank_count": 1,
        "target_symbol": TARGET_SYMBOL,
        "banks": [bank],
    }
    manifest["manifest_sha256"] = manifest_self_hash(manifest)
    return manifest


_REQUIRED_BANK_FIELDS = frozenset(
    {
        "bank_id",
        "generator_entrypoint",
        "generator_version",
        "input_sha256",
        "generated_source_sha256",
        "lean_dependency_manifest_sha256",
        "checker_theorem",
        "aggregate_certificate_theorems",
        "public_projection_theorems",
        "trust_mode",
        "publication_reachable",
        "last_verified_head",
        "proof_blueprint_build_fingerprint",
        "coordinator_reference_module_count",
        "coordinator_reference_stale_count",
        "coordinator_reference_missing_count",
    }
)


def _validate_stored_manifest(manifest: dict[str, Any]) -> str:
    if manifest.get("schema") != TOP_SCHEMA:
        raise ManifestAuditError("unsupported publication-bank manifest schema")
    if manifest.get("bank_count") != 1 or manifest.get("target_symbol") != TARGET_SYMBOL:
        raise ManifestAuditError("publication-bank top-level scope drifted")
    banks = manifest.get("banks")
    if not isinstance(banks, list) or len(banks) != 1 or not isinstance(banks[0], dict):
        raise ManifestAuditError("publication-bank manifest must contain exactly one bank")
    bank = banks[0]
    missing = _REQUIRED_BANK_FIELDS - set(bank)
    if missing:
        raise ManifestAuditError(f"bank record lacks required fields: {sorted(missing)}")
    if bank.get("bank_id") != BANK_ID:
        raise ManifestAuditError("publication-bank id drifted")
    head = _require_git_sha(bank.get("last_verified_head"), "last_verified_head")
    claimed_hash = _require_sha256(manifest.get("manifest_sha256"), "manifest_sha256")
    if claimed_hash != manifest_self_hash(manifest):
        raise ManifestAuditError("publication-bank manifest self-hash mismatch")
    return head


def _atomic_write(path: Path, data: bytes) -> None:
    path.parent.mkdir(parents=True, exist_ok=True)
    temporary_name: str | None = None
    try:
        with tempfile.NamedTemporaryFile(
            mode="wb",
            dir=path.parent,
            prefix=f".{path.name}.",
            suffix=".tmp",
            delete=False,
        ) as stream:
            temporary_name = stream.name
            stream.write(data)
            stream.flush()
            os.fsync(stream.fileno())
        os.replace(temporary_name, path)
        temporary_name = None
    finally:
        if temporary_name is not None:
            Path(temporary_name).unlink(missing_ok=True)


def generate_manifest(
    output: Path, *, repo_root: Path = REPO_ROOT, verified_head: str | None = None
) -> dict[str, object]:
    manifest = build_manifest(repo_root=repo_root, verified_head=verified_head)
    _atomic_write(output, canonical_json_bytes(manifest))
    return manifest


def check_manifest(path: Path, *, repo_root: Path = REPO_ROOT) -> dict[str, object]:
    stored_bytes = path.read_bytes()
    stored = _strict_json_bytes(stored_bytes, "publication-bank manifest")
    verified_head = _validate_stored_manifest(stored)
    current_head = _git_head(repo_root)
    if not _git_is_ancestor(repo_root, verified_head, current_head):
        raise ManifestAuditError(
            f"stored verified head {verified_head} is not an ancestor of {current_head}"
        )
    regenerated = build_manifest(repo_root=repo_root, verified_head=verified_head)
    if stored != regenerated:
        raise ManifestAuditError("publication-bank manifest semantic drift")
    if stored_bytes != canonical_json_bytes(regenerated):
        raise ManifestAuditError("publication-bank manifest byte encoding drift")
    return regenerated


def main(argv: list[str] | None = None) -> int:
    parser = argparse.ArgumentParser(description=__doc__)
    subparsers = parser.add_subparsers(dest="command", required=True)
    generate_parser = subparsers.add_parser("generate")
    generate_parser.add_argument("--output", required=True, type=Path)
    generate_parser.add_argument("--verified-head")
    check_parser = subparsers.add_parser("check")
    check_parser.add_argument("--manifest", required=True, type=Path)
    arguments = parser.parse_args(argv)
    try:
        if arguments.command == "generate":
            generate_manifest(
                arguments.output, verified_head=arguments.verified_head
            )
        else:
            check_manifest(arguments.manifest)
    except (ManifestAuditError, OSError, UnicodeError) as exc:
        parser.error(str(exc))
    return 0


if __name__ == "__main__":
    raise SystemExit(main())
