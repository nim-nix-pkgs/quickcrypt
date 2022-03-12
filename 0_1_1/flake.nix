{
  description = ''A library for quickly and easily encrypting strings & files. User-friendly and highly compatible.'';

  inputs.flakeNimbleLib.owner = "riinr";
  inputs.flakeNimbleLib.ref   = "master";
  inputs.flakeNimbleLib.repo  = "nim-flakes-lib";
  inputs.flakeNimbleLib.type  = "github";
  inputs.flakeNimbleLib.inputs.nixpkgs.follows = "nixpkgs";
  
  inputs.src-quickcrypt-0_1_1.flake = false;
  inputs.src-quickcrypt-0_1_1.owner = "theAkito";
  inputs.src-quickcrypt-0_1_1.ref   = "refs/tags/0.1.1";
  inputs.src-quickcrypt-0_1_1.repo  = "nim-quickcrypt";
  inputs.src-quickcrypt-0_1_1.type  = "github";
  
  inputs."nimaes".dir   = "nimpkgs/n/nimaes";
  inputs."nimaes".owner = "riinr";
  inputs."nimaes".ref   = "flake-pinning";
  inputs."nimaes".repo  = "flake-nimble";
  inputs."nimaes".type  = "github";
  inputs."nimaes".inputs.nixpkgs.follows = "nixpkgs";
  inputs."nimaes".inputs.flakeNimbleLib.follows = "flakeNimbleLib";
  
  inputs."neoid".dir   = "nimpkgs/n/neoid";
  inputs."neoid".owner = "riinr";
  inputs."neoid".ref   = "flake-pinning";
  inputs."neoid".repo  = "flake-nimble";
  inputs."neoid".type  = "github";
  inputs."neoid".inputs.nixpkgs.follows = "nixpkgs";
  inputs."neoid".inputs.flakeNimbleLib.follows = "flakeNimbleLib";
  
  outputs = { self, nixpkgs, flakeNimbleLib, ...}@deps:
  let 
    lib  = flakeNimbleLib.lib;
    args = ["self" "nixpkgs" "flakeNimbleLib" "src-quickcrypt-0_1_1"];
  in lib.mkRefOutput {
    inherit self nixpkgs ;
    src  = deps."src-quickcrypt-0_1_1";
    deps = builtins.removeAttrs deps args;
    meta = builtins.fromJSON (builtins.readFile ./meta.json);
  };
}