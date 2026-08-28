"""Validate the proposed A2 CAP T0 target packet and its custody links."""

from __future__ import annotations

import argparse
import json
import re
import subprocess
import sys
from datetime import UTC, datetime
from pathlib import Path
from typing import Any

REPO_ROOT = Path(__file__).resolve().parents[1]
if str(REPO_ROOT) not in sys.path:
    sys.path.insert(0, str(REPO_ROOT))

from census.cap_configuration.schema import (
    CapConfigurationSchemaError,
    parse_stored_json_bytes,
    raw_sha256,
    structured_hash,
)

TARGET_ID = "p97-capcfg-rigid221-exact17-cap9-exactcover-negative-v1"
EXPECTED_BASE_HEAD = "38f6b0ced41acbda8b2d2f590f2acf6b1a14a7a4"
EXPECTED_BRANCH = "cap-a2-t0-packet-20260827"
EXPECTED_MAIN_BRANCH = "main"
EXPECTED_PACKET_COMMIT = "64d65e4ebbbf7439b48dc56990fcb0886045e9a6"
EXPECTED_REQUEST_MAIN_HEAD = "a301d85e2a432b2804cfc98fd9f3e620dc1f0ec5"
EXPECTED_FORMAL_SOURCE_RELATIVE = Path("FormalConjectures/ErdosProblems/97.lean")
EXPECTED_PROPOSITION_SHA256 = (
    "0dcf5e74a8c4fe5ee6e6fdd2626f69743d65a7284f755f06c2f14d32a8568c66"
)
SOURCE_PATH = Path(
    "certificates/cap_configuration_t0_a2_exact17_second_cap9_source_manifest_v1.json"
)
PREFLIGHT_PATH = Path(
    "certificates/cap_configuration_t0_a2_exact17_second_cap9_preflight_v1.json"
)
TARGET_PATH = Path(
    "certificates/cap_configuration_t0_a2_exact17_second_cap9_target_v1.json"
)
REVIEW_PATH = Path(
    "certificates/cap_configuration_t0_a2_exact17_second_cap9_review_v1.json"
)
REQUEST_PATH = Path(
    "certificates/cap_configuration_t0_a2_exact17_second_cap9_acceptance_request_v1.json"
)
ACCEPTANCE_PATH = Path(
    "certificates/cap_configuration_t0_a2_exact17_second_cap9_acceptance_v1.json"
)

_HEX40 = re.compile(r"[0-9a-f]{40}")
_HEX64 = re.compile(r"[0-9a-f]{64}")

SOURCE_KEYS = {
    "build_identity", "declarations", "files", "kernel_dependency_manifest_sha256",
    "repository", "schema", "scope", "source_identity_sha256", "status", "target_id",
}
PREFLIGHT_KEYS = {
    "applicability", "first_missing_antecedent", "preflight_sha256",
    "raw_output_retention", "recorded_utc", "result_inventory", "schema",
    "searched_revision", "searches", "status", "target_id", "verdict",
}
TARGET_KEYS = {
    "active_plan_authorization", "anchored_residual", "branch_outcomes", "claim_flags",
    "conclusions_that_must_reach_the_encoder", "constants_and_bounds", "consumers",
    "counterexample_terminal", "declared_universe", "deliberate_semantic_deltas",
    "directional_bridges", "elaborated_proposition",
    "evidence_forbidden_from_stopping_with_target_completion",
    "evidence_permitted_to_stop_with_target_completion", "explicitly_forbidden_claims",
    "finite_ingress", "first_omitted_antecedent", "frontier", "hard_stop_conditions",
    "hypotheses_and_quantifiers", "identity", "omissions", "proposition_polarity",
    "roles_and_acceptance", "schema", "schema_note", "selection_status",
    "source_problem", "status", "t1a_oracle_requirements", "target_id", "target_mode",
    "target_sha256", "termination_policy", "theorem_bank_preflight", "trust_profiles",
    "unresolved_coordinator_decisions",
}
REVIEW_KEYS = {
    "artifacts", "authorization", "checks", "review_sha256", "reviewed_base_head",
    "reviewed_utc", "reviewers", "schema", "status", "target_id",
    "unresolved_blockers", "verdict",
}
REQUEST_KEYS = {
    "authorization", "decision_requested", "evidence", "limitations",
    "request_sha256", "requested_utc", "requester", "schema",
    "source_drift_attestation", "status", "target_id",
}
ACCEPTANCE_KEYS = {
    "acceptance_sha256", "accepted_utc", "authorization", "coordinator", "decision",
    "evidence", "schema", "source_drift_attestation", "status", "target_id",
}
REVIEW_CHECK_KEYS = {
    "authorization_separation", "bridge_directions_and_nonclaims",
    "canonical_and_hashes", "exact_proposition_and_elaboration",
    "external_problem_source_authenticated", "independent_custody_review",
    "independent_mathematical_review", "mode_polarity_termination",
    "preflight_applicability", "source_and_declaration_anchors", "trust_profiles",
}


class PacketValidationError(ValueError):
    """Raised when the proposed packet fails closed."""


def _fail(message: str) -> None:
    raise PacketValidationError(message)


def _require_exact_keys(value: Any, expected: set[str], label: str) -> dict[str, Any]:
    if type(value) is not dict:
        _fail(f"{label}: must be an object")
    actual = set(value)
    if actual != expected:
        _fail(
            f"{label}: keys mismatch: "
            f"missing={sorted(expected - actual)}, extra={sorted(actual - expected)}"
        )
    return value


def _require_string(value: Any, label: str) -> str:
    if type(value) is not str or not value or value != value.strip():
        _fail(f"{label}: must be non-empty canonical text")
    return value


def _require_hex(value: Any, width: int, label: str) -> str:
    text = _require_string(value, label)
    pattern = _HEX40 if width == 40 else _HEX64
    if pattern.fullmatch(text) is None:
        _fail(f"{label}: must be lowercase {width}-hex")
    return text


def _require_list(value: Any, label: str) -> list[Any]:
    if type(value) is not list or not value:
        _fail(f"{label}: must be a non-empty array")
    return value


def load_canonical(path: Path) -> dict[str, Any]:
    try:
        value = parse_stored_json_bytes(path.read_bytes())
    except (OSError, CapConfigurationSchemaError) as exc:
        raise PacketValidationError(f"{path}: {exc}") from exc
    if type(value) is not dict:
        _fail(f"{path}: top-level value must be an object")
    return value


def verify_structured_record(
    value: dict[str, Any], *, field: str, domain: str, label: str
) -> str:
    claimed = value.get(field)
    if type(claimed) is not str:
        _fail(f"{label}: {field} must be a string")
    body = dict(value)
    del body[field]
    actual = structured_hash(domain, body)
    if claimed != actual:
        _fail(f"{label}: {field} mismatch: claimed={claimed}, actual={actual}")
    return actual


def _git_bytes(repo_root: Path, revision: str, path: str) -> bytes:
    completed = subprocess.run(
        ["git", "show", f"{revision}:{path}"],
        cwd=repo_root,
        check=False,
        capture_output=True,
    )
    if completed.returncode != 0:
        _fail(
            f"git show {revision}:{path} failed: "
            f"{completed.stderr.decode('utf-8', errors='replace').strip()}"
        )
    return completed.stdout


def _git_commit(repo_root: Path, revision: str, label: str) -> str:
    completed = subprocess.run(
        ["git", "rev-parse", "--verify", f"{revision}^{{commit}}"],
        cwd=repo_root,
        check=False,
        capture_output=True,
        text=True,
    )
    if completed.returncode != 0:
        _fail(f"{label}: cannot resolve commit {revision}")
    return _require_hex(completed.stdout.strip(), 40, label)


def _git_parent(repo_root: Path, commit: str, label: str) -> str:
    return _git_commit(repo_root, f"{commit}^", label)


def _git_is_ancestor(repo_root: Path, ancestor: str, descendant: str, label: str) -> None:
    completed = subprocess.run(
        ["git", "merge-base", "--is-ancestor", ancestor, descendant],
        cwd=repo_root,
        check=False,
        capture_output=True,
        text=True,
    )
    if completed.returncode != 0:
        _fail(f"{label}: {ancestor} is not an ancestor of {descendant}")


def _verify_raw(claimed: Any, payload: bytes, label: str) -> None:
    actual = raw_sha256(payload)
    if claimed != actual:
        _fail(f"{label}: raw SHA-256 mismatch: claimed={claimed}, actual={actual}")


def _parse_utc(value: Any, label: str) -> datetime:
    text = _require_string(value, label)
    if re.fullmatch(
        r"[0-9]{4}-[0-9]{2}-[0-9]{2}T[0-9]{2}:[0-9]{2}:[0-9]{2}Z", text
    ) is None:
        _fail(f"{label}: must be canonical UTC")
    try:
        return datetime.strptime(text, "%Y-%m-%dT%H:%M:%SZ").replace(tzinfo=UTC)
    except ValueError as exc:
        raise PacketValidationError(f"{label}: invalid UTC timestamp") from exc


def _verify_source_identity(
    repo_root: Path,
    source: dict[str, Any],
    *,
    formal_conjectures_root: Path | None,
    require_external_sources: bool,
) -> list[str]:
    _require_exact_keys(source, SOURCE_KEYS, "source identity")
    if source.get("schema") != "cap-configuration-t0-source-identity/v1":
        _fail("source identity: wrong schema")
    if source.get("target_id") != TARGET_ID:
        _fail("source identity: wrong target_id")
    if source.get("status") != "DRAFT_NONNORMATIVE_NOT_AUTHORIZED":
        _fail("source identity: status must remain draft and unauthorized")
    if source.get("kernel_dependency_manifest_sha256") != "MISSING_NOT_MINED_FOR_T0_CANDIDATE":
        _fail("source identity: kernel-dependency limitation must remain explicit")
    verify_structured_record(
        source,
        field="source_identity_sha256",
        domain="cap-configuration-t0-source-identity/v1",
        label="source identity",
    )
    repository = _require_exact_keys(
        source["repository"],
        {"base_head", "candidate_branch", "source_tree_clean_before_lane_record"},
        "source identity.repository",
    )
    base_head = _require_hex(repository["base_head"], 40, "source identity.base_head")
    if base_head != EXPECTED_BASE_HEAD:
        _fail("source identity: unexpected packet base_head")
    if repository["candidate_branch"] != EXPECTED_BRANCH:
        _fail("source identity: unexpected candidate branch")
    if repository["source_tree_clean_before_lane_record"] is not True:
        _fail("source identity: source tree must have been clean at selection")
    scope = _require_exact_keys(
        source["scope"],
        {"complete_kernel_dependency_closure", "description", "line_anchors_valid_only_at_base_head"},
        "source identity.scope",
    )
    if scope["complete_kernel_dependency_closure"] is not False:
        _fail("source identity: kernel dependency closure must not be overstated")
    if scope["line_anchors_valid_only_at_base_head"] is not True:
        _fail("source identity: line-anchor revision limit must remain explicit")
    _require_string(scope["description"], "source identity.scope.description")

    files = _require_list(source["files"], "source identity.files")
    seen_paths: set[str] = set()
    roles: list[str] = []
    for item in files:
        item = _require_exact_keys(
            item, {"bytes", "path", "raw_sha256", "role"}, "source identity.files[]"
        )
        path = _require_string(item["path"], "source identity file path")
        if path in seen_paths:
            _fail(f"source identity: duplicate file path {path}")
        seen_paths.add(path)
        roles.append(_require_string(item["role"], f"source identity: {path} role"))
        if type(item["bytes"]) is not int or item["bytes"] < 1:
            _fail(f"source identity: {path} bytes must be a positive integer")
        _require_hex(item["raw_sha256"], 64, f"source identity: {path} raw_sha256")
        if path.startswith("lean/"):
            payload = _git_bytes(repo_root, base_head, path)
            if item.get("bytes") != len(payload):
                _fail(f"source identity: {path} byte count mismatch")
            _verify_raw(item.get("raw_sha256"), payload, f"source identity: {path}")
    if roles.count("TARGET_SOURCE") != 1:
        _fail("source identity: exactly one TARGET_SOURCE is required")
    if roles.count("IMPORTED_PROBLEM_SOURCE") != 1:
        _fail("source identity: exactly one IMPORTED_PROBLEM_SOURCE is required")

    build_identity = _require_exact_keys(
        source["build_identity"],
        {
            "dependency_lock", "formal_conjectures_revision", "lakefile",
            "lean_toolchain", "mathlib_revision",
        },
        "source identity.build_identity",
    )
    _require_hex(
        build_identity["formal_conjectures_revision"], 40,
        "source identity formal_conjectures revision",
    )
    _require_hex(build_identity["mathlib_revision"], 40, "source identity mathlib revision")
    expected_build_paths = {
        "dependency_lock": "lean/lake-manifest.json",
        "lakefile": "lean/lakefile.toml",
        "lean_toolchain": "lean/lean-toolchain",
    }
    build_payloads: dict[str, bytes] = {}
    for key in ("dependency_lock", "lakefile", "lean_toolchain"):
        expected_keys = {"path", "raw_sha256"}
        if key == "lean_toolchain":
            expected_keys.add("content")
        item = _require_exact_keys(
            build_identity[key], expected_keys, f"source identity.build_identity.{key}"
        )
        _require_string(item["path"], f"source identity.build_identity.{key}.path")
        if item["path"] != expected_build_paths[key]:
            _fail(f"source identity: unexpected build_identity.{key}.path")
        _require_hex(item["raw_sha256"], 64, f"source identity.build_identity.{key}.raw_sha256")
        payload = _git_bytes(repo_root, base_head, item["path"])
        build_payloads[key] = payload
        _verify_raw(item.get("raw_sha256"), payload, f"source identity: {key}")
    if build_identity["lean_toolchain"]["content"] != build_payloads["lean_toolchain"].decode(
        "utf-8"
    ).strip():
        _fail("source identity: lean_toolchain.content does not match pinned bytes")
    try:
        lock = json.loads(build_payloads["dependency_lock"])
        packages = {item["name"]: item for item in lock["packages"]}
    except (KeyError, TypeError, json.JSONDecodeError) as exc:
        raise PacketValidationError("source identity: malformed pinned lake-manifest") from exc
    if build_identity["formal_conjectures_revision"] != packages["formal_conjectures"]["rev"]:
        _fail("source identity: formal_conjectures revision does not match lockfile")
    if build_identity["mathlib_revision"] != packages["mathlib"]["rev"]:
        _fail("source identity: mathlib revision does not match lockfile")

    declarations = _require_list(source["declarations"], "source identity.declarations")
    declaration_names: set[str] = set()
    for declaration in declarations:
        declaration = _require_exact_keys(
            declaration,
            {
                "declaration_sha256", "end_line_inclusive", "fqn", "path", "role",
                "start_line",
            },
            "source identity.declarations[]",
        )
        fqn = _require_string(declaration["fqn"], "source identity declaration fqn")
        if fqn in declaration_names:
            _fail(f"source identity: duplicate declaration {fqn}")
        declaration_names.add(fqn)
        path = _require_string(declaration["path"], "source identity declaration path")
        if path not in seen_paths:
            _fail(f"source identity: declaration path is absent from files: {path}")
        payload = _git_bytes(repo_root, base_head, declaration["path"])
        lines = payload.splitlines(keepends=True)
        start = declaration["start_line"]
        end = declaration["end_line_inclusive"]
        if (
            type(start) is not int
            or type(end) is not int
            or start < 1
            or end < start
            or end > len(lines)
        ):
            _fail(f"source identity: invalid declaration range for {fqn}")
        segment = b"".join(lines[start - 1 : end])
        _verify_raw(
            declaration.get("declaration_sha256"),
            segment,
            f"source identity: {declaration.get('fqn')}",
        )

    warnings: list[str] = []
    formal_entries = [item for item in files if item["path"].startswith("formal_conjectures@")]
    if len(formal_entries) != 1:
        _fail("source identity: expected exactly one formal_conjectures problem source")
    for item in formal_entries:
        expected_external_path = (
            f"formal_conjectures@{build_identity['formal_conjectures_revision']}/"
            f"{EXPECTED_FORMAL_SOURCE_RELATIVE}"
        )
        if item["path"] != expected_external_path:
            _fail("source identity: imported problem path/revision mismatch")
        external_root = (
            formal_conjectures_root
            if formal_conjectures_root is not None
            else repo_root / "lean/.lake/packages/formal_conjectures"
        )
        external_root = external_root.resolve()
        local = (external_root / EXPECTED_FORMAL_SOURCE_RELATIVE).resolve()
        if not local.is_relative_to(external_root):
            _fail("source identity: imported problem path escapes external source root")
        if local.is_file():
            payload = local.read_bytes()
            if item.get("bytes") != len(payload):
                _fail(f"source identity: {item['path']} byte count mismatch")
            _verify_raw(item.get("raw_sha256"), payload, f"source identity: {item['path']}")
        else:
            message = f"external source not materialized locally: {item['path']}"
            if require_external_sources:
                _fail(f"source identity: {message}")
            warnings.append(message)
    return warnings


def _verify_preflight(preflight: dict[str, Any], source: dict[str, Any]) -> None:
    _require_exact_keys(preflight, PREFLIGHT_KEYS, "preflight")
    if preflight.get("schema") != "cap-configuration-t0-preflight/v1":
        _fail("preflight: wrong schema")
    if preflight.get("target_id") != TARGET_ID:
        _fail("preflight: wrong target_id")
    if preflight.get("status") != "DRAFT_NONNORMATIVE_NOT_AUTHORIZED":
        _fail("preflight: status must remain draft and unauthorized")
    if preflight.get("verdict") != "NO_REUSABLE_TARGET_CLOSURE_FOUND":
        _fail("preflight: unexpected verdict")
    _require_string(preflight["first_missing_antecedent"], "preflight first missing antecedent")
    _parse_utc(preflight["recorded_utc"], "preflight recorded_utc")
    verify_structured_record(
        preflight,
        field="preflight_sha256",
        domain="cap-configuration-t0-preflight/v1",
        label="preflight",
    )
    applicability = _require_exact_keys(
        preflight["applicability"],
        {
            "accepted_base_head", "relevant_source_changed_since_search",
            "searched_revision_source_raw_sha256", "selected_base_source_raw_sha256",
        },
        "preflight.applicability",
    )
    repository = source["repository"]
    source_file = next(item for item in source["files"] if item["role"] == "TARGET_SOURCE")
    if applicability["accepted_base_head"] != repository["base_head"]:
        _fail("preflight: accepted_base_head does not match source base_head")
    if applicability["relevant_source_changed_since_search"] is not False:
        _fail("preflight: relevant source must remain byte-identical")
    for key in ("searched_revision_source_raw_sha256", "selected_base_source_raw_sha256"):
        if applicability[key] != source_file["raw_sha256"]:
            _fail(f"preflight: applicability.{key} does not match target source")
    searched_revision = _require_exact_keys(
        preflight["searched_revision"],
        {"exact_execution_time_utc", "execution_date_utc", "repository_head"},
        "preflight.searched_revision",
    )
    _require_hex(searched_revision["repository_head"], 40, "preflight searched revision")
    if searched_revision["repository_head"] != "2d6eb3ef92ea381990c12b2633a7bfd015e28174":
        _fail("preflight: unexpected searched revision")
    if searched_revision["execution_date_utc"] != "2026-08-27":
        _fail("preflight: unexpected execution date")
    if searched_revision["exact_execution_time_utc"] != "UNKNOWN_NOT_RETAINED":
        _fail("preflight: exact execution-time limitation must remain explicit")
    retention = _require_exact_keys(
        preflight["raw_output_retention"],
        {"raw_log_sha256", "status", "warning"},
        "preflight.raw_output_retention",
    )
    if retention.get("status") != "CANONICAL_SUMMARY_ONLY":
        _fail("preflight: raw-output limitation must remain explicit")
    if retention["raw_log_sha256"] != "MISSING_NOT_RETAINED":
        _fail("preflight: missing raw-log limitation must remain explicit")
    _require_string(retention["warning"], "preflight retention warning")
    inventory = _require_list(preflight["result_inventory"], "preflight.result_inventory")
    inventory_fqns: set[str] = set()
    for item in inventory:
        item = _require_exact_keys(item, {"fqn", "relevance"}, "preflight.result_inventory[]")
        inventory_fqns.add(_require_string(item["fqn"], "preflight result fqn"))
        _require_string(item["relevance"], "preflight result relevance")
    expected_inventory = {
        "Problem97.ATailBlockerVExactSeventeenSourceNormalForm.exists_sourceRealization_of_geometricExactCover",
        "Problem97.ATailFrontierLiveClosure.exists_exactSeventeenSourceRealization_of_exactCover",
        "Problem97.ATailFrontierLiveClosure.exactFourRigid221_blockerV_exactSeventeen_secondCapNine_outsideRows_unused_or_exactCover",
        "Problem97.ATailFrontierLiveClosure.oppApex2_not_mem_capByIndex_oppIndex2_for_exactSeventeen",
    }
    if inventory_fqns != expected_inventory:
        _fail("preflight: result inventory mismatch")
    searches = _require_list(preflight["searches"], "preflight.searches")
    expected_commands = {
        "proof-blueprint search 'exactSeventeen SourceRealization exactCover' --limit 20 --json": (
            "exactSeventeen SourceRealization exactCover", "current project indexed Lean corpus"
        ),
        "nthdegree docs search --lean \"exact seventeen cap nine exact cover source realization finite cell atom entitlement\"": (
            "exact seventeen cap nine exact cover source realization finite cell atom entitlement",
            "all configured Lean corpora",
        ),
    }
    seen_commands: set[str] = set()
    for item in searches:
        item = _require_exact_keys(
            item, {"command", "findings", "key", "scope"}, "preflight.searches[]"
        )
        command = _require_string(item["command"], "preflight search command")
        seen_commands.add(command)
        if command not in expected_commands:
            _fail("preflight: unexpected search command")
        if (item["key"], item["scope"]) != expected_commands[command]:
            _fail("preflight: search key or scope mismatch")
        _require_list(item["findings"], "preflight search findings")
    if seen_commands != set(expected_commands):
        _fail("preflight: required searches are missing")


def _verify_target(
    source_path: Path,
    source: dict[str, Any],
    preflight_path: Path,
    preflight: dict[str, Any],
    target: dict[str, Any],
) -> None:
    _require_exact_keys(target, TARGET_KEYS, "target")
    if target.get("schema") != "cap-configuration-t0-target/v1":
        _fail("target: wrong schema")
    if target.get("target_id") != TARGET_ID:
        _fail("target: wrong target_id")
    verify_structured_record(
        target,
        field="target_sha256",
        domain="cap-configuration-t0-target/v1",
        label="target",
    )
    proposition = _require_exact_keys(
        target["elaborated_proposition"],
        {
            "elaboration_check", "lean_text", "namespace_context", "open_namespaces",
            "open_scoped", "proposition_utf8_sha256", "status",
        },
        "target.elaborated_proposition",
    )
    _require_string(proposition["lean_text"], "target elaborated proposition")
    _require_list(proposition["namespace_context"], "target proposition namespace_context")
    _require_list(proposition["open_namespaces"], "target proposition open_namespaces")
    _require_list(proposition["open_scoped"], "target proposition open_scoped")
    _require_exact_keys(
        proposition["elaboration_check"],
        {"base_head", "method", "result", "source_changes"},
        "target proposition elaboration_check",
    )
    elaboration = proposition["elaboration_check"]
    if elaboration["base_head"] != source["repository"]["base_head"]:
        _fail("target: proposition elaboration base_head mismatch")
    if elaboration["result"] != "PASS":
        _fail("target: proposition elaboration result must be PASS")
    if elaboration["source_changes"] is not False:
        _fail("target: proposition check must not change source")
    _require_string(elaboration["method"], "target proposition elaboration method")
    if proposition["namespace_context"] != [
        "Problem97", "Problem97.ATailFrontierLiveClosure"
    ]:
        _fail("target: proposition namespace context mismatch")
    if proposition["open_scoped"] != ["EuclideanGeometry"]:
        _fail("target: proposition scoped-open context mismatch")
    if proposition["status"] != "PROPOSED_EXACT_ANCHORED_RESIDUAL_NOT_AN_EXISTING_DECLARATION":
        _fail("target: proposition status mismatch")
    if proposition["proposition_utf8_sha256"] != EXPECTED_PROPOSITION_SHA256:
        _fail("target: unexpected proposition digest")
    _verify_raw(
        proposition.get("proposition_utf8_sha256"),
        proposition["lean_text"].encode("utf-8"),
        "target: elaborated proposition",
    )
    identity = _require_exact_keys(
        target["identity"],
        {
            "repository_base_head", "source_identity_path", "source_identity_raw_sha256",
            "source_identity_sha256", "theorem_bank_preflight_path",
            "theorem_bank_preflight_raw_sha256", "theorem_bank_preflight_sha256",
        },
        "target.identity",
    )
    expected = {
        "repository_base_head": source["repository"]["base_head"],
        "source_identity_path": str(SOURCE_PATH),
        "source_identity_raw_sha256": raw_sha256(source_path.read_bytes()),
        "source_identity_sha256": source["source_identity_sha256"],
        "theorem_bank_preflight_path": str(PREFLIGHT_PATH),
        "theorem_bank_preflight_raw_sha256": raw_sha256(preflight_path.read_bytes()),
        "theorem_bank_preflight_sha256": preflight["preflight_sha256"],
    }
    for key, value in expected.items():
        if identity.get(key) != value:
            _fail(f"target: identity.{key} mismatch")
    flags = _require_exact_keys(
        target["claim_flags"],
        {
            "aggregate_lean_theorem", "atom_entitlement_complete",
            "certificate_lean_promotion", "finite_raw_cell_exhaustiveness",
            "live_search_ready", "source_to_cell_coverage", "symmetry_transport_complete",
            "t0_accepted", "t1a_accepted", "target_closed",
        },
        "target.claim_flags",
    )
    if any(value is not False for value in flags.values()):
        _fail("target: every pre-acceptance claim flag must be false")
    authorization = _require_exact_keys(
        target["active_plan_authorization"],
        {
            "candidate_packet_authorized", "coordinator_acceptance_required",
            "live_search_authorized", "solver_campaign_authorized", "statement",
        },
        "target.active_plan_authorization",
    )
    if authorization["candidate_packet_authorized"] is not True:
        _fail("target: candidate packet authorization must be explicit")
    if authorization["coordinator_acceptance_required"] is not True:
        _fail("target: coordinator acceptance must remain required")
    if authorization["live_search_authorized"] is not False:
        _fail("target: live search must remain unauthorized")
    if authorization["solver_campaign_authorized"] is not False:
        _fail("target: solver campaign must remain unauthorized")

    source_problem = _require_exact_keys(
        target["source_problem"],
        {
            "imported_fqn", "imported_path", "imported_raw_sha256", "local_source_path",
            "local_source_raw_sha256",
        },
        "target.source_problem",
    )
    source_files = source["files"]
    local_source = next(item for item in source_files if item["role"] == "TARGET_SOURCE")
    imported_source = next(
        item for item in source_files if item["role"] == "IMPORTED_PROBLEM_SOURCE"
    )
    if source_problem["local_source_path"] != local_source["path"]:
        _fail("target: local problem source path mismatch")
    if source_problem["local_source_raw_sha256"] != local_source["raw_sha256"]:
        _fail("target: local problem source hash mismatch")
    if source_problem["imported_path"] != imported_source["path"]:
        _fail("target: imported problem source path mismatch")
    if source_problem["imported_raw_sha256"] != imported_source["raw_sha256"]:
        _fail("target: imported problem source hash mismatch")
    if source_problem["imported_fqn"] != "Erdos97.erdos_97":
        _fail("target: imported problem theorem mismatch")

    target_preflight = _require_exact_keys(
        target["theorem_bank_preflight"],
        {"path", "raw_sha256", "structured_sha256", "verdict"},
        "target.theorem_bank_preflight",
    )
    if target_preflight["path"] != str(PREFLIGHT_PATH):
        _fail("target: theorem-bank preflight path mismatch")
    if target_preflight["raw_sha256"] != raw_sha256(preflight_path.read_bytes()):
        _fail("target: theorem-bank preflight raw hash mismatch")
    if target_preflight["structured_sha256"] != preflight["preflight_sha256"]:
        _fail("target: theorem-bank preflight structured hash mismatch")
    if target_preflight["verdict"] != preflight["verdict"]:
        _fail("target: theorem-bank preflight verdict mismatch")

    for key in (
        "branch_outcomes", "conclusions_that_must_reach_the_encoder",
        "directional_bridges", "evidence_forbidden_from_stopping_with_target_completion",
        "evidence_permitted_to_stop_with_target_completion", "explicitly_forbidden_claims",
        "hard_stop_conditions", "hypotheses_and_quantifiers", "omissions", "trust_profiles",
        "unresolved_coordinator_decisions",
    ):
        value = target[key]
        if type(value) is list:
            _require_list(value, f"target.{key}")
        elif type(value) is dict and not value:
            _fail(f"target.{key}: must be a non-empty object")
    if target.get("status") != "DRAFT_NONNORMATIVE_NOT_AUTHORIZED":
        _fail("target: status must remain draft and unauthorized")
    if target.get("selection_status") != (
        "RECOMMENDED_PENDING_INDEPENDENT_REVIEW_AND_COORDINATOR_ACCEPTANCE"
    ):
        _fail("target: selection status mismatch")
    if target.get("target_mode") != "NEGATIVE_BRANCH_CLOSURE":
        _fail("target: target mode mismatch")
    if target.get("proposition_polarity") != "EMPTY_SOURCE_BRANCH_UNIVERSAL_NEGATION":
        _fail("target: proposition polarity mismatch")
    termination = _require_exact_keys(
        target["termination_policy"], {"kind", "partial_result_effect", "scope"},
        "target.termination_policy",
    )
    if termination["kind"] != "EXHAUSTIVE":
        _fail("target: termination policy must be exhaustive")
    if termination["partial_result_effect"] != "DIAGNOSTIC_ONLY_NO_TARGET_COMPLETION":
        _fail("target: partial-result effect mismatch")


def _verify_review(
    source_path: Path,
    source: dict[str, Any],
    preflight_path: Path,
    preflight: dict[str, Any],
    target_path: Path,
    target: dict[str, Any],
    review: dict[str, Any],
) -> None:
    _require_exact_keys(review, REVIEW_KEYS, "review")
    if review.get("schema") != "cap-configuration-t0-review/v1":
        _fail("review: wrong schema")
    if review.get("target_id") != TARGET_ID:
        _fail("review: wrong target_id")
    verify_structured_record(
        review,
        field="review_sha256",
        domain="cap-configuration-t0-review/v1",
        label="review",
    )
    if review["reviewed_base_head"] != source["repository"]["base_head"]:
        _fail("review: reviewed_base_head does not match source base_head")
    _parse_utc(review["reviewed_utc"], "review reviewed_utc")
    artifacts = _require_exact_keys(
        review["artifacts"],
        {"human_review", "preflight", "source_identity", "target"},
        "review.artifacts",
    )
    expected = {
        "source_identity": (
            str(SOURCE_PATH),
            source["source_identity_sha256"],
            raw_sha256(source_path.read_bytes()),
        ),
        "preflight": (
            str(PREFLIGHT_PATH),
            preflight["preflight_sha256"],
            raw_sha256(preflight_path.read_bytes()),
        ),
        "target": (
            str(TARGET_PATH),
            target["target_sha256"],
            raw_sha256(target_path.read_bytes()),
        ),
    }
    for key, (path, structured, raw) in expected.items():
        item = _require_exact_keys(
            artifacts[key],
            {"path", "raw_sha256", "structured_sha256"},
            f"review.artifacts.{key}",
        )
        if item.get("path") != path:
            _fail(f"review: artifacts.{key}.path mismatch")
        if item.get("structured_sha256") != structured:
            _fail(f"review: artifacts.{key}.structured_sha256 mismatch")
        if item.get("raw_sha256") != raw:
            _fail(f"review: artifacts.{key}.raw_sha256 mismatch")
    human_review = _require_exact_keys(
        artifacts["human_review"], {"path", "raw_sha256"}, "review.artifacts.human_review"
    )
    human_path = Path(human_review["path"])
    if human_path.is_absolute() or ".." in human_path.parts:
        _fail("review: human-review path must be repository-relative")
    _verify_raw(
        human_review["raw_sha256"],
        (source_path.parents[1] / human_path).read_bytes(),
        "review: human review",
    )
    reviewers = _require_list(review["reviewers"], "review.reviewers")
    if len(reviewers) != 2:
        _fail("review: exactly two independent reviewers are required")
    roles: set[str] = set()
    tasks: set[str] = set()
    identities: set[str] = set()
    for reviewer in reviewers:
        reviewer = _require_exact_keys(
            reviewer,
            {
                "agent_task", "blocking_findings", "nonblocking_findings",
                "remediations_verified", "reviewer_identity", "role", "verdict",
            },
            "review.reviewers[]",
        )
        role = _require_string(reviewer["role"], "review reviewer role")
        task = _require_string(reviewer["agent_task"], "review reviewer task")
        identity = _require_string(reviewer["reviewer_identity"], "reviewer identity")
        if role in roles or task in tasks or identity in identities:
            _fail("review: reviewer roles, tasks, and identities must be distinct")
        roles.add(role)
        tasks.add(task)
        identities.add(identity)
        if reviewer["verdict"] != "PASS_FOR_COORDINATOR_REVIEW":
            _fail(f"review: reviewer {task} did not pass the remediated packet")
        if reviewer["blocking_findings"] != []:
            _fail(f"review: reviewer {task} retains blocking findings")
        if type(reviewer["nonblocking_findings"]) is not list:
            _fail("review: nonblocking_findings must be an array")
        _require_list(reviewer["remediations_verified"], "review remediations_verified")
    if roles != {"INDEPENDENT_CUSTODY_SCHEMA", "INDEPENDENT_MATHEMATICAL_SOURCE"}:
        _fail("review: required independent reviewer roles are missing")

    checks = _require_exact_keys(review["checks"], REVIEW_CHECK_KEYS, "review.checks")
    if any(value is not True for value in checks.values()):
        _fail("review: every declared review check must pass")
    authorization = _require_exact_keys(
        review["authorization"],
        {
            "acceptance_record_present", "coordinator_acceptance_required",
            "live_search_authorized", "solver_campaign_authorized", "t0_accepted",
        },
        "review.authorization",
    )
    if authorization != {
        "acceptance_record_present": False,
        "coordinator_acceptance_required": True,
        "live_search_authorized": False,
        "solver_campaign_authorized": False,
        "t0_accepted": False,
    }:
        _fail("review: authorization boundary mismatch")
    if review.get("verdict") != "PASSED_FOR_COORDINATOR_REVIEW":
        _fail("review: verdict must be PASSED_FOR_COORDINATOR_REVIEW")
    if review.get("status") != "REVIEWED_CANDIDATE_NOT_ACCEPTED":
        _fail("review: status must remain reviewed but not accepted")
    blockers = review["unresolved_blockers"]
    if blockers != ["COORDINATOR_ACCEPTANCE_MISSING"]:
        _fail("review: coordinator acceptance must be the sole T0 blocker")


def _artifact_bindings(
    source_path: Path,
    source: dict[str, Any],
    preflight_path: Path,
    preflight: dict[str, Any],
    target_path: Path,
    target: dict[str, Any],
    review_path: Path,
    review: dict[str, Any],
) -> dict[str, tuple[str, str, str]]:
    return {
        "source_identity": (
            str(SOURCE_PATH), source["source_identity_sha256"], raw_sha256(source_path.read_bytes())
        ),
        "preflight": (
            str(PREFLIGHT_PATH), preflight["preflight_sha256"], raw_sha256(preflight_path.read_bytes())
        ),
        "target": (
            str(TARGET_PATH), target["target_sha256"], raw_sha256(target_path.read_bytes())
        ),
        "review": (
            str(REVIEW_PATH), review["review_sha256"], raw_sha256(review_path.read_bytes())
        ),
    }


def _verify_artifacts(
    artifacts: Any,
    expected: dict[str, tuple[str, str, str]],
    *,
    label: str,
) -> None:
    artifacts = _require_exact_keys(artifacts, set(expected), label)
    for key, (path, structured, raw) in expected.items():
        item = _require_exact_keys(
            artifacts[key], {"path", "raw_sha256", "structured_sha256"},
            f"{label}.{key}",
        )
        if (item["path"], item["structured_sha256"], item["raw_sha256"]) != (
            path, structured, raw
        ):
            _fail(f"{label}.{key}: binding mismatch")


def _verify_packet_binding(
    repo_root: Path,
    packet: Any,
    expected_artifacts: dict[str, tuple[str, str, str]],
) -> None:
    packet = _require_exact_keys(
        packet,
        {"artifacts", "branch", "commit", "packet_sha256", "parent"},
        "packet binding",
    )
    verify_structured_record(
        packet,
        field="packet_sha256",
        domain="cap-configuration-t0-packet-binding/v1",
        label="packet binding",
    )
    if packet["branch"] != EXPECTED_BRANCH:
        _fail("packet binding: unexpected branch")
    commit = _require_hex(packet["commit"], 40, "packet binding commit")
    if commit != EXPECTED_PACKET_COMMIT:
        _fail("packet binding: unexpected reviewed packet commit")
    parent = _require_hex(packet["parent"], 40, "packet binding parent")
    if parent != EXPECTED_BASE_HEAD:
        _fail("packet binding: unexpected parent")
    if _git_commit(repo_root, commit, "packet binding commit") != commit:
        _fail("packet binding: commit did not resolve exactly")
    if _git_parent(repo_root, commit, "packet binding parent") != parent:
        _fail("packet binding: packet parent mismatch")
    _verify_artifacts(packet["artifacts"], expected_artifacts, label="packet artifacts")
    for key, (path, _structured, raw) in expected_artifacts.items():
        _verify_raw(raw, _git_bytes(repo_root, commit, path), f"packet commit artifact {key}")


def _reviewer_identities(review: dict[str, Any]) -> list[str]:
    return sorted(reviewer["reviewer_identity"] for reviewer in review["reviewers"])


def _verify_source_at_head(
    repo_root: Path,
    source: dict[str, Any],
    head: str,
    *,
    label: str,
) -> None:
    for item in source["files"]:
        path = item["path"]
        if path.startswith("formal_conjectures@"):
            continue
        _verify_raw(
            item["raw_sha256"],
            _git_bytes(repo_root, head, path),
            f"{label}: {path}",
        )
    build_identity = source["build_identity"]
    for key in ("dependency_lock", "lakefile", "lean_toolchain"):
        item = build_identity[key]
        _verify_raw(
            item["raw_sha256"],
            _git_bytes(repo_root, head, item["path"]),
            f"{label}: {item['path']}",
        )


def _verify_source_drift_attestation(
    repo_root: Path,
    source: dict[str, Any],
    attestation: Any,
    *,
    label: str,
    expected_checked_head: str | None,
    require_observed_branch_head: bool,
) -> str:
    attestation = _require_exact_keys(
        attestation,
        {
            "base_head", "checked_head", "checked_scope", "external_source_policy",
            "observed_branch", "status", "verification_scope",
        },
        label,
    )
    if attestation["base_head"] != EXPECTED_BASE_HEAD:
        _fail(f"{label}: wrong base_head")
    checked_head = _require_hex(attestation["checked_head"], 40, f"{label}.checked_head")
    if expected_checked_head is not None and checked_head != expected_checked_head:
        _fail(f"{label}: unexpected checked_head")
    if attestation["observed_branch"] != EXPECTED_MAIN_BRANCH:
        _fail(f"{label}: wrong observed branch")
    if attestation["verification_scope"] != "COMMITTED_GIT_OBJECTS_ONLY":
        _fail(f"{label}: wrong verification scope")
    if attestation["checked_scope"] != "SOURCE_MANIFEST_FILES_AND_BUILD_IDENTITY":
        _fail(f"{label}: wrong checked scope")
    if attestation["external_source_policy"] != "PINNED_REVISION_AND_RAW_SHA256":
        _fail(f"{label}: wrong external-source policy")
    if attestation["status"] != "PASS_NO_RELEVANT_SOURCE_DRIFT":
        _fail(f"{label}: source drift did not pass")
    if _git_commit(repo_root, checked_head, f"{label}.checked_head") != checked_head:
        _fail(f"{label}: checked_head did not resolve exactly")
    if require_observed_branch_head:
        branch_head = _git_commit(
            repo_root,
            f"refs/heads/{EXPECTED_MAIN_BRANCH}",
            f"{label}.observed_branch",
        )
        if branch_head != checked_head:
            _fail(f"{label}: observed branch ref does not equal checked_head")
    _git_is_ancestor(repo_root, EXPECTED_BASE_HEAD, checked_head, label)
    _verify_source_at_head(repo_root, source, checked_head, label=label)
    return checked_head


_REQUEST_LIMITATIONS = [
    "REQUEST_IS_NOT_COORDINATOR_ACCEPTANCE",
    "T0_DOES_NOT_AUTHORIZE_PHASE1_LIVE_SEARCH_OR_SOLVER_CAMPAIGNS",
    "SOURCE_ATTESTATION_COVERS_COMMITTED_GIT_OBJECTS_NOT_SHARED_WORKTREE_BYTES",
    "KERNEL_MINED_TRANSITIVE_DEPENDENCY_MANIFEST_NOT_AVAILABLE_AT_T0",
]


def _verify_acceptance_request(
    repo_root: Path,
    source: dict[str, Any],
    review: dict[str, Any],
    expected_artifacts: dict[str, tuple[str, str, str]],
    request: dict[str, Any],
    *,
    require_observed_branch_head: bool = True,
) -> None:
    _require_exact_keys(request, REQUEST_KEYS, "acceptance request")
    if request["schema"] != "cap-configuration-t0-acceptance-request/v1":
        _fail("acceptance request: wrong schema")
    if request["target_id"] != TARGET_ID:
        _fail("acceptance request: wrong target_id")
    _parse_utc(request["requested_utc"], "acceptance request requested_utc")
    verify_structured_record(
        request,
        field="request_sha256",
        domain="cap-configuration-t0-acceptance-request/v1",
        label="acceptance request",
    )
    requester = _require_exact_keys(
        request["requester"], {"identity", "role"}, "acceptance request.requester"
    )
    _require_string(requester["identity"], "acceptance request requester identity")
    if requester["role"] != "T0_PACKET_CUSTODIAN":
        _fail("acceptance request: wrong requester role")
    decision_requested = _require_exact_keys(
        request["decision_requested"],
        {"allowed_decisions", "coordinator_role", "scope"},
        "acceptance request.decision_requested",
    )
    if decision_requested != {
        "allowed_decisions": ["ACCEPT", "REJECT"],
        "coordinator_role": "T0_COORDINATOR",
        "scope": "T0_TARGET_CONTRACT_ONLY",
    }:
        _fail("acceptance request: decision boundary mismatch")
    evidence = _require_exact_keys(
        request["evidence"], {"packet", "reviewer_identities"},
        "acceptance request.evidence",
    )
    _verify_packet_binding(repo_root, evidence["packet"], expected_artifacts)
    if evidence["reviewer_identities"] != _reviewer_identities(review):
        _fail("acceptance request: reviewer identities mismatch")
    _verify_source_drift_attestation(
        repo_root,
        source,
        request["source_drift_attestation"],
        label="acceptance request source drift",
        expected_checked_head=EXPECTED_REQUEST_MAIN_HEAD,
        require_observed_branch_head=require_observed_branch_head,
    )
    authorization = _require_exact_keys(
        request["authorization"],
        {
            "live_search_authorized", "phase1_authorized",
            "solver_campaign_authorized", "t0_target_contract_accepted",
        },
        "acceptance request.authorization",
    )
    if authorization != {
        "live_search_authorized": False,
        "phase1_authorized": False,
        "solver_campaign_authorized": False,
        "t0_target_contract_accepted": False,
    }:
        _fail("acceptance request: authorization must remain entirely false")
    if request["limitations"] != _REQUEST_LIMITATIONS:
        _fail("acceptance request: limitations mismatch")
    if request["status"] != "SUBMITTED_PENDING_COORDINATOR":
        _fail("acceptance request: status must remain pending coordinator")


def _verify_acceptance(
    repo_root: Path,
    source_path: Path,
    source: dict[str, Any],
    preflight_path: Path,
    preflight: dict[str, Any],
    target_path: Path,
    target: dict[str, Any],
    review_path: Path,
    review: dict[str, Any],
    request_path: Path,
    request: dict[str, Any],
    acceptance: dict[str, Any],
) -> None:
    canonical_request_path = (repo_root / REQUEST_PATH).resolve()
    if request_path.resolve() != canonical_request_path:
        _fail(f"acceptance: request must use canonical repository path {REQUEST_PATH}")
    stored_request = load_canonical(request_path)
    if stored_request != request:
        _fail("acceptance: supplied request object differs from stored request bytes")
    expected_artifacts = _artifact_bindings(
        source_path, source, preflight_path, preflight, target_path, target, review_path, review
    )
    _verify_acceptance_request(
        repo_root,
        source,
        review,
        expected_artifacts,
        request,
        require_observed_branch_head=False,
    )
    _require_exact_keys(acceptance, ACCEPTANCE_KEYS, "acceptance")
    if acceptance["schema"] != "cap-configuration-t0-acceptance/v1":
        _fail("acceptance: wrong schema")
    if acceptance["target_id"] != TARGET_ID:
        _fail("acceptance: wrong target_id")
    accepted_utc = _parse_utc(acceptance["accepted_utc"], "acceptance accepted_utc")
    requested_utc = _parse_utc(request["requested_utc"], "acceptance request requested_utc")
    if accepted_utc < requested_utc:
        _fail("acceptance: accepted_utc predates the request")
    verify_structured_record(
        acceptance,
        field="acceptance_sha256",
        domain="cap-configuration-t0-acceptance/v1",
        label="acceptance",
    )
    evidence = _require_exact_keys(
        acceptance["evidence"], {"packet", "request", "reviewer_identities"},
        "acceptance.evidence",
    )
    request_binding = _require_exact_keys(
        evidence["request"], {"path", "raw_sha256", "structured_sha256"},
        "acceptance.evidence.request",
    )
    if request_binding != {
        "path": str(REQUEST_PATH),
        "raw_sha256": raw_sha256(request_path.read_bytes()),
        "structured_sha256": request["request_sha256"],
    }:
        _fail("acceptance: request binding mismatch")
    _verify_packet_binding(repo_root, evidence["packet"], expected_artifacts)
    if evidence["packet"] != request["evidence"]["packet"]:
        _fail("acceptance: packet differs from the pending request")
    identities = _reviewer_identities(review)
    if evidence["reviewer_identities"] != identities:
        _fail("acceptance: reviewer identities mismatch")
    if evidence["reviewer_identities"] != request["evidence"]["reviewer_identities"]:
        _fail("acceptance: reviewers differ from the pending request")
    accepted_head = _verify_source_drift_attestation(
        repo_root,
        source,
        acceptance["source_drift_attestation"],
        label="acceptance source drift",
        expected_checked_head=request["source_drift_attestation"]["checked_head"],
        require_observed_branch_head=False,
    )
    requested_head = request["source_drift_attestation"]["checked_head"]
    if accepted_head != requested_head:
        _fail("acceptance: accepted source head differs from the request")
    coordinator = _require_exact_keys(
        acceptance["coordinator"], {"decision", "identity", "role"},
        "acceptance.coordinator",
    )
    _require_string(coordinator["identity"], "acceptance coordinator identity")
    if coordinator["role"] != "T0_COORDINATOR" or coordinator["decision"] != "ACCEPT":
        _fail("acceptance: explicit T0 coordinator ACCEPT act is required")
    if acceptance["decision"] != "ACCEPT":
        _fail("acceptance: top-level decision must be ACCEPT")
    authorization = _require_exact_keys(
        acceptance["authorization"],
        {
            "live_search_authorized", "phase1_authorized",
            "solver_campaign_authorized", "t0_target_contract_accepted",
        },
        "acceptance.authorization",
    )
    if authorization != {
        "live_search_authorized": False,
        "phase1_authorized": False,
        "solver_campaign_authorized": False,
        "t0_target_contract_accepted": True,
    }:
        _fail("acceptance: T0 acceptance must not authorize downstream execution")
    if acceptance["status"] != "T0_ACCEPTED_TARGET_CONTRACT_ONLY":
        _fail("acceptance: wrong status")


def validate_packet(
    repo_root: Path,
    *,
    require_review: bool = True,
    formal_conjectures_root: Path | None = None,
    acceptance_path: Path | None = None,
) -> dict[str, Any]:
    source_path = repo_root / SOURCE_PATH
    preflight_path = repo_root / PREFLIGHT_PATH
    target_path = repo_root / TARGET_PATH
    review_path = repo_root / REVIEW_PATH
    request_path = repo_root / REQUEST_PATH
    source = load_canonical(source_path)
    preflight = load_canonical(preflight_path)
    target = load_canonical(target_path)
    warnings = _verify_source_identity(
        repo_root,
        source,
        formal_conjectures_root=formal_conjectures_root,
        require_external_sources=require_review,
    )
    _verify_preflight(preflight, source)
    _verify_target(source_path, source, preflight_path, preflight, target)
    result: dict[str, Any] = {
        "preflight_raw_sha256": raw_sha256(preflight_path.read_bytes()),
        "preflight_sha256": preflight["preflight_sha256"],
        "source_identity_raw_sha256": raw_sha256(source_path.read_bytes()),
        "source_identity_sha256": source["source_identity_sha256"],
        "target_raw_sha256": raw_sha256(target_path.read_bytes()),
        "target_sha256": target["target_sha256"],
        "warnings": warnings,
    }
    if require_review:
        review = load_canonical(review_path)
        _verify_review(
            source_path,
            source,
            preflight_path,
            preflight,
            target_path,
            target,
            review,
        )
        result["review_raw_sha256"] = raw_sha256(review_path.read_bytes())
        result["review_sha256"] = review["review_sha256"]
        request = load_canonical(request_path)
        expected_artifacts = _artifact_bindings(
            source_path,
            source,
            preflight_path,
            preflight,
            target_path,
            target,
            review_path,
            review,
        )
        _verify_acceptance_request(
            repo_root,
            source,
            review,
            expected_artifacts,
            request,
            require_observed_branch_head=acceptance_path is None,
        )
        result["acceptance_request_raw_sha256"] = raw_sha256(request_path.read_bytes())
        result["acceptance_request_sha256"] = request["request_sha256"]
        if acceptance_path is not None:
            canonical_acceptance_path = (repo_root / ACCEPTANCE_PATH).resolve()
            if acceptance_path.resolve() != canonical_acceptance_path:
                _fail(
                    "acceptance: --acceptance must name the canonical repository path "
                    f"{ACCEPTANCE_PATH}"
                )
            acceptance = load_canonical(acceptance_path)
            _verify_acceptance(
                repo_root,
                source_path,
                source,
                preflight_path,
                preflight,
                target_path,
                target,
                review_path,
                review,
                request_path,
                request,
                acceptance,
            )
            result["acceptance_raw_sha256"] = raw_sha256(acceptance_path.read_bytes())
            result["acceptance_sha256"] = acceptance["acceptance_sha256"]
    return result


def _parse_args() -> argparse.Namespace:
    parser = argparse.ArgumentParser(description=__doc__)
    parser.add_argument("--repo-root", type=Path, default=REPO_ROOT)
    parser.add_argument(
        "--formal-conjectures-root",
        type=Path,
        help="materialized formal_conjectures package root; required for a review pass",
    )
    mode = parser.add_mutually_exclusive_group()
    mode.add_argument(
        "--acceptance",
        type=Path,
        help=(
            "optional coordinator acceptance record; must be the canonical "
            f"repository path {ACCEPTANCE_PATH}"
        ),
    )
    mode.add_argument(
        "--target-only",
        action="store_true",
        help="validate before the review record exists",
    )
    return parser.parse_args()


def main() -> int:
    args = _parse_args()
    result = validate_packet(
        args.repo_root.resolve(),
        require_review=not args.target_only,
        formal_conjectures_root=(
            args.formal_conjectures_root.resolve()
            if args.formal_conjectures_root is not None
            else None
        ),
        acceptance_path=(args.acceptance.resolve() if args.acceptance is not None else None),
    )
    print(json.dumps(result, sort_keys=True, separators=(",", ":")))
    return 0


if __name__ == "__main__":
    raise SystemExit(main())
