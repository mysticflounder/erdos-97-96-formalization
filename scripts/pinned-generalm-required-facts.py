#!/usr/bin/env python3
# Copyright (c) 2026 Adam McKenna. All rights reserved.
# Released under Apache 2.0 license as described in the file LICENSE.
# Author: Adam McKenna <adam@mysticflounder.ai>
"""Per-row required-fact enumeration for the pinned-surplus general-m route.

Closure-plan 2026-07-06 §3 step 1: pure post-processing of the 135 relaxed
singleton-split certificates in certificates/surplus/relaxed_split_singleton/
plus the two census artifacts.  Zero solver cost.

For every leaf, over its NONZERO-coefficient generators only, partition into:
  (a) exact v-center distance equations,
  (b) exact w-center distance equations,
  (c) the Rabinowitsch separator,
  (d) erased-center distance facts whose witnesses are both in the leaf's
      common_erased_masks[center].members.
Any nonzero generator outside (a)-(d) is a RESIDUE instance and is listed
exactly.  Each (d) membership bit (center, witness) is classified against
the split tree:
  case_common   - bit holds in every exact completion of the (relaxed row,
                  forced pair) case, no split assumption needed;
  split_yes     - bit is an explicit yes-decision on the leaf's split_path;
  path_entailed - bit holds in the unique completion surviving the leaf's
                  split_path, but is neither case-common nor explicitly split.

The split_path semantics used here are INFERRED from the artifacts and are
validated per leaf: filtering the case's exact completions by the path
decisions must leave exactly the leaf's exact_pid, whose erased-center masks
must equal the leaf's common_erased_masks bit-for-bit.

Outputs (deterministic ordering):
  certificates/surplus/reports/pinned_surplus_generalm_required_facts.json
  certificates/surplus/reports/pinned_surplus_generalm_required_facts.md

Run: UV_CACHE_DIR=/private/tmp/uv-cache-endpoint uv run python \
     scripts/pinned-generalm-required-facts.py
"""

from __future__ import annotations

import hashlib
import json
from collections import Counter
from pathlib import Path

REPO = Path(__file__).resolve().parents[1]
CERT_DIR = REPO / "certificates" / "surplus" / "relaxed_split_singleton"
REPORTS_DIR = REPO / "certificates" / "surplus" / "reports"
CERT_CENSUS_PATH = REPORTS_DIR / "pinned_surplus_relaxed_split_singleton_certificate_census.json"
INCIDENCE_CENSUS_PATH = REPORTS_DIR / "pinned_surplus_relaxed_incidence_census.json"
OUT_JSON = REPORTS_DIR / "pinned_surplus_generalm_required_facts.json"
OUT_MD = REPORTS_DIR / "pinned_surplus_generalm_required_facts.md"

OUT_SCHEMA = "pinned_surplus_generalm_required_facts.v1"
EXPECTED_LEAF_SCHEMA = "pinned_surplus_relaxed_split_certificate.v1"
EXPECTED_FILE_COUNT = 135
EXACT_CENTERS = ("v", "w")
NO_SEPARATOR_TAG = "no_separator"
# Canonical label order; mask integers in both the leaf certificates and the
# incidence census are bitmasks over this order (bit i = CANONICAL_CENTERS[i]).
CANONICAL_CENTERS = ("u", "v", "w", "s1", "s2", "s3", "Pw", "Pu", "Q1", "Q2")
ERASED_CENTERS = tuple(c for c in CANONICAL_CENTERS if c not in EXACT_CENTERS)


def sha256_of(path: Path) -> str:
    return hashlib.sha256(path.read_bytes()).hexdigest()


def mask_of(members, centers) -> int:
    return sum(1 << centers.index(m) for m in members)


def case_tag_of(case_id: str, relaxed_id: str) -> str:
    prefix = relaxed_id + ":"
    if not case_id.startswith(prefix):
        raise ValueError(f"case_id {case_id!r} does not start with {prefix!r}")
    return case_id[len(prefix):]


def sanitize_tag(tag: str) -> str:
    return tag.replace("=", "eq")


def hist(counter: Counter) -> list[list[int]]:
    """Counter over ints -> sorted [value, count] pairs (JSON-stable)."""
    return [[k, counter[k]] for k in sorted(counter)]


def main() -> int:
    anomalies: list[str] = []

    # ---------------- load census context ----------------
    cert_census = json.loads(CERT_CENSUS_PATH.read_text())
    incidence = json.loads(INCIDENCE_CENSUS_PATH.read_text())
    census_by_cert_id = {e["certificate_id"]: e for e in cert_census["certificates"]}

    # incidence rows keyed by relaxed_id
    inc_rows = {r["relaxed_id"]: r for r in incidence["rows"]}
    if len(inc_rows) != len(incidence["rows"]):
        anomalies.append("incidence census: duplicate relaxed_id rows")

    # per relaxed row: pid -> completion record; each completion has full
    # 10-center masks plus comp_g_forced_pair (None encoded as no_separator).
    completions: dict[str, dict[str, dict]] = {}
    for rid, row in inc_rows.items():
        by_pid = {}
        for er in row["exact_rows"]:
            pair = er.get("comp_g_forced_pair")
            by_pid[er["pid"]] = {
                "pair_tag": NO_SEPARATOR_TAG if pair is None else pair,
                "masks": {c: frozenset(v["members"]) for c, v in er["masks"].items()},
                "mask_ints": {c: v["mask"] for c, v in er["masks"].items()},
            }
        if len(by_pid) != row["exact_completion_count"]:
            anomalies.append(
                f"incidence census {rid}: exact_rows count {len(by_pid)} != "
                f"exact_completion_count {row['exact_completion_count']}"
            )
        completions[rid] = by_pid

    # ---------------- load leaf certificates ----------------
    files = sorted(CERT_DIR.glob("*.json"))
    if len(files) != EXPECTED_FILE_COUNT:
        anomalies.append(f"expected {EXPECTED_FILE_COUNT} certificate files, found {len(files)}")

    kind_counts: Counter = Counter()
    source_counts: Counter = Counter()
    kind_source_counts: Counter = Counter()
    nonzero_kind_source_counts: Counter = Counter()
    schema_values: Counter = Counter()
    variables_len_counts: Counter = Counter()

    cat_hists = {k: Counter() for k in ("exact_v", "exact_w", "separator", "erased_covered", "residue")}
    joint_cat_hist: Counter = Counter()
    nonzero_hist: Counter = Counter()

    # (center, witness) -> {"leaves": n, "classes": Counter}
    bit_index: dict[tuple[str, str], dict] = {}
    bit_class_use_totals: Counter = Counter()  # per-use (fact x witness) class totals
    class_overlap_case_common_and_split_yes = 0

    per_sstar: dict[str, dict] = {}
    residues_global: list[dict] = []
    leaves_out: list[dict] = []
    case_leaf_counts: Counter = Counter()
    leaf_anchor_pattern_violations = 0
    semantics_validation_failures = 0

    for path in files:
        data = json.loads(path.read_text())
        failures: list[str] = []

        leaf_id = data["leaf_id"]
        relaxed_id = data["relaxed_id"]
        case_id = data["case_id"]
        cert_id = data["certificate_id"]
        sstar = data["sstar"]
        sep_pair = data["separator_pair"]
        split_path = data["split_path"]
        gens = data["generators"]
        meta = data["generator_metadata"]
        coeffs = data["coefficients"]
        support = data["support"]
        erased = data["common_erased_masks"]
        centers = data["support"]["centers_used"]

        schema_values[data["schema"]] += 1
        if data["schema"] != EXPECTED_LEAF_SCHEMA:
            failures.append(f"unexpected schema {data['schema']!r}")
        variables_len_counts[len(data["variables"])] += 1
        # centers_used = centers of nonzero generators, in canonical order
        if centers != [c for c in CANONICAL_CENTERS if c in set(centers)]:
            failures.append("centers_used not in canonical order or has unknown labels")

        # --- structural alignment ---
        if not (len(gens) == len(meta) == len(coeffs)):
            failures.append(
                f"length mismatch: generators {len(gens)}, metadata {len(meta)}, coefficients {len(coeffs)}"
            )
        for i, m in enumerate(meta):
            if gens[i] != m["generator"]:
                failures.append(f"generators[{i}] != generator_metadata[{i}].generator")

        # --- coefficients vs support ---
        nz = [i for i, c in enumerate(coeffs) if c != "0"]
        if any(c == "" for c in coeffs):
            failures.append("empty-string coefficient present")
        if nz != support["nonzero_indices"]:
            failures.append("recomputed nonzero indices != support.nonzero_indices")
        if len(nz) != support["nonzero_count"]:
            failures.append("support.nonzero_count mismatch")
        optional_positions = [i for i, m in enumerate(meta) if m["optional"]]
        mapped_opt = set()
        opt_ok = True
        for j in support["nonzero_optional_indices"]:
            if 0 <= j < len(optional_positions):
                mapped_opt.add(optional_positions[j])
            else:
                opt_ok = False
        if not opt_ok or mapped_opt != {i for i in nz if meta[i]["optional"]}:
            failures.append("nonzero_optional_indices inconsistent with optional sublist mapping")

        # --- mask integer consistency (canonical bit order) ---
        for c, entry in erased.items():
            if mask_of(entry["members"], CANONICAL_CENTERS) != entry["mask"]:
                failures.append(f"common_erased_masks[{c}]: mask int != members bitmask")
            if entry["members"] != sorted(entry["members"], key=CANONICAL_CENTERS.index):
                failures.append(f"common_erased_masks[{c}]: members not in canonical order")
        if set(erased) != set(ERASED_CENTERS):
            failures.append("erased-center set != canonical centers minus exact centers {v,w}")

        # --- naming / path encoding ---
        case_tag = case_tag_of(case_id, relaxed_id)
        expected_name = f"{relaxed_id}_{sanitize_tag(case_tag)}_{leaf_id}.json"
        if path.name != expected_name:
            failures.append(f"filename {path.name} != expected {expected_name}")
        if cert_id != f"{case_id}:{leaf_id}":
            failures.append(f"certificate_id {cert_id!r} != case_id:leaf_id")
        if not leaf_id.startswith(relaxed_id):
            failures.append("leaf_id does not start with relaxed_id")
        suffix = leaf_id[len(relaxed_id):]
        encoded = "".join("Y" if step["decision"] == "yes" else "N" for step in split_path)
        if suffix != encoded:
            failures.append(f"leaf_id suffix {suffix!r} != split_path Y/N encoding {encoded!r}")
        for step in split_path:
            if step["decision"] not in ("yes", "no"):
                failures.append(f"split_path decision {step['decision']!r} not yes/no")

        # --- separator bookkeeping ---
        sep_meta = [m for m in meta if m["source"] == "separator"]
        if sep_pair is None:
            if case_tag != NO_SEPARATOR_TAG:
                failures.append("separator_pair null but case tag is not no_separator")
            if sep_meta:
                failures.append("separator_pair null but separator generator present")
        else:
            if case_tag != sep_pair:
                failures.append(f"case tag {case_tag!r} != separator_pair {sep_pair!r}")
            if len(sep_meta) != 1:
                failures.append(f"expected 1 separator generator, found {len(sep_meta)}")
            elif "=".join(sep_meta[0]["pair"]) != sep_pair:
                failures.append("separator generator pair != separator_pair")

        # --- incidence-census semantics validation (INFERRED semantics) ---
        row = inc_rows.get(relaxed_id)
        comp = completions.get(relaxed_id, {})
        exact_pids = data["exact_pids"]
        pid = exact_pids[0] if exact_pids else None
        case_common_bits: dict[str, frozenset] = {}
        if row is None:
            failures.append(f"relaxed_id {relaxed_id} missing from incidence census")
        else:
            if row["sstar"] != sstar:
                failures.append(f"sstar {sstar!r} != incidence census {row['sstar']!r}")
            if len(exact_pids) != 1:
                failures.append(f"exact_pids not a singleton: {exact_pids}")
            case_pids = {p for p, c in comp.items() if c["pair_tag"] == case_tag}
            if pid is not None and pid not in case_pids:
                failures.append(f"exact_pid {pid} not among case completions")
            survivors = set(case_pids)
            for step in split_path:
                c, lab, dec = step["center"], step["label"], step["decision"]
                if dec == "yes":
                    survivors = {p for p in survivors if lab in comp[p]["masks"][c]}
                else:
                    survivors = {p for p in survivors if lab not in comp[p]["masks"][c]}
            if survivors != set(exact_pids):
                failures.append(
                    f"split_path filter survivors {sorted(survivors)} != exact_pids {exact_pids}"
                )
            if pid in comp:
                cm = comp[pid]
                for c, entry in erased.items():
                    if frozenset(entry["members"]) != cm["masks"][c] or entry["mask"] != cm["mask_ints"][c]:
                        failures.append(f"common_erased_masks[{c}] != completion {pid} mask")
                # exact-center generator witnesses come from the relaxed row masks
                relaxed_masks = {c: set(v["members"]) for c, v in row["relaxed_masks"].items()}
                for c in EXACT_CENTERS:
                    if cm["masks"][c] != frozenset(relaxed_masks[c]):
                        failures.append(f"completion {pid} mask[{c}] != relaxed row mask")
            if case_pids:
                case_common_bits = {
                    c: frozenset.intersection(*(comp[p]["masks"][c] for p in case_pids))
                    for c in ERASED_CENTERS
                }

        # explicit yes-decisions on this leaf's path
        yes_bits = {(s["center"], s["label"]) for s in split_path if s["decision"] == "yes"}

        # leaf-generator anchor pattern (soft observation): per erased center,
        # 3 generators pairing members[0] with each other member.
        by_center_leafgens: dict[str, list] = {}
        for m in meta:
            if m["source"] == "leaf_common_submask":
                by_center_leafgens.setdefault(m["center"], []).append(m)
        anchor_ok = True
        for c, ms in by_center_leafgens.items():
            mem = erased.get(c, {}).get("members", [])
            expected_pairs = {(mem[0], x) for x in mem[1:]} if len(mem) == 4 else set()
            got_pairs = {tuple(m["witnesses"]) for m in ms}
            if len(ms) != 3 or got_pairs != expected_pairs:
                anchor_ok = False
        if not anchor_ok:
            leaf_anchor_pattern_violations += 1

        # --- per-generator classification over NONZERO generators only ---
        counts = {"exact_v": 0, "exact_w": 0, "separator": 0, "erased_covered": 0, "residue": 0}
        erased_facts = []
        leaf_residues = []
        relaxed_masks_row = (
            {c: set(v["members"]) for c, v in row["relaxed_masks"].items()} if row else {}
        )
        for i, m in enumerate(meta):
            kind_counts[m["kind"]] += 1
            source_counts[m["source"]] += 1
            kind_source_counts[(m["kind"], m["source"])] += 1
            # schema regularity: optional flag tracks the source
            if m["optional"] != (m["source"] == "leaf_common_submask"):
                failures.append(f"generator {m['id']}: optional flag does not match source")
            if coeffs[i] == "0":
                continue
            nonzero_kind_source_counts[(m["kind"], m["source"])] += 1
            src, knd = m["source"], m["kind"]
            if src == "exact_center" and knd == "distance_eq" and m.get("center") in EXACT_CENTERS:
                counts["exact_v" if m["center"] == "v" else "exact_w"] += 1
                if relaxed_masks_row and not set(m["witnesses"]) <= relaxed_masks_row.get(m["center"], set()):
                    failures.append(
                        f"exact generator {m['id']}: witnesses not in relaxed row mask[{m['center']}]"
                    )
            elif src == "separator" and knd == "rabinowitsch_distinct" and m.get("pair"):
                counts["separator"] += 1
            elif src == "leaf_common_submask" and knd == "distance_eq":
                c = m.get("center")
                wits = m.get("witnesses", [])
                members = set(erased.get(c, {}).get("members", []))
                ok = (
                    c in erased
                    and len(wits) == 2
                    and wits[0] != wits[1]
                    and c not in wits
                    and set(wits) <= members
                )
                if ok:
                    counts["erased_covered"] += 1
                    wit_bits = []
                    for x in wits:
                        is_common = x in case_common_bits.get(c, frozenset())
                        is_yes = (c, x) in yes_bits
                        if is_common and is_yes:
                            class_overlap_case_common_and_split_yes += 1
                        cls = "case_common" if is_common else ("split_yes" if is_yes else "path_entailed")
                        wit_bits.append({"witness": x, "class": cls})
                        bit_class_use_totals[cls] += 1
                        b = bit_index.setdefault((c, x), {"leaves": 0, "classes": Counter()})
                        b["leaves"] += 1
                        b["classes"][cls] += 1
                    erased_facts.append(
                        {
                            "index": i,
                            "id": m["id"],
                            "center": c,
                            "witnesses": list(wits),
                            "witness_bits": wit_bits,
                        }
                    )
                else:
                    counts["residue"] += 1
                    inst = {
                        "leaf": cert_id,
                        "index": i,
                        "id": m["id"],
                        "center": c,
                        "witnesses": list(wits),
                        "reason": "witnesses not all in common_erased_masks members"
                        if c in erased
                        else "center not an erased center",
                    }
                    leaf_residues.append(inst)
                    residues_global.append(inst)
            else:
                counts["residue"] += 1
                inst = {
                    "leaf": cert_id,
                    "index": i,
                    "id": m["id"],
                    "center": m.get("center"),
                    "witnesses": list(m.get("witnesses", m.get("pair", []))),
                    "reason": f"unrecognized (kind, source, center) = ({knd}, {src}, {m.get('center')})",
                }
                leaf_residues.append(inst)
                residues_global.append(inst)

        if sum(counts.values()) != support["nonzero_count"]:
            failures.append("category counts do not sum to nonzero_count")
        nonzero_gen_centers = {
            m["center"] for i, m in enumerate(meta) if coeffs[i] != "0" and "center" in m
        }
        if set(centers) != nonzero_gen_centers:
            failures.append("centers_used != centers of nonzero generators")

        # --- certificate census cross-check ---
        ce = census_by_cert_id.get(cert_id)
        if ce is None:
            failures.append("certificate_id missing from split-singleton certificate census")
        else:
            if ce["generator_count"] != len(gens):
                failures.append("census generator_count mismatch")
            if ce["nonzero_count"] != support["nonzero_count"]:
                failures.append("census nonzero_count mismatch")
            if ce["exact_pids"] != exact_pids:
                failures.append("census exact_pids mismatch")
            if ce["split_path"] != split_path:
                failures.append("census split_path mismatch")
            if ce["sha256"] != sha256_of(path):
                failures.append("census sha256 mismatch")
            if ce["status"] != "ok":
                failures.append(f"census status {ce['status']!r}")

        if not data["checks"].get("singular_lifted_column", False):
            failures.append("checks.singular_lifted_column is not true")

        # --- aggregate ---
        case_leaf_counts[(relaxed_id, case_tag)] += 1
        for k, v in counts.items():
            cat_hists[k][v] += 1
        joint_cat_hist[
            (counts["exact_v"], counts["exact_w"], counts["separator"], counts["erased_covered"], counts["residue"])
        ] += 1
        nonzero_hist[support["nonzero_count"]] += 1

        ss = per_sstar.setdefault(
            sstar,
            {"leaves": 0, "nonzero_total": 0, "exact_v": 0, "exact_w": 0, "separator": 0,
             "erased_covered": 0, "residue": 0, "bits": set()},
        )
        ss["leaves"] += 1
        ss["nonzero_total"] += support["nonzero_count"]
        for k in ("exact_v", "exact_w", "separator", "erased_covered", "residue"):
            ss[k] += counts[k]
        for f in erased_facts:
            for wb in f["witness_bits"]:
                ss["bits"].add((f["center"], wb["witness"]))

        if failures:
            semantics_validation_failures += 1
            for f in failures:
                anomalies.append(f"{path.name}: {f}")

        leaves_out.append(
            {
                "file": path.name,
                "certificate_id": cert_id,
                "case_id": case_id,
                "leaf_id": leaf_id,
                "relaxed_id": relaxed_id,
                "sstar": sstar,
                "separator_pair": sep_pair,
                "exact_pid": pid,
                "split_path": split_path,
                "generator_total": len(gens),
                "nonzero_total": support["nonzero_count"],
                "counts": counts,
                "erased_facts": erased_facts,
                "residues": leaf_residues,
                "validation": {"pass": not failures, "failures": failures},
            }
        )

    # --- case leaf counts vs incidence completion counts ---
    expected_cases = {}
    for rid, row in inc_rows.items():
        for pair, n in row["comp_g_forced_pair_counts"].items():
            tag = NO_SEPARATOR_TAG if pair == "None" else pair
            expected_cases[(rid, tag)] = n
    if dict(case_leaf_counts) != expected_cases:
        only_leaves = {k: v for k, v in case_leaf_counts.items() if expected_cases.get(k) != v}
        only_census = {k: v for k, v in expected_cases.items() if case_leaf_counts.get(k) != v}
        anomalies.append(
            f"case leaf counts != incidence completion counts; leaves={only_leaves}, census={only_census}"
        )

    leaves_out.sort(key=lambda r: r["certificate_id"])

    # ---------------- aggregation blocks ----------------
    corder = {c: i for i, c in enumerate(CANONICAL_CENTERS)}
    required_bits = [
        {
            "center": c,
            "witness": x,
            "leaves_used": bit_index[(c, x)]["leaves"],
            "class_counts": dict(sorted(bit_index[(c, x)]["classes"].items())),
        }
        for (c, x) in sorted(bit_index, key=lambda b: (corder.get(b[0], 99), corder.get(b[1], 99)))
    ]
    bits_per_center = Counter(c for (c, _x) in bit_index)

    summary = {
        "headline": {
            "residue_empty": not residues_global,
            "residue_count": len(residues_global),
            "residue_instances": residues_global,
        },
        "file_count": len(files),
        "leaf_schema_values": dict(sorted(schema_values.items())),
        "kinds": dict(sorted(kind_counts.items())),
        "sources": dict(sorted(source_counts.items())),
        "kind_source_pairs": {f"{k}|{s}": n for (k, s), n in sorted(kind_source_counts.items())},
        "nonzero_kind_source_pairs": {
            f"{k}|{s}": n for (k, s), n in sorted(nonzero_kind_source_counts.items())
        },
        "nonzero_count_distribution": hist(nonzero_hist),
        "category_count_distributions": {k: hist(v) for k, v in sorted(cat_hists.items())},
        "joint_category_distribution": [
            {"exact_v": t[0], "exact_w": t[1], "separator": t[2], "erased_covered": t[3],
             "residue": t[4], "leaves": n}
            for t, n in sorted(joint_cat_hist.items())
        ],
        "category_totals": {
            k: sum(v * n for v, n in cat_hists[k].items()) for k in sorted(cat_hists)
        },
        "required_bits": {
            "distinct_count": len(bit_index),
            "per_center_distinct": dict(sorted(bits_per_center.items())),
            "per_use_class_totals": dict(sorted(bit_class_use_totals.items())),
            "case_common_and_split_yes_overlap_uses": class_overlap_case_common_and_split_yes,
            "bits": required_bits,
        },
        "per_sstar": {
            s: {
                "leaves": v["leaves"],
                "nonzero_total": v["nonzero_total"],
                "exact_v": v["exact_v"],
                "exact_w": v["exact_w"],
                "separator": v["separator"],
                "erased_covered": v["erased_covered"],
                "residue": v["residue"],
                "distinct_bits": len(v["bits"]),
            }
            for s, v in sorted(per_sstar.items())
        },
        "variables_length_distribution": hist(variables_len_counts),
        "leaf_anchor_pattern_violations": leaf_anchor_pattern_violations,
        "leaves_with_validation_failures": semantics_validation_failures,
        "anomalies": anomalies,
    }

    report = {
        "schema": OUT_SCHEMA,
        "source": {
            "certificate_dir": str(CERT_DIR.relative_to(REPO)),
            "certificate_census": str(CERT_CENSUS_PATH.relative_to(REPO)),
            "certificate_census_sha256": sha256_of(CERT_CENSUS_PATH),
            "incidence_census": str(INCIDENCE_CENSUS_PATH.relative_to(REPO)),
            "incidence_census_sha256": sha256_of(INCIDENCE_CENSUS_PATH),
        },
        "canonical_centers": list(CANONICAL_CENTERS),
        "summary": summary,
        "leaves": leaves_out,
    }
    OUT_JSON.write_text(json.dumps(report, indent=2, sort_keys=True) + "\n")

    write_md(report)

    print(f"leaves: {len(files)}  residue: {len(residues_global)}  anomalies: {len(anomalies)}")
    print(f"wrote {OUT_JSON.relative_to(REPO)}")
    print(f"wrote {OUT_MD.relative_to(REPO)}")
    return 0


def md_table(header: list[str], rows: list[list]) -> list[str]:
    out = ["| " + " | ".join(header) + " |", "|" + "|".join("---" for _ in header) + "|"]
    for r in rows:
        out.append("| " + " | ".join(str(x) for x in r) + " |")
    return out


def write_md(report: dict) -> None:
    s = report["summary"]
    leaves = {r["certificate_id"]: r for r in report["leaves"]}
    lines: list[str] = []
    add = lines.append

    add("<!--")
    add("Copyright (c) 2026 Adam McKenna. All rights reserved.")
    add("Released under Apache 2.0 license as described in the file LICENSE.")
    add("Author: Adam McKenna <adam@mysticflounder.ai>")
    add("-->")
    add("")
    add("# Pinned surplus general-m required facts (relaxed singleton split)")
    add("")
    add("Closure-plan 2026-07-06 §3 step 1. Post-processing of the 135 leaf")
    add(f"certificates in `{report['source']['certificate_dir']}/` against the")
    add("split-singleton certificate census and the relaxed incidence census.")
    add("Zero solver cost. Generated by `scripts/pinned-generalm-required-facts.py`;")
    add(f"machine report: `{OUT_JSON.relative_to(REPO)}`.")
    add("")

    add("## Headline: residue (EMPIRICAL)")
    add("")
    if s["headline"]["residue_empty"]:
        add("**Residue = empty.** Every nonzero-coefficient generator in every one of")
        add(f"the {s['file_count']} leaves is covered by one of: exact v-center distance")
        add("equations, exact w-center distance equations, the Rabinowitsch separator,")
        add("or erased-center distance facts whose two witnesses both lie in that")
        add("leaf's `common_erased_masks[center].members` (equivalently, per the")
        add("validated split semantics below, membership bits fixed at the leaf).")
    else:
        add(f"**Residue = {s['headline']['residue_count']} instances.** Exact list:")
        add("")
        add_rows = [
            [r["leaf"], r["index"], r["id"], r["center"], ",".join(r["witnesses"]), r["reason"]]
            for r in s["headline"]["residue_instances"]
        ]
        lines.extend(md_table(["leaf", "idx", "generator id", "center", "witnesses", "reason"], add_rows))
    add("")
    tot = s["category_totals"]
    nonzero_total = sum(tot.values())
    add(f"Nonzero generators across all leaves: {nonzero_total}. Category totals:")
    add(f"exact v = {tot['exact_v']}, exact w = {tot['exact_w']},")
    add(f"separator = {tot['separator']}, erased-center covered = {tot['erased_covered']},")
    add(f"residue = {tot['residue']}.")
    add("")

    add("## Corpus and generator vocabulary (EMPIRICAL)")
    add("")
    add(f"- Files: {s['file_count']} (expected {EXPECTED_FILE_COUNT}).")
    add(f"- Leaf schema values: {s['leaf_schema_values']}.")
    add(f"- Distinct `kind` values: {sorted(s['kinds'])} with counts {s['kinds']}.")
    add(f"- Distinct `source` values: {sorted(s['sources'])} with counts {s['sources']}.")
    add(f"- (kind, source) pairs over all generators: {s['kind_source_pairs']}.")
    add(f"- (kind, source) pairs over nonzero generators: {s['nonzero_kind_source_pairs']}.")
    add(f"- Variables-array length distribution: {s['variables_length_distribution']}")
    add("  (17 = coordinate variables + Rabinowitsch t; 16 = the no-separator leaves).")
    add("")

    add("## Per-leaf category count distributions (EMPIRICAL)")
    add("")
    add("Counts are over nonzero-coefficient generators only. `value x leaves`.")
    add("")
    for cat in ("exact_v", "exact_w", "separator", "erased_covered", "residue"):
        d = s["category_count_distributions"][cat]
        add(f"- **{cat}**: " + ", ".join(f"{v}×{n}" for v, n in d))
    add("")
    add("Joint (exact_v, exact_w, separator, erased_covered, residue) distribution:")
    add("")
    lines.extend(
        md_table(
            ["exact_v", "exact_w", "separator", "erased_covered", "residue", "leaves"],
            [[j["exact_v"], j["exact_w"], j["separator"], j["erased_covered"], j["residue"], j["leaves"]]
             for j in s["joint_category_distribution"]],
        )
    )
    add("")
    add("Per-s★ breakdown:")
    add("")
    lines.extend(
        md_table(
            ["s★", "leaves", "nonzero", "exact_v", "exact_w", "separator", "erased_covered", "residue", "distinct bits"],
            [[k, v["leaves"], v["nonzero_total"], v["exact_v"], v["exact_w"], v["separator"],
              v["erased_covered"], v["residue"], v["distinct_bits"]]
             for k, v in s["per_sstar"].items()],
        )
    )
    add("")

    add("## Required membership bits from category (d) (EMPIRICAL)")
    add("")
    rb = s["required_bits"]
    add(f"Distinct (center, witness) membership bits used by nonzero erased-center")
    add(f"facts across all leaves: **{rb['distinct_count']}**")
    add(f"(per center: {rb['per_center_distinct']}).")
    add("")
    add("Per-use classification of the bits (each nonzero erased-center fact uses")
    add("two bits; classification is against the leaf's case and split path):")
    add(f"{rb['per_use_class_totals']}, with")
    add(f"{rb['case_common_and_split_yes_overlap_uses']} uses classified as both")
    add("case-common and an explicit yes-decision.")
    add("")
    add("- `case_common` — bit holds in every exact completion of the leaf's case;")
    add("  usable with no split assumption.")
    add("- `split_yes` — bit is an explicit yes-decision on the leaf's split path.")
    add("- `path_entailed` — bit holds in the unique surviving completion but is")
    add("  neither case-common nor an explicit yes-decision; it is fixed only by")
    add("  elimination along the path (validated below).")
    add("")
    add("Full bit list with per-class use counts is in the machine report under")
    add("`summary.required_bits.bits`.")
    add("")

    add("## split_path semantics (INFERRED, then validated)")
    add("")
    add("INFERRED semantics: each certificate leaf belongs to a case")
    add("`(relaxed row, forced separator pair)`; `case_id` is `R0xx:<pair>` with")
    add("pair `u=v`, `u=s1`, or `no_separator` (incidence census records the pair")
    add("as null for `no_separator`). The case starts from the exact completions of")
    add("the relaxed row carrying that forced pair (per-completion full masks in the")
    add("incidence census `rows[].exact_rows`). `split_path` is the list of binary")
    add("decisions from the case root to the leaf: entry `{center: c, label: l,")
    add("decision: yes|no}` keeps exactly the completions with `l ∈ mask(c)` (yes)")
    add("or `l ∉ mask(c)` (no). The leaf id is the relaxed id followed by the")
    add("path's decisions encoded Y/N in order.")
    add("")
    add("Validated consequences (EMPIRICAL, all 135 leaves):")
    add("")
    add("- Filtering the case's completions by the path leaves exactly the leaf's")
    add("  `exact_pids` — a single pid at every leaf; leaf count per case equals")
    add("  the case's completion count (135 leaves ↔ 135 completions).")
    add("- The leaf's `common_erased_masks` equals that surviving completion's")
    add("  masks on the 8 erased centers (members and mask integers), i.e. every")
    add("  membership bit is fixed at the leaf.")
    add("- The two exact centers v, w have case-level masks (`relaxed_masks` of the")
    add("  incidence row); every completion agrees with them, and all exact-center")
    add("  generator witnesses lie inside them.")
    add("- Mask integers (leaf certificates and incidence census alike) are")
    add(f"  bitmasks over the canonical label order {report['canonical_centers']}")
    add("  (bit i = label i). A leaf's `support.centers_used` is the set of centers")
    add("  of its nonzero generators, listed in canonical order.")
    add("")
    add("Examples:")
    add("")

    def example(cid: str) -> None:
        r = leaves.get(cid)
        if r is None:
            add(f"- `{cid}`: (missing)")
            return
        steps = ", ".join(
            f"{st['center']}:{st['label']}={'Y' if st['decision'] == 'yes' else 'N'}"
            for st in r["split_path"]
        )
        add(f"- `{r['certificate_id']}` (file `{r['file']}`): split_path = [{steps}],")
        add(f"  leaf suffix `{r['leaf_id'][len(r['relaxed_id']):] or '(none)'}`, surviving exact pid `{r['exact_pid']}`.")

    example("R000:u=v:R000")
    example("R001:no_separator:R001N")
    example("R001:no_separator:R001Y")
    example("R002:u=v:R002NNNN")
    example("R009:u=v:R009NNYNNY")
    example("R009:u=s1:R009Y")
    add("")
    add("The R001 pair shows one split separating the case's two completions on the")
    add("bit `s1 ∈ mask(u)`: the `N` leaf's `common_erased_masks[u].members` excludes")
    add("s1, the `Y` leaf's includes it, and each leaf pins a different exact pid.")
    add("")
    add("Structural observation (EMPIRICAL): per leaf, the 24 optional generators")
    add("(`source = leaf_common_submask`) are 3 per erased center, pairing the")
    add("center's first mask member (members lists are stored in canonical label")
    add(f"order, validated) with each of the other three; violations: {s['leaf_anchor_pattern_violations']}.")
    add("The 6 required distance generators (`source = exact_center`) are 3 per")
    add("exact center (v, w); the optional flag equals `source == leaf_common_submask`")
    add("on every generator (deviations would be listed under anomalies).")
    add("")

    add("## Anomalies (EMPIRICAL)")
    add("")
    if s["anomalies"]:
        add(f"{len(s['anomalies'])} anomalies:")
        add("")
        for a in s["anomalies"]:
            add(f"- {a}")
    else:
        add("None. All validations passed on all 135 files: file count; per-file")
        add("`len(generators) == len(generator_metadata) == len(coefficients)`;")
        add("`generators[i]` equals `generator_metadata[i].generator`; recomputed")
        add("nonzero coefficient indices equal `support.nonzero_indices` and")
        add("`nonzero_count`; `nonzero_optional_indices` consistent under the")
        add("optional-sublist mapping; mask integers equal member bitmasks; filename,")
        add("`certificate_id`, and leaf-id Y/N suffix consistent with `case_id` and")
        add("`split_path`; separator generator/pair consistent with `separator_pair`;")
        add("split-path filtering pins exactly the leaf's `exact_pids` with matching")
        add("erased masks; census cross-checks (generator counts, nonzero counts,")
        add("exact pids, split paths, sha256, status ok) pass; case leaf counts equal")
        add("incidence completion counts; `checks.singular_lifted_column` true.")
    add("")
    add(f"Leaves with any validation failure: {s['leaves_with_validation_failures']}.")
    add("")

    OUT_MD.write_text("\n".join(lines) + "\n")


if __name__ == "__main__":
    raise SystemExit(main())
