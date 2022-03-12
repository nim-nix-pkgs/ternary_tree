{
  description = ''Structural sharing data structure of lists and maps.'';

  inputs.flakeNimbleLib.owner = "riinr";
  inputs.flakeNimbleLib.ref   = "master";
  inputs.flakeNimbleLib.repo  = "nim-flakes-lib";
  inputs.flakeNimbleLib.type  = "github";
  inputs.flakeNimbleLib.inputs.nixpkgs.follows = "nixpkgs";
  
  inputs.src-ternary_tree-v0_1_17.flake = false;
  inputs.src-ternary_tree-v0_1_17.owner = "calcit-lang";
  inputs.src-ternary_tree-v0_1_17.ref   = "refs/tags/v0.1.17";
  inputs.src-ternary_tree-v0_1_17.repo  = "ternary-tree";
  inputs.src-ternary_tree-v0_1_17.type  = "github";
  
  outputs = { self, nixpkgs, flakeNimbleLib, ...}@deps:
  let 
    lib  = flakeNimbleLib.lib;
    args = ["self" "nixpkgs" "flakeNimbleLib" "src-ternary_tree-v0_1_17"];
  in lib.mkRefOutput {
    inherit self nixpkgs ;
    src  = deps."src-ternary_tree-v0_1_17";
    deps = builtins.removeAttrs deps args;
    meta = builtins.fromJSON (builtins.readFile ./meta.json);
  };
}