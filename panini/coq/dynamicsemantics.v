Require Export syntax.
Require Export standardauxiliary.
Require Export config.

(** LOCAL AND GLOBAL OPERATIONAL SEMANTICS FOR NORMAL/EXCEPTIONAL EXECUTION **)

(* step denotes evaluation of a global configuration represented by glb_conf to 
another glb_conf by performing an action a. *)
(* X is used to denote exceptional semantics *)
(* Sr is used for store since S collides with natural's successor function name *)
Inductive step : glb_conf -> act -> glb_conf -> Prop :=

	(** ********************* **)
	(** NORMAL EXECUTION **)

	(** ********************* **)
	(** LOCAL **)
	(** ********************* **)
	| O_st_rd : forall self f l v idn Q Sr C F I K,
		value v -> 
		store_lookup l Sr = v ->
		step ((Sigma idn ((st_read_exp self f)::Q) Sr (C , ((f,l) :: F))I):: K) 
			(rd_act idn l) 
			((Sigma idn (v::Q) Sr (C , ((f,l) :: F)) I)::K)
	| O_st_asgn : forall self f l v idn Q Sr C F I K,
		value v ->
		step ((Sigma idn ((st_asgn_exp self f v)::Q) Sr (C , ((f, l)::F)) I)::K)
			(wr_act idn l)
			((Sigma idn (v::Q) (replace l v Sr) (C , ((f, l)::F)) I)::K)
	| O_self_inv : forall T T' p x e v self C f l idn Q Sr F I K,
	value v ->
	proc_body C p ((proc_decl T' p (form_decl T x) e)) ->
	step ((Sigma idn ((self_inv_exp self p v)::Q) Sr (C , ((f, l)::F)) I)::K) 
		(lcl_act idn)
		((Sigma idn (([x:= v]e)::Q) Sr (C , ((f, l)::F)) I)::K)
	| O_super_inv : forall T T' p x e v super f l idn C C' im im' des fs procs Q Sr F I K CT,
	value v ->
	In (cap_decl C im C' im' des fs procs) CT  ->
	proc_body C' p ((proc_decl T' p (form_decl T x) e)) ->
	step ((Sigma idn ((super_inv_exp super p v)::Q) Sr (C , ((f, l)::F)) I)::K) 
		(lcl_act idn)
		((Sigma idn (([x:= v]e)::Q) Sr (C , ((f, l)::F)) I):: K)
	| O_ref : forall v l idn Q Sr C F I K,
		value v ->
		fresh_loc l ->
		l = (length Sr) ->
		step ((Sigma idn ((ref_exp v)::Q) Sr (C, F) I)::K) 
			(wr_act idn l) 
			((Sigma idn ((loc_exp (length Sr))::Q) (snoc Sr v) (C, F) I)::K)
	| O_deref : forall l idn Q C Sr F I K,
		l < length (Sr) ->
		~ unres_value (store_lookup l Sr) ->
		step ((Sigma idn ((deref_exp (loc_exp l))::Q) Sr (C, F) I)::K) 
			(rd_act idn l) 
			((Sigma idn ((store_lookup l Sr)::Q) Sr (C, F) I)::K)
	| O_ref_asgn : forall v l idn Q Sr C F I K,
		value v ->
		~ unres_value (store_lookup l Sr) ->
		step ((Sigma idn ((ref_asgn_exp (loc_exp l) v)::Q) Sr (C, F) I)::K) 
			(wr_act idn l) 
			((Sigma idn (v::Q) (replace l v Sr) (C, F) I)::K)
	| O_let : forall x v e idn Q Sr C F I K,
		value v ->
		step ((Sigma idn ((let_exp x v e)::Q) Sr (C, F) I)::K) 
		   (lcl_act idn) 
		   ((Sigma idn (([x:= v]e)::Q) Sr (C, F) I)::K)
	(** ********************* **)
	(** GLOBAL **)
	(** ********************* **)
	| O_proc_inv : forall v v' l l' l'' x p e e' f alpha R R' i T T' idn idn' Q Q' Sr C Sr' C' F F' I I' K,
		In (idn', i) I ->
		In (Sigma idn' (e'::Q') Sr' (C' , F') I') K ->
		proc_body C' p ((proc_decl T' p (form_decl T x) e)) ->
		store_lookup l'' Sr  = v ->
		reach l'' Sr = R ->
		In (f , l') F ->
		reach l' Sr = R' ->
		intersect_reach R R' nil ->
		fresh_loc l ->
		value v -> 
		value v' ->
		unres_value v' ->
		store_lookup l Sr  = v' ->
		step ((Sigma idn ((inv_exp i p v alpha)::Q) Sr (C , F) I)::K) 
			(inv_act idn idn' p l) 
			((Sigma idn ((loc_exp l):: Q) (reach_remove l (snoc Sr v') R) (C , F) I) ::
			(update_conf (Sigma idn' (e'::Q') Sr' (C' , F') I') K (Sigma idn' (app (e'::Q') [res_exp l ([x := v]e) idn p]) (reach_add l Sr' R) (C' , F') I')))
	| O_res : forall v v' l e p l' l'' f R R' idn idn' Q Sr Sr' C C' F' I I' Q' F K,
		store_lookup l'' Sr  = v ->
		reach l'' Sr = R ->
		In (f , l') F ->
		reach l' Sr = R' ->
		intersect_reach R R' nil ->
		value v ->
		value v' ->
		unres_value v' ->
		store_lookup l Sr'  = v' ->
		In (Sigma idn (e::Q) Sr (C , F) I) K ->
		step (((Sigma idn' ((res_exp l v idn p)::Q') Sr' (C' , F') I'))::K) 
			(res_act idn' idn p l) 
			((Sigma idn' (v::Q') (reach_remove l Sr' R) (C' , F') I') ::
			(update_conf (Sigma idn (e::Q) Sr (C , F) I) K
			(Sigma idn (e:: Q) (reach_add l (replace l v Sr) R) (C , F) I)))
	(** ********************* **)
	(** EXCEPTIONAL EXECUTION **)
	(** ********************* **)
	| X_deref : forall l v idn Q Sr C F I K,
		store_lookup l Sr = v ->
		trans_value v ->
		step ((Sigma idn (deref_exp (loc_exp l)::Q) Sr (C, F) I):: K) 
		   (rd_act idn l)
		   ((Sigma idn (owe_exp::Q) Sr (C, F) I) :: K)
	| X_ref_asgn : forall l v idn Q Sr C F I K,
		store_lookup l Sr = v ->
		trans_value v ->
		step ((Sigma idn ((ref_asgn_exp (loc_exp l) v)::Q) Sr (C, F) I)::K) 
			(wr_act idn l)
			((Sigma idn (owe_exp::Q) Sr (C, F) I)::K)

	| X_proc_inv : forall v Sr C p i alpha idn idn' Q f F I K l l'' l' R R',
		In (idn', i) I ->
		store_lookup l'' Sr = v ->
		reach l'' Sr = R ->
		In (f , l') F ->
		reach l' Sr = R' ->
		~ intersect_reach R R' nil ->
		step ((Sigma idn ((inv_exp i p v alpha)::Q) Sr (C , F) I):: K) 
			(inv_act idn idn' p l) 
			((Sigma idn (owe_exp::Q) Sr (C , F) I)::K)
	| X_res :  forall v p l l'' f R R' idn idn' Q Sr C F I l' K,
		value v ->
		store_lookup l'' Sr = v ->
		reach l'' Sr = R ->
		In (f , l') F ->
		reach l' Sr = R' ->
		~ intersect_reach R R' nil ->
		step ((Sigma idn ((res_exp l v idn' p)::Q) Sr (C , F) I)::K) 
		(res_act idn' idn p l)  
		((Sigma idn (owe_exp::Q) Sr (C , F) I)::K)
	(** ********************* **)
	(** CONGRUENCE **)
	(** ********************* **)
	| O_st_asgn_cong : forall f self a idn e e' Q Q' Sr Sr' C F F' I K K',
	  step ((Sigma idn (e::Q) Sr (C , F) I):: K)
		   a
		   ((Sigma idn (e'::Q') Sr' (C, F') I)::K') ->
	  step ((Sigma idn ((st_asgn_exp self f e)::Q) Sr (C, F) I)::K)
		   a 
		   ((Sigma idn ((st_asgn_exp self f e')::Q') Sr' (C , F') I)::K')
	| O_self_inv_cong : forall T T' e' e'' p x e a idn self C Q Sr F I Sr' Q' F' K K',
		proc_body C p ((proc_decl T' p (form_decl T x) e)) ->
		step ((Sigma idn (e'::Q) Sr (C , F) I)::K) 
			a
			((Sigma idn (e''::Q') Sr' (C , F') I)::K')  ->
		step ((Sigma idn ((self_inv_exp self p e')::Q) Sr (C , F) I)::K)
			a
			((Sigma idn ((self_inv_exp self p e'')::Q') Sr' (C , F') I)::K')
	| O_super_inv_cong : forall T T' e' e'' p e x a idn super C C' im im' des fs procs Q Sr I F Q' Sr' F' K K' CT,
		In (cap_decl C im C' im' des fs procs) CT ->
		proc_body C' p ((proc_decl T' p (form_decl T x) e)) ->
		step ((Sigma idn (e'::Q) Sr (C , F) I):: K) 
			a
		   ((Sigma idn (e''::Q') Sr' (C , F') I)::K') ->
		step ((Sigma idn ((super_inv_exp super p e')::Q) Sr (C , F) I)::K) 
		   a
		   ((Sigma idn ((super_inv_exp super p e'')::Q') Sr' (C , F') I)::K')
	| O_ref_cong : forall e' e a idn Q Sr C F I Q' Sr' F' K K',
		step ((Sigma idn (e::Q) Sr (C, F) I)::K) 
			a
			((Sigma idn (e':: Q') Sr' (C, F') I)::K') ->
		step ((Sigma idn ((ref_exp e)::Q) Sr (C, F) I)::K) 
			a
			((Sigma idn ((ref_exp e')::Q') Sr' (C, F') I)::K')
	| O_deref_cong : forall e e' a idn Q Sr C F I Q' Sr' F' K K',
		step ((Sigma idn (e::Q) Sr (C, F) I)::K)
			a
			((Sigma idn (e'::Q') Sr' (C, F') I)::K') ->
		step ((Sigma idn ((deref_exp e)::Q) Sr (C, F) I)::K)
		   a 
		   ((Sigma idn ((deref_exp e')::Q') Sr' (C, F') I)::K')
	| O_ref_asgn_cong1 : forall e1 e2 e1' a idn Q Sr C F Q' F' I Sr' K K',
	  step ((Sigma idn (e1::Q) Sr (C, F) I)::K) 
		   a
		   ((Sigma idn (e1'::Q') Sr' (C, F') I)::K') ->
	  step ((Sigma idn ((ref_asgn_exp e1 e2)::Q) Sr (C, F) I) :: K)
		   a 
		   ((Sigma idn ((ref_asgn_exp e1' e2)::Q') Sr' (C, F') I)::K')
	| O_ref_asgn_cong2 : forall v e2 e2' a idn Q Sr C F I Q' Sr' F' K K',
		value v -> 
		step ((Sigma idn (e2::Q) Sr (C, F) I)::K) 
		   a
		   ((Sigma idn (e2'::Q') Sr' (C, F') I)::K') ->
		step ((Sigma idn ((ref_asgn_exp v e2)::Q) Sr (C, F) I)::K) 
		   a 
		   ((Sigma idn ((ref_asgn_exp v e2')::Q') Sr' (C, F') I)::K')
	| O_let_cong : forall x e1 e1' e2 a idn Q Sr C F I Q' Sr' F' K K',
		step ((Sigma idn (e1::Q) Sr (C, F) I)::K) 
		   a
		   ((Sigma idn (e1'::Q') Sr' (C, F') I)::K') ->
		step ((Sigma idn ((let_exp x e1 e2)::Q) Sr (C, F) I):: K) 
		   a 
		   (Sigma idn ((let_exp x e1' e2)::Q') Sr' (C, F') I::K')
	| O_proc_inv_cong : forall i p e' e'' alpha a idn T' T x e C Q Sr F I Q' Sr' F' K K',
		proc_body C p ((proc_decl T' p (form_decl T x) e)) ->
		step ((Sigma idn (e'::Q) Sr (C , F) I)::K) 
		   a
		   ((Sigma idn (e''::Q') Sr' (C , F') I)::K')  ->
		step ((Sigma idn ((inv_exp i p e' alpha)::Q) Sr (C, F) I)::K) 
		   a
		   ((Sigma idn ((inv_exp i p e'' alpha)::Q') Sr' (C, F') I)::K')
	| O_res_cong :  forall l e e' p a idn idn' Q Sr C F I Q' Sr' F' K K',
		step ((Sigma idn' (e :: Q) Sr (C , F) I)::K) 
			a
			((Sigma idn' (e'::Q') Sr' (C , F') I)::K')  ->
		step ((Sigma idn' ((res_exp l e idn p)::Q) Sr (C , F) I)::K) 
			a 
			((Sigma idn' ((res_exp l e' idn p)::Q') Sr' (C , F') I)::K').