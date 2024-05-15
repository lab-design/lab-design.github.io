Require Export syntax.
Require Export auxiliaryfunctions.
Require Export standardauxiliary.
Require Export config.
Require Export dynamicsemantics.

(** PROGRESS **)

(* This theorem states that either an expression takes step to another expression or it is a value *)
Theorem progress : forall e T R l'' l' R' idn idn' e'' Q'' Sr'' F'' C' I' v Q Sr C f l F I K Pi,
	has_type empty Pi e T ->
	store_well_typed Pi Sr ->
	value v /\ (unres_value v \/ trans_value v) ->
   (* Information is for proc invoc and resolve. *)
   ((reach l'' Sr = R /\ reach l' Sr = R') \/ 
   (reach l'' Sr'' = R /\ reach l' Sr'' = R')) /\
   (In (Sigma idn' (e'' :: Q'') Sr'' (C' , F'') I') K  \/ 
   ~ In (Sigma idn' (e'' :: Q'') Sr'' (C' , F'') I') K) ->
	value e \/  exists e', exists Q', exists Sr', exists F', exists a, exists K',
	step ((Sigma idn (e::Q) Sr (C , ((f, l)::F)) I)::K)   
	a 
	((Sigma idn (e'::Q') Sr' (C , ((f, l)::F')) I)::K').
Proof with eauto.
	intros.
	remember (@empty ty) as Gamma.
	generalize dependent HeqGamma.
	induction H; intros HeqGamma; subst.
	(* Proc Invoc *)
	- right. destruct IHhas_type as [Ht1p|Ht1p]... 
	exists (loc_exp l). exists Q.
	exists (reach_remove l (snoc Sr v) R). 
	exists F. exists ((inv_act idn idn' p l)).
	exists (update_conf (Sigma idn' (e'' :: Q'') Sr'' (C' , F'') I') K
	(Sigma idn' (app (e'' :: Q'') [res_exp l ([x := e]e') idn p]) 
	(reach_add l Sr'' R) (C' , F'') I')).
	apply O_proc_inv with l' l'' f R' T T'. 
	apply in_I. destruct H2. destruct H5.
	assumption. apply in_K. assert (C' = C0). 
	apply equal_id. rewrite -> H5. 
	assumption. apply equal_exp. 
	destruct H2. destruct H2. destruct H2.
	assumption. auto. 
	apply equal_store. apply in_F. auto. 
	destruct H2. destruct H2. destruct H2.
	assumption. apply equal_store. 
	apply intersect_nil_reach1. 
	apply equal_store. apply fresh_loc_l.
	assumption. destruct H1. assumption. 
	destruct H1. destruct H5. assumption. apply unres.
	assumption. apply equal_exp. apply equal_exp. 
	inversion Ht1p. exists (inv_exp i p x0 alpha).
	inversion H5. exists x1. inversion H6. exists x2. 
	inversion H7. exists x3. inversion H8.
	exists x4. inversion H9. exists x5. 
	apply O_proc_inv_cong with T' T x e'. 
	assert (C = C0). apply equal_id. rewrite -> H11. 
	assumption. assumption.
	(* Self Invoc *)
	- right. destruct IHhas_type as  [Ht1p | Ht1p]... 
	exists (([x:= e']e)). exists Q. exists Sr. exists F.
	exists((lcl_act idn)). exists K.
	apply O_self_inv with T T'. assumption. 
	assert (C = C0). apply equal_id. rewrite -> H5. 
	assumption. inversion Ht1p. exists (self_inv_exp self p x0).
	inversion H5. exists x1. inversion H6. 
	exists x2. inversion H7. exists x3.
	inversion H8. exists x4. inversion H9. 
	exists x5. apply O_self_inv_cong with T T' x e.
	assert (C = C0). apply equal_id. rewrite -> H11. 
	assumption. assumption.
	(* Super Invoc *)
	- right. destruct IHhas_type as  [Ht1p | Ht1p]... 
	exists (([x:= e']e)). exists Q. exists Sr. exists F.
	exists((lcl_act idn)). exists K. 
	apply O_super_inv with T T' C'0 im im' des fs procs CT. 
	assumption. assert (C = C0). apply equal_id. 
	rewrite -> H7. assumption. assumption.
	inversion Ht1p. exists (super_inv_exp super p x0).
	inversion H7. exists x1. inversion H8. exists x2.
	inversion H9. exists x3. inversion H10. 
	exists x4. inversion H11. exists x5. 
	apply O_super_inv_cong with T T' e x C'0 im im' des fs procs CT.
	assert (C = C0). apply equal_id. rewrite -> H13. 
	assumption. assumption. assumption.
	(* Resolve exp *)
	- right. destruct IHhas_type1 as [Ht1p|Ht1p]... 
	exists (e). exists Q. exists (reach_remove l Sr R). 
	exists F. exists (res_act idn' idn p l). 
	exists (update_conf (Sigma idn' (e'' :: Q'') Sr'' (C' , F'') I') 
	K (Sigma idn' (e'' :: Q'') (reach_add l (replace l e Sr'') R) (C' , F'') I')).
	assert (idn0 = idn). apply equal_id. rewrite -> H5. 
	assert (idn = idn'). apply equal_id. rewrite -> H6. 
	assert (l = l0). apply equal_nat. rewrite <- H7. 
	apply O_res with v l' l'' f R'. apply equal_exp. 
	apply equal_store. apply in_F. apply equal_store. 
	apply intersect_nil_reach1. apply equal_store. 
	assumption. destruct H1. assumption. apply unres. 
	destruct H1. assumption. apply equal_exp. 
	apply equal_exp. apply in_K. destruct IHhas_type2. 
	assumption. reflexivity. inversion Ht1p. 
	exists (res_exp l x idn0 p). inversion H6. exists x0. 
	inversion H7. exists x1. inversion H8. exists x2. 
	inversion H9. exists x3. inversion H10. 
	exists x4. assert (H' : l0 = l). auto. apply equal_loc. 
	rewrite -> H'. assert(idn' = idn). 
	apply equal_id. rewrite <- H12. rewrite <- H12 in H11.
	assert(idn0 = idn). apply equal_id. 
	rewrite -> H13. apply O_res_cong. assumption. 
	inversion Ht1p. exists (res_exp l x idn0 p). 
	inversion H6. exists x0. inversion H7. exists x1. 
	inversion H8. exists x2. inversion H9. exists x3. 
	inversion H10. exists x4. assert (H' : l0 = l). auto. 
	apply equal_loc. rewrite -> H'. assert(idn' = idn). 
	apply equal_id. rewrite <- H12. rewrite <- H12 in H11.
	assert(idn0 = idn). apply equal_id.
	rewrite -> H13. apply O_res_cong. assumption.
	(* State assignment *)
	- right. destruct IHhas_type as [Ht1p | Ht1p].
	assumption. reflexivity. exists e. exists Q. 
	exists (replace l e Sr). exists F. exists (wr_act idn l). 
	exists K. assert(H_f : f = f0). apply equal_id. 
	rewrite <- H_f. apply O_st_asgn. assumption. 
	inversion Ht1p. exists ((st_asgn_exp self f x)). 
	inversion H5. exists x0. inversion H6. exists x1. 
	inversion H7. exists x2. inversion H8. 
	exists x3. inversion H9. exists x4. assert(H_st : f = f0). 
	apply equal_id. rewrite <- H_st.
	apply O_st_asgn_cong. assumption.
	(* State read *)
	- inversion H4.
	(* Reference *)
	- right. destruct IHhas_type... 
	exists ((loc_exp (length Sr))). exists Q. 
	exists (snoc Sr e). exists F.
	exists ((wr_act idn l)). exists K. 
	apply O_ref. assumption. apply fresh_loc_l.
	apply equal_nat.
	inversion H3. exists (ref_exp x). 
	inversion H4. exists x0. inversion H5. 
	exists x1. inversion H6.
	exists x2. inversion H7. exists x3. 
	inversion H8. exists x4. apply O_ref_cong.
	assumption.
	(* Dereference *)
	- right. destruct IHhas_type... 
	exists ((store_lookup l Sr)). exists Q. 
	exists Sr. exists F. 
	exists ((rd_act idn l)). exists K. 
	assert (e = loc_exp l). apply equal_exp. 
	rewrite -> H4. apply O_deref. 
	apply less_than_nat. apply not_unres. 
	inversion H3. exists (deref_exp x). 
	inversion H4. exists x0.
	inversion H5. exists x1. 
	inversion H6. exists x2. inversion H7. 
	exists x3. inversion H8. exists x4.
	apply O_deref_cong. assumption.
	(* Reference assignment *)
	- right. destruct IHhas_type1 as [Ht1p|Ht1p].
	assumption. reflexivity.
	destruct IHhas_type2 as [Ht2p|Ht2p]. 
	assumption. reflexivity. 
	exists(e'). exists Q. exists (replace l e' Sr). 
	exists F. exists ((wr_act idn l)). exists K.
	assert (e = loc_exp l).
	apply equal_exp. rewrite -> H4.
	apply O_ref_asgn. assumption.
	apply not_unres. inversion Ht2p.
	exists (ref_asgn_exp e x).
	inversion H4. exists x0.
	inversion H5. exists x1.
	inversion H6. exists x2.
	inversion H7. exists x3.
	inversion H8. exists x4.
	apply O_ref_asgn_cong2. assumption.
	assumption. inversion Ht1p. exists (ref_asgn_exp x e').
	inversion H4. exists x0.
	inversion H5. exists x1.
	inversion H6. exists x2.
	inversion H7. exists x3.
	inversion H8. exists x4.
	apply O_ref_asgn_cong1.
	assumption.
	(* Let *)
	- right. destruct IHhas_type1.
	assumption. reflexivity.
	exists ([x:=e]e'). auto. exists Q.
	exists Sr. exists F. exists (lcl_act idn).
	exists K. apply O_let. assumption.
	inversion H4. exists (let_exp x x0 e').
	inversion H5. exists x1. inversion H6.
	exists x2. inversion H7. exists x3.
	inversion H8. exists x4. inversion H9.
	exists x5. apply O_let_cong. assumption.
	(* Var *)
	- inversion H.
	(* Location *)
	- left. apply loc_val.
	(* Transferred *)
	- left. apply trans_val.
	(* Unresolved *)
	- left. apply unres_val.
	(* Unit *)
	- left. apply unit_val.
	(* Owe *)
	- left. apply owe_val.
	(* Val *)
	- left. apply val_val.
	Qed.

(** PRESERVATION **)

(* This theorem says that if the expression e takes step to e' and store Sr is updated to Sr'
then Pi' extends Pi and e' is well typed if e1 is well typed and also Sr' is well typed. *)

Theorem preservation : forall e e' a T idn C f l F F' Q Q' Sr Sr' I K K' Pi,
	has_type empty Pi e T ->
	store_well_typed Pi Sr ->
	step ((Sigma idn (e :: Q) Sr (C , ((f, l) :: F)) I) :: K)
	a 
	((Sigma idn (e' :: Q') Sr' (C , ((f, l) :: F')) I) :: K') ->
	exists Pi', (extends Pi' Pi /\
	has_type empty Pi' e' T /\
	store_well_typed Pi' Sr').
Proof with eauto using store_weakening, extends_refl.
	remember (@empty ty) as Gamma.
	intros e e' a T idn C f l F F' Q Q' Sr Sr' I K K' Pi Ht.
	generalize dependent e'. generalize dependent Q'. 
	generalize dependent F'.
	generalize dependent K'.
	induction Ht; intros K' F' Q' e'0 HST Hstep;
	subst; try (solve by inversion); inversion Hstep; subst ;
	try (eauto using store_weakening, extends_refl).
	exists Pi. split. apply extends_refl. split. assumption.
	apply reach_remove_well_typed. assumption.
	exists Pi. split. apply extends_refl. split.
	apply T_owe. assumption.
	apply IHHt1 in H12.
	inversion H12 as [Pi' [Hext [Hty Hsty]]].
	exists Pi'. split. assumption. split. apply T_res.
	apply length_extends with Pi.
	assumption. assumption.
	assumption. apply T_loc.
	apply length_extends with Pi. auto.
	assumption. assumption. reflexivity.
	assumption. exists (snoc Pi T).
	inversion HST; subst. split.
	apply extends_snoc. split.
	replace (ref_ty T) with (ref_ty (store_Tlookup (length Sr) (snoc Pi T))).
	apply T_loc. rewrite <- H.
	rewrite length_snoc. omega.
	unfold store_Tlookup. rewrite <- H.
	rewrite nth_eq_snoc...
	apply store_well_typed_snoc; assumption.
	apply IHHt in H8. inversion H8 as [Pi' [Hext [Hty Hsty]]].
	exists Pi'. split. assumption.
	split. apply T_ref. assumption.
	assumption. reflexivity.
	assumption. exists Pi. split; try split. 
	apply extends_refl. inversion HST as [_ Hsty].
	replace T with (store_Tlookup l0 Pi).
	apply Hsty... inversion Ht; 
	subst... assumption.
	exists Pi. split. apply extends_refl.
	split. apply T_owe. assumption.
	apply IHHt in H8. inversion H8 as [Pi' [Hext [Hty Hsty]]].
	exists Pi'. split. assumption. split. apply T_deref.
	assumption. assumption. reflexivity.
	assumption. exists Pi. split; try split...
	eapply assign_pres_store_typing...
	apply less_than_nat. inversion Ht1; subst. assumption.
	exists Pi. split. apply extends_refl.
	split. apply T_owe. assumption.
	apply IHHt1 in H9. inversion H9 as [Pi' [Hext [Hty Hsty]]].
	exists Pi'. split. assumption.
	split. apply T_ref_asgn. assumption.
	apply store_weakening with Pi. assumption.
	assumption. assumption.
	reflexivity. assumption.
	apply IHHt2 in H15. inversion H15 as [Pi' [Hext [Hty Hsty]]].
	exists Pi'. split. assumption.
	split. apply T_ref_asgn.
	apply store_weakening with Pi.
	assumption. assumption. assumption. assumption.
	reflexivity. assumption. exists Pi.
	split. apply extends_refl. split.
	apply substitution_preserves_typing with T.
	assumption. assumption. assumption.
	apply IHHt1 in H10.
	inversion H10 as [Pi' [Hext [Hty Hsty]]]. exists Pi'.
	split. assumption. split.
	apply T_let with T. assumption.
	apply store_weakening with Pi.
	assumption. assumption. assumption.
	reflexivity. assumption.
	Qed. 

(** SOUNDNESS **)

Theorem soundness : forall v l'' R idn' l' R' Sr'' e'' Q'' C' F'' f l e T idn Q Sr C F I e' Q' Sr' F' I' K tr K' Pi,
  	value v /\ (unres_value v \/ trans_value v) ->
   (* Information is for proc invoc and resolve. *)
   ((reach l'' Sr = R /\ reach l' Sr = R') \/ 
   (reach l'' Sr'' = R /\ reach l' Sr'' = R')) /\
   (In (Sigma idn' (e'' :: Q'') Sr'' (C' , F'') I') K  \/ 
   ~ In (Sigma idn' (e'' :: Q'') Sr'' (C' , F'') I') K) ->
	has_type empty Pi e T ->
	multi (Sigma idn (e::Q) Sr (C , ((f, l)::F)) I :: K) tr 
  (Sigma idn (e'::Q') Sr' (C , ((f, l)::F')) I :: K') ->
	~ stuck (Sigma idn (e'::Q') Sr' (C , ((f, l)::F')) I :: K') e'.
Proof.
	intros v l'' R idn' l' R' Sr'' e'' Q'' C' F'' f l e T idn Q Sr C F
	I e' Q' Sr' F' I' K tr K' Pi H1 H2 Hhas_type Hmulti.
	unfold stuck. intros [Hnf Hnot_val]. induction Hmulti.
	apply progress with e T R l'' l' R' idn0 idn' e'' Q'' Sr'' F'' 
	C' I' v Q Sr C f l F I K Pi in Hhas_type.
	destruct Hhas_type; auto.
	apply preservation with e e'0 a T idn0 C0 f0 l0 F0 F'0 
	Q0 Q'0 Sr0 Sr'0 I0 K0 K'0 Pi in Hhas_type.
	destruct IHHmulti. assumption. destruct IHHmulti. 
	assumption. replace e with e0. apply H. apply equal_exp. 
	assumption. assumption.
	destruct Hnf.
	exists (Sigma idn0 (e0 :: Q0) Sr0 (C0, (f0, l0) :: F0) I0 :: K0). 
	exists a. assumption.
	Qed.