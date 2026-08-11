#!/usr/bin/env python3
"""Prepare a projected-static-v3 production authority, or fail closed."""

from __future__ import annotations

import argparse
import sys
from pathlib import Path

ROOT = Path(__file__).resolve().parents[1]
if str(ROOT) not in sys.path:
    sys.path.insert(0, str(ROOT))

from census.p97_search import phase3_piqd_projected_v3_provisioning as provisioning
from census.p97_search import phase3_piqd_projected_v3_qualification as qualification


def _parser() -> argparse.ArgumentParser:
    parser = argparse.ArgumentParser(
        description=(
            "Create one projected-static-v3 production onboarding packet. "
            "The current global base intentionally fails PROFILE_DRIFT against "
            "the historical shard-local qualification-v2 profile."
        )
    )
    parser.add_argument("--out", required=True, type=Path)
    parser.add_argument("--piqd-base-url", required=True)
    parser.add_argument("--piqd-producer-job-id")
    parser.add_argument(
        "--piqd-solver-name",
        default=qualification.PRODUCTION_SOLVER_NAME,
    )
    parser.add_argument("--timeout-s", type=int, default=900)
    parser.add_argument("--march-timeout-s", type=int, default=900)
    return parser


def main(argv: list[str] | None = None) -> int:
    args = _parser().parse_args(argv)
    try:
        result = provisioning.provision_projected_v3_production(
            output_dir=args.out,
            daemon_url=args.piqd_base_url,
            producer_job_id=args.piqd_producer_job_id,
            solver_name=args.piqd_solver_name,
            timeout_s=args.timeout_s,
            march_timeout_s=args.march_timeout_s,
        )
    except provisioning.ProfileDriftError as exc:
        print(str(exc), file=sys.stderr)
        return 2
    except provisioning.ProvisioningError as exc:
        print(f"provisioning failed: {exc}", file=sys.stderr)
        return 1
    print(result.authority_path)
    return 0


if __name__ == "__main__":
    raise SystemExit(main())
