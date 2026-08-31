<!--
Copyright (c) 2026 Adam McKenna. All rights reserved.
Released under Apache 2.0 license as described in the file LICENSE.
Author: Adam McKenna <adam@mysticflounder.ai>
-->

# P97 package-bank fidelity harnesses

This directory archives three deliberate `sorry`-backed elaboration checks. They are
diagnostic harnesses, not proof obligations or package-bank deliverables. The live,
`sorry`-free artifacts remain:

- `lean/scratch/c-package-bank/CPackageBank.lean`;
- `lean/scratch/e-package-bank/EPackageBank.lean`.

The harnesses were moved verbatim on 2026-08-30 from:

- `lean/scratch/c-package-bank/FidelityCheck.lean` to
  `c-package-bank/FidelityCheck.lean`;
- `lean/scratch/e-package-bank/FidelityCheck.lean` to
  `e-package-bank/FidelityCheck.lean`.

Archive provenance base: `beb71db498ad47cca5c343a76a359423ff47f9e2`.

The archived byte digests are:

- C harness SHA-256:
  `4643c5a52a62f764807407372bc3a0d313152cee23f7681abf6d0ac577dae1ec`;
- E harness SHA-256:
  `41b6416b3f4e5b906eb07d1140540791936257df3556b1054904c2560e9e7e71`.

## Manual replay

Run these commands from `lean/`. Each bank must first be compiled to the local
directory used by the harness's unqualified import.

```bash
lake env lean -o scratch/c-package-bank/CPackageBank.olean \
  scratch/c-package-bank/CPackageBank.lean
LEAN_PATH="$(lake env printenv LEAN_PATH):scratch/c-package-bank" \
  lake env lean \
  ../attic/p97-package-bank-fidelity-2026-08-30/c-package-bank/FidelityCheck.lean
```

The expected result is successful elaboration with exactly the two intentional
`declaration uses 'sorry'` warnings from `fidelity_c1` and `fidelity_c2`.

```bash
lake env lean -o scratch/e-package-bank/EPackageBank.olean \
  scratch/e-package-bank/EPackageBank.lean
LEAN_PATH="$(lake env printenv LEAN_PATH):scratch/e-package-bank" \
  lake env lean \
  ../attic/p97-package-bank-fidelity-2026-08-30/e-package-bank/FidelityCheck.lean
```

The expected result is successful elaboration with exactly the one intentional
`declaration uses 'sorry'` warning from `fidelity_e1`.
