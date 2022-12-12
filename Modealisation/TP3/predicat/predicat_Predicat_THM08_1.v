(* This file is generated by Why3's Coq driver *)
(* Beware! Only edit allowed sections below    *)
Require Import BuiltIn.
Require BuiltIn.

Axiom t : Type.
Parameter t_WhyType : WhyType t.
Existing Instance t_WhyType.

Axiom ta : Type.
Parameter ta_WhyType : WhyType ta.
Existing Instance ta_WhyType.

Axiom tb : Type.
Parameter tb_WhyType : WhyType tb.
Existing Instance tb_WhyType.

Parameter p: t -> Prop.

Parameter q: t -> Prop.

(* Why3 goal *)
Theorem THM08 :
  (forall (x:t), p x /\ q x) -> (forall (x:t), p x) /\ (forall (x:t), q x).
Proof.
firstorder.

Qed.

