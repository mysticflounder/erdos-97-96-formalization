#!/usr/bin/env python3
"""Serial, resumable kernel builder for selected fine Kx product subtrees."""

from __future__ import annotations

import argparse
import hashlib
import importlib.util
import json
import os
import subprocess
import sys
import time
from pathlib import Path
from typing import Any, Mapping


HERE = Path(__file__).resolve().parent
REPO = HERE.parents[3]
LEAN_DIR = REPO / "lean"
GENERATOR = HERE / "generate_lambda_kx_fine_modules.py"
OUTPUT_DIR = HERE / "LambdaKxFine"
BUILD_DIR = HERE / "LambdaKxFineBuild"


def file_sha256(path: Path) -> str:
    digest = hashlib.sha256()
    with path.open("rb") as stream:
        while block := stream.read(1024 * 1024):
            digest.update(block)
    return digest.hexdigest()


def load_generator():
    spec = importlib.util.spec_from_file_location(
        "lambda_kx_fine_generator_for_serial_build", GENERATOR
    )
    if spec is None or spec.loader is None:
        raise RuntimeError(f"cannot import {GENERATOR}")
    module = importlib.util.module_from_spec(spec)
    sys.modules[spec.name] = module
    spec.loader.exec_module(module)
    return module


def atomic_json(path: Path, value: Mapping[str, Any]) -> None:
    temporary = path.with_suffix(path.suffix + ".tmp")
    temporary.write_text(
        json.dumps(value, indent=2, sort_keys=True) + "\n", encoding="utf-8"
    )
    temporary.replace(path)


def descendant_rss_kib(root_pid: int) -> int | None:
    """Return current aggregate RSS for the lake/Lean process tree."""

    try:
        result = subprocess.run(
            ("ps", "-axo", "pid=,ppid=,rss=,command="),
            check=True,
            capture_output=True,
            text=True,
        )
    except (OSError, subprocess.CalledProcessError):
        return None
    rows: list[tuple[int, int, int]] = []
    for line in result.stdout.splitlines():
        fields = line.strip().split(None, 3)
        if len(fields) < 3:
            continue
        try:
            rows.append((int(fields[0]), int(fields[1]), int(fields[2])))
        except ValueError:
            continue
    descendants = {root_pid}
    changed = True
    while changed:
        changed = False
        for pid, ppid, _rss in rows:
            if ppid in descendants and pid not in descendants:
                descendants.add(pid)
                changed = True
    values = [rss for pid, _ppid, rss in rows if pid in descendants]
    return sum(values) if values else None


def first_diagnostic(output: str) -> str | None:
    lines = [line.strip() for line in output.splitlines() if line.strip()]
    for marker in ("error:", "declaration has metavariables", "failed"):
        for line in lines:
            if marker in line.lower():
                return line
    return lines[0] if lines else None


def main() -> None:
    parser = argparse.ArgumentParser()
    selection = parser.add_mutually_exclusive_group(required=True)
    selection.add_argument("--generators")
    selection.add_argument("--certificate", action="store_true")
    parser.add_argument("--certificate-max-node", type=int)
    parser.add_argument("--node-min", type=int)
    parser.add_argument("--node-max", type=int)
    parser.add_argument("--label", required=True)
    parser.add_argument("--include-prelude", action="store_true")
    parser.add_argument("--resume", action="store_true")
    parser.add_argument("--adopt-state-label")
    parser.add_argument("--dry-run", action="store_true")
    arguments = parser.parse_args()

    if arguments.certificate_max_node is not None and not arguments.certificate:
        raise SystemExit("--certificate-max-node requires --certificate")
    if (arguments.node_min is None) != (arguments.node_max is None):
        raise SystemExit("--node-min and --node-max must be supplied together")
    if arguments.node_min is not None and arguments.certificate:
        raise SystemExit("--node-min/--node-max require --generators")
    if (
        arguments.node_min is not None
        and arguments.node_min > arguments.node_max
    ):
        raise SystemExit("--node-min must not exceed --node-max")

    generator_indices = (
        tuple(sorted({int(value) for value in arguments.generators.split(",")}))
        if arguments.generators is not None
        else ()
    )
    if arguments.generators is not None and (
        not generator_indices
        or any(not 0 <= value < 12 for value in generator_indices)
    ):
        raise SystemExit("generator indices must be a nonempty subset of 0..11")

    generator = load_generator()
    artifacts, manifest = generator.build()
    plan = generator.M.build_plan()
    certificate_nodes = {
        node_id for node_id, node in plan.nodes.items() if node.generator_index is None
    }
    if (
        arguments.certificate_max_node is not None
        and arguments.certificate_max_node not in certificate_nodes
    ):
        raise SystemExit(
            "--certificate-max-node must name a certificate node: "
            + ",".join(str(value) for value in sorted(certificate_nodes))
        )
    base_selected_nodes = {
        node_id
        for node_id, node in plan.nodes.items()
        if (
            node.generator_index is None
            and (
                arguments.certificate_max_node is None
                or node_id <= arguments.certificate_max_node
            )
            if arguments.certificate
            else node.generator_index in generator_indices
        )
    }
    if arguments.node_min is not None:
        if (
            arguments.node_min not in base_selected_nodes
            or arguments.node_max not in base_selected_nodes
        ):
            raise SystemExit("node-range endpoints must belong to the selected generators")
        selected_nodes = {
            node_id
            for node_id in base_selected_nodes
            if arguments.node_min <= node_id <= arguments.node_max
        }
    else:
        selected_nodes = base_selected_nodes
    selected = [
        artifact
        for artifact in artifacts
        if artifact.node_id in selected_nodes
        or (arguments.include_prelude and artifact.kind == "prelude")
    ]
    if not selected:
        raise SystemExit("selection produced no modules")

    expected_generator_hash = str(manifest["generator_sha256"])
    for artifact in selected:
        source = OUTPUT_DIR / artifact.relative_file
        if not source.exists() or file_sha256(source) != file_sha256_bytes(artifact.source):
            raise SystemExit(f"generated source drift before build: {source}")

    print(
        "selection",
        json.dumps(
            {
                "label": arguments.label,
                "mode": "certificate" if arguments.certificate else "generators",
                "generators": generator_indices,
                "certificate_max_node": arguments.certificate_max_node,
                "node_min": arguments.node_min,
                "node_max": arguments.node_max,
                "modules": len(selected),
                "nodes": len(selected_nodes),
                "include_prelude": arguments.include_prelude,
                "fine_generator_sha256": expected_generator_hash,
            },
            sort_keys=True,
        ),
        flush=True,
    )
    if arguments.dry_run:
        for artifact in selected:
            print(artifact.module)
        return

    BUILD_DIR.mkdir(parents=True, exist_ok=True)
    log_dir = BUILD_DIR / f"logs-{arguments.label}"
    log_dir.mkdir(parents=True, exist_ok=True)
    state_path = BUILD_DIR / f"state-{arguments.label}.json"
    if arguments.resume and state_path.exists():
        state: dict[str, Any] = json.loads(state_path.read_text(encoding="utf-8"))
    else:
        state = {
            "schema": "p97-lambda-kx-fine-serial-build-v1",
            "label": arguments.label,
            "mode": "certificate" if arguments.certificate else "generators",
            "generators": list(generator_indices),
            "certificate_max_node": arguments.certificate_max_node,
            "node_min": arguments.node_min,
            "node_max": arguments.node_max,
            "fine_generator_sha256": expected_generator_hash,
            "results": {},
        }
    if state.get("fine_generator_sha256") != expected_generator_hash:
        raise SystemExit("resume state belongs to a different fine generator")
    expected_mode = "certificate" if arguments.certificate else "generators"
    if state.get("mode", expected_mode) != expected_mode:
        raise SystemExit("resume state belongs to a different selection mode")
    if state.get("certificate_max_node") != arguments.certificate_max_node:
        raise SystemExit("resume state belongs to a different certificate prefix")
    if (
        state.get("node_min") != arguments.node_min
        or state.get("node_max") != arguments.node_max
    ):
        raise SystemExit("resume state belongs to a different node range")

    if arguments.adopt_state_label is not None:
        adopt_path = BUILD_DIR / f"state-{arguments.adopt_state_label}.json"
        if not adopt_path.exists():
            raise SystemExit(f"adopt state does not exist: {adopt_path}")
        adopted_state = json.loads(adopt_path.read_text(encoding="utf-8"))
        if adopted_state.get("fine_generator_sha256") != expected_generator_hash:
            raise SystemExit("adopt state belongs to a different fine generator")
        selected_by_module = {artifact.module: artifact for artifact in selected}
        adopted_count = 0
        for module_name, previous in adopted_state.get("results", {}).items():
            artifact = selected_by_module.get(module_name)
            if artifact is None or not isinstance(previous, dict):
                continue
            source = OUTPUT_DIR / artifact.relative_file
            output = source.with_suffix(".olean")
            source_sha = file_sha256(source)
            if (
                previous.get("status") == "PASS"
                and previous.get("source_sha256") == source_sha
                and output.exists()
                and previous.get("olean_sha256") == file_sha256(output)
            ):
                if module_name not in state["results"]:
                    adopted_count += 1
                state["results"][module_name] = previous
        state["adopted_from"] = arguments.adopt_state_label
        atomic_json(state_path, state)
        print(
            f"ADOPT label={arguments.adopt_state_label} modules={adopted_count}",
            flush=True,
        )

    total = len(selected)
    for position, artifact in enumerate(selected, start=1):
        source = OUTPUT_DIR / artifact.relative_file
        output = source.with_suffix(".olean")
        source_sha = file_sha256(source)
        previous = state["results"].get(artifact.module)
        if (
            arguments.resume
            and isinstance(previous, dict)
            and previous.get("status") == "PASS"
            and previous.get("source_sha256") == source_sha
            and output.exists()
            and previous.get("olean_sha256") == file_sha256(output)
        ):
            print(
                f"SKIP {position}/{total} {artifact.module} "
                f"olean={previous['olean_sha256']}",
                flush=True,
            )
            continue

        argv = (
            "lake",
            "env",
            "lean",
            "-M",
            "16384",
            "-DElab.async=false",
            "-R",
            str(HERE),
            "-o",
            str(output),
            str(source),
        )
        environment = os.environ.copy()
        inherited = environment.get("LEAN_PATH", "")
        environment["LEAN_PATH"] = (
            f"{HERE}:{inherited}" if inherited else str(HERE)
        )
        log_path = log_dir / f"{artifact.module.replace('.', '_')}.log"
        print(
            f"START {position}/{total} {artifact.module} bytes={len(artifact.source)}",
            flush=True,
        )
        started = time.monotonic()
        peak_rss_kib: int | None = None
        with log_path.open("wb") as log_stream:
            process = subprocess.Popen(
                argv,
                cwd=LEAN_DIR,
                env=environment,
                stdout=log_stream,
                stderr=subprocess.STDOUT,
            )
            next_report = started + 30
            while process.poll() is None:
                rss = descendant_rss_kib(process.pid)
                if rss is not None:
                    peak_rss_kib = max(peak_rss_kib or 0, rss)
                now = time.monotonic()
                if now >= next_report:
                    print(
                        f"LIVE {position}/{total} {artifact.module} "
                        f"wall={now - started:.1f}s rss_kib={rss}",
                        flush=True,
                    )
                    next_report = now + 30
                time.sleep(2)
            exit_code = process.wait()
        wall = time.monotonic() - started
        rendered_output = log_path.read_text(encoding="utf-8", errors="replace")
        axiom_lines = [
            line.strip()
            for line in rendered_output.splitlines()
            if "depends on axioms" in line
        ]
        diagnostic = first_diagnostic(rendered_output) if exit_code else None
        olean_sha = file_sha256(output) if exit_code == 0 and output.exists() else None
        result = {
            "status": "PASS" if exit_code == 0 else "FAIL",
            "module": artifact.module,
            "source": str(source.relative_to(REPO)),
            "source_sha256": source_sha,
            "olean": str(output.relative_to(REPO)),
            "olean_sha256": olean_sha,
            "command": list(argv),
            "lean_path_prefix": str(HERE),
            "exit_code": exit_code,
            "wall_seconds": round(wall, 3),
            "peak_process_tree_rss_kib": peak_rss_kib,
            "axiom_lines": axiom_lines,
            "first_diagnostic": diagnostic,
            "log": str(log_path.relative_to(REPO)),
        }
        state["results"][artifact.module] = result
        atomic_json(state_path, state)
        if exit_code != 0:
            print(
                f"FAIL {position}/{total} {artifact.module} wall={wall:.1f}s "
                f"rss_kib={peak_rss_kib} diagnostic={diagnostic!r}",
                flush=True,
            )
            if rendered_output:
                print(rendered_output[-8000:], flush=True)
            raise SystemExit(exit_code)
        print(
            f"PASS {position}/{total} {artifact.module} wall={wall:.1f}s "
            f"rss_kib={peak_rss_kib} olean={olean_sha} axioms={axiom_lines}",
            flush=True,
        )

    print(
        f"COMPLETE label={arguments.label} modules={total} state={state_path}",
        flush=True,
    )


def file_sha256_bytes(data: bytes) -> str:
    return hashlib.sha256(data).hexdigest()


if __name__ == "__main__":
    main()
