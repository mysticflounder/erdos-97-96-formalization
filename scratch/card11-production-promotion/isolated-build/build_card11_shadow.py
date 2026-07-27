#!/usr/bin/env python3
"""Build the card-eleven ingress closure in a resumable parallel shadow DAG."""

from __future__ import annotations

import argparse
from collections import Counter, defaultdict
from concurrent.futures import FIRST_COMPLETED, Future, ThreadPoolExecutor, wait
from dataclasses import dataclass, field
from datetime import datetime, timezone
import hashlib
import heapq
import os
from pathlib import Path
import shlex
import subprocess
import sys
import tempfile
import time
import traceback
from typing import Callable, Mapping, Sequence


TARGET = "Erdos9796Proof.P97.ATail.CardElevenUniqueFourCertificateIngress"
SCRIPT_DIR = Path(__file__).resolve().parent
REPO_ROOT = SCRIPT_DIR.parents[2]
LEAN_ROOT = REPO_ROOT / "lean"
CANONICAL = LEAN_ROOT / ".lake/build/lib/lean"
RUN_ROOT = SCRIPT_DIR / "full-old-semantics-lean-4.27"
SHADOW = RUN_ROOT / "lib/lean"
LOG = RUN_ROOT / "build.log"
MANIFEST = RUN_ROOT / "missing-modules.txt"
MODULE_LOG_ROOT = RUN_ROOT / "module-logs"
WORK_ROOT = RUN_ROOT / "work"
SMOKE_LOG = RUN_ROOT / "ingress-import-smoke.log"
LOCK = RUN_ROOT / "build.lock"
LOCK_INITIALIZATION_GRACE_S = 5.0

LEAN_VERSION_PREFIX = "Lean (version 4.27.0,"
DEFAULT_WORKERS = min(12, os.cpu_count() or 1)
LEAN_ARGS = [
    "-R",
    ".",
    "-M16384",
    "-s2097152",
    "-Dpp.unicode.fun=true",
    "-DrelaxedAutoImplicit=false",
    "-Dweak.linter.mathlibStandardSet=true",
]


@dataclass(frozen=True)
class DependencyGraph:
    order: tuple[str, ...]
    internal: Mapping[str, tuple[str, ...]]
    external: tuple[str, ...]


@dataclass(frozen=True)
class ModuleArtifactState:
    module: str
    valid: bool
    origin: str
    olean: Path | None
    ilean: Path | None
    olean_mtime_ns: int | None
    reasons: tuple[str, ...]


@dataclass(frozen=True)
class BuildPlan:
    states: Mapping[str, ModuleArtifactState]
    todo: tuple[str, ...]
    ready: tuple[str, ...]


@dataclass(frozen=True)
class CompileResult:
    module: str
    returncode: int
    duration_s: float = 0.0
    log_path: Path | None = None
    detail: str = ""
    ended_ns: int = field(default_factory=time.monotonic_ns)

    @property
    def succeeded(self) -> bool:
        return self.returncode == 0


@dataclass(frozen=True)
class ScheduleOutcome:
    results: tuple[CompileResult, ...]
    submitted: tuple[str, ...]
    unscheduled: tuple[str, ...]
    first_failure: CompileResult | None


def module_relative_path(module: str) -> Path:
    """Map a Lean module name to disk, including quoted identifier components."""

    components: list[str] = []
    current: list[str] = []
    quoted = False
    for character in module:
        if character == "«" and not quoted:
            quoted = True
        elif character == "»" and quoted:
            quoted = False
        elif character == "." and not quoted:
            if not current:
                raise ValueError(f"invalid module name: {module}")
            components.append("".join(current))
            current = []
        else:
            current.append(character)
    if quoted or not current:
        raise ValueError(f"invalid module name: {module}")
    components.append("".join(current))
    return Path(*components)


def source_path(module: str, lean_root: Path = LEAN_ROOT) -> Path:
    return Path(str(lean_root / module_relative_path(module)) + ".lean")


def artifact_path(root: Path, module: str, suffix: str) -> Path:
    return Path(str(root / module_relative_path(module)) + suffix)


def _without_lean_comments(text: str) -> str:
    """Remove nested block and line comments while preserving line boundaries."""

    output: list[str] = []
    block_depth = 0
    line_comment = False
    index = 0
    while index < len(text):
        pair = text[index : index + 2]
        character = text[index]
        if line_comment:
            if character == "\n":
                line_comment = False
                output.append(character)
            index += 1
            continue
        if block_depth:
            if pair == "/-":
                block_depth += 1
                index += 2
            elif pair == "-/":
                block_depth -= 1
                index += 2
            else:
                if character == "\n":
                    output.append(character)
                index += 1
            continue
        if pair == "--":
            line_comment = True
            index += 2
        elif pair == "/-":
            block_depth = 1
            index += 2
        else:
            output.append(character)
            index += 1
    return "".join(output)


def imports(module: str, lean_root: Path = LEAN_ROOT) -> list[str]:
    source = source_path(module, lean_root)
    if not source.is_file():
        return []
    result: list[str] = []
    for raw_line in _without_lean_comments(source.read_text()).splitlines():
        tokens = raw_line.strip().split()
        if tokens[:1] == ["import"]:
            result.extend(tokens[1:])
        elif tokens[:2] in (["public", "import"], ["private", "import"]):
            result.extend(tokens[2:])
    return result


def dependency_graph(target: str, lean_root: Path = LEAN_ROOT) -> DependencyGraph:
    state: dict[str, int] = {}
    stack: list[str] = []
    order: list[str] = []
    internal: dict[str, tuple[str, ...]] = {}
    external: set[str] = set()

    def visit(module: str) -> None:
        status = state.get(module, 0)
        if status == 2:
            return
        if status == 1:
            cycle_start = stack.index(module)
            cycle = " -> ".join([*stack[cycle_start:], module])
            raise RuntimeError(f"import cycle in local closure: {cycle}")
        source = source_path(module, lean_root)
        if not source.is_file():
            external.add(module)
            return

        state[module] = 1
        stack.append(module)
        local_dependencies: list[str] = []
        for dependency in imports(module, lean_root):
            if source_path(dependency, lean_root).is_file():
                local_dependencies.append(dependency)
                visit(dependency)
            else:
                external.add(dependency)
        stack.pop()
        state[module] = 2
        internal[module] = tuple(local_dependencies)
        order.append(module)

    visit(target)
    return DependencyGraph(tuple(order), internal, tuple(sorted(external)))


def _path_claimed(path: Path) -> bool:
    return path.exists() or path.is_symlink()


def _artifact_root(
    module: str,
    canonical_root: Path,
    shadow_root: Path,
) -> tuple[str, Path | None]:
    shadow_pair = (
        artifact_path(shadow_root, module, ".olean"),
        artifact_path(shadow_root, module, ".ilean"),
    )
    if any(_path_claimed(path) for path in shadow_pair):
        symlink_count = sum(path.is_symlink() for path in shadow_pair)
        if symlink_count == len(shadow_pair):
            origin = "canonical-link"
        elif symlink_count:
            origin = "shadow-mixed"
        else:
            origin = "shadow"
        return origin, shadow_root

    canonical_pair = (
        artifact_path(canonical_root, module, ".olean"),
        artifact_path(canonical_root, module, ".ilean"),
    )
    if any(_path_claimed(path) for path in canonical_pair):
        return "canonical", canonical_root
    return "missing", None


def make_build_plan(
    order: Sequence[str],
    internal_dependencies: Mapping[str, Sequence[str]],
    *,
    lean_root: Path = LEAN_ROOT,
    canonical_root: Path = CANONICAL,
    shadow_root: Path = SHADOW,
) -> BuildPlan:
    """Classify artifacts in topological order and propagate every stale dependency."""

    states: dict[str, ModuleArtifactState] = {}
    for module in order:
        source = source_path(module, lean_root)
        origin, root = _artifact_root(module, canonical_root, shadow_root)
        olean = artifact_path(root, module, ".olean") if root is not None else None
        ilean = artifact_path(root, module, ".ilean") if root is not None else None
        reasons: list[str] = []
        olean_mtime_ns: int | None = None
        ilean_mtime_ns: int | None = None

        if origin == "shadow-mixed":
            reasons.append("mixed-shadow-pair")

        try:
            if olean is None or not olean.is_file():
                reasons.append("missing-olean")
            else:
                olean_mtime_ns = olean.stat().st_mtime_ns
        except OSError:
            reasons.append("unreadable-olean")

        try:
            if ilean is None or not ilean.is_file():
                reasons.append("missing-ilean")
            else:
                ilean_mtime_ns = ilean.stat().st_mtime_ns
        except OSError:
            reasons.append("unreadable-ilean")

        source_mtime_ns = source.stat().st_mtime_ns
        if olean_mtime_ns is not None and source_mtime_ns > olean_mtime_ns:
            reasons.append("source-newer-than-olean")
        if ilean_mtime_ns is not None and source_mtime_ns > ilean_mtime_ns:
            reasons.append("source-newer-than-ilean")

        for dependency in internal_dependencies[module]:
            dependency_state = states.get(dependency)
            if dependency_state is None:
                raise RuntimeError(
                    f"{module} was not topologically ordered after dependency {dependency}"
                )
            if not dependency_state.valid:
                reasons.append(f"dependency-needs-rebuild:{dependency}")
            elif (
                olean_mtime_ns is not None
                and dependency_state.olean_mtime_ns is not None
                and dependency_state.olean_mtime_ns > olean_mtime_ns
            ):
                reasons.append(f"dependency-newer:{dependency}")

        states[module] = ModuleArtifactState(
            module=module,
            valid=not reasons,
            origin=origin,
            olean=olean,
            ilean=ilean,
            olean_mtime_ns=olean_mtime_ns,
            reasons=tuple(reasons),
        )

    todo = tuple(module for module in order if not states[module].valid)
    todo_set = set(todo)
    ready = tuple(
        module
        for module in todo
        if not any(dependency in todo_set for dependency in internal_dependencies[module])
    )
    return BuildPlan(states, todo, ready)


def lean_paths(environment: Mapping[str, str]) -> tuple[Path, ...]:
    raw = environment.get("LEAN_PATH")
    if not raw:
        raise SystemExit("LEAN_PATH is unset; run this script through `lake env`")
    return tuple(Path(item) for item in raw.split(os.pathsep) if item)


def missing_external_artifacts(
    external_modules: Sequence[str],
    search_roots: Sequence[Path],
) -> tuple[str, ...]:
    missing: list[str] = []
    for module in external_modules:
        if not any(artifact_path(root, module, ".olean").is_file() for root in search_roots):
            missing.append(module)
    return tuple(missing)


def lean_version(environment: Mapping[str, str]) -> str:
    version = subprocess.check_output(
        ["lean", "--version"],
        cwd=LEAN_ROOT,
        env=environment,
        text=True,
    ).strip()
    if not version.startswith(LEAN_VERSION_PREFIX):
        raise SystemExit(f"expected Lean 4.27.0, got: {version}")
    return version


def mirror_existing_artifacts() -> int:
    """Add read-only canonical symlinks without replacing compiled shadow files."""

    linked = 0
    if not CANONICAL.is_dir():
        raise SystemExit(f"canonical artifact root is missing: {CANONICAL}")
    for source in CANONICAL.rglob("*"):
        if not source.is_file() or source.suffix not in {".olean", ".ilean"}:
            continue
        destination = SHADOW / source.relative_to(CANONICAL)
        if destination.exists() and not destination.is_symlink():
            continue
        source_target = source.resolve()
        if destination.is_symlink():
            try:
                if destination.resolve(strict=True) == source_target:
                    continue
            except OSError:
                pass
            destination.unlink()
        destination.parent.mkdir(parents=True, exist_ok=True)
        destination.symlink_to(source_target)
        linked += 1
    return linked


class ScratchBuildLock:
    """An atomically published, stale-PID-aware scratch-directory lock."""

    def __init__(self, path: Path) -> None:
        self.path = path
        self.token = f"{os.getpid()}:{time.monotonic_ns()}"
        self.acquired = False

    @staticmethod
    def _pid_is_alive(pid: int) -> bool:
        try:
            os.kill(pid, 0)
        except ProcessLookupError:
            return False
        except PermissionError:
            return True
        return True

    def __enter__(self) -> ScratchBuildLock:
        self.path.parent.mkdir(parents=True, exist_ok=True)
        descriptor, candidate_name = tempfile.mkstemp(
            prefix=f".{self.path.name}.",
            suffix=".candidate",
            dir=self.path.parent,
        )
        candidate = Path(candidate_name)
        try:
            with os.fdopen(descriptor, "w") as lock_file:
                lock_file.write(self.token + "\n")
                lock_file.flush()
                os.fsync(lock_file.fileno())

            for _attempt in range(3):
                try:
                    os.link(candidate, self.path)
                except FileExistsError:
                    try:
                        existing = self.path.read_text().strip()
                        pid = int(existing.split(":", 1)[0])
                    except FileNotFoundError:
                        continue
                    except (OSError, ValueError):
                        try:
                            age_s = max(
                                0.0,
                                (time.time_ns() - self.path.stat().st_mtime_ns)
                                / 1_000_000_000,
                            )
                        except FileNotFoundError:
                            continue
                        if age_s < LOCK_INITIALIZATION_GRACE_S:
                            raise SystemExit(
                                "scratch build lock is initializing or unreadable: "
                                f"{self.path}"
                            )
                        try:
                            self.path.unlink()
                        except FileNotFoundError:
                            continue
                        continue
                    if self._pid_is_alive(pid):
                        raise SystemExit(
                            f"scratch build already active as pid {pid}: {self.path}"
                        )
                    try:
                        self.path.unlink()
                    except FileNotFoundError:
                        continue
                    continue
                self.acquired = True
                return self
            raise SystemExit(f"could not acquire scratch build lock: {self.path}")
        finally:
            try:
                candidate.unlink()
            except FileNotFoundError:
                pass

    def __exit__(self, _exc_type: object, _exc: object, _traceback: object) -> None:
        if not self.acquired:
            return
        try:
            if self.path.read_text().strip() == self.token:
                self.path.unlink()
        except FileNotFoundError:
            pass


def module_log_path(module: str) -> Path:
    return Path(str(MODULE_LOG_ROOT / module_relative_path(module)) + ".log")


def _input_stamp(path: Path, *, hash_contents: bool) -> tuple[int, int, int, int, str]:
    """Capture enough identity to reject an input changed during compilation."""

    before = path.stat()
    digest = hashlib.sha256(path.read_bytes()).hexdigest() if hash_contents else ""
    after = path.stat()
    before_identity = (
        before.st_dev,
        before.st_ino,
        before.st_size,
        before.st_mtime_ns,
    )
    after_identity = (
        after.st_dev,
        after.st_ino,
        after.st_size,
        after.st_mtime_ns,
    )
    if before_identity != after_identity:
        raise RuntimeError(f"input changed while it was being inspected: {path}")
    return (*after_identity, digest)


def _compile_module(
    module: str,
    internal_dependencies: Sequence[str],
    environment: Mapping[str, str],
) -> CompileResult:
    started = time.monotonic()
    log_path = module_log_path(module)
    log_path.parent.mkdir(parents=True, exist_ok=True)
    WORK_ROOT.mkdir(parents=True, exist_ok=True)
    digest = hashlib.sha256(module.encode()).hexdigest()[:16]

    try:
        with tempfile.TemporaryDirectory(prefix=f"{digest}-", dir=WORK_ROOT) as temporary:
            temporary_root = Path(temporary)
            temporary_olean = temporary_root / "module.olean"
            temporary_ilean = temporary_root / "module.ilean"
            source = source_path(module)
            final_olean = artifact_path(SHADOW, module, ".olean")
            final_ilean = artifact_path(SHADOW, module, ".ilean")
            inputs = [
                (source, True),
                *[
                    (artifact_path(SHADOW, dependency, ".olean"), False)
                    for dependency in internal_dependencies
                ],
            ]
            command = [
                "lean",
                *LEAN_ARGS,
                "-o",
                str(temporary_olean),
                "-i",
                str(temporary_ilean),
                str(source.relative_to(LEAN_ROOT)),
            ]

            with log_path.open("w") as module_log:
                module_log.write(f"module={module}\ncommand={shlex.join(command)}\n\n")
                module_log.flush()
                input_stamps = {
                    path: _input_stamp(path, hash_contents=hash_contents)
                    for path, hash_contents in inputs
                }
                completed = subprocess.run(
                    command,
                    cwd=LEAN_ROOT,
                    env=environment,
                    stdout=module_log,
                    stderr=subprocess.STDOUT,
                )
                if completed.returncode:
                    return CompileResult(
                        module,
                        completed.returncode,
                        time.monotonic() - started,
                        log_path,
                        "Lean compilation failed",
                    )
                changed_inputs: list[Path] = []
                for path, hash_contents in inputs:
                    try:
                        current = _input_stamp(path, hash_contents=hash_contents)
                    except OSError:
                        changed_inputs.append(path)
                        continue
                    if current != input_stamps[path]:
                        changed_inputs.append(path)
                if changed_inputs:
                    detail = "inputs changed during Lean compilation: " + ", ".join(
                        str(path) for path in changed_inputs
                    )
                    module_log.write("\n" + detail + "\n")
                    return CompileResult(
                        module,
                        75,
                        time.monotonic() - started,
                        log_path,
                        detail,
                    )
                missing_outputs = [
                    str(path)
                    for path in (temporary_olean, temporary_ilean)
                    if not path.is_file()
                ]
                if missing_outputs:
                    detail = "Lean succeeded without outputs: " + ", ".join(missing_outputs)
                    module_log.write("\n" + detail + "\n")
                    return CompileResult(
                        module,
                        70,
                        time.monotonic() - started,
                        log_path,
                        detail,
                    )

            final_olean.parent.mkdir(parents=True, exist_ok=True)
            # Publish the semantic import artifact last so interrupted runs remain stale.
            os.replace(temporary_ilean, final_ilean)
            os.replace(temporary_olean, final_olean)
        return CompileResult(module, 0, time.monotonic() - started, log_path)
    except Exception as error:
        with log_path.open("a") as module_log:
            module_log.write("\nBUILDER_EXCEPTION\n")
            traceback.print_exc(file=module_log)
        return CompileResult(
            module,
            70,
            time.monotonic() - started,
            log_path,
            f"{type(error).__name__}: {error}",
        )


ScheduleEvent = Callable[[str, str, CompileResult | None], None]
CompileOne = Callable[[str], CompileResult]


def run_parallel_dag(
    order: Sequence[str],
    internal_dependencies: Mapping[str, Sequence[str]],
    todo: Sequence[str],
    workers: int,
    compile_one: CompileOne,
    event: ScheduleEvent | None = None,
) -> ScheduleOutcome:
    """Run a bounded ready queue and stop submitting as soon as one job fails."""

    if workers < 1:
        raise ValueError("workers must be positive")
    todo_set = set(todo)
    order_index = {module: index for index, module in enumerate(order)}
    remaining_dependencies = {
        module: sum(dependency in todo_set for dependency in internal_dependencies[module])
        for module in todo
    }
    dependents: dict[str, list[str]] = defaultdict(list)
    for module in todo:
        for dependency in internal_dependencies[module]:
            if dependency in todo_set:
                dependents[dependency].append(module)

    ready: list[tuple[int, str]] = [
        (order_index[module], module)
        for module in todo
        if remaining_dependencies[module] == 0
    ]
    heapq.heapify(ready)
    futures: dict[Future[CompileResult], str] = {}
    submitted: list[str] = []
    results: list[CompileResult] = []
    first_failure: CompileResult | None = None

    def submit_ready(executor: ThreadPoolExecutor) -> None:
        while ready and len(futures) < workers and first_failure is None:
            _index, module = heapq.heappop(ready)
            if event is not None:
                event("submitted", module, None)
            future = executor.submit(compile_one, module)
            futures[future] = module
            submitted.append(module)

    with ThreadPoolExecutor(max_workers=workers, thread_name_prefix="card11-shadow") as executor:
        submit_ready(executor)
        while futures:
            done, _pending = wait(tuple(futures), return_when=FIRST_COMPLETED)
            batch: list[CompileResult] = []
            for future in done:
                module = futures.pop(future)
                try:
                    result = future.result()
                except Exception as error:
                    result = CompileResult(
                        module,
                        70,
                        detail=f"{type(error).__name__}: {error}",
                    )
                if result.module != module:
                    result = CompileResult(
                        module,
                        70,
                        detail=f"compiler returned result for {result.module}",
                    )
                batch.append(result)
            batch.sort(key=lambda result: result.ended_ns)

            failed = [result for result in batch if not result.succeeded]
            if failed and first_failure is None:
                first_failure = failed[0]

            for result in batch:
                results.append(result)
                if event is not None:
                    event("finished", result.module, result)
                if not result.succeeded:
                    continue
                for dependent in dependents[result.module]:
                    remaining_dependencies[dependent] -= 1
                    if remaining_dependencies[dependent] == 0:
                        heapq.heappush(
                            ready,
                            (order_index[dependent], dependent),
                        )
            submit_ready(executor)

    unscheduled = tuple(module for module in todo if module not in set(submitted))
    if first_failure is None and unscheduled:
        raise RuntimeError(
            "DAG scheduler exhausted its ready queue with unscheduled modules: "
            + ", ".join(unscheduled[:5])
        )
    return ScheduleOutcome(
        tuple(results),
        tuple(submitted),
        unscheduled,
        first_failure,
    )


def _reason_family(reason: str) -> str:
    return reason.split(":", 1)[0]


def print_status(graph: DependencyGraph, plan: BuildPlan, workers: int) -> None:
    valid = len(graph.order) - len(plan.todo)
    valid_origins = Counter(
        state.origin for state in plan.states.values() if state.valid
    )
    reason_counts = Counter(
        _reason_family(reason)
        for module in plan.todo
        for reason in plan.states[module].reasons
    )
    print(
        f"project closure={len(graph.order)} valid={valid} rebuild={len(plan.todo)} "
        f"initial-ready={len(plan.ready)} workers={workers}"
    )
    print(
        "valid origins: "
        + " ".join(f"{origin}={count}" for origin, count in sorted(valid_origins.items()))
    )
    if reason_counts:
        print(
            "rebuild reasons: "
            + " ".join(f"{reason}={count}" for reason, count in reason_counts.most_common())
        )
    if plan.ready:
        preview = ", ".join(plan.ready[:12])
        suffix = " ..." if len(plan.ready) > 12 else ""
        print(f"initial ready: {preview}{suffix}")


def write_manifest(plan: BuildPlan) -> None:
    MANIFEST.parent.mkdir(parents=True, exist_ok=True)
    text = "\n".join(plan.todo)
    MANIFEST.write_text(text + ("\n" if text else ""))


def run_smoke(environment: Mapping[str, str], main_log: object) -> None:
    command = ["lean", *LEAN_ARGS, "--stdin"]
    with SMOKE_LOG.open("w") as smoke_log:
        smoke_log.write(f"command={shlex.join(command)}\n\n")
        smoke_log.flush()
        completed = subprocess.run(
            command,
            cwd=LEAN_ROOT,
            env=environment,
            input=f"import {TARGET}\n",
            text=True,
            stdout=smoke_log,
            stderr=subprocess.STDOUT,
        )
    if completed.returncode:
        main_log.write(f"INGRESS_IMPORT_CHECK=FAIL log={SMOKE_LOG}\n")
        main_log.flush()
        raise SystemExit(
            f"INGRESS IMPORT CHECK FAILED ({completed.returncode}); log: {SMOKE_LOG}"
        )
    main_log.write(f"INGRESS_IMPORT_CHECK=PASS log={SMOKE_LOG}\n")
    main_log.flush()


def parse_args(argv: Sequence[str] | None = None) -> argparse.Namespace:
    parser = argparse.ArgumentParser(description=__doc__)
    parser.add_argument(
        "--workers",
        type=int,
        default=DEFAULT_WORKERS,
        help=f"maximum concurrent Lean processes (default: {DEFAULT_WORKERS})",
    )
    mode = parser.add_mutually_exclusive_group()
    mode.add_argument(
        "--status",
        action="store_true",
        help="read-only resume/staleness report; do not link or compile",
    )
    mode.add_argument(
        "--dry-run",
        action="store_true",
        help="alias for --status",
    )
    arguments = parser.parse_args(argv)
    if arguments.workers < 1:
        parser.error("--workers must be positive")
    return arguments


def main(argv: Sequence[str] | None = None) -> None:
    sys.setrecursionlimit(10_000)
    arguments = parse_args(argv)
    environment = os.environ.copy()
    original_lean_paths = lean_paths(environment)
    version = lean_version(environment)
    graph = dependency_graph(TARGET)
    missing_external = missing_external_artifacts(
        graph.external,
        (SHADOW, *original_lean_paths),
    )
    if missing_external:
        preview = ", ".join(missing_external[:10])
        raise SystemExit(
            f"{len(missing_external)} imported external oleans are unavailable: {preview}"
        )
    plan = make_build_plan(graph.order, graph.internal)
    print_status(graph, plan, arguments.workers)
    if arguments.status or arguments.dry_run:
        print(f"lean={version}")
        print("status mode: no files changed and no Lean modules compiled")
        return

    with ScratchBuildLock(LOCK):
        if (LEAN_ROOT / ".lake/lake-build.lock").exists():
            raise SystemExit("refusing to race an active lake-build lock")
        SHADOW.mkdir(parents=True, exist_ok=True)
        linked = mirror_existing_artifacts()
        environment["LEAN_PATH"] = (
            str(SHADOW) + os.pathsep + os.pathsep.join(map(str, original_lean_paths))
        )
        # Re-plan after linking and while holding the scratch lock.
        plan = make_build_plan(graph.order, graph.internal)
        write_manifest(plan)
        print(f"newly linked artifacts={linked} resumable rebuild={len(plan.todo)}")

        LOG.parent.mkdir(parents=True, exist_ok=True)
        with LOG.open("a", buffering=1) as main_log:
            started_at = datetime.now(timezone.utc).isoformat()
            main_log.write(
                f"\nRUN_START={started_at}\ntarget={TARGET}\nclosure={len(graph.order)}\n"
                f"rebuild={len(plan.todo)}\nworkers={arguments.workers}\n"
                f"shadow={SHADOW}\nlean={version}\n"
            )
            completed_count = 0

            def record_event(
                event_name: str,
                module: str,
                result: CompileResult | None,
            ) -> None:
                nonlocal completed_count
                if event_name == "submitted":
                    main_log.write(f"SUBMIT module={module} log={module_log_path(module)}\n")
                    return
                assert result is not None
                completed_count += result.succeeded
                status = "PASS" if result.succeeded else "FAIL"
                main_log.write(
                    f"{status} module={module} duration_s={result.duration_s:.3f} "
                    f"returncode={result.returncode} log={result.log_path} "
                    f"detail={result.detail}\n"
                )
                if (
                    not result.succeeded
                    or completed_count == 1
                    or completed_count % 25 == 0
                    or completed_count == len(plan.todo)
                ):
                    print(
                        f"{status.lower()} completed={completed_count}/{len(plan.todo)} "
                        f"module={module}"
                    )

            outcome = run_parallel_dag(
                graph.order,
                graph.internal,
                plan.todo,
                arguments.workers,
                lambda module: _compile_module(
                    module,
                    graph.internal[module],
                    environment,
                ),
                record_event,
            )
            if outcome.first_failure is not None:
                failure = outcome.first_failure
                main_log.write(
                    f"RUN_RESULT=FAIL first_failure={failure.module} "
                    f"unscheduled={len(outcome.unscheduled)}\n"
                )
                print(f"FAILED module: {failure.module}")
                print(f"module log: {failure.log_path}")
                print(f"main log: {LOG}")
                raise SystemExit(failure.returncode)

            run_smoke(environment, main_log)
            final_plan = make_build_plan(graph.order, graph.internal)
            write_manifest(final_plan)
            if final_plan.todo:
                preview = ", ".join(final_plan.todo[:10])
                main_log.write(
                    f"RUN_RESULT=FAIL post_smoke_stale={len(final_plan.todo)} "
                    f"preview={preview}\n"
                )
                print(
                    f"FAILED: {len(final_plan.todo)} modules became stale during the run"
                )
                print(f"resume manifest: {MANIFEST}")
                print(f"main log: {LOG}")
                raise SystemExit(75)
            main_log.write("RUN_RESULT=PASS\n")

    print(f"target olean: {artifact_path(SHADOW, TARGET, '.olean')}")
    print(f"target ilean: {artifact_path(SHADOW, TARGET, '.ilean')}")
    print(f"main log: {LOG}")
    print(f"smoke log: {SMOKE_LOG}")
    print("ingress import check: PASS")


if __name__ == "__main__":
    main()
