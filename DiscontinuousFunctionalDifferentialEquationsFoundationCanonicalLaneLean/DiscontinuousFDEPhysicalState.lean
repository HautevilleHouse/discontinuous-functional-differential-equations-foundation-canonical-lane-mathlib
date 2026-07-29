import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace DiscontinuousFDEPhysicalState

structure DiscontinuousFDEPhysicalStatePackage where
  timeDomain : Type u
  stateSpace : Type v
  jumpTimes : Set timeDomain
  jumpOperator : timeDomain → stateSpace → stateSpace
  continuousFlow : timeDomain → stateSpace → stateSpace
  initialCondition : stateSpace
  solutionExists : Prop
  uniquenessHolds : Prop
  jumpTimesClosed : Set.Finite jumpTimes
  jumpOperatorMeasurable : Measurable (fun (p : timeDomain × stateSpace) => jumpOperator p.1 p.2)
  continuousFlowContinuous : Continuous (fun (p : timeDomain × stateSpace) => continuousFlow p.1 p.2)
  initialConditionAdmissible : initialCondition ∈ stateSpace
  solutionExistsTerm : solutionExists
  uniquenessHoldsTerm : uniquenessHolds
  jumpTimesClosedTerm : jumpTimesClosed
  jumpOperatorMeasurableTerm : jumpOperatorMeasurable
  continuousFlowContinuousTerm : continuousFlowContinuous
  initialConditionAdmissibleTerm : initialConditionAdmissible

structure DiscontinuousFDEPhysicalEvidence (P : DiscontinuousFDEPhysicalStatePackage) where
  solutionExistsClosed : P.solutionExists
  uniquenessHoldsClosed : P.uniquenessHolds
  jumpTimesClosedClosed : P.jumpTimesClosed
  jumpOperatorMeasurableClosed : P.jumpOperatorMeasurable
  continuousFlowContinuousClosed : P.continuousFlowContinuous
  initialConditionAdmissibleClosed : P.initialConditionAdmissible

def DiscontinuousFDEPhysicalStateClosed (P : DiscontinuousFDEPhysicalStatePackage) : Prop :=
  P.solutionExists ∧ P.uniquenessHolds ∧ P.jumpTimesClosed ∧
  P.jumpOperatorMeasurable ∧ P.continuousFlowContinuous ∧ P.initialConditionAdmissible

theorem discontinuous_fde_physical_state_closed_from_evidence
    (P : DiscontinuousFDEPhysicalStatePackage) (E : DiscontinuousFDEPhysicalEvidence P) :
    DiscontinuousFDEPhysicalStateClosed P := by
  exact And.intro E.solutionExistsClosed
    (And.intro E.uniquenessHoldsClosed
      (And.intro E.jumpTimesClosedClosed
        (And.intro E.jumpOperatorMeasurableClosed
          (And.intro E.continuousFlowContinuousClosed E.initialConditionAdmissibleClosed))))

end DiscontinuousFDEPhysicalState
end HautevilleHouse