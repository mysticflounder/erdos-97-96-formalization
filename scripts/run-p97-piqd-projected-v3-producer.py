#!/usr/bin/env python3
"""Run or offline-check the one-shot projected-static-v3 producer."""

from __future__ import annotations

import argparse
import sys
from pathlib import Path

ROOT = Path(__file__).resolve().parents[1]
if str(ROOT) not in sys.path:
    sys.path.insert(0, str(ROOT))

from census.p97_search.phase3_piqd_projected_v3_producer import (
    ProducerError,
    ProducerPolicy,
    check_projected_v3_output,
    produce_projected_v3,
)


def main(argv: list[str] | None = None) -> int:
    parser = argparse.ArgumentParser(description=__doc__, allow_abbrev=False)
    parser.add_argument("--out", type=Path, required=True)
    parser.add_argument(
        "--authority",
        type=Path,
        help="optional downstream authority-v3 for offline cross-binding",
    )
    parser.add_argument("--piqd-base-url")
    parser.add_argument("--max-polls", type=int, default=300)
    parser.add_argument("--poll-interval-s", type=float, default=2.0)
    parser.add_argument("--resume", action="store_true")
    parser.add_argument("--check", action="store_true")
    args = parser.parse_args(argv)
    try:
        if args.check:
            if args.piqd_base_url is not None or args.resume:
                parser.error("--check is offline and rejects --piqd-base-url/--resume")
            result = check_projected_v3_output(args.out, authority_path=args.authority)
            print(result["result_sha256"])
            return 0
        if not args.piqd_base_url:
            parser.error("normal producer mode requires --piqd-base-url")
        if args.authority is not None:
            parser.error("--authority is only valid with --check")
        result = produce_projected_v3(
            output_dir=args.out,
            base_url=args.piqd_base_url,
            policy=ProducerPolicy(args.max_polls, args.poll_interval_s),
            resume=args.resume,
        )
        print(result.result_path)
        return 0
    except ProducerError as exc:
        parser.error(str(exc))


if __name__ == "__main__":
    raise SystemExit(main())
