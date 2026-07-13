"""Manifest-driven entrypoint for the permanent AHEAD card-head runner.

Only the lightweight specification preflight and read-only derived status are
enabled at this checkpoint.  The ``execute`` entrypoint validates the complete
preflight and then refuses to launch until the permanent mining/generation
worker lands.  This makes the command pinned in a run manifest fail closed
instead of falling back to historical scratch code or silently consuming the
active heavy-compute lease.
"""

from __future__ import annotations

import argparse
import json
import os
from collections.abc import Mapping
from pathlib import Path
from typing import Any

from .candidate_surface import (
    CandidateSurfaceError,
    validate_candidate_count_fixtures,
)
from .bank_store import BANKED_CERTIFICATE_SCHEMA, BANK_ROW_SCHEMA
from .cegar_adapter import PROPOSAL_SCHEMA
from .pattern_certificate import CERTIFICATE_SCHEMA, VERIFICATION_SCHEMA
from .run_manifest import (
    ManifestError,
    json_sha256,
    verify_source_digests,
)
from .run_protocol import (
    RunProtocolError,
    default_event_dir,
    read_run_state,
)


PREFLIGHT_SCHEMA = "p97_ahead_runner_preflight.v1"
PREFLIGHT_STATUS = "PREFLIGHT_VALID_EXECUTION_DISABLED"
RUNNER_STATUS_SCHEMA = "p97_ahead_runner_status.v1"
DEFAULT_FIXTURES = Path(__file__).with_name("candidate_count_fixtures.json")
REQUIRED_SOURCE_PATHS = frozenset(
    {
        "census/card_head/profiles.py",
        "census/card_head/candidate_surface.py",
        "census/card_head/candidate_count_fixtures.json",
        "census/card_head/bank_store.py",
        "census/card_head/cegar_adapter.py",
        "census/card_head/pattern_certificate.py",
        "census/card_head/run_manifest.py",
        "census/card_head/run_protocol.py",
        "census/card_head/runner.py",
        "census/card_head/sat_encoding.py",
    }
)


class RunnerError(ValueError):
    """Raised when the permanent runner cannot pass its fail-closed gate."""


def _profile_fixture(
    fixtures: Mapping[str, Any], cardinality: int, profile: list[int]
) -> dict[str, Any]:
    matches = [
        entry
        for entry in fixtures["profiles"]
        if entry["cardinality"] == cardinality and entry["profile"] == profile
    ]
    if len(matches) != 1:
        raise RunnerError("manifest profile has no unique candidate-count fixture")
    return matches[0]


def preflight_manifest(
    manifest: Mapping[str, Any],
    *,
    repo_root: Path,
    fixture_document: Mapping[str, Any],
) -> dict[str, Any]:
    """Validate sources, fixtures, and the selected finite candidate surface."""

    normalized = verify_source_digests(repo_root, manifest)
    pinned_sources = set(normalized["source_digests"])
    missing_sources = sorted(REQUIRED_SOURCE_PATHS - pinned_sources)
    if missing_sources:
        raise RunnerError(
            f"manifest omits required runner sources: {', '.join(missing_sources)}"
        )
    fixtures = validate_candidate_count_fixtures(fixture_document)
    selected = _profile_fixture(
        fixtures, normalized["cardinality"], normalized["profile"]
    )
    return {
        "schema": PREFLIGHT_SCHEMA,
        "status": PREFLIGHT_STATUS,
        "run_id": normalized["run_id"],
        "cardinality": normalized["cardinality"],
        "profile": normalized["profile"],
        "manifest_sha256": json_sha256(normalized),
        "cut_contract_sha256": normalized["cut_contract_sha256"],
        "candidate_fixture": selected,
        "cegar_boundary": {
            "proposal_schema": PROPOSAL_SCHEMA,
            "certificate_schema": CERTIFICATE_SCHEMA,
            "verification_schema": VERIFICATION_SCHEMA,
            "bank_row_schema": BANK_ROW_SCHEMA,
            "banked_certificate_schema": BANKED_CERTIFICATE_SCHEMA,
            "exact_fraction_replay_required": True,
            "bank_publication_enabled": True,
            "mining_generation_worker_enabled": False,
        },
        "launch_authorized": False,
        "blocked_on": [
            "permanent mining/generation worker",
            "explicit CTRL-RESOURCE transfer to AHEAD",
        ],
        "scope": (
            "Lightweight deterministic specification preflight only; "
            "not a census result or geometric closure theorem"
        ),
    }


def _load_json(path: Path) -> dict[str, Any]:
    value = json.loads(path.read_text(encoding="utf-8"))
    if not isinstance(value, dict):
        raise RunnerError(f"{path} must contain a JSON object")
    return value


def preflight_file(
    manifest_path: Path, *, repo_root: Path, fixture_path: Path
) -> dict[str, Any]:
    """Load and preflight one immutable run manifest."""

    return preflight_manifest(
        _load_json(manifest_path),
        repo_root=repo_root,
        fixture_document=_load_json(fixture_path),
    )


def status_manifest(
    manifest: Mapping[str, Any],
    *,
    repo_root: Path,
    fixture_document: Mapping[str, Any],
) -> dict[str, Any]:
    """Preflight a manifest and derive its current append-only run state."""

    preflight = preflight_manifest(
        manifest,
        repo_root=repo_root,
        fixture_document=fixture_document,
    )
    state = read_run_state(manifest, default_event_dir(repo_root, manifest))
    return {
        "schema": RUNNER_STATUS_SCHEMA,
        "run_id": preflight["run_id"],
        "preflight": preflight,
        "run_state": state,
    }


def main() -> int:
    parser = argparse.ArgumentParser()
    subparsers = parser.add_subparsers(dest="action", required=True)
    for action in ("preflight", "status", "execute"):
        action_parser = subparsers.add_parser(action)
        action_parser.add_argument("manifest", type=Path)
        action_parser.add_argument("--repo-root", type=Path, default=Path.cwd())
        action_parser.add_argument("--fixtures", type=Path, default=DEFAULT_FIXTURES)

    args = parser.parse_args()
    try:
        manifest = _load_json(args.manifest)
        fixtures = _load_json(args.fixtures)
        if args.action == "status":
            result = status_manifest(
                manifest,
                repo_root=args.repo_root,
                fixture_document=fixtures,
            )
            print(json.dumps(result, sort_keys=True, indent=2))
            return 0
        result = preflight_manifest(
            manifest,
            repo_root=args.repo_root,
            fixture_document=fixtures,
        )
        if args.action == "execute":
            required_nice = manifest["resources"]["nice"]
            actual_nice = os.getpriority(os.PRIO_PROCESS, 0)
            if actual_nice < required_nice:
                raise RunnerError(
                    f"process nice={actual_nice} is below manifest nice={required_nice}"
                )
            raise RunnerError(
                "execution is fail-closed until the permanent mining/generation "
                "worker lands and CTRL-RESOURCE is transferred to AHEAD"
            )
        print(json.dumps(result, sort_keys=True, indent=2))
        return 0
    except (
        CandidateSurfaceError,
        ManifestError,
        RunProtocolError,
        RunnerError,
        OSError,
        json.JSONDecodeError,
    ) as exc:
        parser.error(str(exc))
    raise AssertionError("unreachable")


if __name__ == "__main__":
    raise SystemExit(main())
