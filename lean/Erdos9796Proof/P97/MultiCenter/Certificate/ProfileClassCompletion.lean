/-
Copyright (c) 2026 Adam McKenna. All rights reserved.
Released under Apache 2.0 license as described in the file LICENSE.
Authors: Adam McKenna
-/

import Erdos9796Proof.P97.MultiCenter.Certificate.LocalEnumeratorCertificate
import Erdos9796Proof.P97.MultiCenter.Certificate.ProfileClassBridge
import Erdos9796Proof.P97.MultiCenter.Certificate.ProfileClassCoverageCertificate

/-!
# Completed multi-center profile/class incidence bridge
-/

namespace Problem97
namespace MultiCenter
namespace Certificate
namespace ProfileClassIncidence

/-- The verified LOCAL enumerator, typed-bank certificate, permutation table,
and profile-incidence coverage certificate prove the remaining finite-code
bridge. -/
theorem finiteCodeWitnesses : FiniteCodeWitnesses := by
  intro n profile _hn hocc code hlocal
  rcases exists_incidenceRow_of_profileOccursAtN hocc with
    ⟨incidenceRow, hincidence, hnRow, hprofile⟩
  rcases LocalEnumeratorCertificate.exists_typedRow_of_l2FullLocal
      hlocal.1 hlocal.2.1 hlocal.2.2 with
    ⟨source, hsource, hsourceClass⟩
  have hlocalSource :
      source.toJointClass.LocallyAdmissible incidenceRow.profile := by
    rw [hprofile, hsourceClass]
    exact hlocal.2.2
  have hcapacity :=
    ProfileClassCoverageCertificate.capacityOK_of_locallyAdmissible hlocalSource
  rcases ProfileClassCoverageCertificate.exists_incidenceRepresentative_of_mem
      hincidence hsource hcapacity with
    ⟨target, htarget, hcontains, hequivalent⟩
  rw [hprofile, hsourceClass] at hequivalent
  exact ⟨incidenceRow, hincidence, hnRow, hprofile,
    target, htarget, hcontains, hequivalent⟩

/-- The generated incidence relation covers every scoped L2/full LOCAL class
above its certificate threshold, modulo profile automorphisms. -/
theorem coversL2FullLocalModuloFrom :
    Completion.CoversL2FullLocalModuloFrom certifies threshold :=
  coversL2FullLocalModuloFrom_of_finiteCodeWitnesses finiteCodeWitnesses

/-- The representative-closed generated surface is complete for scoped
L2/full LOCAL classes above the certificate threshold. -/
theorem completesL2FullFrom_representativeSurface :
    Completion.CompletesL2FullFrom representativeSurface threshold :=
  completesL2FullFrom_representativeSurface_of_finiteCodeWitnesses
    finiteCodeWitnesses

end ProfileClassIncidence
end Certificate
end MultiCenter
end Problem97
