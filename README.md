# TSA-Claims-SAS
prepare and analyze claims data from the Transportation Security Administration (TSA) with SAS Studio

# Analyse Exploratoire de Données : Titanic Dataset

## Description
The case study data is in a CSV file named TSA Claims 2002 to 2017. This file was created from publicly available data from the TSA and the Federal Aviation Administration, or FAA. The TSA data has information about claims and the FAA data has information about USA airport facilities. The case study data was created by concatenating individual TSA airport claims data, removing some extra columns, and then joining the concatenated TSA claims data with the FAA airport facilities data. The TSA Claims 2002 to 2017 CSV file has 14 columns and over 220,000 rows.

Ce projet utilise SAS Studio pour effectuer une analyse exploratoire de données (EDA) sur le célèbre jeu de données Titanic. L'objectif est de :
- Explorer les caractéristiques des passagers (âge, sexe, classe, etc.).
- Identifier des tendances entre les variables (ex. survie et genre).
- Traiter les données manquantes.

## Contenu
- **`scripts/eda_titanic.sas`** : Script SAS pour l'analyse et le traitement des données.
- **`data/titanic.csv`** : Jeu de données brut (non inclus si protégé par des droits).
- **`outputs/`** : Contient les graphiques et les données nettoyées exportées.
- **README.md** : Documentation du projet.

## Instructions
1. Téléchargez le dépôt GitHub.
2. Chargez le fichier `eda_titanic.sas` dans SAS Studio.
3. Modifiez le chemin vers le fichier `titanic.csv` dans le script pour qu'il corresponde à votre environnement.
4. Exécutez le script pour :
   - Charger et explorer les données.
   - Produire des statistiques descriptives et des visualisations.
   - Exporter les données nettoyées.

## Jeu de données
- **Source** : [Kaggle Titanic Dataset](https://www.kaggle.com/c/titanic/data)
- **Colonnes principales** :
  - `Survived` : Indique si le passager a survécu (1) ou non (0).
  - `Pclass` : Classe de billet (1 = Première, 2 = Deuxième, 3 = Troisième).
  - `Sex` : Sexe du passager.
  - `Age` : Âge du passager.
  - `Fare` : Tarif du billet.

## Résultats
Les résultats de l'analyse incluent :
1. **Graphiques** : Histogramme des âges, barres pour le genre et la survie.
2. **Données nettoyées** : Fichier `titanic_clean.csv` exporté.
3. **Insights clés** :
   - Les femmes ont une probabilité de survie plus élevée que les hommes.
   - Les passagers de première classe ont survécu en plus grand nombre.

## À propos
Ce projet est un exemple d'implémentation des bases de la data science avec SAS Studio.

