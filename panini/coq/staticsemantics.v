Require Export syntax.
Require Export standardauxiliary.
Require Export config.

(** ********************* **)
(** TYPING ENVIRONMENTS **)
(** ********************* **)
Definition var_ty_env := partial_map ty.
Definition store_ty_env := list varl_ty.

(** ********************* **)
(** WELL FORMEDNESS **)
(** ********************* **)
(* wellformed states that type is well formed. *)
Inductive wellformed : ty -> Prop :=
	| wellformed_cap_ty : forall C C' im im' dsgn fs procs CT,
		In (cap_decl C im C' (im') dsgn fs procs) CT ->
		wellformed (cap_ty C) 
	| wellformed_var_ty1 : forall T,
		wellformed (var_ty T)
	| wellformed_var_ty2 : forall T,
		wellformed (var_ty T) ->
		wellformed (var_ty (ref_ty T)).

(* var_subtype takes two variable types as arguments and states that one is subtype of another. *)
Inductive var_subtype : ty -> ty -> Prop :=
	| refl_var_subtype : forall T,
		wellformed (var_ty T) ->
		var_subtype (var_ty T) (var_ty T)
	| trans_var_subtype : forall T T' T'',
		wellformed (var_ty T'') ->
		wellformed (var_ty T) ->
		wellformed (var_ty T') ->
		var_subtype (var_ty T) (var_ty T') ->
		var_subtype (var_ty T') (var_ty T'') ->
		var_subtype (var_ty T) (var_ty T'').

(* cap_subtype takes two capsule types as arguments and states that one is subtype of another. *)
Inductive cap_subtype : ty -> ty -> Prop :=
	| refl_cap_subtype : forall C,
		wellformed (cap_ty C) ->
		cap_subtype (cap_ty C) (cap_ty C)
	| trans_cap_subtype : forall C C' C'',
		wellformed (cap_ty C) ->
		wellformed (cap_ty C') ->
		wellformed (cap_ty C'') ->
		cap_subtype (cap_ty C) (cap_ty C') ->
		cap_subtype (cap_ty C') (cap_ty C'') ->
		cap_subtype (cap_ty C) (cap_ty C'')
	| decl_cap_subtype : forall C C' im im' dsgn fs procs CT,
		In (cap_decl C im C' im' dsgn fs procs) CT ->
		wellformed (cap_ty C) ->
		wellformed (cap_ty C') ->
		cap_subtype (cap_ty C) (cap_ty C')
	| subcap_top : forall C Top CT,
    In (cap_decl Top [ ] Top [ ] (dsgn_decl [ ] [ ]) [ ] [ ]) CT ->
		wellformed (cap_ty C) ->
		wellformed (cap_ty Top) ->
		cap_subtype (cap_ty C) (cap_ty Top).

(** ********************* **)
(** EXPRESSION TYPING RULES **)
(** ********************* **)
Inductive has_type : var_ty_env -> store_ty_env -> exp -> ty -> Prop :=
	| T_proc_inv : forall i p e x alpha C T T' e' Gamma Pi,
		Gamma i = Some (cap_ty C) ->
		proc_body C p ((proc_decl T' p (form_decl T x) e')) ->
		has_type Gamma Pi e (var_ty T) ->
		has_type Gamma Pi (inv_exp i p e alpha) (var_ty T')
	| T_self_inv : forall self p e' x e C T T' Gamma Pi,
		Gamma self = Some (cap_ty C) ->
		proc_body C p ((proc_decl T' p (form_decl T x) e)) ->
		has_type Gamma Pi e' (var_ty T) ->
		has_type Gamma Pi (self_inv_exp self p e') (var_ty T')
	| T_super_inv : forall self super p e' C C' im im' des fs procs x e T T' Gamma Pi CT,
		Gamma self = Some (cap_ty C) ->
		In (cap_decl C im C' im' des fs procs) CT ->
		proc_body C' p ((proc_decl T' p (form_decl T x) e)) ->
		Gamma super = Some (cap_ty C') ->
		has_type Gamma Pi e' (var_ty T') ->
		has_type Gamma Pi (super_inv_exp super p e') (var_ty T')	  
	| T_res : forall l e idn p T Gamma Pi,
    l < length Pi ->
		has_type Gamma Pi e (var_ty T) ->
		has_type Gamma Pi (loc_exp l) (var_ty (ref_ty (store_Tlookup l Pi))) ->
		has_type Gamma Pi (res_exp l e idn p) (var_ty T)
	| T_st_asgn : forall self f e T fs C Gamma Pi,
		Gamma self = Some (cap_ty C) ->
		states_of C ((st_decl T f) :: fs) ->
		has_type Gamma Pi e (var_ty T) ->
		has_type Gamma Pi (st_asgn_exp self f e) (var_ty T)
	| T_st_read : forall self f T fs C Gamma Pi,
		Gamma self = Some (cap_ty C) ->
		states_of C ((st_decl T f) :: fs) ->
    Gamma f = Some (var_ty T) ->
		has_type Gamma Pi (st_read_exp self f) (var_ty T)
	| T_ref : forall e T Gamma Pi,
		has_type Gamma Pi e (var_ty T) ->
		has_type Gamma Pi (ref_exp e) (var_ty (ref_ty T))
	| T_deref : forall e T Gamma Pi,
		has_type Gamma Pi e (var_ty (ref_ty T)) ->
		has_type Gamma Pi (deref_exp e) (var_ty T)	  
	| T_ref_asgn : forall e e' T Gamma Pi,
		has_type Gamma Pi e (var_ty (ref_ty T)) ->
		has_type Gamma Pi e' (var_ty T) ->
		has_type Gamma Pi (ref_asgn_exp e e') (var_ty T)
	| T_let : forall x e e' T T' Gamma Pi ,
		has_type Gamma Pi e (var_ty T) ->
		has_type (extend Gamma x (var_ty T)) Pi e' (var_ty T') ->
		has_type Gamma Pi (let_exp x e e') (var_ty T')  
	| T_var : forall x T Gamma Pi,
		Gamma x = Some T ->
		has_type Gamma Pi (var_exp x) T
	| T_loc : forall l Gamma Pi,
		l < length Pi ->
		has_type Gamma Pi (loc_exp l) (var_ty (ref_ty (store_Tlookup l Pi)))
	| T_trans_val : forall T Gamma Pi,
		trans_value trans_exp ->
		has_type Gamma Pi trans_exp (var_ty T)
	| T_unres_val : forall T Gamma Pi,
		unres_value unres_exp ->
		has_type Gamma Pi unres_exp (var_ty T)	  
	| T_unit : forall Gamma Pi,
		has_type Gamma Pi unit_exp (var_ty unit_ty) 
	| T_owe : forall T Gamma Pi,
		has_type Gamma Pi (owe_exp) (var_ty T)
	| T_val : forall idn T Gamma Pi ,
		has_type Gamma Pi (val_exp idn) (var_ty T)
(** ********************* **)
(** CAPSULE/VARIABLE TYPE SUBSUMPTION **)
(** ********************* **)	  
with 
(* variableSubsumption is a combination of the hasType and subtype predicates to represent subtyping of 
variable types.*)
var_subsm : var_ty_env -> store_ty_env -> exp -> ty -> Prop :=
	| T_var_subsm : forall e T T' Gamma Pi,
		has_type Gamma Pi e (var_ty T') ->
		var_subtype (var_ty T') (var_ty T) ->
		var_subsm Gamma Pi e (var_ty T)
with
(* capsuleSubsumption is a combination of the hasType and subtype predicates to represent subtyping of 
capsule types.*)
cap_subsm : var_ty_env -> store_ty_env -> exp -> ty -> Prop :=
	| T_cap_subsm : forall i C C' Gamma Pi,
		has_type Gamma Pi (var_exp i) (cap_ty C') ->
		cap_subtype (cap_ty C') (cap_ty C) ->
		cap_subsm Gamma Pi (var_exp i) (cap_ty C).

(** ********************* **)
(** DECLARATION TYPING RULES **)
(** ********************* **)
Inductive has_type_proc_decl : var_ty_env -> store_ty_env -> proc -> Prop :=
	| T_proc_decl : forall x e p T T' Gamma Pi ,
		has_type (extend Gamma x (var_ty T)) Pi e (var_ty T') ->
		has_type_proc_decl Gamma Pi (proc_decl (T') p (form_decl (T) x) e).

Inductive has_type_wire_decl : var_ty_env -> store_ty_env -> wire -> Prop :=
	| T_wire_decl : forall i j js g C C' im im' G des fs procs Gamma Pi CT,
		has_type Gamma Pi (var_exp i) (cap_ty C) ->
		In (cap_decl C im C' im' des fs procs) CT ->
		length im = length js ->
		In (imp_decl G g) im ->
		In j js ->
		has_type Gamma Pi (var_exp j) (cap_ty G) ->
		has_type_wire_decl Gamma Pi (wire_decl i js).

Inductive has_type_cap_decl : capl_ty -> Prop :=
	| T_cap_decl : forall p x e' g g' h C C' G G' H im im' insts wires f fs wire self proc' procs T T' Gamma CT,
		In (cap_decl C im C' im' (dsgn_decl insts wires) fs procs) CT ->
		In (imp_decl G g) im ->
		In (imp_decl G' g') im' ->
		In (inst_decl H h) insts ->
		In wire wires ->
		In (st_decl T f) fs ->
		In (proc_decl T' p (form_decl T x) e') procs ->
		has_type Gamma [ ] (var_exp g) (cap_ty G) ->
		has_type Gamma [ ] (var_exp g') (cap_ty G') ->
		has_type Gamma [ ] (var_exp h) (cap_ty H) ->
		has_type Gamma [ ] (var_exp f) (var_ty T) ->
		has_type Gamma [ ] (var_exp self) (cap_ty C) ->
		has_type_proc_decl Gamma [ ] ((proc_decl T' p (form_decl T x) e')) ->
		has_type_wire_decl Gamma [ ] wire ->
		has_type_proc_decl Gamma [ ] proc' ->
		has_type_cap_decl C' ->
		has_type_cap_decl G ->
		has_type_cap_decl G' ->
		has_type_cap_decl H ->
		has_type_cap_decl C.