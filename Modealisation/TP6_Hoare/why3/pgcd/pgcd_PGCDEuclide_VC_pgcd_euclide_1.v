(* This file is generated by Why3's Coq driver *)
(* Beware! Only edit allowed sections below    *)
Require Import BuiltIn.
Require BuiltIn.
Require int.Int.

(* Why3 assumption *)
Inductive ref (a:Type) :=
  | mk_ref : a -> ref a.
Axiom ref_WhyType : forall (a:Type) {a_WT:WhyType a}, WhyType (ref a).
Existing Instance ref_WhyType.
Arguments mk_ref {a}.

(* Why3 assumption *)
Definition contents {a:Type} {a_WT:WhyType a} (v:ref a) : a :=
  match v with
  | mk_ref x => x
  end.

Parameter pgcd: Z -> Z -> Z.

Parameter a: Z.

Parameter b: Z.

Axiom H : (0%Z < a)%Z.

Axiom H1 : (0%Z < b)%Z.

Parameter bp: Z.

Parameter ap: Z.

Axiom H2 : ((pgcd ap bp) = (pgcd a b)).

Axiom H3 : ~ (ap = bp).

Axiom H4 : (ap <= bp)%Z.

Parameter bp1: Z.

Axiom H5 : (bp1 = (bp - ap)%Z).

(* Why3 goal *)
Theorem VC_pgcd_euclide :
  (0%Z <= (bp + ap)%Z)%Z /\ ((bp1 + ap)%Z < (bp + ap)%Z)%Z.
Proof.


Qed.
