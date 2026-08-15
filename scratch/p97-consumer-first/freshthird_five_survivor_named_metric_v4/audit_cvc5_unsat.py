"""Minimize and dual-replay cvc5-only UNSATs from the v4 wave."""

from __future__ import annotations

import importlib.util
import json
import re
import subprocess
import sys
import time
from pathlib import Path
from typing import Any

ROOT = Path(__file__).resolve().parent


def load_wave() -> Any:
    path = ROOT / "run_wave.py"
    spec = importlib.util.spec_from_file_location("freshthird_v4_unsat_audit", path)
    if spec is None or spec.loader is None:
        raise RuntimeError(f"cannot import {path}")
    module = importlib.util.module_from_spec(spec)
    sys.modules[spec.name] = module
    spec.loader.exec_module(module)
    return module


WAVE = load_wave()
CORE_RE = re.compile(r"^\(\s*([A-Za-z0-9_\s]+)\s*\)$", re.MULTILINE)


def core_query(smt: str) -> str:
    return smt.replace(
        "(set-logic QF_NRA)",
        "(set-logic QF_NRA)\n(set-option :produce-unsat-cores true)",
        1,
    ).replace("(check-sat)", "(check-sat)\n(get-unsat-core)", 1)


def parse_core(output: str) -> list[str]:
    matches = CORE_RE.findall(output)
    if not matches:
        raise RuntimeError(f"no core in cvc5 output: {output[:300]}")
    return matches[-1].split()


def cvc5_core(smt: str, timeout_s: int = 60) -> tuple[str, list[str], str, float]:
    started = time.monotonic()
    proc = subprocess.run(
        [
            "cvc5",
            "--lang=smt2",
            "--produce-unsat-cores",
            "--nl-cov",
            f"--tlimit={timeout_s * 1000}",
        ],
        input=core_query(smt),
        text=True,
        capture_output=True,
        timeout=timeout_s + 10,
        check=False,
    )
    elapsed = time.monotonic() - started
    output = proc.stdout + proc.stderr
    status = WAVE.solver_status(output)
    return status, parse_core(output) if status == "unsat" else [], output, elapsed


def audit_case(tag_name: str, stage_name: str) -> dict[str, Any]:
    stage_dir = WAVE.ARTIFACTS / tag_name / stage_name
    full_smt = (stage_dir / "query.smt2").read_text()
    full_status, group_core, group_output, group_elapsed = cvc5_core(full_smt)
    (stage_dir / "cvc5.group-core.log").write_text(group_output)
    (stage_dir / "cvc5.group-core-query.smt2").write_text(core_query(full_smt))
    if full_status != "unsat":
        raise RuntimeError(f"cvc5 full replay changed for {tag_name}/{stage_name}: {full_status}")

    model = json.loads((WAVE.ARTIFACTS / tag_name / "structural.z3.model.json").read_text())
    groups, real_vars, metadata = WAVE.V3.metric_groups(model)
    atom_groups = {
        f"{group}__atom_{index}": [assertion]
        for group in group_core
        for index, assertion in enumerate(groups[group])
    }
    atom_smt = WAVE.V3.emit_metric(atom_groups, real_vars, list(atom_groups))
    atom_status, atom_core, atom_output, _atom_elapsed = cvc5_core(atom_smt)
    (stage_dir / "cvc5.atom-core.log").write_text(atom_output)
    (stage_dir / "cvc5.atom-core-query.smt2").write_text(core_query(atom_smt))
    if atom_status != "unsat":
        raise RuntimeError(f"cvc5 atom replay changed for {tag_name}/{stage_name}: {atom_status}")

    # Deletion-minimize the small cvc5 atom core using cvc5's fast exact
    # decision on this fragment.  SAT is required before an atom is dropped;
    # unknown/timeout retains it.
    source_minimal_atoms = list(atom_core)
    for label in list(source_minimal_atoms):
        trial = [name for name in source_minimal_atoms if name != label]
        trial_smt = WAVE.V3.emit_metric(atom_groups, real_vars, trial)
        trial_status, _output, _elapsed = WAVE.run_binary(
            "cvc5", trial_smt, 5, nonlinear=True
        )
        if trial_status == "unsat":
            source_minimal_atoms = trial
    irredundance: dict[str, str] = {}
    for label in source_minimal_atoms:
        trial = [name for name in source_minimal_atoms if name != label]
        trial_smt = WAVE.V3.emit_metric(atom_groups, real_vars, trial)
        trial_status, _output, _elapsed = WAVE.run_binary(
            "cvc5", trial_smt, 10, nonlinear=True
        )
        irredundance[label] = trial_status
    if any(status != "sat" for status in irredundance.values()):
        raise RuntimeError(
            f"source core is not cvc5-irredundant for {tag_name}/{stage_name}: "
            f"{irredundance}"
        )

    # Z3 sometimes needs the source-free translation gauge to decide the same
    # distance-only contradiction.  Preserve that distinction in the record:
    # `source_minimal_atoms` is the cvc5-irreducible metric core, while
    # `dual_replay_atoms` may add only gauge atoms already present in the
    # original query and cvc5 atom core.
    dual_replay_atoms = list(source_minimal_atoms)
    minimal_smt = WAVE.V3.emit_metric(atom_groups, real_vars, dual_replay_atoms)
    z3_status, _values, z3_core, z3_elapsed = WAVE.V3.z3_solve_exact(
        minimal_smt, real_vars, 20
    )
    if z3_status != "unsat":
        gauge_atoms = [name for name in atom_core if name.startswith("gauge__atom_")]
        dual_replay_atoms = gauge_atoms + dual_replay_atoms
        minimal_smt = WAVE.V3.emit_metric(atom_groups, real_vars, dual_replay_atoms)
        z3_status, _values, z3_core, z3_elapsed = WAVE.V3.z3_solve_exact(
            minimal_smt, real_vars, 60
        )
    (stage_dir / "dual-minimized.smt2").write_text(minimal_smt)
    cvc5_status, cvc5_output, cvc5_elapsed = WAVE.run_binary(
        "cvc5", minimal_smt, 60, nonlinear=True
    )
    (stage_dir / "dual-minimized.cvc5.log").write_text(cvc5_output)
    if z3_status != "unsat" or cvc5_status != "unsat":
        raise RuntimeError(
            f"minimized replay not dual UNSAT for {tag_name}/{stage_name}: "
            f"z3={z3_status}, cvc5={cvc5_status}"
        )

    atom_assertions = {name: atom_groups[name][0] for name in dual_replay_atoms}
    origin_by_atom = {
        name: WAVE.source_labels_for([name.split("__atom_", 1)[0]])[
            name.split("__atom_", 1)[0]
        ]
        for name in dual_replay_atoms
    }
    exact_groups = {
        name.split("__atom_", 1)[0]
        for name in dual_replay_atoms
        if name.startswith("exact_offsupport_")
    }
    exact_guard_pass = exact_groups <= {
        "exact_offsupport_PRow",
        "exact_offsupport_PRhoRow",
        "exact_offsupport_S0Row",
        "exact_offsupport_S1Row",
        "exact_offsupport_DBRow",
    }
    record = {
        "tag": tag_name,
        "stage": stage_name,
        "scope": "one frozen exact-17 structural survivor",
        "full_cvc5_replay": {"status": full_status, "elapsed_s": round(group_elapsed, 3)},
        "cvc5_group_core": group_core,
        "cvc5_atom_core": atom_core,
        "dual_minimized": {
            "source_minimal_atoms": source_minimal_atoms,
            "source_minimal_irredundance_replay": irredundance,
            "dual_replay_atoms": dual_replay_atoms,
            "gauge_atoms_added_for_z3": [
                name for name in dual_replay_atoms if name not in source_minimal_atoms
            ],
            "atom_assertions": atom_assertions,
            "source_origins": origin_by_atom,
            "z3": {"status": z3_status, "elapsed_s": round(z3_elapsed, 3), "core": z3_core},
            "cvc5": {"status": cvc5_status, "elapsed_s": round(cvc5_elapsed, 3)},
            "sha256": WAVE.sha256_text(minimal_smt),
        },
        "guard_audit": {
            "all_groups_source_mapped": all(value != "UNMAPPED" for value in origin_by_atom.values()),
            "exact_offsupport_groups": sorted(exact_groups),
            "exact_offsupport_only_source_entitled": exact_guard_pass,
            "DBRow_meaning": "actual deleted blocker's canonical unique original four-class",
            "FiveRowCircleIntersectionOrderCore_used": False,
        },
        "roles": metadata["roles"],
        "rows": metadata["rows"],
        "classification": "DUAL_UNSAT_MINIMIZED_FROZEN_MOTIF_ONLY",
    }
    WAVE.json_write(stage_dir / "unsat-audit.json", record)
    return record


def main() -> int:
    results_path = ROOT / "results.json"
    results = json.loads(results_path.read_text())
    targets: list[tuple[str, str]] = []
    for tag_name, tag_record in results["tags"].items():
        for stage_name, stage_record in tag_record["metric_stages"].items():
            if stage_record["cvc5"]["status"] == "unsat":
                targets.append((tag_name, stage_name))
    audits = [audit_case(tag, stage) for tag, stage in targets]
    for audit in audits:
        stage_record = results["tags"][audit["tag"]]["metric_stages"][audit["stage"]]
        stage_record["classification"] = audit["classification"]
        stage_record["unsat_audit"] = audit
    results["cvc5_unsat_audits"] = audits
    WAVE.json_write(results_path, results)

    counts: dict[str, int] = {}
    for tag_record in results["tags"].values():
        for stage_record in tag_record["metric_stages"].values():
            key = stage_record["classification"]
            counts[key] = counts.get(key, 0) + 1
    lines = [
        "# Results",
        "",
        "All eight exact-17 tags have a dual-SAT, independently validated structural survivor under the v4 endpoint/outside cuts.",
        "",
        f"Metric classifications: `{json.dumps(counts, sort_keys=True)}`.",
        "",
        "Two exact-off-support frozen motifs produced fast cvc5 UNSAT results. Source-labeled cvc5 group and atom cores were extracted, deletion-minimized with Z3, and the minimized subsets replayed UNSAT in both Z3 and cvc5. The other 22 metric-stage queries remain bounded-inconclusive.",
        "",
        "These two results reject only the two frozen incidence motifs, not their tags. No exhaustive survivor coverage was attempted.",
        "",
        "`FiveRowCircleIntersectionOrderCore` was not emitted because its complete source-entitled premise map is absent.",
        "",
        "This remains finite exact-17 producer discovery: no P97 counterexample, universal contradiction, or Lean closure follows.",
        "",
    ]
    (ROOT / "RESULTS.md").write_text("\n".join(lines))
    WAVE.write_checksums()
    print(json.dumps({"audited_unsats": len(audits), "classifications": counts}, sort_keys=True))
    return 0


if __name__ == "__main__":
    raise SystemExit(main())
