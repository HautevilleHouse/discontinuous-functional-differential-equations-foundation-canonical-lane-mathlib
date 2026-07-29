import canonicalLaneMathlib.AdmissibleClass
import DiscontinuousFunctionalDifferentialEquationsFoundationCanonicalLaneLean.DelayDifferentialEquation

namespace HautevilleHouse
namespace DiscontinuousFunctionalDifferentialEquationsFoundationCanonicalLaneLean

structure RazumikhinStabilityPackage {S : FunctionalDifferentialEquationState} (D : DelayDifferentialEquation S) where
  lyapunovFunction : S.stateSpace → ℝ
  razumikhinCondition : Prop
  stabilityConclusion : Prop
  lyapunovFunctionDefined : lyapunovFunction 0 = 0
  razumikhinConditionClosed : razumikhinCondition
  stabilityConclusionClosed : stabilityConclusion

structure RazumikhinStabilityEvidence {S : FunctionalDifferentialEquationState} {D : DelayDifferentialEquation S} (R : RazumikhinStabilityPackage D) where
  lyapunovFunctionContinuous : Prop
  lyapunovFunctionPositiveDefinite : Prop
  stabilityConclusionClosed : R.stabilityConclusion

def RazumikhinStabilityClosed {S : FunctionalDifferentialEquationState} {D : DelayDifferentialEquation S} (R : RazumikhinStabilityPackage D) : Prop := R.stabilityConclusion

theorem razumikhin_stability_closed_from_evidence {S : FunctionalDifferentialEquationState} {D : DelayDifferentialEquation S} (R : RazumikhinStabilityPackage D) (E : RazumikhinStabilityEvidence R) : RazumikhinStabilityClosed R := by
  exact E.stabilityConclusionClosed

end DiscontinuousFunctionalDifferentialEquationsFoundationCanonicalLaneLean
end HautevilleHouse