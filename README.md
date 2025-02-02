# Projet Base de Données : Jazz & BD

## Introduction

Les bases de données sont au cœur des systèmes d’information modernes, offrant des solutions robustes pour stocker, organiser et manipuler les données de manière efficace.  
Ce projet, intitulé **"Jazz & BD"**, a pour objectif la **conception** et la **mise en œuvre** d’une base de données spécifiquement dédiée à la **gestion d’événements de concerts de jazz**.

---

## Présentation des données

Les données exploitées sont réparties en plusieurs tables principales :

- **Salles** : Informations sur les lieux où se déroulent les concerts, incluant leur capacité.  
- **Organisateurs** : Détails sur les entités responsables de l’organisation des concerts.  
- **Musiciens** : Liste des musiciens participant aux concerts, ainsi que leurs rôles (leader, arrangeur, auteur).  
- **Clients** : Données des clients ayant réservé des billets pour les concerts.  
- **Morceaux** : Catalogue des morceaux joués pendant les concerts, avec leurs auteurs et arrangeurs.

Ces tables, accompagnées de leurs relations, servent de base à la modélisation de la BD et permettent de répondre à des requêtes liées à la gestion des concerts.

---

## Objectifs

1. **Modéliser et implémenter** :
   - Élaborer un **modèle Entité-Association (E/A)** représentant les relations entre les différentes entités.  
   - Transformer ce modèle conceptuel en un **modèle relationnel opérationnel**.
2. **Répondre à des besoins pratiques** :
   - Rédiger et exécuter des **requêtes SQL** pour répondre à des questions spécifiques sur les concerts, les réservations et les musiciens.  
   - Fournir des **analyses** et **statistiques** à partir des données disponibles.

Le projet vise à créer une structure de données conforme aux normes relationnelles (jusqu’à la 3e forme normale), tout en développant des requêtes SQL adaptées à des cas pratiques. Cela démontre une **maîtrise approfondie** des principes fondamentaux de gestion des bases de données.

---

## Synthèse des expérimentations

### 1) Détermination des Cardinalités

Pour déterminer les cardinalités, nous avons analysé en détail toutes les informations de l’énoncé. En l’absence de précisions explicites, nous avons opté pour des valeurs logiques (cardinalités minimales et maximales). Les données fournies en fin d’énoncé ont permis de **vérifier** et **valider** ce travail.

Exemples de cardinalités mises en évidence :

- **Concert** ↔ **Salle** :  
  - Un concert peut avoir lieu dans plusieurs salles (1, N)  
  - Une salle peut accueillir plusieurs concerts (1, N)  
- **Concert** ↔ **Organisateur** :  
  - Chaque concert est organisé par un seul organisateur (1,1)  
  - Un organisateur peut gérer plusieurs concerts, voire aucun (0,N)

(*et ainsi de suite pour les autres associations comme Participe, Est leader, Est au programme, Réserve, etc.*)

Ces choix garantissent la cohérence et la logique du modèle conceptuel (**Figure E/A avec cardinalités**).

### 2) Passage au Modèle Relationnel & Vérification des Formes Normales

#### Règles de base

- Chaque **entité** devient une **relation** (table).  
- Les **associations** binaires avec cardinalité (N, N) créent une nouvelle table (clés primaires concaténées).  
- Les associations avec cardinalité (1, N) peuvent être gérées via clés étrangères.

Nous avons créé les tables principales :

- **Salle**, **Organisateur**, **Musicien**, **Morceau**, **Client**, **Concert**, etc.

Puis, pour les associations binaire (N, N), nous avons introduit des tables comme :  
- **Réservation** (#ID_concert, #ID_client, …)  
- **Participation** (#ID_musicien, #ID_concert)  
- **Programme** (#ID_morceau, #ID_concert, #ID_arrangeur)  
- **Auteur** (#ID_musicien, #ID_morceau)  
- **Séance** (#ID_concert, Date, #ID_salle)

Nous avons ensuite **vérifié la conformité** aux **3 formes normales** (1NF, 2NF, 3NF), détectant et corrigeant les éventuels problèmes de dépendances partielles ou transitives. Les tables finales sont donc **normalisées** et évitent les anomalies de mise à jour.

### 3) Contraintes d’Intégrité

Pour garantir la cohérence des données :

- **Unicité** : Tous les identifiants (`ID_concert`, `ID_salle`, …) sont uniques (clés primaires).  
- **Clés étrangères** : Les liens (Concert ↔ Salle, etc.) sont validés via clés étrangères.  
- **Valeurs obligatoires** : Par exemple, `Prix >= 0`, `NombrePlaces > 0`.  
- **Clé primaire composite** : Par exemple, `(ID_concert, Date)` pour identifier une séance unique.

Nous avons également vérifié la cohérence des données insérées, comme la correction de places en double pour un même concert.

### 4) Requêtes SQL

Après la construction et l’initialisation de la base (**`jazz_projet.db`**), nous avons pu rédiger et exécuter des requêtes SQL pour répondre à divers scénarios :

- Afficher les musiciens qui n’ont jamais arrangé de morceau.  
- Calculer les revenus générés par concert.  
- Lister les clients ayant réservé à toutes les séances, etc.

---

## Conclusion

Le projet **"Jazz & BD"** illustre comment une **base de données rigoureuse** (bien modélisée et normalisée) peut faciliter la **gestion** et la **planification** de concerts de jazz :

- Les informations sont organisées de manière à éviter les redondances et incohérences.  
- Les requêtes SQL peuvent répondre rapidement et efficacement aux différents besoins opérationnels.  
- La solution montre l’importance des principes de **normalisation** et d’une **bonne conception** (Entité-Association → Modèle relationnel).

Grâce à ce projet, nous démontrons la **puissance** d’une base de données relationnelle pour la **gestion d’événements musicaux** et la **prise de décisions stratégiques** associées.

---

### Liens Utiles

- **GitHub du projet** : [PROJET-BDD-JAZZ](https://github.com/amenallah01/PROJET-BDD-JAZZ.git)

Pour plus de détails, se référer aux **scripts SQL** et aux **notebooks** disponibles dans le dépôt, qui illustrent différentes approches et requêtes supplémentaires.
