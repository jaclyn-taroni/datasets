# Flake to set up an environment to upload profile_index.csv to Zenodo.
{
  inputs.nix-github-actions.url = "github:nix-community/nix-github-actions";
  inputs.nix-github-actions.inputs.nixpkgs.follows = "nixpkgs";

  outputs = { self, nixpkgs, nix-github-actions }: {
    githubActions = nix-github-actions.lib.mkGithubMatrix { inherit (self) checks; };
    checks.x86_64-linux.hello = nixpkgs.legacyPackages.x86_64-linux.hello;
    checks.x86_64-linux.default = self.packages.x86_64-linux.hello;
  };
}
