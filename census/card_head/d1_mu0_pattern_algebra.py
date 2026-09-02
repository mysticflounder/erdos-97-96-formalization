"""Stage 2 metric realizability of Stage 1 incidence patterns (TriApex mu = 0 cell).

Consumes the ``*.models.jsonl`` files written by
``census/card_head/d1_mu0_incidence_census.py`` (one ``Pattern.to_json()``
record per line) and asks, per metric pattern, whether the equidistance
equalities the pattern asserts have a solution in the plane.

Metric content of a pattern.  Only the incidence data with metric meaning
is kept: every four-point shell with its centre (``centre[x]`` is at one
distance from the four points of ``shell[x]``) and every apex class
(``A{k}.{t}`` is a set of points at one distance from apex ``k``).  The
role labels (``kept``, ``deleted``, ``source``, ``z``, ``w``, ``E``) and the
slice partition carry no equation and are dropped, so several Stage 1
records collapse to one metric pattern.

Normalization.  Apex ``A0`` is pinned at the origin and apex ``A1`` at
``(1, 0)``; the remaining thirteen points carry two coordinates each, so the
polynomial ring has 26 variables (the degree-of-freedom count of the plan's
Phase 2).  Every equality is a difference of squared distances, a
polynomial of degree at most two.

Verdicts.  For each pattern the emitted Singular script computes a Groebner
basis over the rationals and prints ``dim`` (Krull dimension of the complex
variety, ``-1`` when the ideal is the unit ideal), ``vdim`` when the variety
is finite, and then ``nrRootsDeterm`` from ``rootsmr.lib``, the number of
distinct real solutions of a zero-dimensional system.  An optional
saturation by chosen distinctness polynomials removes components on which
two named points coincide.  Every run goes through the piqd daemon
(``piqc singular run``); this module never spawns Singular itself.

Trust boundary.  Singular is one engine.  Guardrail 7 of the sat-solvers
skill requires an independent engine before a decisive emptiness verdict is
banked; until piqd offers one, every verdict here is CONJECTURE at the
encoded scope and is recorded as one-engine evidence.  Nothing here closes a
Lean obligation.
"""

from __future__ import annotations

import argparse
import hashlib
import json
import subprocess
import sys
import time
from collections.abc import Iterable, Mapping, Sequence
from dataclasses import dataclass, field
from datetime import UTC, datetime
from itertools import combinations
from pathlib import Path
from typing import Any

SCHEMA = "p97_d1_mu0_pattern_algebra.v1"
SEMANTIC_STATUS = "discovery_metric_realizability_one_engine_card15_only"
PROMOTION_ELIGIBLE = False
LANE_ID = "d1-triapex-plan-20260901"
PROJECT_LABEL = "erdos-97-96-formalization"
SOURCE_LABEL = "d1-triapex-plan-20260901/pattern-algebra"
QUEUE_ALLOWANCE_S = 3600

APEX_NAMES = ("A0", "A1", "A2")
INTERIOR_NAMES = tuple(f"P{k}.{s}" for k in range(3) for s in range(1, 5))
ALL_NAMES = APEX_NAMES + INTERIOR_NAMES
PINNED: dict[str, tuple[str, str]] = {"A0": ("0", "0"), "A1": ("1", "0")}


class D1Mu0AlgebraError(ValueError):
    """A pattern record, a script, or a Singular reply broke its contract."""


# --------------------------------------------------------------------------
# Metric pattern
# --------------------------------------------------------------------------


@dataclass(frozen=True)
class MetricPattern:
    """Shells ``(centre, support)`` and apex classes ``(apex, members)``."""

    shells: tuple[tuple[str, tuple[str, ...]], ...]
    classes: tuple[tuple[str, tuple[str, ...]], ...]

    @property
    def key(self) -> str:
        payload = json.dumps(
            {"shells": self.shells, "classes": self.classes},
            sort_keys=True,
            separators=(",", ":"),
        )
        return hashlib.sha256(payload.encode("utf-8")).hexdigest()[:16]

    @property
    def points(self) -> tuple[str, ...]:
        seen: set[str] = set()
        for centre, support in self.shells:
            seen.add(centre)
            seen.update(support)
        for apex, members in self.classes:
            seen.add(apex)
            seen.update(members)
        return tuple(name for name in ALL_NAMES if name in seen)


def _check_name(name: str) -> str:
    if name not in ALL_NAMES:
        raise D1Mu0AlgebraError(f"unknown point label {name!r}")
    return name


def metric_pattern(record: Mapping[str, Any]) -> MetricPattern:
    """Project one Stage 1 ``Pattern.to_json()`` record to its metric content."""

    centre = record["centre"]
    shell = record["shell"]
    if set(centre) != set(shell):
        raise D1Mu0AlgebraError("centre and shell maps range over different points")
    shells: set[tuple[str, tuple[str, ...]]] = set()
    for x, c in centre.items():
        support = tuple(sorted(_check_name(y) for y in shell[x]))
        if len(support) != 4 or len(set(support)) != 4:
            raise D1Mu0AlgebraError(f"shell of {x} is not four distinct points")
        if x not in support:
            raise D1Mu0AlgebraError(f"shell of {x} does not contain {x}")
        if _check_name(c) in support:
            raise D1Mu0AlgebraError(f"centre {c} of {x} lies in its own shell")
        shells.add((c, support))
    classes: set[tuple[str, tuple[str, ...]]] = set()
    for name, members in record["classes"].items():
        apex = f"A{name.split('.')[0][1:]}"
        _check_name(apex)
        member_names = tuple(sorted(_check_name(m) for m in members))
        if apex in member_names:
            raise D1Mu0AlgebraError(f"apex {apex} lies in its own class {name}")
        if len(member_names) >= 2:
            classes.add((apex, member_names))
    return MetricPattern(tuple(sorted(shells)), tuple(sorted(classes)))


def load_patterns(paths: Iterable[Path]) -> dict[str, tuple[MetricPattern, int]]:
    """Distinct metric patterns across model files, with their record counts."""

    result: dict[str, tuple[MetricPattern, int]] = {}
    for path in paths:
        with Path(path).open(encoding="utf-8") as handle:
            for line in handle:
                line = line.strip()
                if not line:
                    continue
                record = json.loads(line)
                if "pattern" in record and isinstance(record["pattern"], dict):
                    record = record["pattern"]
                pattern = metric_pattern(record)
                previous = result.get(pattern.key)
                result[pattern.key] = (pattern, 1 + (previous[1] if previous else 0))
    return result


# --------------------------------------------------------------------------
# Polynomials
# --------------------------------------------------------------------------


def var_names(points: Sequence[str]) -> tuple[str, ...]:
    names: list[str] = []
    for name in ALL_NAMES:
        if name in PINNED or name not in points:
            continue
        names.extend((coord_name(name, "x"), coord_name(name, "y")))
    return tuple(names)


def coord_name(point: str, axis: str) -> str:
    return f"{axis}{point.replace('.', 's')}"


def coords(point: str) -> tuple[str, str]:
    if point in PINNED:
        return PINNED[point]
    return coord_name(point, "x"), coord_name(point, "y")


def squared_distance(p: str, q: str) -> str:
    px, py = coords(p)
    qx, qy = coords(q)
    return f"(({px})-({qx}))^2+(({py})-({qy}))^2"


def equidistance_equations(centre: str, members: Sequence[str]) -> list[str]:
    """``|centre - m_0|^2 = |centre - m_j|^2`` for every later member ``m_j``."""

    if centre in members:
        raise D1Mu0AlgebraError(f"{centre} cannot be equidistant from itself")
    first = members[0]
    return [
        f"({squared_distance(centre, first)})-({squared_distance(centre, other)})"
        for other in members[1:]
    ]


def equations(pattern: MetricPattern) -> list[str]:
    result: list[str] = []
    for centre, support in pattern.shells:
        result.extend(equidistance_equations(centre, support))
    for apex, members in pattern.classes:
        result.extend(equidistance_equations(apex, members))
    return result


def distinctness_polynomial(p: str, q: str) -> str:
    """Vanishes exactly where ``p = q``; used to saturate away coincidences."""

    return squared_distance(p, q)


# --------------------------------------------------------------------------
# Singular script
# --------------------------------------------------------------------------


def singular_script(
    pattern: MetricPattern,
    *,
    saturate: Sequence[tuple[str, str]] = (),
    extra: Sequence[str] = (),
    real_roots: bool = True,
    char: int = 0,
) -> str:
    """Emit the Singular script deciding one pattern.

    ``saturate`` lists point pairs whose coincidence locus is removed by
    saturation (one pair at a time) before the dimension is read.  ``extra``
    adds raw polynomials (tests).  ``char`` selects the coefficient field:
    ``0`` is the rationals (the deciding field); a prime gives a modular
    prefilter, which can report a unit ideal for an unlucky prime and is
    therefore never the final word.  Output lines are ``key value`` pairs.
    """

    points = pattern.points
    names = var_names(points)
    if not names:
        raise D1Mu0AlgebraError("pattern has no free coordinates")
    lines = [
        "// generated by census/card_head/d1_mu0_pattern_algebra.py",
        f"// pattern {pattern.key}",
        'LIB "elim.lib";',
        'LIB "rootsmr.lib";',
        f"ring R = {char},({','.join(names)}),dp;",
        "option(redSB);",
        "ideal I;",
    ]
    for poly in list(equations(pattern)) + list(extra):
        lines.append(f"I = I,{poly};")
    lines.append("I = simplify(I,2);")
    lines.append(f'print("equations {len(equations(pattern)) + len(extra)}");')
    lines.append("ideal G = std(I);")
    lines.append('print("dim_raw " + string(dim(G)));')
    if saturate:
        # One saturation per pair keeps every intermediate basis small; a
        # single product of all pair polynomials would have degree 2 * pairs.
        # ``sat`` returns an ideal in Singular 4.4 and a list (ideal, exponent)
        # in older releases; accept both.
        lines.append("def S;")
        for p, q in saturate:
            lines.append(f"S = sat(G,ideal({distinctness_polynomial(p, q)}));")
            lines.append('if (typeof(S) == "list") { G = std(S[1]); } else { G = std(S); }')
        lines.append('print("dim_sat " + string(dim(G)));')
    lines.append('print("dim " + string(dim(G)));')
    lines.append("if (dim(G) == 0) {")
    lines.append('  print("vdim " + string(vdim(G)));')
    if real_roots and char == 0:
        lines.append('  print("real " + string(nrRootsDeterm(G)));')
    lines.append("}")
    lines.append("quit;")
    return "\n".join(lines) + "\n"


def parse_output(stdout: str) -> dict[str, int]:
    """Read the ``key value`` lines; Singular errors do not change the exit code."""

    result: dict[str, int] = {}
    for line in stdout.splitlines():
        if line.lstrip().startswith("?"):
            raise D1Mu0AlgebraError(f"Singular error: {line.strip()}")
        parts = line.strip().split()
        if len(parts) == 2 and parts[0] in ("equations", "dim_raw", "dim_sat", "dim", "vdim", "real"):
            result[parts[0]] = int(parts[1])
    if "dim" not in result:
        raise D1Mu0AlgebraError("Singular output has no dim line")
    if "dim_sat" in result and result["dim_sat"] > result["dim_raw"]:
        raise D1Mu0AlgebraError("saturation raised the dimension; script is broken")
    return result


def verdict(fields: Mapping[str, int]) -> str:
    """Classify one parsed output at the encoded scope (one engine)."""

    dim = fields["dim"]
    if dim < 0:
        return "EMPTY_COMPLEX"
    if dim > 0:
        return "POSITIVE_DIMENSIONAL"
    real = fields.get("real")
    if real is None:
        return "FINITE_UNKNOWN_REAL"
    return "FINITE_NO_REAL" if real == 0 else "FINITE_REAL_CANDIDATES"


# --------------------------------------------------------------------------
# piqd Singular lane
# --------------------------------------------------------------------------


@dataclass
class SingularRun:
    run_id: str
    receipt: dict[str, Any]
    stdout: str
    stderr: str


def _piqc(args: Sequence[str]) -> str:
    proc = subprocess.run(["piqc", *args], capture_output=True, text=True, check=False)
    if proc.returncode != 0:
        raise D1Mu0AlgebraError(f"piqc {' '.join(args)} failed: {proc.stderr.strip()}")
    return proc.stdout


def run_script(script_path: Path, *, timeout_s: int, source: str = SOURCE_LABEL) -> SingularRun:
    """Submit one script through ``piqc singular run --wait`` and read it back.

    piqd executes Singular runs one at a time, so a queued run can outlive
    the client's own wait; the receipt is then re-read until the daemon
    reports the run finished (bounded by the run timeout plus a queue
    allowance).
    """

    receipt = json.loads(
        _piqc(
            [
                "singular",
                "run",
                str(script_path),
                "--project",
                PROJECT_LABEL,
                "--source",
                source,
                "--timeout",
                str(timeout_s),
                "--wait",
            ]
        )
    )
    run_id = receipt["id"]
    deadline = time.monotonic() + timeout_s + QUEUE_ALLOWANCE_S
    while receipt.get("state") != "finished" and time.monotonic() < deadline:
        time.sleep(2.0)
        receipt = json.loads(_piqc(["singular", "show", run_id]))
    stdout = _piqc(["singular", "stdout", run_id]) if receipt.get("state") == "finished" else ""
    stderr = _piqc(["singular", "stderr", run_id]) if receipt.get("state") == "finished" else ""
    return SingularRun(run_id, receipt, stdout, stderr)


def sha256_hex(payload: bytes) -> str:
    return hashlib.sha256(payload).hexdigest()


@dataclass
class PatternResult:
    key: str
    records: int
    script_sha256: str
    run_id: str
    run_status: str
    exit_code: int | None
    wall_ms: int | None
    fields: dict[str, int] = field(default_factory=dict)
    verdict: str = "NO_OUTPUT"
    stderr_head: str = ""

    def to_json(self) -> dict[str, Any]:
        return {
            "key": self.key,
            "records": self.records,
            "script_sha256": self.script_sha256,
            "run_id": self.run_id,
            "run_status": self.run_status,
            "exit_code": self.exit_code,
            "wall_ms": self.wall_ms,
            "fields": self.fields,
            "verdict": self.verdict,
            "stderr_head": self.stderr_head,
        }


def decide_pattern(
    pattern: MetricPattern,
    records: int,
    artifacts: Path,
    *,
    timeout_s: int,
    saturate: Sequence[tuple[str, str]] = (),
    char: int = 0,
) -> PatternResult:
    """Decide one pattern; over a prime field every verdict is prefixed ``MOD_``."""

    script = singular_script(pattern, saturate=saturate, char=char)
    script_path = artifacts / f"pattern-{pattern.key}.sing"
    script_path.write_text(script, encoding="utf-8")
    run = run_script(script_path, timeout_s=timeout_s)
    (artifacts / f"pattern-{pattern.key}.receipt.json").write_text(
        json.dumps(run.receipt, indent=1, sort_keys=True) + "\n", encoding="utf-8"
    )
    (artifacts / f"pattern-{pattern.key}.stdout.txt").write_text(run.stdout, encoding="utf-8")
    if run.stderr:
        (artifacts / f"pattern-{pattern.key}.stderr.txt").write_text(run.stderr, encoding="utf-8")
    result = PatternResult(
        key=pattern.key,
        records=records,
        script_sha256=sha256_hex(script.encode("utf-8")),
        run_id=run.run_id,
        run_status=str(run.receipt.get("run_status")),
        exit_code=run.receipt.get("exit_code"),
        wall_ms=run.receipt.get("wall_ms"),
        stderr_head=run.stderr[:400],
    )
    if run.receipt.get("run_status") == "RAN" and run.receipt.get("exit_code") == 0:
        try:
            result.fields = parse_output(run.stdout)
            result.verdict = verdict(result.fields)
        except D1Mu0AlgebraError as error:
            result.verdict = f"UNPARSED: {error}"
    elif run.receipt.get("state") == "finished":
        result.verdict = "TIMEOUT" if run.receipt.get("run_status") == "TIMED_OUT" else "RUN_FAILED"
    else:
        result.verdict = "RUN_FAILED"
    if char != 0:
        result.verdict = "MOD_" + result.verdict
    return result


# --------------------------------------------------------------------------
# Minimal inconsistent sub-patterns (cores)
# --------------------------------------------------------------------------


def contains(pattern: MetricPattern, core: MetricPattern) -> bool:
    """Whether every shell and class of ``core`` is a constraint of ``pattern``."""

    return set(core.shells) <= set(pattern.shells) and set(core.classes) <= set(pattern.classes)


def all_pairs(pattern: MetricPattern) -> tuple[tuple[str, str], ...]:
    return tuple(combinations(pattern.points, 2))


def is_empty_saturated(
    pattern: MetricPattern,
    artifacts: Path,
    name: str,
    *,
    timeout_s: int,
    char: int = 0,
    strict: bool = True,
) -> bool:
    """One saturated run; True exactly when the distinct-point variety is empty.

    With ``strict=False`` a run that times out or fails counts as "not
    empty" (the conservative answer for a deletion step) instead of raising.
    """

    script = singular_script(pattern, saturate=all_pairs(pattern), real_roots=False, char=char)
    script_path = artifacts / f"{name}.sing"
    script_path.write_text(script, encoding="utf-8")
    run = run_script(script_path, timeout_s=timeout_s)
    (artifacts / f"{name}.receipt.json").write_text(
        json.dumps(run.receipt, indent=1, sort_keys=True) + "\n", encoding="utf-8"
    )
    (artifacts / f"{name}.stdout.txt").write_text(run.stdout, encoding="utf-8")
    if run.receipt.get("run_status") != "RAN" or run.receipt.get("exit_code") != 0:
        if strict:
            raise D1Mu0AlgebraError(f"{name}: Singular run failed: {run.stderr[:200]}")
        return False
    try:
        return parse_output(run.stdout)["dim"] < 0
    except D1Mu0AlgebraError:
        if strict:
            raise
        return False


PREFILTER_CHAR = 32003


def shrink_core(
    pattern: MetricPattern,
    artifacts: Path,
    *,
    timeout_s: int,
    step_timeout_s: int = 120,
    prefilter_char: int = PREFILTER_CHAR,
) -> tuple[MetricPattern, bool]:
    """Deletion-minimal sub-pattern that is still empty after saturation.

    Every shell and class is dropped in turn and kept out when the rest stays
    empty.  Deletion steps run over ``GF(prefilter_char)`` with a short
    timeout (a timed-out step keeps its constraint), so the result is minimal
    only up to those two approximations.  The returned flag says whether the
    core was then confirmed empty over the rationals; when it was not, the
    full pattern is returned with ``False``.
    """

    shells = list(pattern.shells)
    classes = list(pattern.classes)
    step = 0
    for index in range(len(shells) - 1, -1, -1):
        trial = MetricPattern(tuple(shells[:index] + shells[index + 1 :]), tuple(classes))
        if not trial.points or not var_names(trial.points):
            continue
        step += 1
        if is_empty_saturated(
            trial, artifacts, f"core-{pattern.key}-s{step}", timeout_s=step_timeout_s,
            char=prefilter_char, strict=False,
        ):
            del shells[index]
    for index in range(len(classes) - 1, -1, -1):
        trial = MetricPattern(tuple(shells), tuple(classes[:index] + classes[index + 1 :]))
        if not trial.points or not var_names(trial.points):
            continue
        step += 1
        if is_empty_saturated(
            trial, artifacts, f"core-{pattern.key}-s{step}", timeout_s=step_timeout_s,
            char=prefilter_char, strict=False,
        ):
            del classes[index]
    core = MetricPattern(tuple(shells), tuple(classes))
    confirmed = is_empty_saturated(
        core, artifacts, f"core-{pattern.key}-confirm", timeout_s=timeout_s, char=0, strict=False
    )
    if not confirmed:
        return pattern, False
    return core, True


# --------------------------------------------------------------------------
# Driver
# --------------------------------------------------------------------------


def parse_args(argv: Sequence[str] | None = None) -> argparse.Namespace:
    parser = argparse.ArgumentParser(description=__doc__.splitlines()[0])
    parser.add_argument("models", nargs="+", type=Path, help="Stage 1 *.models.jsonl files")
    parser.add_argument("--artifacts", type=Path, required=True, help="output directory")
    parser.add_argument("--timeout", type=int, default=600, help="per-run wall-clock limit (s)")
    parser.add_argument("--limit", type=int, default=0, help="decide at most this many patterns (0: all)")
    parser.add_argument(
        "--saturate-all-distinct",
        action="store_true",
        help="saturate by every pair of points the pattern mentions (expensive)",
    )
    parser.add_argument("--tag", default="", help="summary file tag")
    parser.add_argument("--keys", default="", help="comma-separated pattern keys to decide (default: all)")
    parser.add_argument(
        "--char",
        type=int,
        default=0,
        help="coefficient field characteristic: 0 (rationals, deciding) or a prime (modular prefilter)",
    )
    parser.add_argument(
        "--core",
        action="store_true",
        help="shrink every refuted pattern to a deletion-minimal core and skip patterns a known core covers",
    )
    return parser.parse_args(argv)


def main(argv: Sequence[str] | None = None) -> int:
    args = parse_args(argv)
    patterns = load_patterns(args.models)
    args.artifacts.mkdir(parents=True, exist_ok=True)
    results: list[dict[str, Any]] = []
    counts: dict[str, int] = {}
    cores: dict[str, MetricPattern] = {}
    coverage: dict[str, int] = {}
    wanted = {k for k in args.keys.split(",") if k}
    if wanted:
        patterns = {k: v for k, v in patterns.items() if k in wanted}
    for index, (key, (pattern, records)) in enumerate(sorted(patterns.items())):
        if args.limit and index >= args.limit:
            break
        covering = next((k for k, core in cores.items() if contains(pattern, core)), None)
        if covering is not None:
            coverage[covering] += 1
            counts["COVERED_BY_CORE"] = counts.get("COVERED_BY_CORE", 0) + 1
            results.append({"key": key, "records": records, "verdict": "COVERED_BY_CORE", "core": covering})
            print(f"{key} records={records} COVERED_BY_CORE {covering}", flush=True)
            continue
        saturate: tuple[tuple[str, str], ...] = ()
        if args.saturate_all_distinct or args.core:
            saturate = all_pairs(pattern)
        result = decide_pattern(
            pattern, records, args.artifacts, timeout_s=args.timeout, saturate=saturate, char=args.char
        )
        entry = result.to_json()
        if args.core and result.verdict in ("EMPTY_COMPLEX", "MOD_EMPTY_COMPLEX"):
            core, confirmed = shrink_core(pattern, args.artifacts, timeout_s=args.timeout)
            cores[core.key] = core
            coverage[core.key] = 1
            entry["core"] = core.key
            entry["core_confirmed"] = confirmed
            entry["core_shells"] = len(core.shells)
            entry["core_classes"] = len(core.classes)
        results.append(entry)
        counts[result.verdict] = counts.get(result.verdict, 0) + 1
        print(f"{key} records={records} {result.verdict} {result.fields} core={entry.get('core', '-')}", flush=True)
    tag = args.tag or datetime.now(UTC).strftime("%Y%m%dT%H%M%SZ")
    summary = {
        "schema": SCHEMA,
        "semantic_status": SEMANTIC_STATUS,
        "promotion_eligible": PROMOTION_ELIGIBLE,
        "lane_id": LANE_ID,
        "engine": "Singular via piqc singular run (one engine; Guardrail 7 cross-check pending)",
        "char": args.char,
        "models": [str(p) for p in args.models],
        "distinct_metric_patterns": len(patterns),
        "decided": len(results),
        "verdict_counts": counts,
        "cores": {
            key: {"shells": core.shells, "classes": core.classes, "covers": coverage[key]}
            for key, core in cores.items()
        },
        "results": results,
    }
    (args.artifacts / f"summary-{tag}.json").write_text(
        json.dumps(summary, indent=1, sort_keys=True) + "\n", encoding="utf-8"
    )
    print(json.dumps({"distinct_metric_patterns": len(patterns), "verdict_counts": counts}))
    return 0


if __name__ == "__main__":
    sys.exit(main())
