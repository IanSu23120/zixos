{ ... }:
{
  programs.git = {
    enable = true;
    settings = {
      pull.rebase = true;
      user = {
        name = "iansu";
        email = "4B1L0901@stust.edu.tw";
      };
    };
  };
}
