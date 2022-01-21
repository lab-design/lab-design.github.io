Require Export syntax.
Require Export standardauxiliary.
Require Export config.
Require Export staticsemantics.
Require Export dynamicsemantics.

(* Store well typed *)

(* We can say that a store [S1] is _well typed_ with respect a
   store typing [Pi] if the expression at each location [l] in [S1] has the
   type at location [l] in [Pi]. *)
Definition store_well_typed (Pi:store_ty_env) (S1:store) :=
length Pi = length S1 /\
(forall l, l < length S1 -> 
has_type empty Pi  (store_lookup l S1)  (var_ty (store_Tlookup l Pi))).

(* This hypothesis states that two type are same *)
Hypothesis equal_ty : forall (T T' : ty), T = T'.

Lemma store_weakening : forall Gamma Pi Pi' e T,
	extends Pi' Pi ->
	has_type Gamma Pi e T ->
	has_type Gamma Pi' e T.
Proof with eauto.
	intros. induction H0; eauto.
	inversion H0.
	(* Proc Invoc Exp *)
	- apply T_proc_inv with x C T e'.
	assumption. assumption. apply IHhas_type.
	assumption.
	(* Self Proc Invoc Exp *)
	- apply T_self_inv with x e C T. assumption.
	assumption. apply IHhas_type. assumption.
	(* Super Proc Invoc Exp *)
	- apply T_super_inv with self C C' im im' des fs procs x e T CT. 
  assumption. assumption. assumption. assumption. 
  apply IHhas_type. assumption.
	(* Resolve Exp *)
	- apply T_res. apply length_extends with Pi. assumption.
  assumption. apply IHhas_type1. assumption. apply T_loc.
  apply length_extends with Pi. assumption. assumption.
	(* State Assignment Exp *)
	- apply T_st_asgn with fs C. assumption.
	assumption. apply IHhas_type. assumption.
	(* State Read Exp *)
	- apply T_st_read with fs C. assumption. 
  assumption. assumption.
	(* Reference Exp *)
	- apply T_ref. apply IHhas_type. auto.
	(* Dereference Exp *)
	- apply T_deref. apply IHhas_type. assumption.
	(* Reference Assignment Exp *)
	- apply T_ref_asgn. apply IHhas_type1. 
  assumption. auto.
	(* Let Exp *)
	- apply T_let with T. apply IHhas_type1. 
  assumption. apply IHhas_type2. auto.
	(* Var Exp *)
  - apply T_var. assumption.
	(* Loc Exp *)
	-  erewrite <- extends_lookup... 
  apply T_loc. eapply length_extends...
	(* Transferred Exp *)
	- apply T_trans_val. assumption.
	(* Unresolved Exp *)
	- apply T_unres_val. assumption.
	(* Unit Exp *)
	- apply T_unit.
	(* Owe Exp *)
	- apply T_owe.
	(* Val Exp *)
	- apply T_val.
  Qed.

(* We can use the [store_weakening] lemma to prove that if a store is
   well typed with respect to a store typing, then the store extended
   with a new expression [e] will still be well typed with respect to the
   store typing extended with [e]'s type. *)
Lemma store_well_typed_snoc : forall Pi Sr e T1,
	store_well_typed Pi Sr  ->
	has_type empty Pi e (var_ty T1)  ->
	store_well_typed (snoc Pi T1) (snoc Sr e) .
Proof with auto.
	intros.
	unfold store_well_typed in *.
	inversion H as [Hlen Hmatch]; clear H.
	rewrite !length_snoc.
	split...
	- (* types match. *)
	intros l Hl.
	unfold store_lookup, store_Tlookup.
	apply le_lt_eq_dec in Hl; inversion Hl as [Hlt | Heq].
	+ (* l < length st. *)
	apply lt_S_n in Hlt.
	rewrite <- !nth_lt_snoc...
	apply store_weakening with Pi. 
  apply extends_snoc.
	apply Hmatch...
	rewrite Hlen...
	+ (* l = length st. *)
	inversion Heq.
	rewrite nth_eq_snoc. 
	rewrite <- Hlen. rewrite nth_eq_snoc...
	apply store_weakening with Pi... 
  apply extends_snoc.
	Qed.

Axiom reach_remove_well_typed : forall Pi Sr Sr0 l0 l'',
  store_well_typed Pi Sr ->
  store_well_typed Pi (reach_remove l0 Sr (reach l'' Sr0)).

(* This lemma says that replacing the contents of a cell in the store 
with a new value of appropriate type does not change the overall type of the store. *)
Lemma assign_pres_store_typing : forall Sr l e Pi,
	l < length Sr ->
	store_well_typed Pi Sr ->
	has_type empty Pi e (var_ty (store_Tlookup l Pi)) ->
	store_well_typed Pi (replace l e Sr) .
Proof with auto.
	intros. inversion  H0; subst.
	split. rewrite length_replace...
	intros. destruct (beq_nat l0 l) eqn: H4'.
	apply beq_nat_true in H4'; subst.
	rewrite lookup_replace_eq. assumption.
	assumption. 
	apply beq_nat_false in H4'. 
	rewrite lookup_replace_neq...
	rewrite length_replace in H4.
	apply H0...
Qed.

(* This lemma states that Gamma' assigns the same type as 
Gamma to all the variables that appears free in e *)
Lemma context_invariance : forall Gamma Gamma' Pi e T,
	has_type Gamma  Pi e  T ->
	(forall x, appears_free_in x e -> Gamma x = Gamma' x) ->
	has_type Gamma' Pi e T.
Proof with eauto.
	intros.
	generalize dependent Gamma'.
	induction H; intros...
	(* T_inv *)
	- apply T_proc_inv with x C T e'.
  rewrite <- H2. assumption.
  apply afi_inv2. assumption.
  apply IHhas_type. intros.
  rewrite <- H2. reflexivity.
  apply afi_inv1. assumption.
	(* T_self_inv *)
	- apply T_self_inv with x e C T.
  rewrite <- H2. assumption.
  apply afi_self_inv2. assumption.
  apply IHhas_type. intros.
  rewrite <- H2. reflexivity.
 apply afi_self_inv1. assumption.
	(* T_superProcInvoc *)
	- apply T_super_inv with self C C' im im' des fs procs x e T CT.
  rewrite <- H4. assumption.
  apply afi_super_inv3.
  assumption. assumption. 
 rewrite <- H4. assumption.
  apply afi_super_inv2. apply IHhas_type. 
  intros. rewrite <- H4.
  reflexivity. apply afi_super_inv1. assumption.
	(* T_resolve *)
	- apply T_res. assumption. 
  apply IHhas_type1; intros. 
  rewrite <- H2. reflexivity.
  apply afi_res1. assumption. 
  apply IHhas_type2. intros. rewrite <- H2.
  reflexivity. apply afi_res2. assumption.
	(* T_st_asgn *)
	- apply T_st_asgn with fs C. rewrite <- H2. 
  assumption. apply afi_st_asgn2.
  assumption. apply IHhas_type; intros. 
  rewrite <- H2. reflexivity. apply afi_st_asgn1.
  apply not_equal_id. assumption.
	(* T_st_read *)
	- apply T_st_read with fs C. rewrite <- H2. 
  assumption. apply afi_st_read2.
  assumption. rewrite <- H2. 
  assumption. apply afi_st_read1.
	(* T_ref *)
	- apply T_ref. apply IHhas_type; intros.
  rewrite <- H0. reflexivity. 
  apply afi_ref. assumption.
	(* T_deref *)
	- apply T_deref. apply IHhas_type; intros.
  rewrite <- H0. reflexivity. 
 apply afi_deref. assumption.
	(* T_refAsgn *)
	- apply T_ref_asgn. apply IHhas_type1; intros.
  rewrite <- H1. reflexivity.
	apply afi_ref_asgn1. assumption.
  apply IHhas_type2; intros.
  rewrite <- H1. reflexivity.
	apply afi_ref_asgn2. assumption.
  (* T_let *)
	- apply T_let with T. apply IHhas_type1; intros. 
  rewrite <- H1. reflexivity. 
	apply afi_let1. assumption. apply IHhas_type2;intros. 
  unfold extend. destruct (eq_id_dec x x0)... 
	rewrite <- H1. reflexivity. apply afi_let2. 
  assumption. assumption.
	(* T_var *)
	- apply T_var. rewrite <- H0. 
  assumption. apply afi_var.
	(* T_location *)
	- apply T_loc. assumption.
	(* T_transferredValue *)
	- apply T_trans_val. assumption.
	(* T_unresolvedValue *)
	- apply T_unres_val. assumption.
	(* T_unit *)
	- apply T_unit.
	(* T_owe *)
	- apply T_owe.
	(* T_value *)
	- apply T_val.
  Qed.

(* If a variable [x] appears free in an expression [e],
   and if we know [e] is well typed in context [Gamma], then it must
   be the case that [Gamma] assigns a type to [x]. *)
Lemma free_in_context : forall x e T Gamma Pi,
	appears_free_in x e ->
	has_type Gamma Pi e T ->
	exists T', Gamma x = Some T'.
Proof with eauto.
	intros. generalize dependent Gamma.
	generalize dependent T.
	intros.
	inversion H0. subst.
	Admitted.

(** SUBSTITUTION PRESERVE TYPING **)

(* Substitution preserve typing says that suppose we
   have an expression [e] with a free variable [x], and suppose we've been
   able to assign a type [T] to [e] under the assumption that [x] has
   some type [T1].  Also, suppose that we have some other term [e'] and
   that we've shown that [e'] has type [T1].  Then, since [e'] satisfies
   the assumption we made about [x] when typing [e], we should be
   able to substitute [e'] for each of the occurrences of [x] in [e]
   and obtain a new expression that still has type [T]. *)
Lemma substitution_preserves_typing : forall x e T' e' T Gamma Pi ,
	has_type empty Pi e' (var_ty T')  ->
	has_type (extend Gamma x (var_ty T')) Pi e (var_ty T) -> 
	has_type Gamma Pi ([x:=e']e) (var_ty T).
Proof with eauto.
	intros x e T' e' T Gamma Pi Hs Ht.
	generalize dependent Gamma.
  generalize dependent T.
	induction e; intros T Gamma H1; 
  simpl; inversion H1; subst ; simpl...
	(* Proc Invoc Exp *)
	- apply T_proc_inv with x0 C T0 e'0. 
  rewrite extend_neq in H5. assumption.
  apply not_equal_id. assumption. 
  apply IHe. assumption.
	(* Self Proc Invoc Exp *)
	- apply T_self_inv with x0 e0 C T0. 
  rewrite extend_neq in H6. assumption.
  apply not_equal_id. assumption. 
  apply IHe. assumption.
	(* Super Proc Invoc Exp *)
	- apply T_super_inv with self C C' im 
  im' des fs procs x0 e0 T0 CT.
  rewrite extend_neq in H4. assumption. 
  apply not_equal_id.
	assumption. assumption. 
  rewrite extend_neq in H9. assumption. 
  apply not_equal_id.
	apply IHe. assumption.
	(* State Read Exp *)
	- apply T_st_read with fs C. unfold extend in H5.
  rename i into y. subst. rewrite (neq_id) in H5.
	assumption. apply not_equal_id. assumption. 
  unfold extend in H7. rename i into y. subst.
  rewrite (neq_id) in H7. assumption. 
  apply not_equal_id.
	(* State Assignment Exp *)
	- apply T_st_asgn with fs C. unfold extend in H6. 
  rename i into y. subst. 
  rewrite (neq_id) in H6. assumption.
	apply not_equal_id. assumption.
  apply IHe. assumption.
	(* Reference Exp *)
	- apply T_ref. apply IHe. assumption.
	(* Dereference Exp *)
	- apply T_deref. apply IHe. assumption.
	(* Reference Assignment Exp *)
	- apply T_ref_asgn. apply IHe1. 
  assumption. apply IHe2. assumption.
	(* Let Expression *)
	- apply T_let with T0. apply IHe1. 
  assumption. destruct (eq_id_dec x i).
  subst. eapply context_invariance...
	intros. rewrite extend_shadow. 
  reflexivity. apply IHe2. 
  apply ex_falso_quodlibet.
  destruct n. apply equal_id.
	(* Val Exp *)
	- apply T_val.
  (* Var Exp *)
	- rename i into y. destruct (eq_id_dec x y). subst.
	rewrite extend_eq in H3. 
  inversion H3; subst. eapply context_invariance...
  intros x Hcontra. 
	destruct (free_in_context x e' (var_ty T) 
  empty Pi Hcontra) as [T1 HT']...
	inversion HT'. apply T_var. 
  rewrite extend_neq in H3...
	(* Unit Exp *)
	- apply T_unit.
	(* Location Exp *)
	- apply T_loc. assumption.
	(* Resolve Exp *)
	- apply T_res. assumption. 
  apply IHe. assumption. apply T_loc.
	assumption.
	(* Owe Exp *)
	- apply T_owe.
	(* Transferred Exp *)
	-  apply T_trans_val. assumption.
	(* Unresolved Exp *)
	- apply T_unres_val. assumption.
	Qed.

Fixpoint labels (e : exp) : list lbl  :=
	match e with 
		| (var_exp x) => nil
		| (st_read_exp self f) => nil
		| (inv_exp i p e alpha) => (alpha :: (labels e))
		| (self_inv_exp self p e) => (labels e)
		| (super_inv_exp super p e) => (labels e)
		| (st_asgn_exp self f e) => (labels e)
		| (ref_exp e) => (labels e)
		| (deref_exp e) => (labels e)
		| (ref_asgn_exp e1 e2) => (app (labels e1) (labels e2))
		| (let_exp x e1 e2) => (app (labels e1) (labels e2))
		| (val_exp x) => nil
		| (loc_exp n) => nil
		| (res_exp l e iden p) => (labels e)
		| unit_exp => nil
		| owe_exp => nil
		| trans_exp => nil
		| unres_exp => nil
	end.

(* instance_of_cap returns the capsule identifier of an action a.*)
Fixpoint instance_of_cap (a:act) : id :=
	match a with
		| (rd_act idn l) => idn 
		| (wr_act idn l)  => idn
		| (inv_act idn idn' p l) => idn
		| (res_act idn idn' p l) => idn
		| (lcl_act idn) => idn
	end.

(* multi denotes the multi step taken by a global configuration *)
Inductive multi : glb_conf -> list act -> glb_conf -> Prop :=
 	| multi_step : forall a tr idn e Q Sr C f l F I e' Q' Sr' F' e'' Q'' Sr'' F'' K K' K'',
		step (Sigma idn (e::Q) Sr (C , ((f,l) :: F)) I :: K) a 
		(Sigma idn (e'::Q') Sr' (C , ((f,l) :: F')) I :: K') ->
		multi (Sigma idn (e'::Q') Sr' (C , ((f,l) :: F')) I :: K') tr 
			(Sigma idn (e''::Q'') Sr'' (C , ((f,l) :: F'')) I :: K'') ->
		multi (Sigma idn (e::Q) Sr (C , ((f,l) :: F)) I :: K) (a::tr) 
			(Sigma idn (e''::Q'') Sr'' (C , ((f,l) :: F'')) I :: K'')
 	| multi_refl : forall a idn e Q Sr C f l F I K,
		step (Sigma idn (e::Q) Sr (C , ((f,l) :: F)) I :: K) a 
		(Sigma idn (e::Q) Sr (C , ((f,l) :: F)) I :: K) ->
			multi (Sigma idn (e::Q) Sr (C , ((f,l) :: F)) I :: K) (a :: nil) 
		(Sigma idn (e::Q) Sr (C , ((f,l) :: F)) I :: K).

(* A global configuration in normal form is a configuration that cannot make progress *)
 Definition normal_form (K : glb_conf) : Prop :=
 	~ exists K',
 	exists a, step K a K'.

Definition stuck (K : glb_conf) (e : exp) : Prop :=
 	normal_form K /\ ~ (value e).

(* Lemma for well-formedness of variable subtyping. *)
Lemma var_subtype_wellformed : forall T T',
	var_subtype T T' ->
	wellformed T /\ wellformed T'.
Proof with eauto.
	intros T T' Hsub.
	induction Hsub;
	intros; try (destruct IHHsub1; destruct IHHsub2)...
	Qed.

(* Lemma for well-formedness of capsule subtyping. *)
Lemma cap_subtype_wellformed : forall C C',
	cap_subtype C C' ->
	wellformed C /\ wellformed C'.
Proof with eauto.
	intros C C' Hsub.
	induction Hsub;
	intros; try (destruct IHHsub1; destruct IHHsub2)...
Qed.

(* adjacent_act represents two adjacent actions that means they 
follow immediately after the other. *)
Inductive adjacent_act (a1 : act) (a2 : act) : Prop :=
	| adj_act : forall t,
		In a1 t ->
		In a2 t ->
		is_subset [a1; a2] t true -> 
		adjacent_act a1 a2.


(* This represents definiton 2 in the paper which states that
 two adjacent actions a1 and a2 in trace tr are neighbors 
 if they are performed by different capsule instance C1 and C2.
 Definition 2 from the paper. *)
Inductive neighbors_act (a1 : act) (a2 : act) : Prop :=
	| neighbors : forall t C1 C2,
		In a1 t  ->
		In a2 t ->
		adjacent_act a1 a2 ->
		instance_of_cap a1 = C1 ->
		instance_of_cap a2 = C2 ->
		neighbors_act a1 a2.

(* commuting_act states that actions a1 and a2 commute if swapping
 them results in same final state. Definition 3 from the paper. *)
Inductive commuting_act : act -> act -> Prop :=
	| commuting : forall idn idn' a a' K K' K'',
		neighbors_act a a' ->
		instance_of_cap a = idn ->
		instance_of_cap a' = idn' ->
		step K a K' /\ step K' a' K'' ->
		step K a' K' /\ step K' a K'' ->
		commuting_act a a'.

(* conflicting_act states that actions a1 and a2 conflict if swapping 
them does not results in same final state. Definition 3 from the paper. *)
Inductive conflicting_act : act -> act -> Prop :=
	| conflicting : forall a a' idn idn',
		neighbors_act a a' ->
		instance_of_cap a = idn ->
		instance_of_cap a' = idn' ->
		~ commuting_act a a' ->
		conflicting_act a a'.

(* right_mover_act states that actions a1 and a2 are neighbour actions 
and if a1 is a right mover then swapping them results in same final state. 
Definition 4 from paper. *)
Inductive right_mover_act : act -> Prop :=
	| right : forall idn idn' a a' K K1' K2' K'',
		neighbors_act a a' ->
		instance_of_cap a = idn ->
		instance_of_cap a' = idn' ->
		step K a K1' /\ step K1' a' K'' ->
		step K a' K2' /\ step K2' a K'' ->
		right_mover_act a.

(* left_mover_act states that actions a1 and a2 are neighbour actions 
 and if a2 is a left mover then swapping them results in same final state. 
 Definition 4 from paper. *)
Inductive left_mover_act : act -> Prop :=
	| left : forall idn idn' a a' K K1' K2' K'',
		neighbors_act a a' ->
		instance_of_cap a =idn ->
		instance_of_cap a' = idn' ->
		step K a K1' /\ step K1' a' K'' ->
		step K a' K2' /\ step K2' a K'' ->
		left_mover_act a'.

Inductive non_mover_act : act -> Prop :=
	| non1 : forall a a' idn idn',
		neighbors_act a a' ->
		instance_of_cap a  = idn ->
		instance_of_cap a' = idn' ->
		~ left_mover_act a ->
		~ right_mover_act a ->
		non_mover_act a
	| non2 : forall a a' idn idn',
		neighbors_act a a' ->
		instance_of_cap a = idn ->
		instance_of_cap a' = idn' ->
		~ left_mover_act a' ->
		~ right_mover_act a' ->
		non_mover_act a' .

(* happens_before represents happes before relation between 
 the actions in Panini. *)
Inductive happens_before : act -> act -> Prop :=
	| res_before_read : forall idn idn' l p,
		happens_before (res_act idn idn' p l) (rd_act idn' l)
	| res_before_write : forall idn idn' l p,
		happens_before (res_act idn idn' p l) (wr_act idn' l).

(* Element at any position n in the trace. We need to assume 
 a default trace since it does not matter if position is some nat 
 and trace is empty. *)
 Fixpoint trace_lookup (n:nat) (l: trace) (default : act) : act :=
     match n, l with
       | O, x :: l' => x
       | O, other => default
       | S m, nil => default
       | S m, x :: t => nth m t default
     end.

Inductive is_subset_upto_n : trace -> trace -> nat -> nat -> bool -> Prop :=
 	| non_empty_tr1 : forall tr'2 tr''2 tr1 tr2,
		tr2 = tr'2 ++ tr1 ++ tr''2 ->
    is_subset_upto_n tr1 tr2 (S (length tr'2)) (length tr'2 + length tr1) true
   | non_empty_tr'2 : forall tr'2 tr''2 tr1 tr2 ,
		tr2 = tr'2 ++ tr1 ++ tr''2 ->
    is_subset_upto_n tr'2 tr2 O (length tr'2) true
  	| non_empty_tr''2 : forall tr'2 tr''2 tr1 tr2,
		tr2 = tr'2 ++ tr1 ++ tr''2 ->
    is_subset_upto_n tr''2 tr2 (S (length tr1)) (length tr'2 + length tr1 + length tr''2) true.


Inductive divide : trace -> trace -> trace -> trace -> Prop :=
	| divide_nil_trace : forall tr,
		tr = nil ->
		divide tr nil nil nil 
	| divide_non_empty_trace : forall tr tr1 tr2 tr3,
		is_subset_upto_n tr1 tr O (length tr1) true ->
		is_subset_upto_n tr2 tr (S(length tr1)) (length tr1 + length tr2) true->
		is_subset_upto_n tr3 tr (S(length tr2)) (length tr1 + length tr2 + length tr3) true ->
		divide tr tr2 tr1 tr3.

Inductive lipton_reorder (tr : trace) : trace -> Prop :=
	| lipton_reorder1 : forall a a' tr1 tr2,
		divide tr [a;a'] tr1 tr2 ->
		right_mover_act a ->
		lipton_reorder tr (app tr1 (app [a' ; a] tr2))
	| lipton_reorder2 : forall a a' tr1 tr2,
		divide tr [a;a'] tr1 tr2 ->
		left_mover_act a' ->
		lipton_reorder tr (app tr1 (app [a' ; a] tr2))
	| lipton_reorder3 : forall a a' tr1 tr2,
		divide tr [a;a'] tr1 tr2 ->
		non_mover_act a' ->
		non_mover_act a ->
		lipton_reorder tr (app tr1 (app [a ; a'] tr2))
	| lipton_reorder4 : forall a a' a'' tr1 tr2,
		divide tr [a;a';a''] tr1 tr2 ->
		left_mover_act a' /\ right_mover_act a' ->
		lipton_reorder tr (app tr1 (app tr1 (app [a' ; a ; a''] tr2))) ->
		lipton_reorder tr (app tr1 (app tr1 (app [a' ; a'' ; a] tr2))).

(* a2 is the present somewhere to the right of a1. *)
Inductive right_of (a1 : act) (a2 : act) (tr : trace)  : Prop :=
	| right_negh : forall i n default,
		In a1 tr ->
		In a2 tr ->
		trace_lookup i tr default = a1 ->
		trace_lookup n tr default = a2 ->
		greater_than n i true ->
		right_of a1 a2 tr.


Definition lemma2_conclusion : Prop := forall l a a' idn idn' p' tr1 tr2, 
	((a = (rd_act idn l) \/ a = (wr_act idn l)) /\ lipton_reorder (app tr1 (app [a ; a'] tr2)) (app tr1 (app [a' ; a] tr2))) \/
	(a' =  (res_act idn idn' p' l)  /\ lipton_reorder (app tr1 (app [a ; a'] tr2)) (app tr1 (app [a' ; a] tr2))) \/
	(a' = (inv_act idn idn' p' l) /\ lipton_reorder (app tr1 (app [a ; a'] tr2)) (app tr1 (app [a ; a'] tr2))).

Definition lemma3_conclusion : Prop := forall A idn idn' a l a' Sr Sr' l',
	A = (remove_loc (trans_exp) l' (intersect Sr Sr')) ->
	(A = nil \/ ((In a [rd_act idn l ; wr_act idn l]) /\ (In a' [rd_act idn' l ; wr_act idn' l])) /\ 
	((happens_before a a') \/ (happens_before a' a))).

Definition lemma4_conclusion : Prop := forall l Sr Sr',
	intersect_reach (reach l (app Sr Sr')) (reach l Sr) (reach l Sr).
