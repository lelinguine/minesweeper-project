import 'dart:math';
import 'package:minesweeper/model/class/case.dart';
import 'package:minesweeper/model/class/coup.dart';

/// [Grille] de démineur
class Grille {
  /// Dimension de la grille carrée : [taille]x[taille]
  final int taille;

  /// Nombre de mines présentes dans la grille
  final int nbMines;

  /// Attribut privé (_), liste composée [taille] listes de chacune [taille] cases
  final List<List<Case>> _grille = [];

  /// Construit une [Grille] comportant [taille] lignes, [taille] colonnes et [nbMines] mines
  Grille({required this.taille, required this.nbMines}) {
    int nbCasesACreer = nbCases; // Le nombre de cases qu'il reste à créer
    int nbMinesAPoser = nbMines; // Le nombre de mines qu'il reste à poser
    Random generateur = Random(); // Générateur de nombres aléatoires
    // Pour chaque ligne de la grille
    for (int lig = 0; lig < taille; lig++) {
      // On va ajouter à la grille une nouvelle Ligne (liste de 'cases')
      List<Case> uneLigne = []; //
      for (int col = 0; col < taille; col++) {
        // S'il reste nBMinesAPoser dans nbCasesACreer, la probabilité de miner est nbMinesAPoser/nbCasesACreer
        // Donc on tire un nombre aléatoire a dans [1..nbCasesACreer] et on pose une mine si a <= nbMinesAposer
        bool isMinee = generateur.nextInt(nbCasesACreer) < nbMinesAPoser;
        if (isMinee) nbMinesAPoser--; // une mine de moins à poser
        uneLigne.add(Case(isMinee)); // On ajoute une nouvelle case à la ligne
        nbCasesACreer--; // Une case de moins à créer
      }
      // On ajoute la nouvelle ligne à la grille
      _grille.add(uneLigne);
    }
    // Les cases étant créées et les mines posées, on calcule pour chaque case le 'nombre de mines autour'
    calculeNbMinesAutour();
  }

  /// Getter qui retourne le nombre de cases
  int get nbCases => taille * taille;

  /// Retourne la [Case] de la [Grille] située à [coord]
  Case getCase(Coordonnees coord) {
    return _grille[coord.ligne][coord.colonne];
  }

  /// Retourne la liste des [Coordonnees] des voisines de la case située à [coord]
  List<Coordonnees> getVoisines(Coordonnees coord) {
    List<Coordonnees> listeVoisines = [];

    for (int ligne = coord.ligne - 1; ligne <= coord.ligne + 1; ligne++) {
      for (int colonne = coord.colonne - 1;
          colonne <= coord.colonne + 1;
          colonne++) {
        if (ligne >= 0 && ligne < taille && colonne >= 0 && colonne < taille) {
          Coordonnees coordVoisine = (ligne: ligne, colonne: colonne);
          Case current = getCase(coordVoisine);
          if (coordVoisine != coord && current.etat != Etat.decouverte) {
            listeVoisines.add(coordVoisine);
          }
        }
      }
    }
    return listeVoisines;
  }

  /// Assigne à chaque [Case] le nombre de mines présentes dans ses voisines
  void calculeNbMinesAutour() {
    for (int lig = 0; lig < taille; lig++) {
      for (int col = 0; col < taille; col++) {
        _grille[lig][col].nbMinesAutour = 0;
        Coordonnees coord = (ligne: lig, colonne: col);
        List<Coordonnees> listeVoisines = getVoisines(coord);
        for (Coordonnees coord in listeVoisines) {
          if (_grille[coord.ligne][coord.colonne].minee) {
            _grille[lig][col].nbMinesAutour++;
          }
        }
      }
    }
  }

  /// - Découvre récursivement toutes les cases voisines d'une case située à [coord]
  /// - La case située à [coord] doit être découverte
  void decouvrirVoisines(Coordonnees coord) {
    Case init = getCase(coord);
    init.etat = Etat.decouverte;
    if (init.nbMinesAutour == 0) {
      List<Coordonnees> listeVoisines = getVoisines(coord);
      for (Coordonnees coord in listeVoisines) {
        decouvrirVoisines(coord);
      }
    }
  }

  /// Met à jour la Grille en fonction du [coup] joué
  void mettreAJour(Coup coup) {
    Coordonnees coord =
        (ligne: coup.coordonnees.ligne, colonne: coup.coordonnees.colonne);
    if (coup.action == Action.decouvrir) {
      decouvrirVoisines(coord);
    } else if (coup.action == Action.marquer) {
      Case init = getCase(coord);
      init.etat = Etat.marquee;
    }
  }

  /// Renvoie vrai si [Grille] ne comporte que des cases soit minées soit découvertes (mais pas les 2)
  bool isGagnee() {
    for (List<Case> lignes in _grille) {
      for (Case current in lignes) {
        if (!current.minee && current.etat != Etat.decouverte) {
          return false;
        }
      }
    }
    return true;
  }

  /// Renvoie vrai si [Grille] comporte au moins une case minée et découverte
  bool isPerdue(Coup coup) {
    Coordonnees coord = (ligne: coup.coordonnees.ligne, colonne: coup.coordonnees.colonne);
    Case init = getCase(coord);
    if(init.minee)  {
      return true;
    }
    return false;
  }

  /// Renvoie vrai si la partie est finie, gagnée ou perdue
  bool isFinie(Coup coup) {
    if(isPerdue(coup) || isGagnee())  {
      return true;
    }
    return false;
  }
}
