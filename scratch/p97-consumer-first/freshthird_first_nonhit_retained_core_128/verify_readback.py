"""Independent artifact/readback validator for the 128-slice wave."""

from __future__ import annotations

import hashlib
import json
import re
from pathlib import Path

ROOT = Path(__file__).resolve().parent


def digest(path: Path) -> str:
    h = hashlib.sha256()
    with path.open("rb") as stream:
        for chunk in iter(lambda: stream.read(1 << 16), b""):
            h.update(chunk)
    return h.hexdigest()


def arm_tag(arm: list[int]) -> dict[str, object]:
    x0, y0, x1, y1 = arm
    x, y = x0 == x1, y0 == y1
    return {
        "kind": "derived_conditional_tag",
        "applicable": x or y,
        "side": "x+y" if x and y else "x" if x else "y" if y else None,
        "solver_constraint": False,
    }


def validate(root: Path = ROOT) -> list[str]:
    errors: list[str] = []
    manifest = json.loads((root / "manifest.json").read_text())
    results = json.loads((root / "results.json").read_text())
    if manifest["case_count"] != 128 or results["case_count"] != 128:
        errors.append("expected 128 raw records")
    if manifest["common_endpoint_omission"]["universal_ingress"]:
        errors.append("common omission was promoted to universal ingress")
    if manifest["named_consumer_queries"]:
        errors.append("unlicensed named consumer query present")
    records = results["records"]
    if len(records) != 128:
        errors.append(f"record count={len(records)}")
    for record in records:
        if (
            record["z3"] != "sat"
            or record["cvc5"] != "sat"
            or record["expected"] != "sat"
        ):
            errors.append(f"non-sat record {record.get('label')}")
        if record["common_endpoint_omission"] != arm_tag(record["arm"]):
            errors.append(f"derived tag mismatch {record.get('label')}")
        artifact = (
            root
            / "artifacts"
            / record["pair_id"]
            / f"arm{record['arm_index']:02d}_x{record['arm'][0]}y{record['arm'][1]}_x{record['arm'][2]}y{record['arm'][3]}.smt2"
        )
        if not artifact.is_file():
            errors.append(f"missing artifact {artifact}")
            continue
        text = artifact.read_text()
        if text.count("(check-sat)") != 1:
            errors.append(f"check-sat count {artifact}")
        for variable, value in (
            ("row0_xChoice", record["arm"][0]),
            ("row0_yChoice", record["arm"][1]),
            ("row1_xChoice", record["arm"][2]),
            ("row1_yChoice", record["arm"][3]),
        ):
            if not re.search(rf"\(assert \(= {variable} {value}\)\)", text):
                errors.append(f"missing fixed choice {variable}={value} in {artifact}")
    sha_path = root / "SHA256SUMS"
    if not sha_path.is_file():
        errors.append("missing SHA256SUMS")
    else:
        for line in sha_path.read_text().splitlines():
            expected, relative = line.split("  ", 1)
            path = root / relative
            if not path.is_file() or digest(path) != expected:
                errors.append(f"hash mismatch {relative}")
    return errors


if __name__ == "__main__":
    failures = validate()
    if failures:
        print("status=FAIL")
        print("\n".join(failures[:20]))
        raise SystemExit(1)
    print("status=PASS readback=independent artifacts=128")
