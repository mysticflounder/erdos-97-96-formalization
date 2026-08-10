"""Build a shared structural bank from authenticated five-omission runs."""

from __future__ import annotations

import argparse
from pathlib import Path

from .source_faithful_five_omission_cegar import _new_instance
from .source_faithful_five_omission_lean_export import load_authenticated_run
from .source_faithful_five_omission_shared_bank import (
    build_shared_bank_document,
    write_new_shared_bank,
)


def _workdir_spec(value: str) -> tuple[int, Path]:
    label_text, separator, path_text = value.partition("=")
    if not separator or not path_text:
        raise argparse.ArgumentTypeError("workdir must have DELETED_LABEL=PATH form")
    try:
        label = int(label_text)
    except ValueError as exc:
        raise argparse.ArgumentTypeError("deleted label must be an integer") from exc
    if not 0 <= label < 12:
        raise argparse.ArgumentTypeError("deleted label must lie in Fin 12")
    return label, Path(path_text)


def main() -> int:
    parser = argparse.ArgumentParser()
    parser.add_argument("--repo-root", type=Path, required=True)
    parser.add_argument(
        "--workdir",
        action="append",
        type=_workdir_spec,
        required=True,
        help="repeat DELETED_LABEL=PATH for every authenticated source run",
    )
    parser.add_argument("--out", type=Path, required=True)
    args = parser.parse_args()

    runs = tuple(
        load_authenticated_run(args.repo_root, path, label)
        for label, path in args.workdir
    )
    document = build_shared_bank_document(
        runs, tuple(_new_instance(label) for label in range(12))
    )
    write_new_shared_bank(args.out, document)
    print(
        f"wrote {args.out} with {document['record_count']} unique replayed cuts "
        f"from {document['source_run_count']} authenticated runs"
    )
    return 0


if __name__ == "__main__":
    raise SystemExit(main())
