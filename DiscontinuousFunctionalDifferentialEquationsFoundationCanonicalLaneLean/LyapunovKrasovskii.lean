import canonicalLaneMathlib.AdmissibleClass
import DiscontinuousFunctionalDifferentialEquationsFoundationCanonicalLaneLean.RazumikhinStability

namespace HautevilleHouse
namespace DiscontinuousFunctionalDifferentialEquationsFoundationCanonicalLaneLean

structure LyapunovKrasovskiiPackage {S : FunctionalDifferentialEquationState} {D : DelayDifferentialEquation S} (R : RazumikhinStabilityPackage D) where
  functional : (S.timeDomain → S.stateSpace) → ℝ
  derivativeEstimate : Prop
  asymptoticStability : Prop
  derivativeEstimateClosed : derivativeEstimate
  asymptoticStabilityClosed : asymptoticStability

structure LyapunovKrasovskiiEvidence {S : FunctionalDifferentialEquationState} {D : DelayDifferentialEquation S} {R : RazumikhinStabilityPackage D} (L : LyapunovKrasovskiiPackage R) where
  derivativeEstimateClosed : L.derivativeEstimate
  asymptoticStabilityClosed : L.asymptoticStability

def LyapunovKrasovskiiClosed {S : FunctionalDifferentialEquationState} {D : DelayDifferentialEquation S} {R : RazumikhinStabilityPackage D} (L : LyapunovKrasovskiiPackage R) : Prop := L.derivativeEstimate ∧ L.asymptoticStability

theorem lyapunov_krasovskii_closed_from_evidence {S : FunctionalDifferentialEquationState} {D : DelayDifferentialEquation S} {R : RazumikhinStabilityPackage D} (L : LyapunovKrasovskiiPackage R) (E : LyapunovKrasovskiiEvidence L) : LyapunovKrasovskiiClosed L := by
  exact And.intro E.derivativeEstimateClosed E.asymptoticStabilityClosed

end DiscontinuousFunctionalDifferentialEquationsFoundationCanonicalLaneLean
end HautevilleHouse