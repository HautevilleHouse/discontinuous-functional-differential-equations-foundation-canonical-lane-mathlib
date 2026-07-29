import canonicalLaneMathlib.AdmissibleClass
import DiscontinuousFunctionalDifferentialEquationsFoundationCanonicalLaneLean.LyapunovKrasovskii

namespace HautevilleHouse
namespace DiscontinuousFunctionalDifferentialEquationsFoundationCanonicalLaneLean

structure AveragingMethodPackage {S : FunctionalDifferentialEquationState} {D : DelayDifferentialEquation S} {R : RazumikhinStabilityPackage D} (L : LyapunovKrasovskiiPackage R) where
  averagedEquation : DelayDifferentialEquation S
  approximationError : Prop
  averagingValidity : Prop
  approximationErrorClosed : approximationError
  averagingValidityClosed : averagingValidity

structure AveragingMethodEvidence {S : FunctionalDifferentialEquationState} {D : DelayDifferentialEquation S} {R : RazumikhinStabilityPackage D} {L : LyapunovKrasovskiiPackage R} (A : AveragingMethodPackage L) where
  approximationErrorClosed : A.approximationError
  averagingValidityClosed : A.averagingValidity

def AveragingMethodClosed {S : FunctionalDifferentialEquationState} {D : DelayDifferentialEquation S} {R : RazumikhinStabilityPackage D} {L : LyapunovKrasovskiiPackage R} (A : AveragingMethodPackage L) : Prop := A.approximationError ∧ A.averagingValidity

theorem averaging_method_closed_from_evidence {S : FunctionalDifferentialEquationState} {D : DelayDifferentialEquation S} {R : RazumikhinStabilityPackage D} {L : LyapunovKrasovskiiPackage R} (A : AveragingMethodPackage L) (E : AveragingMethodEvidence A) : AveragingMethodClosed A := by
  exact And.intro E.approximationErrorClosed E.averagingValidityClosed

end DiscontinuousFunctionalDifferentialEquationsFoundationCanonicalLaneLean
end HautevilleHouse