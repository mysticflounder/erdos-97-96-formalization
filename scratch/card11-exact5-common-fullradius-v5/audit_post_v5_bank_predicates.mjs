#!/usr/bin/env node

import fs from "node:fs";
import path from "node:path";

const here = path.dirname(new URL(import.meta.url).pathname);
const cases = ["s2_o0", "s2_o9", "s3_o0", "s3_o9"];

function readJson(file) {
  return JSON.parse(fs.readFileSync(file, "utf8"));
}

function isPositive(model, variable) {
  return model.signed_literals[variable - 1] > 0;
}

function sorted(values) {
  return [...values].sort((a, b) => a - b);
}

function key(values) {
  return sorted(values).join(",");
}

function localClasses(manifest, model, center) {
  const labels = manifest.carrier_labels.filter((x) => x !== center);
  const parent = new Map(labels.map((x) => [x, x]));
  function find(x) {
    let y = x;
    while (parent.get(y) !== y) y = parent.get(y);
    while (parent.get(x) !== x) {
      const next = parent.get(x);
      parent.set(x, y);
      x = next;
    }
    return y;
  }
  function union(a, b) {
    const ra = find(a);
    const rb = find(b);
    if (ra !== rb) parent.set(rb, ra);
  }
  for (const eq of manifest.equality_variables) {
    if (eq.center === center && isPositive(model, eq.variable)) {
      union(eq.left, eq.right);
    }
  }
  const classes = new Map();
  for (const x of labels) {
    const r = find(x);
    if (!classes.has(r)) classes.set(r, []);
    classes.get(r).push(x);
  }
  return [...classes.values()].map(sorted).sort((a, b) => a[0] - b[0]);
}

function loadCase(caseName) {
  const run = path.join(here, "runs", caseName);
  const manifest = readJson(path.join(run, "manifest.json"));
  const model = readJson(path.join(run, "model.json"));
  const rows = manifest.selected_rows.filter((r) => isPositive(model, r.variable));
  const rowByCenter = new Map(rows.map((r) => [r.center, r]));
  const sources = manifest.source_choices.filter((s) => isPositive(model, s.variable));
  const classesByCenter = new Map(
    manifest.carrier_labels.map((c) => [c, localClasses(manifest, model, c)]),
  );
  return { manifest, model, rows, rowByCenter, sources, classesByCenter };
}

function classContaining(classes, label) {
  return classes.find((c) => c.includes(label));
}

function auditCase(caseName) {
  const data = loadCase(caseName);
  const adjacent = [];
  const thirdCommon = [];
  const nontripleEquilateral = [];
  const commonBisectorTriple = [];
  const sourceSummaries = [];

  for (const source of data.sources) {
    const q = source.source;
    const p = source.center;
    const sourceRow = data.rowByCenter.get(p);
    const T = sourceRow.support.filter((x) => x !== q);
    if (T.length !== 3) {
      throw new Error(`${caseName}: source ${q}->${p} does not leave a triple`);
    }

    const qCritical = new Map();
    const qDeleted = new Map();
    for (const center of data.manifest.carrier_labels) {
      if (center === q) continue;
      const classes = data.classesByCenter.get(center);
      const throughQ = classContaining(classes, q);
      if (throughQ?.length === 4) {
        qCritical.set(center, throughQ.filter((x) => x !== q));
      }
      const deletedClass = classes.find(
        (c) => !c.includes(q) && c.length >= 4,
      );
      if (deletedClass) qDeleted.set(center, deletedClass.slice(0, 4));
      if (throughQ?.length >= 5) {
        qDeleted.set(center, throughQ.filter((x) => x !== q).slice(0, 4));
      }
    }

    for (let i = 0; i < T.length; i += 1) {
      for (let j = i + 1; j < T.length; j += 1) {
        const t1 = T[i];
        const t2 = T[j];
        const b1 = qCritical.get(t1);
        const b2 = qCritical.get(t2);
        if (!b1 || !b2 || !b1.includes(p) || !b2.includes(p)) continue;
        if (b1.includes(t2) || b2.includes(t1)) {
          adjacent.push({ q, p, T, t1, t2, B1: b1, B2: b2 });
        }
        const t3 = T.find((t) => t !== t1 && t !== t2);
        if (b1.includes(t3) && b2.includes(t3)) {
          thirdCommon.push({ q, p, T, t1, t2, t3, B1: b1, B2: b2 });
        }
      }
    }

    const outside = data.manifest.carrier_labels.filter(
      (x) => x !== q && x !== p && !T.includes(x),
    );
    for (const t of T) {
      const classT = data.classesByCenter
        .get(t)
        .find((c) => !c.includes(q) && c.length >= 4);
      for (const x of outside) {
        const classX = data.classesByCenter
          .get(x)
          .find((c) => !c.includes(q) && c.length >= 4);
        if (
          classT &&
          classX &&
          classT.includes(p) &&
          classT.includes(x) &&
          classX.includes(p) &&
          classX.includes(t)
        ) {
          nontripleEquilateral.push({
            q,
            p,
            T,
            t,
            x,
            classT,
            classX,
          });
        }
      }
    }
    for (const x of outside) {
      const classX = data.classesByCenter
        .get(x)
        .find((c) => !c.includes(q) && c.length >= 4);
      if (
        classX &&
        classX.includes(p) &&
        T.every((t) => classX.includes(t))
      ) {
        commonBisectorTriple.push({
          q,
          p,
          T,
          x,
          classX,
        });
      }
    }

    sourceSummaries.push({
      q,
      p,
      T,
      qCriticalOnT: T.filter((t) => qCritical.has(t)).map((t) => ({
        center: t,
        B: qCritical.get(t),
      })),
      qDeletedOnT: T.filter((t) => qDeleted.has(t)).map((t) => ({
        center: t,
        B: qDeleted.get(t),
      })),
    });
  }

  return {
    case: caseName,
    selectedRows: data.rows.map(({ center, row_index, support }) => ({
      center,
      row_index,
      support,
      localClasses: data.classesByCenter.get(center),
      selectedSupportIsEntireClass: data.classesByCenter
        .get(center)
        .some((c) => key(c) === key(support)),
    })),
    sources: sourceSummaries,
    bankPredicates: {
      twoTripleCentersAdjacent: adjacent,
      twoTripleCentersThirdCommon: thirdCommon,
      nontripleEquilateralOnPCircle: nontripleEquilateral,
      commonBisectorTriple,
    },
  };
}

const result = {
  schema: "card11-exact5-common-fullradius-v5-post-bank-audit-v1",
  cases: cases.map(auditCase),
};

process.stdout.write(`${JSON.stringify(result, null, 2)}\n`);
