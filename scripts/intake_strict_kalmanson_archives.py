"""Authenticate and unpack the four user-delivered Kalmanson archives.

No bundled code is executed. Run from the repository root with --source-dir.
The destination must be fresh; extracted files are retained under a governed run.
"""

import argparse
import hashlib
import json
import shutil
import tarfile
from pathlib import Path, PurePosixPath

PINS = {
    "p97-strict-kalmanson-n10-certified-recovery-2026-09-03.tar.xz":
        "7e494f13689dbd7b5daace2a21b99488c285c958d443430d5eba6f1b45377f7c",
    "p97-strict-kalmanson-wave4-2026-09-03.tar.gz":
        "2138dc9c9d390db0b18efd4c125d9e42709266b124bcdce2dc43329178b2b72d",
    "p97-strict-kalmanson-wave5-n12-curated-2026-09-04.tar.gz":
        "d3fdd5a9619de16c0959fb2c7e0ff38452ddb7ff8e76343afe5171119ad37652",
    "p97-strict-kalmanson-wave6-n12-corrected-curated-2026-09-04.tar.gz":
        "76af03910f8ab519111a17baf569da1bd186ca5ca0582c61e912ca5eae13f7c6",
}
LANE = "strict-kalmanson-recovered-archives-20260905"


def digest(path):
    return hashlib.sha256(path.read_bytes()).hexdigest()


def write_json(path, value):
    with path.open("x") as stream:
        json.dump(value, stream, indent=2, sort_keys=True)
        stream.write("\n")


def main():
    parser = argparse.ArgumentParser(description=__doc__)
    parser.add_argument("--source-dir", type=Path, required=True)
    parser.add_argument("--run-id", default="run-0001")
    args = parser.parse_args()
    checkpoint = json.loads(
        Path(f".codex/worktree-checkpoints/{LANE}.json").read_text()
    )
    root = Path(f"scratch/runs/{LANE}/{args.run_id}")
    if str(root) not in checkpoint["generated_roots"]:
        raise ValueError("run root is not registered in lane checkpoint")
    for name, expected in PINS.items():
        if digest(args.source_dir / name) != expected:
            raise ValueError(f"archive digest mismatch: {name}")
    root.mkdir(parents=True, exist_ok=False)
    artifacts = root / "artifacts"
    artifacts.mkdir()
    receipt = []
    inputs = {}
    for name, expected in PINS.items():
        copied = artifacts / name
        shutil.copyfile(args.source_dir / name, copied)
        if digest(copied) != expected:
            raise ValueError(f"copied archive digest mismatch: {name}")
        inputs[str(copied)] = expected
        destination = artifacts / name.removesuffix(".tar.gz").removesuffix(".tar.xz")
        destination.mkdir()
        with tarfile.open(copied) as archive:
            members = archive.getmembers()
            names = set()
            for member in members:
                path = PurePosixPath(member.name)
                if (path.is_absolute() or ".." in path.parts
                        or not (member.isdir() or member.isfile())
                        or member.name in names):
                    raise ValueError(f"unsafe/duplicate member: {member.name}")
                names.add(member.name)
            if sum(m.size for m in members) > 500_000_000:
                raise ValueError("archive exceeds extraction limit")
            archive.extractall(destination, filter="data")
        files = [p for p in destination.rglob("*") if p.is_file()]
        receipt.append({
            "archive": str(copied), "sha256": expected,
            "bytes": copied.stat().st_size, "extracted_root": str(destination),
            "file_count": len(files),
            "extracted_bytes": sum(p.stat().st_size for p in files),
        })
    source = "scripts/intake_strict_kalmanson_archives.py"
    manifest = {
        "schema": "worktree-run-manifest/v1", "lane_id": LANE,
        "run_id": args.run_id, "root": str(root),
        "owner": checkpoint["owner"], "base_head": checkpoint["base_head"],
        "created_utc": checkpoint["created_utc"],
        "output_classes": ["artifacts", "events", "tmp"],
        "source_digests": {source: digest(Path(source))}, "input_digests": inputs,
    }
    manifest["manifest_sha256"] = hashlib.sha256(
        json.dumps(manifest, sort_keys=True, separators=(",", ":")).encode()
    ).hexdigest()
    write_json(root / "run_manifest.json", manifest)
    write_json(root / "intake.json", receipt)
    print(json.dumps(receipt, indent=2))


if __name__ == "__main__":
    main()
