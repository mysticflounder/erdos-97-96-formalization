#!/usr/bin/env python3
"""Insert the mechanical 1,899-argument LRAT coordinator application."""

from pathlib import Path


HERE = Path(__file__).resolve().parent
TARGET = HERE / "DirectSourceExactFiveCoordinator.lean"
START = "-- GENERATED DIRECT-SOURCE APPLICATION START"
END = "-- GENERATED DIRECT-SOURCE APPLICATION END"


def theorem_text() -> str:
    arguments = []
    arguments.extend(f"      base.h{i:04d}" for i in range(145))
    arguments.extend(f"      role.h{i:04d}" for i in range(145, 170))
    arguments.extend(
        f"      (directSource_h{i:04d} P)" for i in range(170, 237)
    )
    arguments.extend(
        f"      (directSource_h{i:04d} (C := C) P)" for i in range(237, 489)
    )
    arguments.extend(
        f"      (directSource_h{i:04d} (T := T) P)" for i in range(489, 571)
    )
    arguments.extend(
        f"      (directSource_h{i:04d} P)" for i in range(571, 1899)
    )
    application = "\n".join(arguments)
    return f"""{START}
/-- The source-faithful semantic table contradicts the exact pass-five LRAT
certificate in the card-thirteen same-radius branch. -/
theorem false_of_directSource_semanticTable
    {{D : CounterexampleData}} {{S : SurplusCapPacket D.A}} {{radius : ℝ}}
    {{H : CriticalShellSystem D.A}}
    {{F : CriticalPairFrontier D S radius H}}
    {{R : FrontierCommonDeletionParentResidual F}}
    {{B : FrontierBiApexRobustResidual R}}
    (Q : FrontierBiApexRobustExactFiveSecondCapResidual B)
    {{profile : LargeCapUniqueFiveSecondApexRadius D S}}
    {{M : PhysicalActualCriticalMutualOmissionPair H profile}}
    {{N : SourceTwoHitNormalForm Q profile M}}
    (P : CanonicalAsymmetricRolePrepacket N)
    {{star : PhysicalGlobalCrossDeletionStar profile}}
    {{first : FirstApexShellRolePacket F R}}
    (T : CanonicalAsymmetricSemanticRowTable P star first)
    (C : CanonicalCoverFamilies T)
    (hcard : D.A.card = 13) (hsame : first.doubleRadius = radius) :
    False := by
  let base := directSource_certificateBaseAssertions C
  let role := directSource_roleAssertions Q T C hcard hsame
  exact false_of_directSource_flat
      (directSourceRows C) directCertificateBlockers (directSourceShell T)
      (directSourceQ T) (directSourceW T) (directSourceFirstRow T)
      (directSourceRanks P)
{application}

/-- The spoke-one source normal form supplies the complete exact certificate
ingress from the live geometric parent. -/
theorem false_of_exactFive_card13_sameRadius_spoke₁
    {{D : CounterexampleData}} {{S : SurplusCapPacket D.A}} {{radius : ℝ}}
    {{H : CriticalShellSystem D.A}}
    {{F : CriticalPairFrontier D S radius H}}
    {{R : FrontierCommonDeletionParentResidual F}}
    {{B : FrontierBiApexRobustResidual R}}
    (Q : FrontierBiApexRobustExactFiveSecondCapResidual B)
    (profile : LargeCapUniqueFiveSecondApexRadius D S)
    (star : PhysicalGlobalCrossDeletionStar profile)
    (N : SourceTwoHitNormalForm Q profile
      star.spoke₁HubPair.toMutualOmissionPair)
    (first : FirstApexShellRolePacket F R)
    (hcard : D.A.card = 13) (hsame : first.doubleRadius = radius) :
    False := by
  rcases nonempty_canonicalAsymmetricRolePrepacket Q profile
      star.spoke₁HubPair.toMutualOmissionPair N hcard with ⟨P⟩
  rcases CanonicalAsymmetricSemanticRowTable.nonempty P star first with ⟨T⟩
  rcases nonempty_canonicalCoverFamilies_spoke₁ T with ⟨C⟩
  exact false_of_directSource_semanticTable Q P T C hcard hsame

/-- The spoke-two source normal form supplies the complete exact certificate
ingress from the live geometric parent. -/
theorem false_of_exactFive_card13_sameRadius_spoke₂
    {{D : CounterexampleData}} {{S : SurplusCapPacket D.A}} {{radius : ℝ}}
    {{H : CriticalShellSystem D.A}}
    {{F : CriticalPairFrontier D S radius H}}
    {{R : FrontierCommonDeletionParentResidual F}}
    {{B : FrontierBiApexRobustResidual R}}
    (Q : FrontierBiApexRobustExactFiveSecondCapResidual B)
    (profile : LargeCapUniqueFiveSecondApexRadius D S)
    (star : PhysicalGlobalCrossDeletionStar profile)
    (N : SourceTwoHitNormalForm Q profile
      star.spoke₂HubPair.toMutualOmissionPair)
    (first : FirstApexShellRolePacket F R)
    (hcard : D.A.card = 13) (hsame : first.doubleRadius = radius) :
    False := by
  rcases nonempty_canonicalAsymmetricRolePrepacket Q profile
      star.spoke₂HubPair.toMutualOmissionPair N hcard with ⟨P⟩
  rcases CanonicalAsymmetricSemanticRowTable.nonempty P star first with ⟨T⟩
  rcases nonempty_canonicalCoverFamilies_spoke₂ T with ⟨C⟩
  exact false_of_directSource_semanticTable Q P T C hcard hsame
{END}"""


def main() -> None:
    source = TARGET.read_text()
    generated = theorem_text()
    if START in source:
        before, rest = source.split(START, 1)
        _, after = rest.split(END, 1)
        source = before + generated + after
    else:
        marker = "#print axioms directSource_roleAssertions"
        source = source.replace(marker, generated + "\n\n" + marker)
    TARGET.write_text(source)


if __name__ == "__main__":
    main()
