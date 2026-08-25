#!/usr/bin/env python3
"""Forbidden-import lint for the FrontierLiveClosure proof clusters.

The A-tail frontier live-closure directory is partitioned into proof clusters
(Rigid221, TriApex, TwoSource, TwoDeletion, B1) plus a `shared` remainder.  The
architectural rule this script enforces:

  * a cluster module may import shared modules freely (`to-shared`);
  * a cluster module may import modules of its own cluster (`intra-cluster`);
  * a cluster module must NOT import a module of a different cluster
    (`cross-cluster`);
  * a shared module must NOT import a cluster module
    (`from-shared-to-cluster`) -- a core/shared module must not depend on a
    cluster.

Every cross-cluster and from-shared-to-cluster edge that already existed when
the rule was introduced is recorded in `proof-status/import-waivers.json`.  The
lint fails only on edges that are not covered by a waiver, so the graph can be
frozen at its current shape and untangled wave by wave.

A waiver is not self-authenticating.  Each waiver row must name a `(from, to)`
pair that the frozen Phase 0 graph record `proof-status/cluster-import-edges.json`
records as a forbidden edge, and that is still present in the live tree.  A pair
absent from the frozen record is an unauthenticated waiver (it would license an
edge that the freeze never observed); a pair whose live edge is gone is a stale
waiver row that must be deleted with the edge it used to cover.  Both fail.

Import scanning covers the Lean module header only.  Lean 4 requires every
`import` command to precede any other command, so the header ends at the first
line that is not blank, not a comment, and not an import.  Prose in a module
docstring can therefore never be mistaken for an import, which lets the parser
accept the real-world spellings (leading whitespace, a trailing `--` comment)
that a column-0 exact-prefix match would silently drop.

Usage:

    uv run python scripts/lint_cluster_imports.py
    uv run python scripts/lint_cluster_imports.py --json
    uv run python scripts/lint_cluster_imports.py --list-waived
    uv run python scripts/lint_cluster_imports.py --scan-file PATH

Exit status:
    0  every forbidden edge in the live tree is waived by an authenticated
       waiver, and the waiver file's own metadata and summary are consistent
    1  at least one non-waived forbidden edge, or at least one waiver that
       fails authentication or metadata validation
    2  the lint could not run (missing tree, unreadable waiver or graph file)

Standard library only.  No third-party imports, no regular expressions.
"""

from __future__ import annotations

import argparse
import json
import os
import sys

# --------------------------------------------------------------------------
# Repository layout
# --------------------------------------------------------------------------

SCRIPT_DIR = os.path.dirname(os.path.abspath(__file__))
REPO_ROOT = os.path.dirname(SCRIPT_DIR)
LEAN_ROOT = os.path.join(REPO_ROOT, "lean")

CLUSTER_NAMESPACE = "Erdos9796Proof.P97.ATail.FrontierLiveClosure"
CLUSTER_DIR = os.path.join(
    LEAN_ROOT, "Erdos9796Proof", "P97", "ATail", "FrontierLiveClosure"
)
# The parent coordinator module file sits beside the directory, not inside it.
COORDINATOR_FILE = CLUSTER_DIR + ".lean"

WAIVER_FILE = os.path.join(REPO_ROOT, "proof-status", "import-waivers.json")
# Frozen Phase 0 graph record.  Read-only here: it is the authentication basis
# for every waiver row, never rewritten by this script.
GRAPH_FILE = os.path.join(REPO_ROOT, "proof-status", "cluster-import-edges.json")

# --------------------------------------------------------------------------
# Cluster classification
# --------------------------------------------------------------------------

SHARED = "shared"

# Ordered (basename prefix, cluster) pairs.  Matching is on the FINAL dotted
# component of the module name only -- never on a substring of the full path --
# so `ExactTwelveRigid221Ingress` is shared, not Rigid221, and the nested
# `...FrontierLiveClosure.Coordinator` is never confused with the parent
# coordinator module `...ATail.FrontierLiveClosure`.
CLUSTER_PREFIXES = (
    ("Rigid221", "Rigid221"),
    ("TriApex", "TriApex"),
    ("TwoSource", "TwoSource"),
    ("FreshThird", "TwoSource"),
    ("FirstFiber", "TwoSource"),
    ("FirstNonHit", "TwoSource"),
    ("TwoDeletion", "TwoDeletion"),
)

# Exact basenames (not prefixes) that name a cluster.
CLUSTER_EXACT = {
    "B1Live": "B1",
}

MODULE_CHARS = frozenset(
    "ABCDEFGHIJKLMNOPQRSTUVWXYZ" "abcdefghijklmnopqrstuvwxyz" "0123456789" "_.'"
)
ASCII_UPPER = frozenset("ABCDEFGHIJKLMNOPQRSTUVWXYZ")

IMPORT_KEYWORD = "import "

LINE_COMMENT = "--"
BLOCK_OPEN = "/-"
BLOCK_CLOSE = "-/"

# File-header commands that legally precede `import` and are not imports.  They
# are skipped, not treated as the end of the header.
HEADER_KEYWORDS = frozenset(("module", "prelude"))

# First tokens that mean "this line is an import the parser did not understand"
# -- for example the Lean module-system spellings `import all M`, `public import
# M`, `meta import M`.  Truncating the header there would silently drop every
# later import of the file, which is the lint bypass this parser exists to shut,
# so an unrecognized import form is a hard error instead.
IMPORT_LEAD_TOKENS = frozenset(("import", "public", "meta"))


class HeaderParseError(Exception):
    """An import-looking header line the parser refuses to guess at."""

# The retirement waves a waiver row may name.  An explicit tuple, so a typo or
# an invented wave label is a failure rather than an unnoticed free-text field.
ALLOWED_RETIREMENTS = ("W1b", "W2", "W3", "W4", "unassigned")


def cluster_of(module: str) -> str:
    """Cluster owning `module`, by the final dotted component of its name."""
    basename = module.rsplit(".", 1)[-1]
    exact = CLUSTER_EXACT.get(basename)
    if exact is not None:
        return exact
    for prefix, cluster in CLUSTER_PREFIXES:
        if basename.startswith(prefix):
            return cluster
    return SHARED


def classify(from_cluster: str, to_cluster: str) -> str:
    """Edge class.  The four labels are total and mutually exclusive."""
    if to_cluster == SHARED:
        # Covers cluster -> shared and shared -> shared.  Always permitted.
        return "to-shared"
    if from_cluster == SHARED:
        return "from-shared-to-cluster"
    if from_cluster == to_cluster:
        return "intra-cluster"
    return "cross-cluster"


FORBIDDEN_CLASSES = frozenset(("cross-cluster", "from-shared-to-cluster"))


# --------------------------------------------------------------------------
# Parsing
# --------------------------------------------------------------------------


def module_name(path: str) -> str:
    """Lean module name for a `.lean` file under `lean/`."""
    relative = os.path.relpath(path, LEAN_ROOT)
    if relative.endswith(".lean"):
        relative = relative[: -len(".lean")]
    return relative.replace(os.sep, ".")


def source_files() -> list:
    """Every `.lean` file in the cluster tree, plus the parent coordinator."""
    found = []
    if os.path.isfile(COORDINATOR_FILE):
        found.append(COORDINATOR_FILE)
    for dirpath, dirnames, filenames in os.walk(CLUSTER_DIR):
        dirnames.sort()
        for filename in sorted(filenames):
            if filename.endswith(".lean"):
                found.append(os.path.join(dirpath, filename))
    return found


def strip_comments(line: str, depth: int):
    """Return `(code, depth)`: `line` with Lean comments removed.

    `depth` is the number of `/-` block comments open when the line starts and
    is returned updated for the next line.  Lean 4 block comments nest, so the
    depth is a counter, not a flag.  A `--` line comment at depth 0 ends the
    line.  Character scan, no regular expressions.
    """
    kept = []
    index = 0
    length = len(line)
    while index < length:
        if depth > 0:
            if line.startswith(BLOCK_CLOSE, index):
                depth -= 1
                index += 2
                continue
            if line.startswith(BLOCK_OPEN, index):
                depth += 1
                index += 2
                continue
            index += 1
            continue
        if line.startswith(BLOCK_OPEN, index):
            depth += 1
            index += 2
            continue
        if line.startswith(LINE_COMMENT, index):
            break
        kept.append(line[index])
        index += 1
    return "".join(kept), depth


def import_target(line: str):
    """Module imported by `line`, or None when the line is not an import.

    Accepts leading whitespace and a trailing `--` comment, both of which occur
    in the live tree and were silently dropped by a column-0 exact match.  The
    module path itself must still start with an ASCII capital and use only Lean
    module characters, so prose such as `important:` or `imported here.` (no
    space after `import`) is rejected.

    Callers scan the module header only (see `header_imports`), so a docstring
    line that happens to read `import Foo` is never reached.
    """
    code, _ = strip_comments(line, 0)
    stripped = code.strip()
    if not stripped.startswith(IMPORT_KEYWORD):
        return None
    target = stripped[len(IMPORT_KEYWORD) :].strip()
    if not target:
        return None
    if target[0] not in ASCII_UPPER:
        return None
    for character in target:
        if character not in MODULE_CHARS:
            return None
    return target


def header_imports(path: str) -> list:
    """`(line_number, module)` for every import in `path`'s module header.

    Lean 4 requires all `import` commands to precede every other command, so
    the header ends at the first line that is neither blank, nor a comment, nor
    an import.  Scanning stops there: nothing after that point can be an import,
    and stopping keeps module-docstring prose out of the parser entirely.

    Raises `HeaderParseError` when the stopping line still looks like an import
    the parser does not understand, rather than truncating the header silently.
    """
    found = []
    depth = 0
    with open(path, "r", encoding="utf-8") as handle:
        for number, raw in enumerate(handle, 1):
            code, depth = strip_comments(raw.rstrip("\n"), depth)
            text = code.strip()
            if not text:
                # Blank line, whole-line comment, or a line inside a block
                # comment.  All three are legal inside a module header.
                continue
            target = import_target(code)
            if target is not None:
                found.append((number, target))
                continue
            tokens = text.split()
            if tokens and tokens[0] in HEADER_KEYWORDS:
                # `module` / `prelude` precede the imports; keep scanning.
                continue
            looks_like_import = bool(tokens) and (
                tokens[0] == "import"
                or (tokens[0] in IMPORT_LEAD_TOKENS and tokens[1:2] == ["import"])
            )
            if looks_like_import:
                raise HeaderParseError(
                    "%s:%d: unrecognized import form %s -- refusing to truncate "
                    "the header here; teach the parser this spelling"
                    % (path, number, json.dumps(text))
                )
            # First real command: the header is over.
            break
    return found


def in_cluster_tree(module: str) -> bool:
    return module == CLUSTER_NAMESPACE or module.startswith(CLUSTER_NAMESPACE + ".")


def edge_record(source_module: str, target: str, relative_path: str, number: int):
    source_cluster = cluster_of(source_module)
    target_cluster = cluster_of(target)
    return {
        "from": source_module,
        "to": target,
        "from_cluster": source_cluster,
        "to_cluster": target_cluster,
        "class": classify(source_cluster, target_cluster),
        "from_file": relative_path,
        "line": number,
    }


def collect_edges() -> list:
    """Every intra-directory import edge in the live tree.

    Each edge is a dict with `from`, `to`, `from_cluster`, `to_cluster`,
    `class`, `from_file` (repo-relative) and `line`.
    """
    edges = []
    for path in source_files():
        source_module = module_name(path)
        relative_path = os.path.relpath(path, REPO_ROOT)
        for number, target in header_imports(path):
            if not in_cluster_tree(target):
                continue
            edges.append(edge_record(source_module, target, relative_path, number))
    edges.sort(key=lambda edge: (edge["from"], edge["to"], edge["line"]))
    return edges


# --------------------------------------------------------------------------
# Frozen graph record
# --------------------------------------------------------------------------


def load_frozen_edges(path: str) -> dict:
    """`{(from, to): class}` from the frozen Phase 0 graph record.

    Read-only.  This mapping is the authentication basis for waiver rows: a
    waiver may only cover a pair the freeze actually observed.
    """
    with open(path, "r", encoding="utf-8") as handle:
        document = json.load(handle)
    if not isinstance(document, dict):
        raise ValueError("%s: top level must be an object" % os.path.basename(path))
    entries = document.get("edges")
    if not isinstance(entries, list):
        raise ValueError("%s: 'edges' must be a list" % os.path.basename(path))
    frozen = {}
    for index, entry in enumerate(entries):
        if not isinstance(entry, dict):
            raise ValueError(
                "%s: edge %d is not an object" % (os.path.basename(path), index)
            )
        source = entry.get("from")
        target = entry.get("to")
        edge_class = entry.get("class")
        if (
            not isinstance(source, str)
            or not isinstance(target, str)
            or not isinstance(edge_class, str)
        ):
            raise ValueError(
                "%s: edge %d needs string 'from', 'to' and 'class'"
                % (os.path.basename(path), index)
            )
        frozen[(source, target)] = edge_class
    if not frozen:
        raise ValueError("%s: 'edges' is empty" % os.path.basename(path))
    return frozen


# --------------------------------------------------------------------------
# Waivers
# --------------------------------------------------------------------------


def load_waiver_document(path: str) -> dict:
    with open(path, "r", encoding="utf-8") as handle:
        document = json.load(handle)
    if not isinstance(document, dict):
        raise ValueError("import-waivers.json: top level must be an object")
    return document


def counted(pairs) -> dict:
    """Count occurrences into a plain dict (no `collections` dependency)."""
    tally = {}
    for value in pairs:
        tally[value] = tally.get(value, 0) + 1
    return tally


def validate_waivers(document: dict, frozen: dict, live_forbidden: set):
    """Authenticate every waiver row.

    Returns `(pairs, failures)`.  `pairs` is the set of `(from, to)` pairs the
    lint will honour -- only rows that authenticated.  `failures` is a list of
    human-readable strings; a non-empty list is a lint failure.

    Checks, in order of severity:
      * row shape: object with non-empty string `from`, `to`, `reason`;
      * `planned_retirement` drawn from ALLOWED_RETIREMENTS;
      * no duplicate `(from, to)` row;
      * the pair is recorded in the frozen graph (unauthenticated otherwise);
      * the frozen record classes it forbidden (a waiver for a permitted edge
        licenses nothing and is a bookkeeping error);
      * the edge is still live (a stale row must be deleted with its edge);
      * `.summary` counts equal the recomputed counts.
    """
    failures = []
    entries = document.get("waivers")
    if not isinstance(entries, list):
        raise ValueError("import-waivers.json: 'waivers' must be a list")

    pairs = set()
    seen = set()
    class_tally_input = []
    retirement_tally_input = []

    for index, entry in enumerate(entries):
        label = "waiver %d" % index
        if not isinstance(entry, dict):
            failures.append("%s: not an object" % label)
            continue
        source = entry.get("from")
        target = entry.get("to")
        if not isinstance(source, str) or not isinstance(target, str):
            failures.append("%s: needs string 'from' and 'to'" % label)
            continue
        if not source or not target:
            failures.append("%s: 'from' and 'to' must be non-empty" % label)
            continue
        label = "waiver %d (%s -> %s)" % (index, source, target)

        reason = entry.get("reason")
        if not isinstance(reason, str) or not reason.strip():
            failures.append("%s: 'reason' must be a non-empty string" % label)
        retirement = entry.get("planned_retirement")
        if retirement not in ALLOWED_RETIREMENTS:
            failures.append(
                "%s: 'planned_retirement' is %s; allowed values are %s"
                % (label, json.dumps(retirement), ", ".join(ALLOWED_RETIREMENTS))
            )
        else:
            retirement_tally_input.append(retirement)

        pair = (source, target)
        if pair in seen:
            failures.append("%s: duplicate waiver row for this pair" % label)
            continue
        seen.add(pair)

        frozen_class = frozen.get(pair)
        if frozen_class is None:
            failures.append(
                "%s: pair is NOT in the frozen graph record; a waiver may only "
                "cover an edge the Phase 0 freeze observed" % label
            )
            continue
        class_tally_input.append(frozen_class)
        if frozen_class not in FORBIDDEN_CLASSES:
            failures.append(
                "%s: frozen graph classes this edge '%s', which the rule permits; "
                "a waiver for a permitted edge licenses nothing" % (label, frozen_class)
            )
            continue
        if pair not in live_forbidden:
            failures.append(
                "%s: stale -- the edge is no longer present in the live tree; "
                "delete the waiver row with the edge it covered" % label
            )
            continue
        pairs.add(pair)

    recomputed = {
        "waivers": len(entries),
        "by_class": counted(class_tally_input),
        "by_planned_retirement": counted(retirement_tally_input),
    }
    summary = document.get("summary")
    if not isinstance(summary, dict):
        failures.append("summary: missing or not an object")
    else:
        for key in ("waivers", "by_class", "by_planned_retirement"):
            recorded = summary.get(key)
            if recorded != recomputed[key]:
                failures.append(
                    "summary.%s: recorded %s, recomputed %s"
                    % (
                        key,
                        json.dumps(recorded, sort_keys=True),
                        json.dumps(recomputed[key], sort_keys=True),
                    )
                )
    return pairs, failures


# --------------------------------------------------------------------------
# Entry point
# --------------------------------------------------------------------------


def scan_one_file(path: str) -> int:
    """Diagnostic: print the header imports of a single file and classify them.

    Used to exercise the parser on a file outside the cluster tree (the lint
    itself walks the tree only).  For a file under `lean/` the module name is
    the real one; otherwise the basename stands in, which is enough because
    cluster classification reads the final dotted component only.
    """
    if not os.path.isfile(path):
        sys.stderr.write("lint_cluster_imports: no such file %s\n" % path)
        return 2
    absolute = os.path.abspath(path)
    if absolute.startswith(LEAN_ROOT + os.sep):
        source_module = module_name(absolute)
    else:
        source_module = os.path.basename(absolute)
        if source_module.endswith(".lean"):
            source_module = source_module[: -len(".lean")]
    try:
        imports = header_imports(absolute)
    except (OSError, HeaderParseError) as error:
        sys.stderr.write("lint_cluster_imports: %s\n" % error)
        return 2
    sys.stdout.write(
        "scan-file %s\n  module %s  [cluster %s]\n  header imports: %d\n"
        % (path, source_module, cluster_of(source_module), len(imports))
    )
    for number, target in imports:
        in_tree = in_cluster_tree(target)
        edge = edge_record(source_module, target, path, number)
        sys.stdout.write(
            "  line %d: import %s  [%s -> %s, %s]%s\n"
            % (
                number,
                target,
                edge["from_cluster"],
                edge["to_cluster"],
                edge["class"],
                "" if in_tree else "  (outside cluster tree; not an edge)",
            )
        )
    return 0


def main(argv=None) -> int:
    parser = argparse.ArgumentParser(
        description="Fail on non-waived cross-cluster imports in "
        "Erdos9796Proof/P97/ATail/FrontierLiveClosure."
    )
    parser.add_argument(
        "--waivers",
        default=WAIVER_FILE,
        help="path to import-waivers.json (default: proof-status/import-waivers.json)",
    )
    parser.add_argument(
        "--graph",
        default=GRAPH_FILE,
        help="path to the frozen graph record used to authenticate waivers "
        "(default: proof-status/cluster-import-edges.json)",
    )
    parser.add_argument(
        "--json",
        action="store_true",
        help="emit the violation report as JSON on stdout",
    )
    parser.add_argument(
        "--list-waived",
        action="store_true",
        help="also list the forbidden edges that a waiver currently covers",
    )
    parser.add_argument(
        "--stale-waivers",
        action="store_true",
        help="retained for compatibility; stale waivers are now always a failure",
    )
    parser.add_argument(
        "--scan-file",
        default=None,
        help="diagnostic: print the module-header imports of one file and exit",
    )
    arguments = parser.parse_args(argv)

    if arguments.scan_file is not None:
        return scan_one_file(arguments.scan_file)

    if not os.path.isdir(CLUSTER_DIR):
        sys.stderr.write("lint_cluster_imports: missing tree %s\n" % CLUSTER_DIR)
        return 2
    try:
        frozen = load_frozen_edges(arguments.graph)
        document = load_waiver_document(arguments.waivers)
    except (OSError, ValueError, json.JSONDecodeError) as error:
        sys.stderr.write("lint_cluster_imports: %s\n" % error)
        return 2

    try:
        edges = collect_edges()
    except (OSError, HeaderParseError) as error:
        sys.stderr.write("lint_cluster_imports: %s\n" % error)
        return 2
    forbidden = [edge for edge in edges if edge["class"] in FORBIDDEN_CLASSES]
    live_forbidden = {(edge["from"], edge["to"]) for edge in forbidden}

    try:
        waived, waiver_failures = validate_waivers(document, frozen, live_forbidden)
    except (ValueError, json.JSONDecodeError) as error:
        sys.stderr.write("lint_cluster_imports: %s\n" % error)
        return 2

    violations = [edge for edge in forbidden if (edge["from"], edge["to"]) not in waived]
    covered = [edge for edge in forbidden if (edge["from"], edge["to"]) in waived]

    if arguments.json:
        report = {
            "edges_scanned": len(edges),
            "forbidden_edges": len(forbidden),
            "waivers_authenticated": len(waived),
            "waived_edges": len(covered),
            "violations": violations,
            "waiver_failures": waiver_failures,
        }
        sys.stdout.write(json.dumps(report, indent=2, sort_keys=True) + "\n")
        return 1 if (violations or waiver_failures) else 0

    if arguments.list_waived:
        sys.stdout.write("waived forbidden edges (%d):\n" % len(covered))
        for edge in covered:
            sys.stdout.write(
                "  %s:%d  %s -> %s  [%s -> %s]\n"
                % (
                    edge["from_file"],
                    edge["line"],
                    edge["from"],
                    edge["to"],
                    edge["from_cluster"],
                    edge["to_cluster"],
                )
            )

    waiver_label = os.path.abspath(arguments.waivers)
    if waiver_label.startswith(REPO_ROOT + os.sep):
        waiver_label = os.path.relpath(waiver_label, REPO_ROOT)

    if waiver_failures:
        sys.stderr.write(
            "lint_cluster_imports: FAIL -- %d waiver problem%s in %s\n"
            % (
                len(waiver_failures),
                "" if len(waiver_failures) == 1 else "s",
                waiver_label,
            )
        )
        for failure in waiver_failures:
            sys.stderr.write("  %s\n" % failure)

    if violations:
        sys.stderr.write(
            "lint_cluster_imports: FAIL -- %d non-waived forbidden import edge%s\n"
            % (len(violations), "" if len(violations) == 1 else "s")
        )
        for edge in violations:
            sys.stderr.write(
                "  %s:%d: import %s  (%s -> %s, %s)\n"
                % (
                    edge["from_file"],
                    edge["line"],
                    edge["to"],
                    edge["from_cluster"],
                    edge["to_cluster"],
                    edge["class"],
                )
            )
        sys.stderr.write(
            "Add a waiver to %s with a planned retirement wave, or remove the import.\n"
            % waiver_label
        )

    if violations or waiver_failures:
        return 1

    sys.stdout.write(
        "lint_cluster_imports: OK -- %d import edges scanned, %d forbidden edges, "
        "all waived by %d authenticated waiver%s.\n"
        % (len(edges), len(forbidden), len(waived), "" if len(waived) == 1 else "s")
    )
    return 0


if __name__ == "__main__":
    sys.exit(main())
