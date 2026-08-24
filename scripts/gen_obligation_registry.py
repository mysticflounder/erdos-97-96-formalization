#!/usr/bin/env python3
"""Generate the P97 proof-obligation registry from built-spine truth.

This is the single generated authority ledger described in
``docs/audits/2026-08-23-consolidation-refactor-audit.md`` (sections
"P0 - Single generated authority ledger" and "generated obligation registry as
the sole status source").  It joins Lean declaration identity, publish-spine
reachability, source location and cluster into one canonical file:

    proof-status/obligations.json          canonical registry (schema v1)
    proof-status/id-assignments.json       stable symbol -> id ledger
    proof-status/frontier-table.generated.md  README-shaped open frontier table

Subcommands
-----------
generate --baseline DIR --out DIR
    Build the registry from recorded baseline exports
    (``spine-sorry.json`` / ``offspine-sorry.json`` JSON-lines under DIR).

generate --fresh --out DIR
    Same, but re-export live data first by running ``proof-blueprint`` into a
    temporary directory under DIR.

check --baseline DIR
    Regenerate FRESH from the live tree and exit nonzero with a precise diff if
    the obligation SET or any per-obligation ``lean_decl`` / ``source_file`` /
    ``reachable`` field differs from the committed registry.  This is the
    standing gate for later refactor phases; it never writes.

Standard library only.  Deterministic: no timestamps, every collection sorted.
"""

from __future__ import annotations

import argparse
import json
import shutil
import subprocess
import sys
import tempfile
from pathlib import Path

SCHEMA = "p97-obligation-registry/v1"
ID_SCHEMA = "p97-obligation-id-assignments/v1"
PUBLISH_TARGET = "Problem97.erdos97_rhs"
GENERATED_BY = "scripts/gen_obligation_registry.py"

REPO_ROOT = Path(__file__).resolve().parent.parent

SPINE_EXPORT = "spine-sorry.json"
OFFSPINE_EXPORT = "offspine-sorry.json"
BASE_HEAD_FILE = "base-head.txt"
REGISTRY_NAME = "obligations.json"
ID_ASSIGNMENTS_NAME = "id-assignments.json"
FRONTIER_TABLE_NAME = "frontier-table.generated.md"
META_OVERLAY_NAME = "meta-status.overlay.json"

BLUEPRINT_CMD = "proof-blueprint"
SPINE_ARGS = ["search", "--with-sorry", "--spine", "--json"]
OFFSPINE_ARGS = ["search", "--with-sorry", "--off-spine", "--json"]

# ---------------------------------------------------------------------------
# cluster classification (from the source-file basename)
# ---------------------------------------------------------------------------

CLUSTER_R221 = "R221"
CLUSTER_TA = "TA"
CLUSTER_TS = "TS"
CLUSTER_TD = "TD"
CLUSTER_B1 = "B1"
CLUSTER_X = "X"

CLUSTER_LABELS = {
    CLUSTER_R221: "Rigid221",
    CLUSTER_TA: "TriApex",
    CLUSTER_TS: "TwoSource",
    CLUSTER_TD: "Two-deletion",
    CLUSTER_B1: "B1Live",
    CLUSTER_X: "Other",
}

# Display order of the frontier table, matching the README open-frontier table.
CLUSTER_ORDER = [
    CLUSTER_LABELS[CLUSTER_R221],
    CLUSTER_LABELS[CLUSTER_TA],
    CLUSTER_LABELS[CLUSTER_TS],
    CLUSTER_LABELS[CLUSTER_TD],
    CLUSTER_LABELS[CLUSTER_B1],
    CLUSTER_LABELS[CLUSTER_X],
]

TS_PREFIXES = ("TwoSource", "FreshThird", "FirstFiber", "FirstNonHit")


def module_stem(source_file: str) -> str:
    """Basename of a source path with a trailing ``.lean`` removed."""
    name = source_file.replace("\\", "/").rsplit("/", 1)[-1]
    if name.endswith(".lean"):
        name = name[: -len(".lean")]
    return name


def cluster_code(source_file: str) -> str:
    stem = module_stem(source_file)
    if stem.startswith("Rigid221"):
        return CLUSTER_R221
    if stem.startswith("TriApex"):
        return CLUSTER_TA
    if stem.startswith("TwoDeletionCollision"):
        return CLUSTER_TD
    for prefix in TS_PREFIXES:
        if stem.startswith(prefix):
            return CLUSTER_TS
    if stem.startswith("B1Live"):
        return CLUSTER_B1
    return CLUSTER_X


def cluster_label(source_file: str) -> str:
    return CLUSTER_LABELS[cluster_code(source_file)]


# ---------------------------------------------------------------------------
# slug derivation
# ---------------------------------------------------------------------------

MIN_SLUG_LEN = 10
MAX_SLUG_LEN = 20

# Segments dropped from the front of a declaration base name.
LEAD_NOISE = {"false", "of", "not", "no"}
# Segments dropped from the end of a declaration base name.
TAIL_NOISE = {"of", "counterexample"}
# Segments that carry no distinguishing content when widening a slug leftwards.
SKIP_SEGMENTS = {
    "of", "eq", "ne", "le", "lt", "ge", "gt", "is", "and", "or", "the", "a", "an",
}


def camel_words(text: str) -> list[str]:
    """Split an identifier segment into camel-case words, no regex."""
    words: list[str] = []
    current = ""
    for index, ch in enumerate(text):
        if ch in "_-":
            if current:
                words.append(current)
                current = ""
            continue
        if ch.isupper() and current:
            previous = text[index - 1] if index > 0 else ""
            following = text[index + 1] if index + 1 < len(text) else ""
            starts_word = (
                previous.islower()
                or previous.isdigit()
                or (previous.isupper() and following.islower())
            )
            if starts_word:
                words.append(current)
                current = ""
        current += ch
    if current:
        words.append(current)
    return words


def _upper_alnum(text: str) -> str:
    return "".join(ch for ch in text.upper() if ch.isalnum())


def _joined_length(words: list[str]) -> int:
    return sum(len(_upper_alnum(word)) for word in words)


def slug_for_symbol(symbol: str) -> str:
    """Short UPPERCASE slug from the distinguishing tail of a declaration name.

    The tail is grown right-to-left one underscore segment at a time until it
    reaches ``MIN_SLUG_LEN`` characters, and is trimmed word-by-word from the
    right so it never exceeds ``MAX_SLUG_LEN``.  Example:
    ``false_of_crossBlockerCoincidence`` -> ``CROSSBLOCKER``.
    """
    base = symbol.rsplit(".", 1)[-1]
    segments = [seg for seg in base.split("_") if seg]
    while len(segments) > 1 and segments[0].lower() in LEAD_NOISE:
        segments.pop(0)
    while len(segments) > 1 and segments[-1].lower() in TAIL_NOISE:
        segments.pop()

    words: list[str] = []
    for segment in reversed(segments):
        if segment.lower() in SKIP_SEGMENTS:
            continue
        candidate = camel_words(segment) + words
        if words and _joined_length(candidate) > MAX_SLUG_LEN:
            break
        words = candidate
        if _joined_length(words) >= MIN_SLUG_LEN:
            break

    while len(words) > 1 and _joined_length(words) > MAX_SLUG_LEN:
        words.pop()

    slug = "".join(_upper_alnum(word) for word in words)
    if not slug:
        slug = _upper_alnum(base)
    return slug or "OBLIGATION"


def base_id(symbol: str, source_file: str, reachable: bool) -> str:
    code = cluster_code(source_file)
    prefix = "P97-" + code + "-" if reachable else "P97-OFF-" + code + "-"
    return prefix + slug_for_symbol(symbol)


# ---------------------------------------------------------------------------
# input reading
# ---------------------------------------------------------------------------


class RegistryError(Exception):
    """Operational failure: missing input, failed export, unreadable file."""


def read_records(path: Path) -> list[dict]:
    """Read a proof-blueprint --json export (JSON lines, array tolerated)."""
    if not path.is_file():
        raise RegistryError("missing export file: " + str(path))
    text = path.read_text(encoding="utf-8")
    stripped = text.strip()
    if not stripped:
        return []
    if stripped.startswith("["):
        parsed = json.loads(stripped)
        if not isinstance(parsed, list):
            raise RegistryError("unexpected JSON payload in " + str(path))
        return parsed
    records = []
    for number, line in enumerate(text.splitlines(), start=1):
        line = line.strip()
        if not line:
            continue
        try:
            records.append(json.loads(line))
        except json.JSONDecodeError as exc:
            raise RegistryError(
                "bad JSON on line " + str(number) + " of " + str(path) + ": " + str(exc)
            ) from exc
    return records


def read_json(path: Path) -> dict:
    if not path.is_file():
        raise RegistryError("missing file: " + str(path))
    try:
        return json.loads(path.read_text(encoding="utf-8"))
    except json.JSONDecodeError as exc:
        raise RegistryError("bad JSON in " + str(path) + ": " + str(exc)) from exc


def git_head() -> str:
    try:
        result = subprocess.run(
            ["git", "rev-parse", "HEAD"],
            cwd=str(REPO_ROOT),
            capture_output=True,
            text=True,
            check=False,
        )
    except OSError:
        return ""
    if result.returncode != 0:
        return ""
    return result.stdout.strip()


def read_base_head(baseline_dir: Path | None, out_dir: Path | None) -> str:
    for candidate in (
        baseline_dir / BASE_HEAD_FILE if baseline_dir else None,
        out_dir / "baseline" / BASE_HEAD_FILE if out_dir else None,
    ):
        if candidate is not None and candidate.is_file():
            head = candidate.read_text(encoding="utf-8").strip()
            if head:
                return head
    return "unknown"


def export_fresh(target_dir: Path) -> Path:
    """Run proof-blueprint twice, writing the two exports into target_dir."""
    target_dir.mkdir(parents=True, exist_ok=True)
    for args, name in ((SPINE_ARGS, SPINE_EXPORT), (OFFSPINE_ARGS, OFFSPINE_EXPORT)):
        command = [BLUEPRINT_CMD] + args
        try:
            result = subprocess.run(
                command,
                cwd=str(REPO_ROOT),
                capture_output=True,
                text=True,
                check=False,
            )
        except OSError as exc:
            raise RegistryError(
                "cannot run " + " ".join(command) + ": " + str(exc)
            ) from exc
        if result.returncode != 0:
            detail = result.stderr.strip() or result.stdout.strip() or "(no output)"
            raise RegistryError(
                " ".join(command)
                + " exited "
                + str(result.returncode)
                + " (cwd "
                + str(REPO_ROOT)
                + ")\n"
                + detail
            )
        (target_dir / name).write_text(result.stdout, encoding="utf-8")
    return target_dir


# ---------------------------------------------------------------------------
# id assignment ledger
# ---------------------------------------------------------------------------


def load_id_assignments(path: Path) -> dict:
    if not path.is_file():
        return {"schema": ID_SCHEMA, "assigned": {}, "retired": {}}
    data = read_json(path)
    assigned = data.get("assigned")
    retired = data.get("retired")
    return {
        "schema": data.get("schema", ID_SCHEMA),
        "assigned": dict(assigned) if isinstance(assigned, dict) else {},
        "retired": dict(retired) if isinstance(retired, dict) else {},
    }


def assign_ids(records: list[dict], ledger: dict, source_head: str) -> tuple[dict, dict]:
    """Return (symbol -> id for the current set, updated ledger).

    Existing symbols keep their id even if the slug rule changes.  A symbol
    that reappears after retirement gets its old id back.  New symbols are
    assigned in lexicographic order, with ``-2`` / ``-3`` suffixes on
    collision.  Vanished symbols move to the ``retired`` map with the head at
    which they disappeared.
    """
    assigned = dict(ledger["assigned"])
    retired = dict(ledger["retired"])

    present = {record["symbol"]: record for record in records}

    taken = set(assigned.values())
    for entry in retired.values():
        if isinstance(entry, dict) and entry.get("id"):
            taken.add(entry["id"])

    # A retired symbol that came back reclaims its old id.
    for symbol in sorted(present):
        if symbol in assigned:
            continue
        entry = retired.get(symbol)
        if isinstance(entry, dict) and entry.get("id"):
            assigned[symbol] = entry["id"]
            del retired[symbol]

    for symbol in sorted(present):
        if symbol in assigned:
            continue
        record = present[symbol]
        candidate = base_id(symbol, record["source_file"], record["reachable"])
        if candidate in taken:
            suffix = 2
            while candidate + "-" + str(suffix) in taken:
                suffix += 1
            candidate = candidate + "-" + str(suffix)
        assigned[symbol] = candidate
        taken.add(candidate)

    for symbol in sorted(assigned):
        if symbol in present:
            continue
        if symbol not in retired:
            retired[symbol] = {"id": assigned[symbol], "retired_at_head": source_head}
        del assigned[symbol]

    current = {symbol: assigned[symbol] for symbol in present}
    updated = {
        "schema": ID_SCHEMA,
        "assigned": {symbol: assigned[symbol] for symbol in sorted(assigned)},
        "retired": {symbol: retired[symbol] for symbol in sorted(retired)},
    }
    return current, updated


# ---------------------------------------------------------------------------
# registry construction
# ---------------------------------------------------------------------------


def normalize_records(spine: list[dict], offspine: list[dict]) -> list[dict]:
    """Flatten the two exports into raw obligation records."""
    seen: dict[str, dict] = {}
    for records, reachable in ((spine, True), (offspine, False)):
        for record in records:
            symbol = record.get("symbol")
            if not symbol:
                raise RegistryError("export record without a symbol: " + repr(record))
            source_file = record.get("file") or ""
            entry = {
                "symbol": symbol,
                "reachable": reachable,
                "source_file": source_file,
                "line": record.get("line"),
                "kind": record.get("kind") or "theorem",
            }
            if symbol in seen and seen[symbol] != entry:
                raise RegistryError(
                    "symbol reported twice with different data: " + symbol
                )
            seen[symbol] = entry
    return [seen[symbol] for symbol in sorted(seen)]


def load_meta_overlay(out_dir: Path | None) -> dict:
    """Optional reviewed-metadata overlay: id or lean_decl -> meta_status."""
    if out_dir is None:
        return {}
    path = out_dir / META_OVERLAY_NAME
    if not path.is_file():
        return {}
    data = read_json(path)
    overlay = data.get("meta_status", data)
    return overlay if isinstance(overlay, dict) else {}


def build_registry(
    spine: list[dict],
    offspine: list[dict],
    source_head: str,
    ledger: dict,
    overlay: dict | None = None,
) -> tuple[dict, dict]:
    records = normalize_records(spine, offspine)
    ids, updated_ledger = assign_ids(records, ledger, source_head)
    overlay = overlay or {}

    obligations = []
    for record in records:
        symbol = record["symbol"]
        obligation_id = ids[symbol]
        meta_status = overlay.get(obligation_id, overlay.get(symbol))
        obligations.append(
            {
                "id": obligation_id,
                "lean_decl": symbol,
                "reachable": record["reachable"],
                "source_file": record["source_file"],
                "line": record["line"],
                "cluster": cluster_label(record["source_file"]),
                "kind": record["kind"],
                "legacy_labels": [],
                "meta_status": meta_status if meta_status is not None else None,
            }
        )
    obligations.sort(key=lambda item: item["id"])

    registry = {
        "schema": SCHEMA,
        "source_head": source_head,
        "generated_by": GENERATED_BY,
        "publish_target": PUBLISH_TARGET,
        "obligations": obligations,
    }
    return registry, updated_ledger


def dump_canonical(data: dict) -> str:
    return json.dumps(data, sort_keys=True, indent=2, ensure_ascii=False) + "\n"


# ---------------------------------------------------------------------------
# frontier table
# ---------------------------------------------------------------------------


def frontier_table(registry: dict) -> str:
    counts: dict[str, dict[str, int]] = {}
    for obligation in registry["obligations"]:
        if not obligation["reachable"]:
            continue
        cluster = obligation["cluster"]
        module = module_stem(obligation["source_file"]) + ".lean"
        counts.setdefault(cluster, {})
        counts[cluster][module] = counts[cluster].get(module, 0) + 1

    def cluster_key(cluster: str) -> tuple[int, str]:
        if cluster in CLUSTER_ORDER:
            return (CLUSTER_ORDER.index(cluster), cluster)
        return (len(CLUSTER_ORDER), cluster)

    lines = [
        "# P97 open frontier (generated)",
        "",
        "Generated by `" + GENERATED_BY + "` from `proof-status/" + REGISTRY_NAME + "`.",
        "Do not edit by hand; regenerate instead.",
        "",
        "- Publish target: `" + registry["publish_target"] + "`",
        "- Source head: `" + registry["source_head"] + "`",
        "- Counted rows: obligations reachable from the publish target only.",
        "",
        "| Cluster | Module | Open |",
        "|---|---|---:|",
    ]

    total = 0
    for cluster in sorted(counts, key=cluster_key):
        modules = counts[cluster]
        ordered = sorted(modules, key=lambda name: (-modules[name], name))
        for index, module in enumerate(ordered):
            label = "**" + cluster + "**" if index == 0 else ""
            lines.append(
                "| " + label + " | `" + module + "` | " + str(modules[module]) + " |"
            )
            total += modules[module]
    lines.append("| **Total** | | **" + str(total) + "** |")
    lines.append("")
    return "\n".join(lines)


# ---------------------------------------------------------------------------
# commands
# ---------------------------------------------------------------------------


def gather_exports(
    baseline_dir: Path | None, fresh: bool, scratch_parent: Path
) -> tuple[list[dict], list[dict]]:
    if fresh:
        scratch_parent.mkdir(parents=True, exist_ok=True)
        temp_dir = Path(tempfile.mkdtemp(prefix=".fresh-export-", dir=str(scratch_parent)))
        try:
            export_fresh(temp_dir)
            spine = read_records(temp_dir / SPINE_EXPORT)
            offspine = read_records(temp_dir / OFFSPINE_EXPORT)
        finally:
            shutil.rmtree(temp_dir, ignore_errors=True)
        return spine, offspine
    assert baseline_dir is not None
    return (
        read_records(baseline_dir / SPINE_EXPORT),
        read_records(baseline_dir / OFFSPINE_EXPORT),
    )


def command_generate(args: argparse.Namespace) -> int:
    out_dir = Path(args.out).resolve()
    baseline_dir = Path(args.baseline).resolve() if args.baseline else None

    spine, offspine = gather_exports(baseline_dir, args.fresh, out_dir)

    if args.fresh:
        source_head = git_head() or read_base_head(baseline_dir, out_dir)
    else:
        source_head = read_base_head(baseline_dir, out_dir)

    ledger = load_id_assignments(out_dir / ID_ASSIGNMENTS_NAME)
    overlay = load_meta_overlay(out_dir)
    registry, updated_ledger = build_registry(
        spine, offspine, source_head, ledger, overlay
    )

    out_dir.mkdir(parents=True, exist_ok=True)
    (out_dir / REGISTRY_NAME).write_text(dump_canonical(registry), encoding="utf-8")
    (out_dir / ID_ASSIGNMENTS_NAME).write_text(
        dump_canonical(updated_ledger), encoding="utf-8"
    )
    (out_dir / FRONTIER_TABLE_NAME).write_text(frontier_table(registry), encoding="utf-8")

    reachable = sum(1 for item in registry["obligations"] if item["reachable"])
    offspine_count = len(registry["obligations"]) - reachable
    print(
        "wrote "
        + str(out_dir / REGISTRY_NAME)
        + ": "
        + str(reachable)
        + " reachable, "
        + str(offspine_count)
        + " off-spine"
    )
    print("wrote " + str(out_dir / ID_ASSIGNMENTS_NAME))
    print("wrote " + str(out_dir / FRONTIER_TABLE_NAME))
    return 0


CHECKED_FIELDS = ("lean_decl", "source_file", "reachable")


def command_check(args: argparse.Namespace) -> int:
    baseline_dir = Path(args.baseline).resolve()
    registry_path = (
        Path(args.registry).resolve()
        if args.registry
        else baseline_dir.parent / REGISTRY_NAME
    )
    committed = read_json(registry_path)
    if committed.get("schema") != SCHEMA:
        print(
            "FAIL: " + str(registry_path) + " has schema "
            + repr(committed.get("schema"))
            + ", expected "
            + repr(SCHEMA)
        )
        return 1

    scratch_parent = registry_path.parent
    spine, offspine = gather_exports(None, True, scratch_parent)

    ledger = load_id_assignments(registry_path.parent / ID_ASSIGNMENTS_NAME)
    overlay = load_meta_overlay(registry_path.parent)
    fresh_registry, _ = build_registry(
        spine, offspine, committed.get("source_head", "unknown"), ledger, overlay
    )

    committed_by_decl = {item["lean_decl"]: item for item in committed.get("obligations", [])}
    fresh_by_decl = {item["lean_decl"]: item for item in fresh_registry["obligations"]}

    added = sorted(set(fresh_by_decl) - set(committed_by_decl))
    removed = sorted(set(committed_by_decl) - set(fresh_by_decl))
    changed: list[str] = []
    for decl in sorted(set(fresh_by_decl) & set(committed_by_decl)):
        fresh_item = fresh_by_decl[decl]
        committed_item = committed_by_decl[decl]
        for field in ("id",) + CHECKED_FIELDS:
            if fresh_item.get(field) != committed_item.get(field):
                changed.append(
                    decl
                    + "\n      "
                    + field
                    + ": committed="
                    + repr(committed_item.get(field))
                    + " live="
                    + repr(fresh_item.get(field))
                )

    fresh_reachable = sum(1 for item in fresh_registry["obligations"] if item["reachable"])
    fresh_off = len(fresh_registry["obligations"]) - fresh_reachable
    committed_reachable = sum(
        1 for item in committed.get("obligations", []) if item.get("reachable")
    )
    committed_off = len(committed.get("obligations", [])) - committed_reachable

    if not added and not removed and not changed:
        print(
            "OK: "
            + str(registry_path)
            + " matches the live spine ("
            + str(fresh_reachable)
            + " reachable, "
            + str(fresh_off)
            + " off-spine)"
        )
        return 0

    print("FAIL: generated obligation registry is stale")
    print("  registry: " + str(registry_path))
    print(
        "  committed: "
        + str(committed_reachable)
        + " reachable / "
        + str(committed_off)
        + " off-spine"
    )
    print(
        "  live:      "
        + str(fresh_reachable)
        + " reachable / "
        + str(fresh_off)
        + " off-spine"
    )
    if added:
        print("  NEW obligations on the live tree (" + str(len(added)) + "):")
        for decl in added:
            item = fresh_by_decl[decl]
            print(
                "    + "
                + item["id"]
                + "  "
                + decl
                + "  ["
                + ("reachable" if item["reachable"] else "off-spine")
                + "]  "
                + item["source_file"]
            )
    if removed:
        print("  GONE from the live tree (" + str(len(removed)) + "):")
        for decl in removed:
            item = committed_by_decl[decl]
            print("    - " + str(item.get("id")) + "  " + decl)
    if changed:
        print("  CHANGED fields (" + str(len(changed)) + "):")
        for entry in changed:
            print("    ~ " + entry)
    print(
        "  fix: uv run python "
        + GENERATED_BY
        + " generate --fresh --out proof-status"
    )
    return 1


def build_parser() -> argparse.ArgumentParser:
    parser = argparse.ArgumentParser(
        prog="gen_obligation_registry.py",
        description="Generate and gate the P97 proof-obligation registry.",
    )
    subparsers = parser.add_subparsers(dest="command", required=True)

    generate = subparsers.add_parser(
        "generate", help="build the registry from baseline exports or a live export"
    )
    source = generate.add_mutually_exclusive_group(required=True)
    source.add_argument(
        "--baseline", help="directory holding the recorded spine/off-spine exports"
    )
    source.add_argument(
        "--fresh",
        action="store_true",
        help="re-export live data with proof-blueprint before generating",
    )
    generate.add_argument("--out", required=True, help="proof-status output directory")
    generate.set_defaults(func=command_generate)

    check = subparsers.add_parser(
        "check",
        help="regenerate from the live tree and fail if the committed registry is stale",
    )
    check.add_argument(
        "--baseline",
        required=True,
        help="baseline directory; its parent holds the committed registry",
    )
    check.add_argument(
        "--registry", help="explicit path to the committed obligations.json"
    )
    check.set_defaults(func=command_check)

    return parser


def main(argv: list[str] | None = None) -> int:
    args = build_parser().parse_args(argv)
    try:
        return args.func(args)
    except RegistryError as exc:
        print("error: " + str(exc), file=sys.stderr)
        return 2


if __name__ == "__main__":
    sys.exit(main())
