open Core;;
open Yojson;;

let sim _x _y _data = ()

let train _train_set = ()

(* model(username | information) = [(ip, score), ...] *)
let label _model _x =  let y' = _x in y'

let preprocess_data _raw_data = _raw_data

(* ========================================================================= *)
(*                              Boilerplate ML                               *)
(* ========================================================================= *)

let test _model ~_test_set = 
    List.map ~f:(fun _x -> label _model _x ) _test_set

(* Recall@k, precision@k, F-beta@k, MRR *)
let metrics ~_y _y' = ()

let eval_loop ~_train_set ~_test_set =
    _train_set
    |> train
    |> test ~_test_set
    |> metrics ~_y:_test_set

let split_data _data = ()

let cv _data ~_num_folds = 
    eval_loop ~_test_set:_data ~_train_set:_data

(* ========================================================================= *)
(*                                     I/O                                   *)
(* ========================================================================= *)

let read_data _filename = []

let load_config  filename = 
    Yojson.Basic.from_file filename

let () = 
    let config = load_config "config.json" in 

    config 
    |> read_data
    |> preprocess_data
    |> cv ~_num_folds:5
    |> ignore
;;
