Require Export List.
Require Export SfLib.
Require Export syntax.

(** ********************* **)
(** ACTIONS **)
(** ********************* **)

(* A runtime action taken by procedure id and affects a list of locations. *)
Inductive act  : Type :=
	| rd_act : id -> loc -> act
	| wr_act : id -> loc -> act
	| inv_act : id -> id -> id -> loc -> act
	| res_act : id -> id -> id -> loc -> act
	| lcl_act : id -> act.

(* trace is a list of actions. *)
Definition trace := list act.

(* queue is a list of expression bodies of invoked procedures.*)
Definition queue := list exp.

(** ********************* **)
(** LOCAL CONFIGURATION **)
(** ********************* **)

(* st_map is a set of mapping between state name id to location nat in the store. *)
Definition st_map := list (prod id loc).

(* cap_record is a set of mapping between capsule type and st_map that is mapping 
from state to locations. *)
Definition cap_record := (prod capl_ty st_map).

(* inst_map is a set of mapping between a capsule instance id to its id id. *)
Definition inst_map := list (prod id id).

(* store is a list of expressions. *)
Definition store := list exp.

(* cap_conf represents a capsule instance configurations with name id, queue, 
store, cap_record and inst_map. *)
Inductive cap_conf : Type :=
	| Sigma :  id -> queue -> store -> cap_record -> inst_map -> cap_conf.

(** ********************* **)
(** GLOBAL CONFIGURATION **)
(** ********************* **)

(* glb_conf is a list of capsule configuations. *)
Definition glb_conf := list cap_conf.
