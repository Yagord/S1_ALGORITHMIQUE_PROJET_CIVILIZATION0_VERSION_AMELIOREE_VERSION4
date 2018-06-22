program CivilizationUpgrade;

{$APPTYPE CONSOLE}
{$R *.res}

uses
  System.SysUtils,
  Windows,
  GestionEcran in 'GestionEcran.pas',
  UnitAffichage in 'UnitAffichage.pas',
  UnitUpdate in 'UnitUpdate.pas',
  UnitRecord in 'UnitRecord.pas',
  UnitInit in 'UnitInit.pas',
  UnitGestion in 'UnitGestion.pas',
  UnitVille in 'UnitVille.pas',
  UnitMilitaire in 'UnitMilitaire.pas',
  UnitConst in 'UnitConst.pas',
  UnitSave in 'UnitSave.pas',
  UnitRecherche in 'UnitRecherche.pas',
  UnitSprite in 'UnitSprite.pas';

var
  Jeu: Game; // Le jeu qui contient toute les données d'une partie
  choix: char; // Le caractere saisie par l'utilisateur dans les menu

begin

  gestionSprite(3,4000);

  Jeu.fini := true;

  repeat
    gestionAcceuil(Jeu,choix); // menu accueil

    while (Jeu.fini = False) do
    // boucle tant que le jeu n'est pas fini representant un tour de jeu
    begin
      gestionCivilisation(Jeu, Jeu.civilisations[1]);
      // on gere notre civilisation

      if not Jeu.fini then
        updateGame(Jeu);
      // quand le tour est fini on update le jeu et recommence un tour
    end;

    reset(Jeu);

  until choix = '3'; // on recommence jusqu'a ce que le joueur quitte le jeu

end.
