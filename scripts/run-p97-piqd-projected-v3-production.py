#!/usr/bin/env python3
"""Fail-closed production gate for projected-static-v3 PIQD discovery.

The underlying projected-static-v3 CLI remains a legacy/diagnostic entry point:
it intentionally retains local discovery defaults.  This command accepts the
same arguments, validates only the one-worker, sequential, fresh-session,
fully configured persistent PIQD profile with every bootstrap lane disabled,
validates a sealed production authority-v3, and only then delegates to the
existing qualified PIQD route.
"""

from __future__ import annotations

import argparse
import sys
from collections.abc import Sequence
from pathlib import Path
from typing import NoReturn

SCRIPT_REPOSITORY_ROOT = Path(__file__).resolve().parents[1]
if str(SCRIPT_REPOSITORY_ROOT) not in sys.path:
    sys.path.insert(0, str(SCRIPT_REPOSITORY_ROOT))

from census.p97_search import (
    phase3_piqd_projected_v3_qualification as qualification,
)
from census.p97_search import (
    phase3_structural_cegar_projected_static_v3 as projected_v3,
)


class ProjectedV3ProductionLaunchError(RuntimeError):
    """The projected-static-v3 production launch contract is incomplete."""


def _parser_error(message: str) -> NoReturn:
    parser = argparse.ArgumentParser(description=__doc__, add_help=False)
    parser.error(message)


def _prevalidate_tokens(argv: Sequence[str]) -> None:
    """Reject incomplete/unsafe production shapes before any filesystem read."""

    parser = argparse.ArgumentParser(add_help=False, allow_abbrev=False)
    parser.add_argument("--workers", type=int, default=1)
    parser.add_argument("--parallel-mode", default="sequential")
    parser.add_argument("--projected-static-v3", action="store_true")
    parser.add_argument("--persistent-discovery", action="store_true")
    parser.add_argument("--resume", action="store_true")
    parser.add_argument("--bootstrap-results")
    parser.add_argument("--no-bootstrap", action="store_true")
    parser.add_argument("--algebraic-bootstrap", action="append")
    parser.add_argument("--no-algebraic-bootstrap", action="store_true")
    parser.add_argument("--shard-depth")
    parser.add_argument("--shard-index")
    parser.add_argument("--verify-shards", action="store_true")
    parser.add_argument("--shard-local-simplification", action="store_true")
    parser.add_argument("--out")
    for option in (
        "--piqd-base-url",
        "--piqd-journal-root",
        "--piqd-source-manifest",
        "--piqd-producer-manifest",
        "--piqd-producer-job-id",
        "--piqd-solver-name",
        "--piqd-qualification-authority",
    ):
        parser.add_argument(option)
    args, _unknown = parser.parse_known_args(list(argv))
    try:
        if args.bootstrap_results is not None:
            raise ProjectedV3ProductionLaunchError(
                "production launch rejects --bootstrap-results"
            )
        if args.algebraic_bootstrap is not None:
            raise ProjectedV3ProductionLaunchError(
                "production launch rejects --algebraic-bootstrap"
            )
        _validate_production_shape(args)
    except ProjectedV3ProductionLaunchError as exc:
        _parser_error(str(exc))


def _validate_production_shape(args: argparse.Namespace) -> None:
    if not args.projected_static_v3:
        raise ProjectedV3ProductionLaunchError(
            "production launch requires --projected-static-v3"
        )
    if not args.persistent_discovery:
        raise ProjectedV3ProductionLaunchError(
            "production launch requires --persistent-discovery"
        )

    required_strings = {
        "--out": args.out,
        "--piqd-base-url": args.piqd_base_url,
        "--piqd-producer-job-id": args.piqd_producer_job_id,
        "--piqd-solver-name": args.piqd_solver_name,
        "--piqd-journal-root": args.piqd_journal_root,
        "--piqd-source-manifest": args.piqd_source_manifest,
        "--piqd-producer-manifest": args.piqd_producer_manifest,
        "--piqd-qualification-authority": args.piqd_qualification_authority,
    }
    missing_strings = [
        option
        for option, value in required_strings.items()
        if value is None or (isinstance(value, str) and not value.strip())
    ]
    if missing_strings:
        raise ProjectedV3ProductionLaunchError(
            "production launch requires the complete static/incremental PIQD "
            f"configuration; missing or empty: {', '.join(missing_strings)}"
        )
    if type(args.workers) is not int or args.workers != 1:
        raise ProjectedV3ProductionLaunchError("production launch requires --workers 1")
    if args.parallel_mode != "sequential":
        raise ProjectedV3ProductionLaunchError(
            "production launch rejects cube batching and requires "
            "--parallel-mode sequential"
        )
    if args.resume:
        raise ProjectedV3ProductionLaunchError(
            "production launch does not support --resume"
        )
    if not args.no_bootstrap:
        raise ProjectedV3ProductionLaunchError(
            "production launch requires --no-bootstrap"
        )
    if not args.no_algebraic_bootstrap:
        raise ProjectedV3ProductionLaunchError(
            "production launch requires --no-algebraic-bootstrap"
        )
    if Path(args.piqd_journal_root) != Path(args.out):
        raise ProjectedV3ProductionLaunchError(
            "production launch requires --piqd-journal-root to equal --out"
        )
    if (
        args.shard_depth is not None
        or args.shard_index is not None
        or bool(args.verify_shards)
        or args.shard_local_simplification
    ):
        raise ProjectedV3ProductionLaunchError(
            "production launch does not support shard modes"
        )


def _validate_production_profile(args: argparse.Namespace) -> None:
    _validate_production_shape(args)
    for option, value in {
        "--piqd-journal-root": args.piqd_journal_root,
        "--piqd-source-manifest": args.piqd_source_manifest,
        "--piqd-producer-manifest": args.piqd_producer_manifest,
        "--piqd-qualification-authority": args.piqd_qualification_authority,
    }.items():
        if not isinstance(value, Path):
            raise ProjectedV3ProductionLaunchError(
                f"production launch requires {option}"
            )
    if not isinstance(args.out, Path) or args.piqd_journal_root != args.out:
        raise ProjectedV3ProductionLaunchError(
            "production launch requires --piqd-journal-root to equal --out"
        )
    try:
        authority = qualification.load_production_authority_v3(
            args.piqd_qualification_authority
        )
        qualification.validate_production_launch_authority_v3(
            authority,
            daemon_url=args.piqd_base_url,
            source_manifest=qualification.capture_production_control_input_v3(
                args.piqd_source_manifest
            ),
            producer_manifest=qualification.capture_production_control_input_v3(
                args.piqd_producer_manifest
            ),
            producer_job_id=args.piqd_producer_job_id,
            solver_name=args.piqd_solver_name,
        )
    except (OSError, qualification.QualificationError) as exc:
        raise ProjectedV3ProductionLaunchError(
            f"invalid PIQD production qualification authority: {exc}"
        ) from exc


def _validated_argv(argv: Sequence[str] | None = None) -> list[str]:
    forwarded = list(sys.argv[1:] if argv is None else argv)
    _prevalidate_tokens(forwarded)
    args = projected_v3._parse_args(forwarded)
    try:
        _validate_production_profile(args)
    except ProjectedV3ProductionLaunchError as exc:
        _parser_error(str(exc))
    return forwarded


def main(argv: Sequence[str] | None = None) -> int:
    """Fail closed through v3 validation, then delegate the exact argv."""

    return projected_v3.main(_validated_argv(argv))


if __name__ == "__main__":
    raise SystemExit(main())
