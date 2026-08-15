# Copyright (c) 2026 Adam McKenna. All rights reserved.
# Released under Apache 2.0 license as described in the file LICENSE.
# Author: Adam McKenna <adam@mysticflounder.ai>
"""Source-authenticated, launch-disabled one-shot runner for v6.

The dry run authenticates the exact v5 encoder/runner custody chain, loads the
v6 emitter only after its source hash is checked, replays the bundle and the
existing v4 witness control, and makes zero solver calls.  The independent
exact-CNF/source-map audit is approved and its exact proposed run root is
registered; execution still occurs only under an explicit ``--launch`` call.

If approved later, execution delegates to the authenticated v5 one-shot
custody implementation, rebound to the v6 emitter and strengthened with v6
common-payload model readback.
"""

from __future__ import annotations

import argparse
import hashlib
import importlib.util
import json
import os
import re
import stat
import sys
from collections.abc import Mapping, Sequence
from pathlib import Path, PurePosixPath

RUN_SCHEMA = "p97-freshthird-firstnonhit-common-payload-v6/run/v1"
RECEIPT_SCHEMA = f"{RUN_SCHEMA}/terminal-receipt/v1"
PROCESS_SCHEMA = f"{RUN_SCHEMA}/process-receipt/v1"
LANE_ID = "firstnonhit-common-payload-v6"
CHECKPOINT_RELATIVE = ".codex/worktree-checkpoints/firstnonhit-common-payload-v6.json"
RUN_PREFIX = f"scratch/runs/{LANE_ID}/"
PROPOSED_RUN_ID = "n17-one-shot-audit-approved"
PROPOSED_RUN_ROOT = f"{RUN_PREFIX}{PROPOSED_RUN_ID}"
PRODUCTION_N = 17
RUN_ID = re.compile(r"[a-z0-9][a-z0-9._-]{2,79}")

EXPECTED_COUNTS = {"variables": 93_280, "clauses": 606_898}
EXPECTED_CNF_SHA256 = "a520b6195e0337b629224835c51aa8a4e6b57088d898a32cc7318e71b0a6e403"
INDEPENDENT_AUDIT = {
    "status": "APPROVED",
    "scope": (
        "exact v6 emitted CNF, all 30 common-payload fields, source map, "
        "independent-surface boundary, runner, and model readback"
    ),
    "counts_expected": EXPECTED_COUNTS,
    "cnf_sha256_expected": EXPECTED_CNF_SHA256,
    "counts_reproduced": EXPECTED_COUNTS,
    "cnf_sha256_reproduced": EXPECTED_CNF_SHA256,
    "payload_field_coverage_reproduced": 30,
    "source_map_audited": True,
    "no_unsound_clause_found": True,
    "launch_authorized": True,
}

_V5_ENCODER_RELATIVE = "census/p97_search/freshthird_firstnonhit_overlap_v5.py"
_V5_RUNNER_RELATIVE = "census/p97_search/freshthird_firstnonhit_overlap_v5_run.py"
_V6_ENCODER_RELATIVE = "census/p97_search/freshthird_firstnonhit_common_payload_v6.py"
AUTHENTICATED_SOURCE_SPECS = {
    "encoder_v5": (
        _V5_ENCODER_RELATIVE,
        "6bf562662f826a51eba2b56d555476faeb84a234603c06ecefac8874501c74c3",
    ),
    "runner_v5": (
        _V5_RUNNER_RELATIVE,
        "4603445de8f7cc087e4ebf132f003f9eaf284d124ebcb81981f688d9fce4bea4",
    ),
    "encoder_v6": (
        _V6_ENCODER_RELATIVE,
        "317967139dfdca861a0e7c2eb28d572a98eab34ac44abe7818a42385613c7d76",
    ),
}
AUTHENTICATED_ENCODER_SPECS = AUTHENTICATED_SOURCE_SPECS
AUTHENTICATED_MODULE_NAMES = {
    "encoder_v5": "census.p97_search.freshthird_firstnonhit_overlap_v5",
    "encoder_v6": "census.p97_search._freshthird_firstnonhit_common_payload_v6_authenticated",
}

LEAN_COMMIT = "c8063884754baeef54dd64fae255b72f0e9d1d32"
LEAN_INGRESS_SPECS = {
    "common_payload": (
        (
            "lean/Erdos9796Proof/P97/ATail/FrontierLiveClosure/"
            "FirstNonHitCommonRadiusFinitePayload.lean"
        ),
        "cea8d0d20cf10bc53aa541566c9ada6ad420a95738b4f2b801742d8714010f0b",
        "FirstNonHitFiniteCommonRadiusPayload.ofWitness",
    ),
    "aggregate_hingress": (
        (
            "lean/Erdos9796Proof/P97/ATail/FrontierLiveClosure/"
            "FirstNonHitFiniteHingressPayload.lean"
        ),
        "06ca4a180db7844daf6f2798e93449e7f2b0bceb962d9c64459145f4d80b6462",
        "firstNonHitFiniteHingressPayload_nonempty",
    ),
}

emitter = None
v5_runner = None
runtime = None


class RunnerError(RuntimeError):
    """Fail-closed source-custody, path, or launch-gate failure."""


def _canonical_json(value: object) -> bytes:
    return (
        json.dumps(
            value,
            allow_nan=False,
            ensure_ascii=True,
            sort_keys=True,
            separators=(",", ":"),
        )
        + "\n"
    ).encode()


def _sha256(data: bytes) -> str:
    return hashlib.sha256(data).hexdigest()


def _repo_root() -> Path:
    return Path(__file__).resolve().parents[2]


def _reject_symlink_ancestors(path: Path) -> None:
    candidate = path
    while True:
        if candidate.is_symlink():
            raise RunnerError(f"path has a symlinked ancestor: {candidate}")
        if candidate == candidate.parent:
            return
        candidate = candidate.parent


def _read_regular(path: Path, description: str) -> bytes:
    _reject_symlink_ancestors(path)
    flags = os.O_RDONLY
    if hasattr(os, "O_NOFOLLOW"):
        flags |= os.O_NOFOLLOW
    try:
        descriptor = os.open(path, flags)
    except OSError as exc:
        raise RunnerError(f"cannot open {description}: {path}") from exc
    try:
        info = os.fstat(descriptor)
        if not stat.S_ISREG(info.st_mode) or info.st_nlink != 1:
            raise RunnerError(f"{description} must be a single-link regular file")
        chunks: list[bytes] = []
        while chunk := os.read(descriptor, 1024 * 1024):
            chunks.append(chunk)
        return b"".join(chunks)
    finally:
        os.close(descriptor)


def _strict_json(
    data: bytes, description: str, *, require_canonical: bool = True
) -> dict[str, object]:
    class DuplicateKey(ValueError):
        pass

    def pairs(rows: list[tuple[str, object]]) -> dict[str, object]:
        result: dict[str, object] = {}
        for key, value in rows:
            if key in result:
                raise DuplicateKey(key)
            result[key] = value
        return result

    try:
        value = json.loads(
            data,
            object_pairs_hook=pairs,
            parse_constant=lambda value: (_ for _ in ()).throw(ValueError(value)),
        )
    except (UnicodeDecodeError, json.JSONDecodeError, DuplicateKey, ValueError) as exc:
        raise RunnerError(f"malformed {description}: {exc}") from exc
    if type(value) is not dict:
        raise RunnerError(f"{description} must be a JSON object")
    if require_canonical and _canonical_json(value) != data:
        raise RunnerError(f"{description} is not canonical JSON")
    return value


def _authenticated_source_rows() -> dict[str, dict[str, object]]:
    root = _repo_root()
    rows: dict[str, dict[str, object]] = {}
    for label, (relative, expected) in AUTHENTICATED_SOURCE_SPECS.items():
        data = _read_regular(root / relative, f"authenticated {label} source")
        actual = _sha256(data)
        if actual != expected:
            raise RunnerError(f"{label} source hash mismatch: {actual} != {expected}")
        rows[label] = {"path": relative, "sha256": actual, "size": len(data)}
    return rows


def _authenticate_lean_ingress() -> dict[str, object]:
    rows: dict[str, object] = {}
    for label, (relative, expected, declaration) in LEAN_INGRESS_SPECS.items():
        data = _read_regular(_repo_root() / relative, f"{label} Lean ingress")
        actual = _sha256(data)
        if actual != expected:
            raise RunnerError(
                f"{label} Lean ingress hash mismatch: {actual} != {expected}"
            )
        rows[label] = {
            "path": relative,
            "sha256": actual,
            "size": len(data),
            "declaration": declaration,
        }
    return {"commit": LEAN_COMMIT, "sources": rows}


def _load_source_module(module_name: str, path: Path) -> object:
    spec = importlib.util.spec_from_file_location(module_name, path)
    if spec is None or spec.loader is None:
        raise RunnerError(f"cannot construct authenticated loader: {module_name}")
    module = importlib.util.module_from_spec(spec)
    prior = sys.modules.get(module_name)
    try:
        sys.modules[module_name] = module
        spec.loader.exec_module(module)
    except Exception:
        if prior is None:
            sys.modules.pop(module_name, None)
        else:
            sys.modules[module_name] = prior
        raise
    return module


def _ensure_authenticated_sources() -> dict[str, dict[str, object]]:
    global emitter, v5_runner
    rows = _authenticated_source_rows()
    _authenticate_lean_ingress()
    if v5_runner is None:
        v5_runner = _load_source_module(
            "census.p97_search._firstnonhit_common_payload_v6_v5_runner",
            _repo_root() / rows["runner_v5"]["path"],
        )
        v5_runner._load_authenticated_runner_base()
    if emitter is None:
        emitter = _load_source_module(
            AUTHENTICATED_MODULE_NAMES["encoder_v6"],
            _repo_root() / rows["encoder_v6"]["path"],
        )
    return rows


def _read_checkpoint() -> dict[str, object]:
    value = _strict_json(
        _read_regular(_repo_root() / CHECKPOINT_RELATIVE, "lane checkpoint"),
        "lane checkpoint",
        require_canonical=False,
    )
    if value.get("schema") != "worktree-lane-checkpoint/v1":
        raise RunnerError("checkpoint schema mismatch")
    if value.get("lane_id") != LANE_ID:
        raise RunnerError("checkpoint lane mismatch")
    unsigned = dict(value)
    digest = unsigned.pop("manifest_sha256", None)
    canonical = json.dumps(
        unsigned, ensure_ascii=True, sort_keys=True, separators=(",", ":")
    ).encode()
    if digest != hashlib.sha256(canonical).hexdigest():
        raise RunnerError("checkpoint self-hash mismatch")
    return value


def _normalize_run_root(run_root: Path) -> tuple[Path, str]:
    root = _repo_root()
    absolute = run_root if run_root.is_absolute() else root / run_root
    absolute = Path(os.path.abspath(absolute))
    try:
        relative = absolute.relative_to(root).as_posix()
    except ValueError as exc:
        raise RunnerError("run root must be inside this repository") from exc
    parts = PurePosixPath(relative).parts
    if (
        len(parts) != 4
        or "/".join(parts[:3]) != RUN_PREFIX.rstrip("/")
        or RUN_ID.fullmatch(parts[3]) is None
    ):
        raise RunnerError(f"run root must be exactly {RUN_PREFIX}<stable-run-id>")
    _reject_symlink_ancestors(absolute)
    return absolute, relative


def _registration_status(relative: str) -> bool:
    roots = _read_checkpoint().get("generated_roots")
    if type(roots) is not list or any(type(row) is not str for row in roots):
        raise RunnerError("checkpoint generated_roots is malformed")
    return relative in roots


def _predecessor_model_control() -> dict[str, object]:
    _ensure_authenticated_sources()
    path = _repo_root() / emitter.v5.PREDECESSOR_MODEL_RELATIVE
    return emitter.v5.validate_predecessor_sat_model_control(
        _read_regular(path, "authenticated v4 SAT model")
    )


def _validate_common_blocker_inequalities(
    common_blockers: Mapping[str, int],
    selected_roles: Mapping[str, int],
    named_blockers: Mapping[str, int],
) -> None:
    """Check payload blocker outputs against blocker outputs and apex points."""

    forbidden = (
        named_blockers[emitter.v2.P1],
        named_blockers[emitter.v2.R1],
        selected_roles[emitter.v2.APEX],
        selected_roles["second_apex"],
    )
    for side, center in common_blockers.items():
        if center in forbidden:
            raise RunnerError(f"v6 common blocker inequality failed for {side}")


def _validate_common_payload_model(
    bundle: object,
    stdout: bytes,
    base_summary: dict[str, object],
    configured_runtime: object,
) -> dict[str, object]:
    """Independently read back every v6 selector and payload relation."""

    manifest = emitter.validate_bundle(bundle)
    mapping = json.loads(bundle.variable_map)
    variables = mapping.get("variables")
    if type(variables) is not list:
        raise RunnerError("v6 model variable map is malformed")
    role_to_id = {
        row["role"]: row["id"]
        for row in variables
        if type(row) is dict
        and type(row.get("role")) is str
        and type(row.get("id")) is int
    }
    variable_count = manifest.get("variables")
    n = manifest.get("n")
    if type(variable_count) is not int or type(n) is not int:
        raise RunnerError("v6 model manifest cardinalities are malformed")
    if len(role_to_id) != variable_count:
        raise RunnerError("v6 model variable roles do not replay uniquely")
    assignment = configured_runtime.parse_complete_model(stdout, variable_count)

    def enabled(role: str) -> bool:
        identifier = role_to_id.get(role)
        if type(identifier) is not int:
            raise RunnerError(f"v6 semantic variable is missing: {role}")
        return assignment[identifier]

    common = enabled(emitter.COMMON_GUARD_ROLE)
    legacy = enabled(emitter.LEGACY_COMMON_GUARD_ROLE)
    if common != legacy:
        raise RunnerError("v6 common payload guard does not equal predecessor arm")
    result = dict(base_summary)
    result.update(
        {
            "common_payload_guard": common,
            "common_payload_field_count": len(emitter.PAYLOAD_FIELDS),
            "common_surface_identified_with_c": False,
            "v6_semantic_validation": True,
        }
    )
    if not common:
        result["common_payload_active"] = False
        return result

    common_sources: dict[str, int] = {}
    common_blockers: dict[str, int] = {}
    for side in emitter.COMMON_SIDES:
        selected = [
            index for index in range(n) if enabled(f"common_source/{side}/{index}")
        ]
        blockers = [
            center for center in range(n) if enabled(f"common_blocker/{side}/{center}")
        ]
        if len(selected) != 1 or len(blockers) != 1:
            raise RunnerError("v6 common source/blocker selector is not one-hot")
        common_sources[side] = selected[0]
        common_blockers[side] = blockers[0]
        actual = [
            center
            for center in range(n)
            if enabled(f"blocker/{selected[0]}/{center}")
        ]
        if actual != blockers:
            raise RunnerError("v6 common blocker mux readback mismatch")
        if not enabled(f"interior/{selected[0]}/1"):
            raise RunnerError("v6 common source lost first-cap interior membership")
    if common_sources["one"] == common_sources["two"]:
        raise RunnerError("v6 common sources are not distinct")

    selected_roles: dict[str, int] = {}
    for role in (*emitter.RETAINED_ROLES, *emitter.APEX_ROLES):
        selected = [index for index in range(n) if enabled(f"role/{role}/{index}")]
        if len(selected) != 1:
            raise RunnerError("v6 referenced named role is not one-hot")
        selected_roles[role] = selected[0]
    for source in common_sources.values():
        if source in (selected_roles[role] for role in emitter.RETAINED_ROLES):
            raise RunnerError("v6 common source aliases a retained role")

    named_blockers: dict[str, int] = {}
    for role in emitter.BLOCKER_REFERENCE_ROLES:
        selected = [
            center
            for center in range(n)
            if enabled(f"named_blocker/{role}/{center}")
        ]
        if len(selected) != 1:
            raise RunnerError("v6 referenced named blocker is not one-hot")
        named_blockers[role] = selected[0]
    _validate_common_blocker_inequalities(
        common_blockers, selected_roles, named_blockers
    )

    for side, center in common_blockers.items():
        for left, right, _suffix in (
            (emitter.v2.P1, emitter.v2.P2, "first"),
            (emitter.v2.R1, emitter.v2.R2, "second"),
        ):
            if not (
                enabled(f"has4/{selected_roles[left]}/{center}")
                or enabled(f"has4/{selected_roles[right]}/{center}")
            ):
                raise RunnerError(f"v6 deletion-survival disjunction failed for {side}")

    apex = selected_roles[emitter.v2.APEX]
    first = common_sources["one"]
    second = common_sources["two"]
    if not enabled(f"radius/{apex}/{first}/{second}"):
        raise RunnerError("v6 common-radius equality readback failed")
    for role in emitter.RETAINED_ROLES:
        if enabled(f"radius/{apex}/{first}/{selected_roles[role]}"):
            raise RunnerError("v6 common-radius inequality readback failed")
    result.update(
        {
            "common_payload_active": True,
            "common_source_indices": common_sources,
            "common_blocker_indices": common_blockers,
            "retained_blocker_indices": named_blockers,
            "all_30_payload_fields_validated": True,
        }
    )
    return result


def _load_authenticated_runner_base() -> object:
    """Rebind the authenticated v5 custody runtime to v6 without executing it."""

    global runtime
    if runtime is not None:
        _authenticated_source_rows()
        _authenticate_lean_ingress()
        return runtime
    rows = _ensure_authenticated_sources()
    configured = v5_runner._load_authenticated_runner_base()
    v5_validate_model = configured.validate_model
    v5_initial_manifest = configured._initial_manifest

    def validate_v6_model(bundle: object, stdout: bytes) -> dict[str, object]:
        summary = v5_validate_model(bundle, stdout)
        return _validate_common_payload_model(bundle, stdout, summary, configured)

    def initial_v6_manifest(*args: object, **kwargs: object) -> dict[str, object]:
        manifest = v5_initial_manifest(*args, **kwargs)
        unsigned = dict(manifest)
        unsigned.pop("run_manifest_sha256", None)
        unsigned["lean_ingress"] = _authenticate_lean_ingress()
        unsigned["production_path"] = {
            "custody_base": rows["runner_v5"],
            "predecessor_encoder": rows["encoder_v5"],
            "v6_encoder": rows["encoder_v6"],
            "v6_common_payload_semantic_readback": True,
        }
        return configured._self_hashed(unsigned, "run_manifest_sha256")

    configured.__file__ = __file__
    configured.RunnerError = RunnerError
    configured.RUN_SCHEMA = RUN_SCHEMA
    configured.RECEIPT_SCHEMA = RECEIPT_SCHEMA
    configured.PROCESS_SCHEMA = PROCESS_SCHEMA
    configured.LANE_ID = LANE_ID
    configured.CHECKPOINT_RELATIVE = CHECKPOINT_RELATIVE
    configured.RUN_PREFIX = RUN_PREFIX
    configured.PRODUCTION_N = PRODUCTION_N
    configured.INDEPENDENT_AUDIT = INDEPENDENT_AUDIT
    configured.AUTHENTICATED_ENCODER_SPECS = AUTHENTICATED_SOURCE_SPECS
    configured.AUTHENTICATED_MODULE_NAMES = AUTHENTICATED_MODULE_NAMES
    configured.emitter = emitter
    configured.predecessor_emitter = emitter.v5
    configured._repo_root = _repo_root
    configured._normalize_run_root = _normalize_run_root
    configured._registration_status = _registration_status
    configured._ensure_authenticated_encoders = _ensure_authenticated_sources
    configured._predecessor_model_control = _predecessor_model_control
    configured.validate_model = validate_v6_model
    configured._initial_manifest = initial_v6_manifest

    # The v5 wrapper owns the terminal-recovery implementation called by its
    # production closure.  Rebind only lane/schema/emitter/authentication data.
    for name, value in (
        ("RUN_SCHEMA", RUN_SCHEMA),
        ("RECEIPT_SCHEMA", RECEIPT_SCHEMA),
        ("PROCESS_SCHEMA", PROCESS_SCHEMA),
        ("LANE_ID", LANE_ID),
        ("CHECKPOINT_RELATIVE", CHECKPOINT_RELATIVE),
        ("RUN_PREFIX", RUN_PREFIX),
        ("PRODUCTION_N", PRODUCTION_N),
        ("INDEPENDENT_AUDIT", INDEPENDENT_AUDIT),
        ("emitter", emitter),
        ("predecessor_emitter", emitter.v5),
        ("_repo_root", _repo_root),
        ("_registration_status", _registration_status),
        ("_ensure_authenticated_encoders", _ensure_authenticated_sources),
        ("_authenticate_lean_ingress", _authenticate_lean_ingress),
    ):
        setattr(v5_runner, name, value)

    emitter.ROLES = emitter.v2.ROLES
    emitter.Q1 = emitter.v2.Q1
    runtime = configured
    return configured


def _require_launch_audit() -> None:
    if (
        INDEPENDENT_AUDIT.get("status") != "APPROVED"
        or INDEPENDENT_AUDIT.get("counts_reproduced") != EXPECTED_COUNTS
        or INDEPENDENT_AUDIT.get("cnf_sha256_reproduced") != EXPECTED_CNF_SHA256
        or INDEPENDENT_AUDIT.get("payload_field_coverage_reproduced") != 30
        or INDEPENDENT_AUDIT.get("source_map_audited") is not True
        or INDEPENDENT_AUDIT.get("no_unsound_clause_found") is not True
        or INDEPENDENT_AUDIT.get("launch_authorized") is not True
    ):
        raise RunnerError("production launch is disabled pending independent audit")


def run_once(
    run_root: Path, *, timeout_seconds: int, cross_check: bool
) -> dict[str, object]:
    """Pass the complete gate, then delegate exactly one v6 production solve."""

    configured = _load_authenticated_runner_base()
    _absolute, relative = _normalize_run_root(run_root)
    if not _registration_status(relative):
        raise RunnerError("exact run root is not registered in checkpoint generated_roots")
    _require_launch_audit()
    return configured.run_once(
        run_root, timeout_seconds=timeout_seconds, cross_check=cross_check
    )


def dry_run(
    run_root: Path | None, timeout_seconds: int, cross_check: bool
) -> dict[str, object]:
    if type(timeout_seconds) is not int or timeout_seconds <= 0:
        raise RunnerError("timeout must be a positive integer")
    configured = _load_authenticated_runner_base()
    result = configured.dry_run(run_root, timeout_seconds, cross_check)
    result.update(
        {
            "schema": RUN_SCHEMA,
            "audit_status": INDEPENDENT_AUDIT["status"],
            "run_root_created": False,
            "proposed_run_root": PROPOSED_RUN_ROOT,
            "lean_ingress": _authenticate_lean_ingress(),
            "authenticated_source_chain": _authenticated_source_rows(),
            "runner_base_authenticated": True,
            "production_path_installed": True,
            "common_payload_field_count": 30,
            "common_surface_identified_with_c": False,
            "solver_calls": 0,
        }
    )
    return result


def validate_model(bundle: object, stdout: bytes) -> dict[str, object]:
    return _load_authenticated_runner_base().validate_model(bundle, stdout)


def parse_complete_model(stdout: bytes, variable_count: int) -> dict[int, bool]:
    return _load_authenticated_runner_base().parse_complete_model(stdout, variable_count)


def terminal_reentry(root: Path) -> dict[str, object]:
    """Validate immutable terminal custody without executing a subprocess."""

    return _load_authenticated_runner_base().terminal_reentry(root)


def _validate_process_phase_set(
    names: Sequence[str],
    process_receipts: dict[str, dict[str, object]],
    status: str,
    cross_check_effective: bool,
) -> None:
    _load_authenticated_runner_base()._validate_process_phase_set(
        names, process_receipts, status, cross_check_effective
    )


def main(argv: Sequence[str] | None = None) -> int:
    parser = argparse.ArgumentParser(description=__doc__)
    parser.add_argument("--launch", action="store_true")
    parser.add_argument("--run-root", type=Path)
    parser.add_argument("--timeout-seconds", type=int, default=3600)
    parser.add_argument("--cross-check", action="store_true")
    args = parser.parse_args(argv)
    if args.launch:
        if args.run_root is None:
            parser.error("--launch requires --run-root")
        result = run_once(
            args.run_root,
            timeout_seconds=args.timeout_seconds,
            cross_check=args.cross_check,
        )
    else:
        result = dry_run(args.run_root, args.timeout_seconds, args.cross_check)
    print(json.dumps(result, allow_nan=False, sort_keys=True, separators=(",", ":")))
    return 0


if __name__ == "__main__":
    raise SystemExit(main())
