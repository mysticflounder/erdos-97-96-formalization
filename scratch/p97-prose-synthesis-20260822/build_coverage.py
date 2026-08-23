"""Inventory the prose bundle and verify lossless synthesis coverage."""

from __future__ import annotations

import argparse
import hashlib
import json
import re
import tarfile
from pathlib import Path, PurePosixPath

ROOT = "Erdos-97-Proof"
ADMIN = {"README.md", "STATUS-MANIFEST.md", "ORGANIZATION-LOG.md", "ARCHIVE-NOTICE.md"}
EXPECTED_SECTION_COUNTS = {"B": 1, "C": 13, "D": 7, "E": 20, "F": 72}


def sha256(data: bytes) -> str:
    return hashlib.sha256(data).hexdigest()


def safe_files(archive: Path) -> dict[str, tuple[tarfile.TarInfo, bytes]]:
    result: dict[str, tuple[tarfile.TarInfo, bytes]] = {}
    with tarfile.open(archive) as tar:
        for member in tar.getmembers():
            path = PurePosixPath(member.name)
            if path.is_absolute() or ".." in path.parts:
                raise ValueError(f"unsafe archive path: {member.name}")
            if member.isdir():
                continue
            if not member.isfile() or len(path.parts) != 2 or path.parts[0] != ROOT:
                raise ValueError(f"unexpected archive entry: {member.name}")
            stream = tar.extractfile(member)
            if stream is None:
                raise ValueError(f"cannot read archive entry: {member.name}")
            result[path.name] = (member, stream.read())
    if len(result) != 117:
        raise ValueError(f"expected 117 files, found {len(result)}")
    return result


def classifications(status: str) -> dict[str, dict[str, str]]:
    result: dict[str, dict[str, str]] = {}
    section = ""
    area = ""
    for line in status.splitlines():
        top = re.match(r"^## ([B-F])\.", line)
        if top:
            section = top.group(1)
            area = ""
            continue
        sub = re.match(r"^### (.+)$", line)
        if sub and section:
            area = sub.group(1).strip()
            continue
        item = re.match(r"^- `([^`]+)`", line)
        if item and section:
            name = item.group(1)
            if name in result:
                raise ValueError(f"duplicate manifest classification: {name}")
            result[name] = {"section": section, "area": area}
    counts = {key: 0 for key in EXPECTED_SECTION_COUNTS}
    for value in result.values():
        counts[value["section"]] += 1
    if counts != EXPECTED_SECTION_COUNTS:
        raise ValueError(f"manifest counts differ: {counts}")
    return result


def build_inventory(archive: Path) -> dict[str, object]:
    files = safe_files(archive)
    status = files["STATUS-MANIFEST.md"][1].decode("utf-8")
    classes = classifications(status)
    records = []
    for name, (member, data) in sorted(files.items()):
        classification = classes.get(name)
        if name in ADMIN:
            classification = {"section": "ADMIN", "area": "Administration"}
        if classification is None:
            raise ValueError(f"unclassified archive file: {name}")
        records.append(
            {
                "source": name,
                "bytes": member.size,
                "sha256": sha256(data),
                **classification,
            }
        )
    return {
        "schema": "p97-prose-source-inventory/v1",
        "archive": str(archive),
        "archive_sha256": sha256(archive.read_bytes()),
        "file_count": len(records),
        "records": records,
    }


def parse_ledger(ledger: Path) -> list[dict[str, str]]:
    records = []
    pattern = re.compile(
        r"^\| `([^`]+)` \| `([^`]+)` \| ([^|]+?) \| ([^|]+?) \|$"
    )
    for line in ledger.read_text().splitlines():
        match = pattern.match(line)
        if match:
            records.append(
                {
                    "source": match.group(1),
                    "destination": match.group(2),
                    "disposition": match.group(3).strip(),
                    "integrated_content": match.group(4).strip(),
                }
            )
    return records


def verify(inventory: dict[str, object], ledger: Path) -> dict[str, object]:
    source_names = {record["source"] for record in inventory["records"]}
    records = parse_ledger(ledger)
    covered = [record["source"] for record in records]
    duplicates = sorted({name for name in covered if covered.count(name) > 1})
    missing = sorted(source_names - set(covered))
    extra = sorted(set(covered) - source_names)
    empty = sorted(
        record["source"]
        for record in records
        if not record["destination"] or not record["integrated_content"]
    )
    result = {
        "schema": "p97-prose-synthesis-coverage/v1",
        "archive_file_count": len(source_names),
        "ledger_row_count": len(records),
        "missing": missing,
        "extra": extra,
        "duplicates": duplicates,
        "empty_integration_notes": empty,
        "records": records,
    }
    result["verified"] = not any((missing, extra, duplicates, empty)) and len(records) == 117
    return result


def main() -> None:
    parser = argparse.ArgumentParser()
    parser.add_argument("--archive", type=Path, required=True)
    parser.add_argument("--inventory", type=Path, required=True)
    parser.add_argument("--ledger", type=Path)
    parser.add_argument("--coverage", type=Path)
    args = parser.parse_args()

    inventory = build_inventory(args.archive)
    args.inventory.write_text(json.dumps(inventory, indent=2, sort_keys=True) + "\n")
    if args.ledger:
        if not args.coverage:
            parser.error("--coverage is required with --ledger")
        coverage = verify(inventory, args.ledger)
        args.coverage.write_text(json.dumps(coverage, indent=2, sort_keys=True) + "\n")
        if not coverage["verified"]:
            raise SystemExit(1)
    print(json.dumps({"file_count": inventory["file_count"], "verified": bool(args.ledger)}))


if __name__ == "__main__":
    main()
