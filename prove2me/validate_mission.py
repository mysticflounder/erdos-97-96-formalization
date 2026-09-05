#!/usr/bin/env python3
# Copyright (c) 2026 Adam McKenna. All rights reserved.
# Released under GPL-3.0-or-later as described in the file LICENSE.
# Author: Adam McKenna <adam@mysticflounder.ai>
"""Compile exact draft payloads; success establishes statements, never proofs."""

import hashlib
import json
import os
from pathlib import Path
import shutil
import subprocess

ROOT = Path(__file__).resolve().parent
REPO = ROOT.parent
RUN = REPO/"scratch/runs/prove2me-p97-p96-mission-20260905/run-0001"
STAGE = RUN/"artifacts/platform"
WORKSPACE = Path.home()/"prove2me_workspace"


def sha(data):
    return hashlib.sha256(data).hexdigest()


def main():
    items = json.loads((ROOT/"items.json").read_text())
    proposal = json.loads((ROOT/"proposal.json").read_text())
    packet_digests = {name:sha((ROOT/name).read_bytes()) for name in ("items.json", "proposal.json", "mission-description.md")}
    assert proposal["description"] == (ROOT/"mission-description.md").read_text(), "Prepare metadata again after editing the description"
    manifest = json.loads((WORKSPACE/"lake-manifest.json").read_text())
    mathlib = next(p for p in manifest["packages"] if p["name"] == "mathlib")
    assert mathlib["rev"] == proposal["env"]
    for directory in (STAGE/"Definitions", STAGE/"Theorems", STAGE/".lake", RUN/"events"):
        directory.mkdir(parents=True, exist_ok=True)
    shutil.copyfile(WORKSPACE/"lean-toolchain", STAGE/"lean-toolchain")
    manifest["packagesDir"] = str(WORKSPACE/".lake/packages")
    (STAGE/"lake-manifest.json").write_text(json.dumps(manifest, indent=2)+"\n")
    (STAGE/"lakefile.lean").write_text(
        "import Lake\nopen Lake DSL\npackage «prove2me» where\n"
        f'  packagesDir := "{WORKSPACE}/.lake/packages"\n'
        "  leanOptions := #[⟨`autoImplicit, false⟩]\n"
        'require mathlib from git "https://github.com/leanprover-community/mathlib4.git" @\n'
        f'  "{proposal["env"]}"\n'
        "lean_lib Definitions where\nlean_lib Theorems where\nlean_lib Mission where\n")
    modules = []
    code_digests = {}
    for item in items:
        if item["kind"] == "definition":
            module = "Definitions.Def_"+item["definition_name"]
            code = item["definition"]
            name = item["definition_name"]
        else:
            name = item["theorem_name"]
            module = "Theorems.Thm_"+name.replace(".", "_")
            code = item["preamble"]+"\n"+item["formal_statement"]
        path = STAGE/(module.replace(".", "/")+".lean")
        path.write_text(code)
        modules.append(module)
        code_digests[name] = sha(code.encode())
    (STAGE/"Mission.lean").write_text("".join("import "+module+"\n" for module in modules))
    env = dict(os.environ, LEAN_ROOT=str(STAGE), LAKE_BUILD_NO_REFRESH="1",
               LEAN_USAGE_STATE_DIR=str(RUN/"events/lean-usage"), MEMORY_MB="16384")
    log = RUN/"events/statements-build.log"
    with log.open("w") as output:
        result = subprocess.run(["lake-build", "Mission"], cwd=STAGE, env=env,
                                stdout=output, stderr=subprocess.STDOUT)
    if result.returncode:
        print(log.read_text()[-4500:])
        raise SystemExit(result.returncode)
    print(log.read_text()[-2500:])
    declarations = ["Plane", "ConvexIndep", "HasNEquidistantPointsAt", "HasNEquidistantPointsOn",
                    "HasNEquidistantProperty", "unitDistancePairsCount", "convexUnitDistanceCounts",
                    "maxConvexUnitDistances", "Problem97", "Problem96"]
    audit = STAGE/"Audit.lean"
    audit.write_text("import Mission\n"+"".join(
        "#print axioms Erdos9796Mission."+name+"\n" for name in declarations)+
        "#print axioms Erdos9796Mission.combined\n")
    axioms_log = RUN/"events/statement-axioms.log"
    with axioms_log.open("w") as output:
        checked = subprocess.run(["lake", "env", "lean", "-M", "16384", "Audit.lean"],
                                 cwd=STAGE, env=env, stdout=output, stderr=subprocess.STDOUT)
    assert checked.returncode == 0, axioms_log.read_text()[-3000:]
    lines = axioms_log.read_text().splitlines()
    for line in lines:
        if "sorryAx" in line:
            assert "Erdos9796Mission.combined" in line, "A definition depends on sorryAx"
    assert any("combined" in line and "sorryAx" in line for line in lines)
    report = dict(status="STATEMENTS_CHECKED_NOT_PROVED", toolchain=(STAGE/"lean-toolchain").read_text().strip(),
                  mathlib_rev=proposal["env"], item_count=len(items),
                  build_exit=result.returncode, axiom_probe_exit=checked.returncode,
                  axiom_output=lines,
                  definition_axioms="No sorryAx; exact per-declaration output in statement-axioms.log",
                  goal_axioms="sorryAx expected: this is an open mission statement, not a proof",
                  packet_digests=packet_digests,
                  code_digests=code_digests,
                  build_log=str(log.relative_to(REPO)), build_log_sha256=sha(log.read_bytes()),
                  axiom_log=str(axioms_log.relative_to(REPO)), axiom_log_sha256=sha(axioms_log.read_bytes()),
                  source_base_head="757d852766f377f7c1a0ffeeef6d3526bc0cb7a4",
                  scope="Mathlib-only mission statements ported to the platform environment. No existing repository proof or certificate is transplanted or certified by this check.")
    assert all(sha((ROOT/name).read_bytes()) == expected for name,expected in packet_digests.items()), "Packet changed during validation; rerun"
    (ROOT/"validation.json").write_text(json.dumps(report, indent=2)+"\n")
    print("Validated exact upload bytes; all theorem items remain unproved drafts.")


if __name__ == "__main__":
    main()
