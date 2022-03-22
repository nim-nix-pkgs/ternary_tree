{
  description = ''Ternary tree of list data structure'';

  inputs.flakeNimbleLib.owner = "riinr";
  inputs.flakeNimbleLib.ref   = "master";
  inputs.flakeNimbleLib.repo  = "nim-flakes-lib";
  inputs.flakeNimbleLib.type  = "github";
  inputs.flakeNimbleLib.inputs.nixpkgs.follows = "nixpkgs";
  
  inputs.src-ternary_tree-v0_1_30.flake = false;
  inputs.src-ternary_tree-v0_1_30.owner = "calcit-lang";
  inputs.src-ternary_tree-v0_1_30.ref   = "v0_1_30";
  inputs.src-ternary_tree-v0_1_30.repo  = "ternary-tree";
  inputs.src-ternary_tree-v0_1_30.type  = "github";
  
  outputs = { self, nixpkgs, flakeNimbleLib, ...}@deps:
  let 
    lib  = flakeNimbleLib.lib;
    args = ["self" "nixpkgs" "flakeNimbleLib" "src-ternary_tree-v0_1_30"];
  in lib.mkRefOutput {
    inherit self nixpkgs ;
    src  = deps."src-ternary_tree-v0_1_30";
    deps = builtins.removeAttrs deps args;
    meta = builtins.fromJSON (builtins.readFile ./meta.json);
  };
}