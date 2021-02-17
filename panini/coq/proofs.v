Require Export syntax.
Require Export auxiliaryfunctions.
Require Export standardauxiliary.
Require Export config.
Require Export dynamicsemantics.

Lemma lemma1 : forall Top Main main idn0 idn idn' des fs procs Q Sr C F I Q' Sr' C' F' I' A' K CT,
	In (cap_decl Top [ ] Top [ ] (dsgn_decl [ ] [ ]) [ ] [ ]) CT ->
	In (cap_decl Main [ ] Top [ ] des fs procs) CT ->
	construct_main (inst_decl (Main) main) idn0 K ->
	In (Sigma idn Q Sr (C, F) I) K ->
	In (Sigma idn' Q' Sr' (C', F') I') K ->
	intersect Sr Sr' = A' ->
	A' = nil.
Proof.
	intros.
	inversion H1. inversion H7. 
	assert (Sr1 = Sr). apply equal_store. rewrite -> H31 in H25.
	rewrite <- H4. rewrite -> H25. simpl. reflexivity.
	Qed.

 (* This lemma states the Panini action's mover properties. It is lemma 2 from the paper. *)
Lemma lemma2 : forall a a' tr l p' idn idn' tr1 tr2 K K1' K2' K'',
	adjacent_act a a' ->
	neighbors_act a a' ->
	instance_of_cap a = idn ->
	instance_of_cap a' = idn' ->
	step K a K1'  ->
	step K1' a' K'' ->
	step K a' K2'  ->
	step K2' a K'' ->
	tr = (app tr1 (app [a ; a'] tr2)) ->
	is_subset [a ; a'] tr true ->
	In a tr  ->
	In a' tr  ->
	((a = (rd_act idn l) \/ a = (wr_act idn l)) /\ lipton_reorder (app tr1 (app [a ; a'] tr2)) (app tr1 (app [a' ; a] tr2))) \/
	(a' =  (res_act idn idn' p' l)  /\ lipton_reorder (app tr1 (app [a ; a'] tr2)) (app tr1 (app [a' ; a] tr2))) \/
	(a' = (inv_act idn idn' p' l) /\ lipton_reorder (app tr1 (app [a ; a'] tr2)) (app tr1 (app [a ; a'] tr2))).
Proof.
	intros.
	left.
	split.
	left. apply equal_act.
	apply lipton_reorder1. 
	apply divide_non_empty_trace.
	apply non_empty_tr'2 with tr2 [a;a']. reflexivity.
	apply non_empty_tr1 with tr2. reflexivity.
	apply non_empty_tr''2. reflexivity.
	apply right with idn idn' a' K K1' K2' K''.
	apply neighbors with tr idn idn'. assumption. assumption.
	apply adj_act with tr. assumption. assumption. assumption. assumption. assumption. assumption.
	assumption. split. assumption. assumption. split. assumption. assumption.
	Qed.

(* This theorem states sharing of unresolved future location l between local stores S1 and S1' of 
capsule instance configurations sigma' and sigma''. Lemma 3 from the paper. *)
Lemma lemma3 : forall l l' a a' tr v Top des fs procs idn0 idn idn' Main main Q Q' Sr Sr' C C' F F' I I' A K K' CT,
	In (cap_decl Top [ ] Top [ ] (dsgn_decl [ ] [ ]) [ ] [ ]) CT ->
	In (cap_decl Main [ ] Top [ ] des fs procs) CT ->
	construct_main (inst_decl (Main) main) idn0 K ->
	In (Sigma idn Q Sr (C, F) I) K ->
	In (Sigma idn' Q' Sr' (C', F') I') K ->
	multi K tr K' ->
	A = (remove_loc (trans_exp) l' (intersect Sr Sr')) ->
	(store_lookup l A) = v ->
	unres_value v ->
	In a tr ->
	In a' tr ->
	instance_of_cap a = idn ->
	instance_of_cap a' = idn' ->
	A = nil \/ ((In a [rd_act idn l ; wr_act idn l]) /\ (In a' [rd_act idn' l ; wr_act idn' l])) /\ 
	((happens_before a a') \/ (happens_before a' a)).
Proof.
	intros.
	left.
	apply lemma1 with Top Main main idn0 idn idn' des fs procs Q Sr C F I Q' Sr' C' F' I' K CT.
	apply H.
	apply H0.
	assumption.
	assumption. assumption. subst.
	inversion H1. inversion H10. assert (Sr1 = Sr). apply equal_store. rewrite -> H34 in H28.
	rewrite -> H28. simpl. reflexivity.
	Qed.

(* This theorem states sparse interference in Panini where interference points associated with expression in the body of procedure 
and interference points associated with proc declaration is the set of all interference points in program Pr.
Theorem 5 from the paper. *)
Theorem sparse_interference : forall alpha tr tr' tr'' a n default a' l l' p q e e' v i x x' T T' idn' idn idn'' idn''' C C' C'' im im' des fs procs 
	F Q Q' I I' F' F'' F''' Sr Sr' Sr'' Sr''' K K'  CT,
	In (cap_decl C' im C'' im' des fs procs) CT ->
	proc_body C' p (proc_decl T' p (form_decl T x') e') ->
	multi ((Sigma idn ((res_exp l' (let_exp x (inv_exp i p v alpha) e) idn'' q) :: Q) Sr (C, F) I) ::
	(Sigma idn' Q' Sr' (C', F') I') :: K) tr 
	((Sigma idn (([x:= (loc_exp l)]e)::Q) Sr'' (C, F'') I') ::
	(Sigma idn' (app Q' [(res_exp l ([x' := v]e') idn p)]) Sr''' (C', F''') I') :: K') ->
	labels (let_exp x (inv_exp i p v alpha) e) = (alpha :: nil) ->
	tr = app [inv_act idn idn' p l] (app tr' [(res_act idn'' idn q l')]) ->
	lemma2_conclusion ->
	instance_of_cap a = idn''' ->
	instance_of_cap a' = idn''' ->
	idn''' <> idn ->
	lipton_reorder (app [inv_act idn idn' p l] (app tr' [(res_act idn'' idn q l')])) tr'' ->
	In (inv_act idn idn' p l) tr'' ->
	In a tr'' ->
	trace_lookup O tr'' default = (inv_act idn idn' p l) ->
	trace_lookup n tr'' default = a ->
	right_of (inv_act idn idn' p l) a tr''.
Proof.
	intros.
	destruct H8. assert (tr1 = (inv_act idn idn' p l :: nil)). apply equal_trace.
	subst. apply right_negh with O n default. assumption.
	assumption. assumption. reflexivity. destruct n. apply greater_than_O.
	apply greater_than_O. subst. apply right_negh with O n default. assumption.
	assumption. assumption. reflexivity. destruct n. apply greater_than_O.
	apply greater_than_O. subst. apply right_negh with O n default. assumption.
	assumption. assumption. reflexivity. destruct n. apply greater_than_O.
	apply greater_than_O. subst. apply right_negh with O n default. assumption.
	assumption. assumption. reflexivity. destruct n. apply greater_than_O.
	apply greater_than_O.
	Qed. 

Lemma lemma4 : forall Top Main main des fs procs a a' l tr idn0 idn idn' Q Q' Sr Sr' C C' F F' I I' K K' CT,
	In (cap_decl Top [ ] Top [ ] (dsgn_decl [ ] [ ]) [ ] [ ]) CT ->
	In (cap_decl Main [ ] Top [ ] des fs procs) CT ->
	construct_main (inst_decl (Main) main) idn0 K ->
	In (Sigma idn Q Sr (C, F) I) K ->
	In (Sigma idn' Q' Sr' (C', F') I') K ->
	multi K tr K' ->
	In a tr ->
	In a' tr ->
	instance_of_cap a = idn ->
	instance_of_cap a' = idn' ->
	lemma3_conclusion ->
	(a = rd_act idn l) \/ (a = wr_act idn l) ->
	intersect_reach (reach l (app Sr Sr')) (reach l Sr) (reach l Sr).
Proof.
	intros.
	apply intersect_reach1 with Sr'. reflexivity. split.
	Qed.

(* This theorem states cognizant interference in Panini. Theorem 6 from paper *)
Theorem cognizant_interference : forall l l' x x' i e e' v v' a a' a'' p q alpha tr tr_x tr'' tr''' tr'''' C C' T' T
	Top des fs procs Main main idn idn' idn0 idn'' Q Q' Sr Sr' Sr'' Sr''' F F' F'' F''' I I' K K1 K' CT,
	In (cap_decl Top [] Top [] (dsgn_decl [] []) [] []) CT ->
	In (cap_decl Main [] Top [] des fs procs) CT ->
	construct_main (inst_decl (Main) main) idn0 K1 ->
	In (Sigma idn ((res_exp l' (let_exp x (inv_exp i p v alpha) e) idn'' q) :: Q) Sr (C, F) I) K1 ->
	In (Sigma idn' Q' Sr' (C', F') I') K1 ->
	proc_body C' p (proc_decl T' p (form_decl T x') e') ->
	multi ((Sigma idn ((res_exp l' (let_exp x (inv_exp i p v alpha) e) idn'' q) :: Q) Sr (C, F) I) ::
	(Sigma idn' Q' Sr' (C', F') I') :: K) tr 
	((Sigma idn (v' ::Q) Sr'' (C, F'') I') ::
	(Sigma idn' (app Q' [(res_exp l ([x' := v]e') idn p)]) Sr''' (C', F''') I') :: K') ->
	labels ((let_exp x ( inv_exp i p v alpha) e) ) = (alpha :: nil) ->
	lemma3_conclusion ->
	lemma4_conclusion ->
	tr = app [inv_act idn idn' p l] (app tr_x [res_act idn'' idn q l']) ->
	divide tr_x tr'' tr''' tr'''' ->
	lipton_reorder (app [inv_act idn idn' p l] (app tr_x [res_act idn'' idn q l']))
	(app [inv_act idn idn' p l] (app (app tr'' tr''') (app [res_act idn'' idn q l'] tr''''))) ->
	In a tr_x ->
	In a' tr_x ->
	In a'' tr_x ->
	(instance_of_cap a' = idn') -> 
	(instance_of_cap a = idn) ->
	(~ instance_of_cap a'' = idn) /\ (~ instance_of_cap a'' = idn') ->
	(In a' tr'') /\ (In a tr''') /\ In a'' tr''''.
 Proof.
	intros.
	destruct H10. split. subst. assumption.
	split. subst. assumption. subst. assumption.
	assert (tr0 = (a :: a' :: a'' :: nil)). apply equal_trace.
	rewrite -> H20 in H11. assert ((a' :: nil) = tr2). apply equal_trace.
	rewrite <- H21 in H11. assert ((a :: nil) = tr1). apply equal_trace.
	rewrite <- H22 in H11. assert ((a'' :: nil) = tr3). apply equal_trace.
	rewrite <- H23 in H11. subst. auto. simpl. split. left. reflexivity.
	split. left. reflexivity. left. reflexivity.
	Qed.