"""Preparation-only package builder for the authenticated Child44 campaign.

This module writes only immutable preparation records.  It never starts PIQD,
invokes a solver, removes an artifact, or publishes an output envelope.  The
last step of :func:`prepare_campaign` deliberately enters the committed
control/registry planner so that a preparation cannot silently drift from the
shared ASSUMPTION_CNF route.
"""

from __future__ import annotations

import argparse
import hashlib
import json
import os
import secrets
import stat
from pathlib import Path, PurePosixPath
from typing import Any

from census.p97_search.cegar_wave_assumption_profiles import (
    assumption_campaign_metadata,
    load_assumption_campaign_profile,
)
from census.p97_search.cegar_wave_registry import (
    plan_execution,
    validate_registered_ingress,
)
from census.p97_search.phase3_cegar_wave import (
    LOCAL_CERTIFICATE,
    SAT_MEANS_COUNTEREXAMPLE,
    canonical_json_bytes,
    sha256_bytes,
)
from census.p97_search.phase3_cegar_wave_control import (
    ASSUMPTION_CNF,
    ASSUMPTION_CNF_PIQD_ADAPTER,
    ASSUMPTION_CNF_PIQD_ADAPTER_SCHEMA_V1,
    ASSUMPTION_CNF_SEMANTIC_VALIDATOR_V1,
    CONTROL_SCHEMA_V3,
    MAX_ASSUMPTION_CAMPAIGN_BYTES,
    MAX_PRODUCER_MANIFEST_BYTES,
    MAX_STATIC_CNF_BYTES,
    MAX_VARIABLE_MAP_BYTES,
    MAX_WAVE_MANIFEST_BYTES,
    load_wave_control,
)
from census.p97_search.phase3_piqd_driver import DriverPolicy

ROOT = Path(__file__).resolve().parents[1]
PROFILE_PATH = ROOT / "census/p97_search/exact17_child44_nextcenter_cells_v1.json"
PARENT_PATH = ROOT / (
    "scratch/exact17-lean-to-sat/"
    "exact17-forty-fourth-root-forty-third-model-refinements.cnf"
)
PRODUCER_PATH = ROOT / (
    "scratch/exact17-lean-to-sat/"
    "piqd-ingress-manifest-forty-fourth-model-refinements-core1.json"
)

PROFILE_SHA256 = "6294246f6f12814db63c7c61a23ab8fcffaf65e2277e99a364b15cf8f193208f"
PARENT_SHA256 = "17f1c9c48e25aa887cbf80d9de31e0d9b0de089c7eca1b3968dbbe1e35494af9"
PARENT_BYTES = 291704790
PARENT_VARIABLES = 308
PARENT_CLAUSES = 5848820
PARENT_JOB_ID = "f717c352-2456-412a-ae45-d910f47d3e94"
PRODUCER_SHA256 = "152570011046aee180b6d385f731fa13911dc9800bfc393dc87ad386cd031048"
SOLVER_SHA256 = "0ee355934249f1b3f14a20928877391a87a0dd51326cf8c6135f75cba0b6b965"
SCHEMA = "p97-exact17-child44-assumption-preparation/v1"


class PreparationError(ValueError):
    """The preparation request or an immutable output failed closed."""


def _sha256(path: Path) -> str:
    digest = hashlib.sha256()
    with path.open("rb") as handle:
        for block in iter(lambda: handle.read(1024 * 1024), b""):
            digest.update(block)
    return digest.hexdigest()


def _require_regular(path: Path, label: str) -> None:
    try:
        metadata = os.lstat(path)
    except OSError as error:
        raise PreparationError(f"{label} is unavailable") from error
    if stat.S_ISLNK(metadata.st_mode) or not stat.S_ISREG(metadata.st_mode):
        raise PreparationError(f"{label} must be a regular non-symlink file")


def _repo_relative(repo_root: Path, path: Path) -> str:
    if type(repo_root) is not type(Path()) or not repo_root.is_absolute():
        raise PreparationError("repo_root must be an absolute native Path")
    if type(path) is not type(Path()) or not path.is_absolute():
        raise PreparationError("artifact paths must be absolute native Paths")
    try:
        relative = path.resolve(strict=False).relative_to(repo_root)
    except ValueError as error:
        raise PreparationError("artifact path escapes repo_root") from error
    text = PurePosixPath(relative.as_posix())
    if text.is_absolute() or any(part in {"", ".", ".."} for part in text.parts):
        raise PreparationError("artifact path is not a safe repo-relative path")
    return text.as_posix()


def _require_output_dir(repo_root: Path, output_dir: Path) -> Path:
    root = repo_root.resolve(strict=True)
    if root != repo_root or not root.is_dir():
        raise PreparationError("repo_root must be a canonical directory")
    if type(output_dir) is not type(Path()) or not output_dir.is_absolute():
        raise PreparationError("output_dir must be an absolute native Path")
    output = output_dir.resolve(strict=False)
    if output != output_dir:
        raise PreparationError("output_dir must contain no symlink or traversal component")
    try:
        output.relative_to(root)
    except ValueError as error:
        raise PreparationError("output_dir must be inside repo_root") from error
    output.mkdir(parents=True, exist_ok=True)
    _require_directory_nonsymlink(output)
    return output


def _require_directory_nonsymlink(path: Path) -> None:
    metadata = os.lstat(path)
    if stat.S_ISLNK(metadata.st_mode) or not stat.S_ISDIR(metadata.st_mode):
        raise PreparationError(f"output directory is not a regular directory: {path}")


def _write_once(path: Path, payload: bytes) -> bool:
    """Create *path* durably, or accept the exact existing bytes only."""

    if type(payload) is not bytes:
        raise PreparationError("artifact payload must be builtin bytes")
    _require_directory_nonsymlink(path.parent)
    try:
        metadata = os.lstat(path)
    except FileNotFoundError:
        metadata = None
    except OSError as error:
        raise PreparationError(f"cannot inspect {path}") from error
    if metadata is not None:
        if stat.S_ISLNK(metadata.st_mode) or not stat.S_ISREG(metadata.st_mode):
            raise PreparationError(f"refusing to overwrite non-regular artifact {path}")
        if path.read_bytes() != payload:
            raise PreparationError(f"write-once artifact differs: {path}")
        return False

    candidate = f".{path.name}.{secrets.token_hex(12)}.candidate"
    directory_fd = os.open(path.parent, os.O_RDONLY | getattr(os, "O_DIRECTORY", 0))
    try:
        flags = os.O_WRONLY | os.O_CREAT | os.O_EXCL | getattr(os, "O_NOFOLLOW", 0)
        fd = os.open(candidate, flags, 0o600, dir_fd=directory_fd)
        try:
            with os.fdopen(fd, "wb") as handle:
                handle.write(payload)
                handle.flush()
                os.fsync(handle.fileno())
        except BaseException:
            try:
                os.unlink(candidate, dir_fd=directory_fd)
            except FileNotFoundError:
                pass
            raise
        try:
            os.link(
                candidate,
                path.name,
                src_dir_fd=directory_fd,
                dst_dir_fd=directory_fd,
                follow_symlinks=False,
            )
        except FileExistsError as error:
            # A concurrent creator is acceptable only if it wrote these exact bytes.
            try:
                os.unlink(candidate, dir_fd=directory_fd)
            except FileNotFoundError:
                pass
            if path.is_file() and not path.is_symlink() and path.read_bytes() == payload:
                return False
            raise PreparationError(f"concurrent artifact differs: {path}") from error
        os.fsync(directory_fd)
        return True
    finally:
        try:
            os.unlink(candidate, dir_fd=directory_fd)
        except FileNotFoundError:
            pass
        os.close(directory_fd)


def _variable_map() -> dict[str, Any]:
    return {
        "schema": "p97-exact17-source-model-variable-map/v1",
        "variables": 308,
        "hit": [
            {"center": center, "point": point, "var": 1 + 17 * center + point}
            for center in range(17)
            for point in range(17)
        ],
        "next_center": [
            {"center": center, "var": 290 + center} for center in range(17)
        ],
        "named_order": [{"order": order, "var": 307 + order} for order in range(2)],
        "next_center_formula": "290 + center",
        "named_order_formula": "307 + order",
        "named_order_is_not_fixed_by_cell": True,
    }


def _reference(repo_root: Path, path: Path, payload: bytes, max_bytes: int) -> dict[str, Any]:
    return {
        "path": _repo_relative(repo_root, path),
        "sha256": sha256_bytes(payload),
        "max_bytes": max_bytes,
    }


def build_documents(
    repo_root: Path,
    output_dir: Path,
    *,
    parent_path: Path | None = None,
    profile_path: Path | None = None,
    producer_path: Path | None = None,
    profile_bytes: bytes | None = None,
    producer_bytes: bytes | None = None,
) -> dict[str, bytes]:
    """Build canonical records without reading the parent CNF.

    The optional byte overrides make document generation unit-testable without
    the production root.  The normal preparation path leaves them unset and
    verifies the authenticated Child44 profile and producer identities.
    """

    parent_path = PARENT_PATH if parent_path is None else parent_path
    profile_path = PROFILE_PATH if profile_path is None else profile_path
    producer_path = PRODUCER_PATH if producer_path is None else producer_path
    if profile_bytes is None:
        _require_regular(profile_path, "Child44 campaign profile")
    if producer_bytes is None:
        _require_regular(producer_path, "Child44 producer manifest")
    profile = profile_bytes if profile_bytes is not None else profile_path.read_bytes()
    producer = producer_bytes if producer_bytes is not None else producer_path.read_bytes()
    if profile_bytes is None and sha256_bytes(profile) != PROFILE_SHA256:
        raise PreparationError("Child44 campaign profile hash drifted")
    if producer_bytes is None and sha256_bytes(producer) != PRODUCER_SHA256:
        raise PreparationError("Child44 producer manifest hash drifted")
    output = output_dir.resolve(strict=False)
    paths = {
        "campaign": output / "campaign.json",
        "producer_manifest": output / "producer-manifest.json",
        "variable_map": output / "variable-map.json",
        "wave_manifest": output / "wave-manifest.json",
        "control": output / "control.json",
        "report": output / "report.json",
    }
    variable_map = _variable_map()
    variable_map_bytes = canonical_json_bytes(variable_map)
    wave_manifest = {
        "schema": "p97-cegar-wave/v1",
        "wave_id": "exact17-child44-assumption-preparation",
        "iteration": 0,
        "parent_checkpoint_sha256": None,
        "source": {
            "live_leaf": "Problem97.ATailBlockerVExactSeventeenSourceNormalForm.SourceModel",
            "ingress_hypotheses_sha256": sha256_bytes(profile),
            "finite_schema": "p97-exact17-child44-assumption-cnf/v1",
            "cardinality_scope": "13 legal next-center cells; named-order remains a source assignment dimension",
            "source_theorem": "Problem97.ATailBlockerVExactSeventeenSourceNormalForm.SourceModel.nextCenter_mem_legalNextCenterLabels",
        },
        "encoding": {
            "cnf_sha256": PARENT_SHA256,
            "variable_map_sha256": sha256_bytes(variable_map_bytes),
            "producer_manifest_sha256": sha256_bytes(producer),
            "num_variables": PARENT_VARIABLES,
            "num_clauses": PARENT_CLAUSES,
            "query_polarity": SAT_MEANS_COUNTEREXAMPLE,
        },
        "execution": {
            "backend": "cadical",
            "solver_profile": "sat",
            "shard_id": 0,
            "shard_count": 1,
            "order_sha256": sha256_bytes(b"exact17-child44-nextcenter-order-v1"),
            "seed": 0,
        },
        "promotion": {
            "evidence_classification": LOCAL_CERTIFICATE,
            "producer_theorem": None,
            "lift_theorem": None,
            "consumer_theorem": None,
        },
    }
    wave_bytes = canonical_json_bytes(wave_manifest)
    control = {
        "schema": CONTROL_SCHEMA_V3,
        "wave_kind": ASSUMPTION_CNF,
        "adapter_id": ASSUMPTION_CNF_PIQD_ADAPTER,
        "adapter_schema": ASSUMPTION_CNF_PIQD_ADAPTER_SCHEMA_V1,
        "wave_manifest": _reference(repo_root, paths["wave_manifest"], wave_bytes, MAX_WAVE_MANIFEST_BYTES),
        "package": {
            "cnf": {
                "path": _repo_relative(repo_root, parent_path),
                "sha256": PARENT_SHA256,
                "max_bytes": MAX_STATIC_CNF_BYTES,
            },
            "producer_manifest": _reference(repo_root, paths["producer_manifest"], producer, MAX_PRODUCER_MANIFEST_BYTES),
            "variable_map": _reference(repo_root, paths["variable_map"], variable_map_bytes, MAX_VARIABLE_MAP_BYTES),
        },
        "driver_policy": DriverPolicy(requested_core_limit=1).as_dict(),
        "semantic_validator": ASSUMPTION_CNF_SEMANTIC_VALIDATOR_V1,
        "campaign": _reference(repo_root, paths["campaign"], profile, MAX_ASSUMPTION_CAMPAIGN_BYTES),
    }
    control_bytes = canonical_json_bytes(control)
    return {
        "campaign.json": profile,
        "producer-manifest.json": producer,
        "variable-map.json": variable_map_bytes,
        "wave-manifest.json": wave_bytes,
        "control.json": control_bytes,
    }


def _stable_ingress(repo_root: Path, ingress: dict[str, Any]) -> dict[str, Any]:
    value = dict(ingress)
    parent = dict(value.get("parent", {}))
    if "path" in parent:
        parent["path"] = _repo_relative(repo_root, Path(parent["path"]))
    for field in ("source_dev", "source_ino", "path_chain"):
        parent.pop(field, None)
    value["parent"] = parent
    return value


def prepare_campaign(repo_root: Path = ROOT, output_dir: Path | None = None) -> dict[str, Any]:
    """Write preparation artifacts and invoke the committed ingress planner."""

    root = repo_root.resolve(strict=True)
    output = _require_output_dir(root, output_dir or (root / "scratch/exact17-child44-assumption-preparation"))
    documents = build_documents(root, output)
    names = ("campaign.json", "producer-manifest.json", "variable-map.json", "wave-manifest.json", "control.json")
    for name in names:
        _write_once(output / name, documents[name])

    profile = load_assumption_campaign_profile(output / "campaign.json")
    control = load_wave_control(documents["control.json"])
    ingress = validate_registered_ingress(control, root)
    plan = plan_execution(control, root)
    report = {
        "schema": SCHEMA,
        "status": "PREPARED_LOCAL_ONLY",
        "parent": {
            "job_id": PARENT_JOB_ID,
            "path": _repo_relative(root, PARENT_PATH),
            "sha256": PARENT_SHA256,
            "bytes": PARENT_BYTES,
            "variables": PARENT_VARIABLES,
            "clauses": PARENT_CLAUSES,
        },
        "solver": {"name": "piqd-satworker-cadical-3.0.0", "sha256": SOLVER_SHA256, "protocol_version": 1, "lane": "sat", "conflict_limit": 3000},
        "campaign": assumption_campaign_metadata(profile),
        "variable_map": _variable_map(),
        "artifacts": {name: {"path": _repo_relative(root, output / name), "sha256": sha256_bytes(documents[name])} for name in names},
        "ingress": _stable_ingress(root, ingress),
        "execution": {"registration": plan["registration"], "plan": plan["plan"], "control_sha256": plan["control_sha256"]},
        "promotion": {"evidence_classification": LOCAL_CERTIFICATE, "producer_theorem": None, "lift_theorem": None, "consumer_theorem": None},
    }
    report_bytes = canonical_json_bytes(report)
    _write_once(output / "report.json", report_bytes)
    return report


def main(argv: list[str] | None = None) -> int:
    parser = argparse.ArgumentParser(description=__doc__)
    parser.add_argument("--output-dir", type=Path, required=True)
    args = parser.parse_args(argv)
    report = prepare_campaign(output_dir=args.output_dir)
    print(json.dumps({"status": report["status"], "report": report["artifacts"]["report.json"]}, sort_keys=True))
    return 0


if __name__ == "__main__":
    raise SystemExit(main())
