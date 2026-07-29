import canonicalLaneMathlib.AdmissibleClass
import HautevilleHouse.DiscontinuousFDEPhysicalState

namespace HautevilleHouse
namespace FunctionalDifferentialEquationEvolution

structure FunctionalDifferentialEquationEvolutionPackage (P : DiscontinuousFDEPhysicalState.DiscontinuousFDEPhysicalStatePackage) where
  delayFunctional : Type u
  convolutionKernel : Type v
  evolutionRule : P.stateSpace → P.stateSpace → Prop
  delayTermWellDefined : Prop
  convolutionTermWellDefined : Prop
  evolutionRuleConsistent : Prop
  delayTermWellDefinedTerm : delayTermWellDefined
  convolutionTermWellDefinedTerm : convolutionTermWellDefined
  evolutionRuleConsistentTerm : evolutionRuleConsistent

structure FunctionalDifferentialEquationEvolutionEvidence
    {P : DiscontinuousFDEPhysicalState.DiscontinuousFDEPhysicalStatePackage}
    (F : FunctionalDifferentialEquationEvolutionPackage P) where
  delayTermWellDefinedClosed : F.delayTermWellDefined
  convolutionTermWellDefinedClosed : F.convolutionTermWellDefined
  evolutionRuleConsistentClosed : F.evolutionRuleConsistent

def FunctionalDifferentialEquationEvolutionClosed
    {P : DiscontinuousFDEPhysicalState.DiscontinuousFDEPhysicalStatePackage}
    (F : FunctionalDifferentialEquationEvolutionPackage P) : Prop :=
  F.delayTermWellDefined ∧ F.convolutionTermWellDefined ∧ F.evolutionRuleConsistent

theorem functional_differential_equation_evolution_closed_from_evidence
    {P : DiscontinuousFDEPhysicalState.DiscontinuousFDEPhysicalStatePackage}
    (F : FunctionalDifferentialEquationEvolutionPackage P)
    (E : FunctionalDifferentialEquationEvolutionEvidence F) :
    FunctionalDifferentialEquationEvolutionClosed F := by
  exact And.intro E.delayTermWellDefinedClosed
    (And.intro E.convolutionTermWellDefinedClosed E.evolutionRuleConsistentClosed)

end FunctionalDifferentialEquationEvolution
end HautevilleHouse